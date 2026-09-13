<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";
include "../../inc/apple_calendar.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

if (!isset($_FILES['apple_calendar_file']) || $_FILES['apple_calendar_file']['error'] !== UPLOAD_ERR_OK) {
    $errorMessage = 'No file uploaded or upload error occurred.';
    if (isset($_FILES['apple_calendar_file']['error'])) {
        $errorMessage = apple_calendar_upload_error_message($_FILES['apple_calendar_file']['error']);
    }
    api_json_response(array('message' => $errorMessage), 400);
}

$uploadedFile = $_FILES['apple_calendar_file'];
$fileExtension = strtolower(pathinfo($uploadedFile['name'], PATHINFO_EXTENSION));

if ($fileExtension !== 'csv') {
    api_json_response(array('message' => 'Invalid file type. Please upload a CSV file.'), 400);
}

try {
    $imported = apple_calendar_import_from_csv($uploadedFile['tmp_name']);
} catch (Exception $e) {
    api_json_response(array('message' => 'Failed to import Apple Calendar events.'), 500);
}

api_json_response(array(
    'success' => true,
    'message' => 'Apple Calendar events imported successfully.',
    'imported' => $imported,
));
