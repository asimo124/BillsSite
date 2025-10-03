<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/includes.php";
//ini_set("display_errors", 1);


$date2 = date('Y-m-d');

$day = intval(date('d', strtotime($date2)));
$month = intval(date('m', strtotime($date2)));
$year = intval(date('Y', strtotime($date2)));

if ($day < 15) {
    $day = 1;
} else {
    $day = 15;
}

$payCheckDay = $day;
$payCheckMonth = $month;
$payCheckYear = $year;

$neededPayPeriods = [];
for ($i = 0; $i < 24; $i++) {

    $payPeriodDate = date('Y-m-d', strtotime("$payCheckYear-$payCheckMonth-$payCheckDay"));

    $monthLabel = intval(date("m", strtotime($payPeriodDate)));
    $dayLabel = intval(date("d", strtotime($payPeriodDate)));

    $neededPayPeriods[] = [
        "label" => "$monthLabel/$dayLabel",
        "value" => $payPeriodDate,
    ];

    // Calculate next pay period
    if ($payCheckDay == 1) {
        $payCheckDay = 15;
    } else {
        $payCheckDay = 1;
        if ($payCheckMonth < 12) {
            $payCheckMonth += 1;
        } else {
            $payCheckMonth = 1;
            $payCheckYear += 1;
        }
    }
}

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode($neededPayPeriods, JSON_PRETTY_PRINT);
die();

?>