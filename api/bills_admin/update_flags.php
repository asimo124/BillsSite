<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$body = api_read_json_body();
$id = isset($body['id']) ? intval($body['id']) : 0;
$flag = isset($body['flag']) ? $body['flag'] : '';
$action = isset($body['action']) ? $body['action'] : '';

if ($id <= 0 || !in_array($flag, array('heavy', 'watch'), true) || !in_array($action, array('mark', 'unmark'), true)) {
    api_json_response(array('message' => 'Invalid request'), 400);
}

$value = ($action === 'mark') ? 1 : 0;
$column = ($flag === 'heavy') ? 'is_heavy' : 'watch_flag';

$sql = "UPDATE vnd_bills SET {$column} = :value WHERE vnd_id = :id";
execQuery($sql, array(
    'value' => $value,
    'id' => $id,
));

api_json_response(array(
    'message' => 'Bill has been updated.',
    'id' => $id,
    'flag' => $flag,
    'action' => $action,
    'value' => $value,
));
