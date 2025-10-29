<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/includes.php";
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";

//ini_set("display_errors", 1);

function escapeSql($value) {
    return str_replace("'", "''", $value);
}

$rocket_money_id = isset($_REQUEST['rocket_money_id']) ? intval($_REQUEST['rocket_money_id']) : 0;
$rocket_money_title = isset($_REQUEST['rocket_money_title']) ? $_REQUEST['rocket_money_title'] : '';
$rocket_money_amount = isset($_REQUEST['rocket_money_amount']) ? floatval($_REQUEST['rocket_money_amount']) : 0;
$rocket_money_date = isset($_REQUEST['rocket_money_date']) ? $_REQUEST['rocket_money_date'] : 0;
$expenses_app_id = isset($_REQUEST['expenses_app_id']) ? intval($_REQUEST['expenses_app_id']) : 0;
$expenses_app_title = isset($_REQUEST['expenses_app_title']) ? $_REQUEST['expenses_app_title'] : '';
$expenses_app_amount = isset($_REQUEST['expenses_app_amount']) ? floatval($_REQUEST['expenses_app_amount']) : 0;
$expenses_app_date = isset($_REQUEST['expenses_app_date']) ? $_REQUEST['expenses_app_date'] : 0;

$rocket_money_short_title = substr($rocket_money_title, 0, 14);
$expenses_app_short_title = substr($expenses_app_title, 0, 14);

$sql = "INSERT INTO ae_title_match 
        (rocket_money_id, rocket_money_title, rocket_money_short_title, rocket_money_amount, rocket_money_date, 
         expenses_app_id, expenses_app_title, expenses_app_short_title, expenses_app_amount, expenses_app_date) 
        VALUES 
        ($rocket_money_id, '" . escapeSql($rocket_money_title) . "', '" . escapeSql($rocket_money_short_title) . "', $rocket_money_amount, '" . escapeSql($rocket_money_date) . "',
         $expenses_app_id, '" . escapeSql($expenses_app_title) . "', '" . escapeSql($expenses_app_short_title) . "', $expenses_app_amount, '" . escapeSql($expenses_app_date) . "')";
$result = execQuery($sql);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'success' => true
], JSON_PRETTY_PRINT);
die();
?>