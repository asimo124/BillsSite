<?php
include '../../inc/includes.php';
include '../../inc/api_auth.php';
include '../../inc/disposable_csv.php';

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$validation = disposable_validate_uploaded_csv(isset($_FILES['rocket_money_file']) ? $_FILES['rocket_money_file'] : array());
if (!$validation['ok']) {
    api_json_response(array('message' => $validation['message']), 400);
}

$saved = disposable_save_uploaded_csv($_FILES['rocket_money_file']);
if (!$saved['ok']) {
    api_json_response(array('message' => $saved['message']), 500);
}

$result = disposable_import_csv_from_path($db_conn, $saved['path']);

api_json_response(array(
    'success' => true,
    'message' => 'File uploaded successfully.',
    'imported' => $result['imported'],
    'skipped' => $result['skipped'],
));
