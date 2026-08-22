<?php
$changeTestMode = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/Bills.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";
include "../inc/includes.php";
include "../inc/api_auth.php";

// Keep open for Angular Bills SPA + legacy admin; MyBudget still sends Bearer.
api_handle_preflight();

set_time_limit(300);

$user_id = isset($_REQUEST['user_id']) ? intval($_REQUEST['user_id']) : 0;
$current_balance = isset($_REQUEST['current_balance']) ? intval($_REQUEST['current_balance']) : 0;
$pay_date = isset($_REQUEST['pay_date']) ? trim($_REQUEST['pay_date']) : "";

$prev_date = isset($_REQUEST['prev_date']) ? intval($_REQUEST['prev_date']) : 0;
$next_date = isset($_REQUEST['next_date']) ? intval($_REQUEST['next_date']) : 0;

$disposablePerDay = isset($_REQUEST['disposable_per_day']) ? floatval($_REQUEST['disposable_per_day']) : 40;
if ($disposablePerDay <= 0) {
    $disposablePerDay = 40;
}

$days15 = isset($_REQUEST['days15']) ? intval($_REQUEST['days15']) : 0;
$insertPayPeriodItem = isset($_REQUEST['insert_pay_period_item']) ? intval($_REQUEST['insert_pay_period_item']) : 0;

$billDateHelper = new BillDateHelper();
$results = $billDateHelper->loadBillDates(
    $user_id,
    $current_balance,
    $pay_date,
    $prev_date,
    $next_date,
    $disposablePerDay,
    $days15,
    $insertPayPeriodItem
);

api_json_response($results);
