<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";
include "../../inc/app_settings.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    api_json_response(array(
        'test_mode' => app_test_mode_enabled() ? 1 : 0,
    ));
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$body = api_read_json_body();
$enabled = 0;
if (isset($body['test_mode'])) {
    $enabled = intval($body['test_mode']) ? 1 : 0;
} elseif (isset($body['enabled'])) {
    $enabled = $body['enabled'] ? 1 : 0;
}

app_setting_set('test_mode', (string) $enabled);

api_json_response(array(
    'test_mode' => $enabled,
    'message' => $enabled ? 'Test mode is ON.' : 'Test mode is OFF.',
));
