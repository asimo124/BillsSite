<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

$sql = "SELECT vnd_id, vnd_bill FROM vnd_bills ORDER BY vnd_bill ASC";
$bills = getQuery($sql);
if (!$bills) {
    $bills = array();
}

foreach ($bills as &$bill) {
    $bill['vnd_id'] = intval($bill['vnd_id']);
}
unset($bill);

api_json_response(array('bills' => $bills));
