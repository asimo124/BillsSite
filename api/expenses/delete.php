<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$body = api_read_json_body();
$vnd_id = isset($body['vnd_id']) ? intval($body['vnd_id']) : 0;

if ($vnd_id <= 0) {
    api_json_response(array('message' => 'Invalid expense id'), 400);
}

$rows = getQuery(
    "SELECT vnd_id, vnd_bill, vnd_frequency_value FROM vnd_bills WHERE vnd_id = :vnd_id AND is_future = 1 LIMIT 1",
    array('vnd_id' => $vnd_id)
);

if (!$rows || count($rows) === 0) {
    api_json_response(array('message' => 'Expense not found'), 404);
}

$getBill = $rows[0];

$query = "
DELETE FROM vnd_bill_dates
WHERE vnd_bill_desc = :vnd_bill
  AND vnd_date = :vnd_frequency_value";
$sth = $db_conn->prepare($query);
$sth->execute(array(
    'vnd_bill' => $getBill['vnd_bill'],
    'vnd_frequency_value' => $getBill['vnd_frequency_value'],
));

$query = "DELETE FROM vnd_bills WHERE vnd_id = :vnd_id AND is_future = 1";
$sth = $db_conn->prepare($query);
$sth->execute(array('vnd_id' => $vnd_id));

api_json_response(array(
    'message' => 'You have deleted a future expense.',
    'vnd_id' => $vnd_id,
));
