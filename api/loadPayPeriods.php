<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";
include "../inc/includes.php";
//ini_set("display_errors", 1);

set_time_limit(300);

$user_id 			= isset($_REQUEST['user_id']) ? intval($_REQUEST['user_id']) : 0;
$current_balance 	= isset($_REQUEST['current_balance']) ? intval($_REQUEST['current_balance']) : 3544;
$end_pay_period = isset($_REQUEST['end_pay_period']) ? trim($_REQUEST['end_pay_period']) : "";

if ($current_balance <= 0) {
    $current_balance = 3544;
}

$pay_date = "";
$prev_date = 0;
$next_date = 0;

$date2 = date('Y-m-d');

$day = intval(date('d', strtotime($date2)));
$month = intval(date('m', strtotime($date2)));
$year = intval(date('Y', strtotime($date2)));

if ($day < 15) {
    $day = 15;
} else {
    if ($month < 12) {
        $month += 1;
    } else {
        $month += 1;
        $year += 1;
    }
    $day = 1;
}

$start_pay_period = date('Y-m-d');

if (intval(date("d", strtotime($start_pay_period))) < 15) {
    $start_pay_period = date("Y-m-01", strtotime($start_pay_period));
} else {
    $start_pay_period = date("Y-m-15", strtotime($start_pay_period));
}


if ($end_pay_period == "") {

    $day = intval(date('d', strtotime($date2)));
    $month = intval(date('m', strtotime($date2)));
    $year = intval(date('Y', strtotime($date2)));

    if ($day < 15) {
        $day = 15;
    } else {
        if ($month < 10) {
            $month += 3;
        } else {
            $month = ($month + 3) % 12;
            $year += 1;
        }
        $day = 1;
    }

    $end_pay_period = date('Y-m-d', strtotime("$year-$month-$day"));
}

$disposablePerDay          = isset($_REQUEST['disposable_per_day']) ? floatval($_REQUEST['disposable_per_day']) : 40;
if ($disposablePerDay <= 0) {
    $disposablePerDay = 40;
}

$days15 = isset($_REQUEST['days15']) ? intval($_REQUEST['days15']) : 0;

$insertPayPeriodItem = 1;

$startMonth = intval(date("m", strtotime($start_pay_period)));
$startDay = intval(date("d", strtotime($start_pay_period)));
$startYear = intval(date("Y", strtotime($start_pay_period)));

$ipPayPeriod = new IpPayPeriod();
$ipPayPeriod->updatePayPeriods();

$sql = "TRUNCATE TABLE ip_pay_period_item";
execQuery($sql);

$resultsArr = [];
while (true) {

    $pay_date = date('Y-m-d', strtotime("$startYear-$startMonth-$startDay"));

    $billDateHelper = new BillDateHelper();
    $results = $billDateHelper->loadBillDates($user_id, $current_balance, $pay_date, $prev_date, $next_date,
        $disposablePerDay, $days15, $insertPayPeriodItem);

    $resultsArr[] = $results;

    if (strtotime($pay_date) >= strtotime($end_pay_period)) {
        break;
    }

    if ($startDay == 15) {
        if ($startMonth < 12) {
            $startMonth += 1;
        } else {
            $startMonth = 1;
            $startYear += 1;
        }
        $startDay = 1;
    } else {
        $startDay = 15;
    }
}

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode($resultsArr, JSON_PRETTY_PRINT);
die();

?>