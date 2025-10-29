<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/includes.php";
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";

//ini_set("display_errors", 1);

$id = isset($_REQUEST['vnd_id']) ? intval($_REQUEST['vnd_id']) : 0;
$collapsed = isset($_REQUEST['collapsed']) ? intval($_REQUEST['collapsed']) : 0;

$sql = "UPDATE vnd_bills SET collapsed = $collapsed WHERE vnd_id = $id";
$result = execQuery($sql);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'success' => true
], JSON_PRETTY_PRINT);
die();

?>