<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

$sql = "SELECT vnd_id, vnd_bill, vnd_frequency_value, amount, watch_flag, is_future
        FROM vnd_bills
        WHERE is_future = 1
        ORDER BY vnd_frequency_value";

$rows = getQuery($sql, array());
$expenses = array();

if ($rows) {
    foreach ($rows as $row) {
        $expenses[] = array(
            'vnd_id' => intval($row['vnd_id']),
            'vnd_bill' => $row['vnd_bill'],
            'vnd_frequency_value' => $row['vnd_frequency_value'],
            'amount' => floatval($row['amount']),
            'watch_flag' => intval($row['watch_flag']),
        );
    }
}

api_json_response(array('expenses' => $expenses));
