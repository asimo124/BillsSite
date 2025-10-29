<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/includes.php";
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";

//ini_set("display_errors", 1);

$rocket_money_id = isset($_REQUEST['rocket_money_id']) ? intval($_REQUEST['rocket_money_id']) : 0;
$expenses_app_id = isset($_REQUEST['expenses_app_id']) ? intval($_REQUEST['expenses_app_id']) : 0;

$sql = "DELETE FROM ae_title_match 
        WHERE rocket_money_id = $rocket_money_id 
        AND expenses_app_id = $expenses_app_id";
$result = execQuery($sql);


header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'success' => true
], JSON_PRETTY_PRINT);
die();
?>