<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$body = api_read_json_body();

$vnd_bill = isset($body['vnd_bill']) ? trim($body['vnd_bill']) : '';
$amount = isset($body['amount']) ? floatval($body['amount']) : 0;
$vnd_is_auto = !empty($body['vnd_is_auto']) ? 1 : 0;
$vnd_frequency_notes = isset($body['vnd_frequency_notes']) ? trim($body['vnd_frequency_notes']) : '';
$vnd_frequency = isset($body['vnd_frequency']) ? $body['vnd_frequency'] : '';
$vnd_frequency_type = isset($body['vnd_frequency_type']) ? $body['vnd_frequency_type'] : '';
$vnd_frequency_value = isset($body['vnd_frequency_value']) ? trim($body['vnd_frequency_value']) : '';
$vnd_frequency_value_original = isset($body['vnd_frequency_value_original']) ? trim($body['vnd_frequency_value_original']) : null;
$can_be_multiplied_by = isset($body['can_be_multiplied_by']) ? intval($body['can_be_multiplied_by']) : 1;
if ($can_be_multiplied_by < 1) {
    $can_be_multiplied_by = 1;
}
$end_date = isset($body['end_date']) ? trim($body['end_date']) : null;
$start_date = isset($body['start_date']) ? trim($body['start_date']) : null;

if (!$end_date || $end_date === '0000-00-00') {
    $end_date = null;
}
if (!$start_date || $start_date === '0000-00-00') {
    $start_date = null;
}
if ($vnd_frequency_value_original === '') {
    $vnd_frequency_value_original = null;
}

if ($vnd_bill === '' || $amount <= 0) {
    api_json_response(array('message' => 'You did not fill in all the required fields.'), 400);
}

$sql = "INSERT INTO vnd_bills
        ( vnd_user_id,  vnd_bill,  amount,  vnd_is_auto,  vnd_frequency_notes,  vnd_frequency,  vnd_frequency_type,  vnd_frequency_value,  vnd_frequency_value_original,  end_date,  start_date, can_be_multiplied_by) VALUES
        (:vnd_user_id, :vnd_bill, :amount, :vnd_is_auto, :vnd_frequency_notes, :vnd_frequency, :vnd_frequency_type, :vnd_frequency_value, :vnd_frequency_value_original, :end_date, :start_date, :can_be_multiplied_by)";

execQuery($sql, array(
    'vnd_user_id' => 1,
    'vnd_bill' => $vnd_bill,
    'amount' => $amount,
    'vnd_is_auto' => $vnd_is_auto,
    'vnd_frequency_notes' => $vnd_frequency_notes,
    'vnd_frequency' => $vnd_frequency,
    'vnd_frequency_type' => $vnd_frequency_type,
    'vnd_frequency_value' => $vnd_frequency_value,
    'vnd_frequency_value_original' => $vnd_frequency_value_original,
    'end_date' => $end_date,
    'start_date' => $start_date,
    'can_be_multiplied_by' => $can_be_multiplied_by,
));

$id = intval($db_conn->lastInsertId());

execQuery3("UPDATE vnd_bills SET end_date = null WHERE end_date = '0000-00-00'");
execQuery("UPDATE vnd_bills SET end_date = null WHERE end_date = '0000-00-00'");
execQuery3("UPDATE vnd_bills SET start_date = null WHERE start_date = '0000-00-00'");
execQuery("UPDATE vnd_bills SET start_date = null WHERE start_date = '0000-00-00'");

api_json_response(array(
    'message' => 'Bill has been created.',
    'id' => $id,
));
