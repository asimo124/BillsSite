<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/includes.php";
include "../inc/api_auth.php";
api_handle_preflight();

if (!isset($_SESSION['ae_max_chars'])) {
    $_SESSION['ae_max_chars'] = 33;
}

include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";

//ini_set("display_errors", 1);

function escapeSql($value) {
    return str_replace("'", "''", $value);
}

$rocket_money_id = isset($_REQUEST['rocket_money_id']) ? intval($_REQUEST['rocket_money_id']) : 0;
$expenses_app_id = isset($_REQUEST['expenses_app_id']) ? intval($_REQUEST['expenses_app_id']) : 0;

$sql = "SELECT * FROM ae_rocket_money_item WHERE id = $rocket_money_id";
$rocketMoneyItem = getQuerySingle($sql);

$rocket_money_title = $rocketMoneyItem['Name'];
$rocket_money_amount = $rocketMoneyItem['Amount'];
$rocket_money_date = intval(date("d", strtotime($rocketMoneyItem['Date'])));
$rocket_money_index = $rocketMoneyItem['Index'];

$sql = "SELECT * FROM vnd_bills WHERE vnd_id = $expenses_app_id";
$expensesAppItem = getQuerySingle($sql);

$expenses_app_title = $expensesAppItem['vnd_bill'];
$expenses_app_amount = $expensesAppItem['amount'];
$expenses_app_date = $expensesAppItem['vnd_frequency_value'];
$expenses_app_index = $expensesAppItem['index'];

$rocket_money_short_title = substr($rocket_money_title, 0, $_SESSION['ae_max_chars']);
$expenses_app_short_title = substr($expenses_app_title, 0, $_SESSION['ae_max_chars']);

$sql = "INSERT INTO ae_title_match 
        (rocket_money_id, rocket_money_title, rocket_money_short_title, rocket_money_amount, rocket_money_date, 
         expenses_app_id, expenses_app_title, expenses_app_short_title, expenses_app_amount, expenses_app_date,
         rocket_money_index, expenses_app_index) 
        VALUES 
        ($rocket_money_id, '" . escapeSql($rocket_money_title) . "', '" . escapeSql($rocket_money_short_title) . "', $rocket_money_amount, '" . escapeSql($rocket_money_date) . "',
         $expenses_app_id, '" . escapeSql($expenses_app_title) . "', '" . escapeSql($expenses_app_short_title) . "', $expenses_app_amount, '" . escapeSql($expenses_app_date) . "',
         $rocket_money_index, $expenses_app_index)";
$result = execQuery($sql);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'success' => true
], JSON_PRETTY_PRINT);
die();
?>