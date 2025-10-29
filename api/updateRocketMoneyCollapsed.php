<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/includes.php";
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";

//ini_set("display_errors", 1);

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
$collapsed = isset($_REQUEST['Collapsed']) ? intval($_REQUEST['Collapsed']) : 0;

if ($id > 0) {
    $sql = "UPDATE ae_rocket_money_item SET Collapsed = $collapsed WHERE id = $id";
    $result = execQuery($sql);
}

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'success' => true
], JSON_PRETTY_PRINT);
die();
?>