<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$body = api_read_json_body();
$params = array_merge($_REQUEST, $body);
$id = isset($params['id']) ? intval($params['id']) : 0;

if ($id <= 0) {
    api_json_response(array('message' => 'id is required.'), 400);
}

execQuery("DELETE FROM push_notification WHERE id = :id", array('id' => $id));

api_json_response(array(
    'message' => 'You have deleted a reminder.',
));
