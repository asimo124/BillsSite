<?php
/**
 * Backend proxy for Google Routes API.
 * Keeps your Google API key off the client.
 *
 * Setup:
 *   1. Enable "Routes API" in Google Cloud Console.
 *   2. Create an API key restricted to the Routes API (and to your server's IP if possible).
 *   3. Put GOOGLE_MAPS_API_KEY=... in the project-root .env file.
 */

include "../inc/api_auth.php";
api_handle_preflight();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('error' => 'Use POST'), 405);
}

$envFile = dirname(__DIR__) . '/.env';
if (is_readable($envFile)) {
    foreach (file($envFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES) as $line) {
        $line = trim($line);
        if ($line === '' || $line[0] === '#') {
            continue;
        }
        if (strpos($line, '=') === false) {
            continue;
        }
        [$name, $value] = explode('=', $line, 2);
        $name = trim($name);
        $value = trim($value, " \t\"'");
        if ($name !== '' && getenv($name) === false) {
            putenv("$name=$value");
            $_ENV[$name] = $value;
        }
    }
}

$apiKey = getenv('GOOGLE_MAPS_API_KEY') ?: '';
if ($apiKey === '') {
    api_json_response(array('error' => 'GOOGLE_MAPS_API_KEY is not configured'), 500);
}

$input = json_decode(file_get_contents('php://input'), true);

$origin = trim($input['origin'] ?? '');
$destination = trim($input['destination'] ?? '');
$timeMode = $input['timeMode'] ?? 'departure'; // 'departure' or 'arrival'
$timestamp = $input['timestamp'] ?? null; // ISO 8601 string, e.g. "2026-07-14T08:30:00-07:00"

if ($origin === '' || $destination === '' || !$timestamp) {
    api_json_response(array('error' => 'origin, destination, and timestamp are required'), 400);
}

// Routes API computeRoutes endpoint
$url = 'https://routes.googleapis.com/directions/v2:computeRoutes';

/**
 * Calls computeRoutes with a given traffic model and returns the decoded
 * response plus HTTP status, or an error array on transport failure.
 *
 * trafficModel only takes effect when routingPreference is TRAFFIC_AWARE_OPTIMAL
 * and travelMode is DRIVE - both are fixed below.
 */
function computeRoute($url, $apiKey, $origin, $destination, $timeMode, $timestamp, $trafficModel) {
$body = [
    'origin' => ['address' => $origin],
    'destination' => ['address' => $destination],
    'travelMode' => 'DRIVE',
    'routingPreference' => 'TRAFFIC_AWARE_OPTIMAL',
        'trafficModel' => $trafficModel,
    'computeAlternativeRoutes' => false,
    'languageCode' => 'en-US',
    'units' => 'IMPERIAL',
];

// Routes API only accepts ONE of departureTime or arrivalTime, not both.
if ($timeMode === 'arrival') {
    $body['arrivalTime'] = $timestamp;
} else {
    $body['departureTime'] = $timestamp;
}

$ch = curl_init($url);
curl_setopt_array($ch, [
    CURLOPT_POST => true,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_POSTFIELDS => json_encode($body),
    CURLOPT_HTTPHEADER => [
        'Content-Type: application/json',
        'X-Goog-Api-Key: ' . $apiKey,
            'X-Goog-FieldMask: routes.duration,routes.distanceMeters,routes.staticDuration',
    ],
]);

$response = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$curlError = curl_error($ch);
curl_close($ch);

if ($curlError) {
        return ['error' => true, 'detail' => $curlError];
    }

    return ['error' => false, 'httpCode' => $httpCode, 'data' => json_decode($response, true)];
}

// Two calls: OPTIMISTIC gives the min duration, PESSIMISTIC gives the max.
// Each is billed as a separate Routes API request under the Pro SKU.
$optimistic = computeRoute($url, $apiKey, $origin, $destination, $timeMode, $timestamp, 'OPTIMISTIC');
if ($optimistic['error']) {
    api_json_response(array('error' => 'Upstream request failed', 'detail' => $optimistic['detail']), 502);
}
if ($optimistic['httpCode'] !== 200) {
    api_json_response($optimistic['data'], $optimistic['httpCode']);
}

$pessimistic = computeRoute($url, $apiKey, $origin, $destination, $timeMode, $timestamp, 'PESSIMISTIC');
if ($pessimistic['error']) {
    api_json_response(array('error' => 'Upstream request failed', 'detail' => $pessimistic['detail']), 502);
}
if ($pessimistic['httpCode'] !== 200) {
    api_json_response($pessimistic['data'], $pessimistic['httpCode']);
}

$minRoute = $optimistic['data']['routes'][0] ?? null;
$maxRoute = $pessimistic['data']['routes'][0] ?? null;

if (!$minRoute || !$maxRoute) {
    api_json_response(array('error' => 'No route found between those addresses.'), 404);
}

api_json_response(array(
    'distanceMeters' => $minRoute['distanceMeters'] ?? $maxRoute['distanceMeters'] ?? 0,
    'minDuration' => $minRoute['duration'] ?? null,
    'maxDuration' => $maxRoute['duration'] ?? null,
));
