<?php
include "../../inc/includes.php";
include "../../inc/Bills.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$body = api_read_json_body();

$vnd_bill = isset($body['vnd_bill']) ? trim($body['vnd_bill']) : '';
$vnd_frequency_value = isset($body['vnd_frequency_value']) ? trim($body['vnd_frequency_value']) : '';
$amount = isset($body['amount']) ? floatval($body['amount']) : 0;

if (!validateTags($vnd_bill) || !validateTags($vnd_frequency_value)) {
    api_json_response(array('message' => 'You have entered invalid content. Please re-enter'), 400);
}

$vnd_bill = strip_tags($vnd_bill);
$vnd_frequency_value = strip_tags($vnd_frequency_value);

if ($vnd_bill === '' || $vnd_frequency_value === '') {
    api_json_response(array('message' => 'Description and date are required.'), 400);
}

$query = "INSERT INTO vnd_bills
( vnd_user_id,  vnd_bill,  vnd_frequency_value,  amount,  vnd_is_auto,  vnd_frequency,  vnd_frequency_type,  vnd_entrydate,  multiplier,  is_future) VALUES
(:vnd_user_id, :vnd_bill, :vnd_frequency_value, :amount, :vnd_is_auto, :vnd_frequency, :vnd_frequency_type, :vnd_entrydate, :multiplier, :is_future)";

$data = array(
    'vnd_user_id' => 1,
    'vnd_bill' => $vnd_bill,
    'vnd_frequency_value' => $vnd_frequency_value,
    'amount' => $amount,
    'vnd_is_auto' => 0,
    'vnd_frequency' => 'Once',
    'vnd_frequency_type' => 'Once',
    'vnd_entrydate' => date('Y-m-d H:i:s'),
    'multiplier' => 1,
    'is_future' => 1,
);

$sth = $db_conn->prepare($query);
$sth->execute($data);
$id = intval($db_conn->lastInsertId());

$numReps = 25;
$user_id = 1;
$Bill = new Bills($numReps);
$Bill->deleteOldDates();
$Bill->setPayPeriod('');
$Bill->generateBillDatesByUserID($user_id);

api_json_response(array(
    'message' => 'You have added a future expense.',
    'id' => $id,
));
