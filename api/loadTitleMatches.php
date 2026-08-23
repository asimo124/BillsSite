<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/includes.php";
include "../inc/api_auth.php";
api_handle_preflight();

include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";

//ini_set("display_errors", 1);

function escapeSql($value) {
    return str_replace("'", "''", $value);
}

$sql = "SELECT * FROM ae_title_match ";
$results = getQuery($sql);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'items' => $results
], JSON_PRETTY_PRINT);
die();
?>