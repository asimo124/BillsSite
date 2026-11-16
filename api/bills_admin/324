<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";
include "../../inc/app_settings.php";

api_handle_preflight();
require_api_auth_or_session();
apply_app_test_mode_db();

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
if ($id <= 0) {
    $body = api_read_json_body();
    $id = isset($body['id']) ? intval($body['id']) : 0;
}

if ($id <= 0) {
    api_json_response(array('message' => 'Invalid bill id'), 400);
}

$sql = "SELECT vnd_id, vnd_bill, amount, vnd_is_auto, vnd_frequency_notes,
               vnd_frequency, vnd_frequency_type, vnd_frequency_value, vnd_frequency_value_original,
               end_date, start_date, multiplier, can_be_multiplied_by
        FROM vnd_bills
        WHERE vnd_id = :id
        LIMIT 1";

$rows = getQuery($sql, array('id' => $id));
if (!$rows || count($rows) === 0) {
    api_json_response(array('message' => 'Bill not found'), 404);
}

$bill = $rows[0];
$bill['vnd_id'] = intval($bill['vnd_id']);
$bill['amount'] = floatval($bill['amount']);
$bill['vnd_is_auto'] = intval($bill['vnd_is_auto']);
$bill['can_be_multiplied_by'] = intval($bill['can_be_multiplied_by']);
$bill['start_date'] = ($bill['start_date'] && $bill['start_date'] !== '0000-00-00') ? $bill['start_date'] : '';
$bill['end_date'] = ($bill['end_date'] && $bill['end_date'] !== '0000-00-00') ? $bill['end_date'] : '';

api_json_response(array('bill' => $bill));
