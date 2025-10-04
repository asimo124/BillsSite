<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";
include "../inc/includes.php";
//ini_set("display_errors", 1);

set_time_limit(300);

$ipPayPeriodItem = new IpPayPeriodItem();
$payPeriodResults = $ipPayPeriodItem->index();

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'items' => $payPeriodResults
], JSON_PRETTY_PRINT);
die();

?>