<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";
include "../../inc/app_settings.php";

api_handle_preflight();
require_api_auth_or_session();
apply_app_test_mode_db();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$body = api_read_json_body();
$id = isset($body['id']) ? intval($body['id']) : 0;

if ($id <= 0) {
    api_json_response(array('message' => 'Invalid bill id'), 400);
}

$sql = "DELETE FROM vnd_bills WHERE vnd_id = :id";
execQuery($sql, array('id' => $id));

api_json_response(array(
    'message' => 'You have deleted a bill.',
    'id' => $id,
));
