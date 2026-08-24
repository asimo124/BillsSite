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
$items = isset($body['items']) && is_array($body['items']) ? $body['items'] : array();

if (count($items) === 0) {
    api_json_response(array('message' => 'No audit fields to update'), 400);
}

$sql = "UPDATE vnd_bills
        SET audit_regex = :audit_regex,
            audit_keyword1 = :audit_keyword1,
            audit_keyword2 = :audit_keyword2
        WHERE vnd_id = :vnd_id";

foreach ($items as $item) {
    $vnd_id = isset($item['vnd_id']) ? intval($item['vnd_id']) : 0;
    if ($vnd_id <= 0) {
        continue;
    }
    execQuery($sql, array(
        'vnd_id' => $vnd_id,
        'audit_regex' => isset($item['audit_regex']) ? $item['audit_regex'] : '',
        'audit_keyword1' => isset($item['audit_keyword1']) ? $item['audit_keyword1'] : '',
        'audit_keyword2' => isset($item['audit_keyword2']) ? $item['audit_keyword2'] : '',
    ));
}

api_json_response(array('message' => 'Updated audit fields.'));
