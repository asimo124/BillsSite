<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";
include "../inc/includes.php";
//ini_set("display_errors", 1);

set_time_limit(300);

$date = isset($_REQUEST['date']) ? trim($_REQUEST['date']) : "";
$amount = isset($_REQUEST['amount']) ? floatval($_REQUEST['amount']) : 0.0;
$title = isset($_REQUEST['title']) ? trim($_REQUEST['title']) : "";
$bill_id = isset($_REQUEST['bill_id']) ? intval($_REQUEST['bill_id']) : 0;
$paycheck_date = isset($_REQUEST['paycheck_date']) ? trim($_REQUEST['paycheck_date']) : "";

$isEnabled    = isset($_REQUEST['is_enabled']) ? intval($_REQUEST['is_enabled']) : 0;

if (!$date || !$title) {
    header("Content-type: application/json");
    header('Access-Control-Allow-Origin: *');
    echo json_encode([
        'success' => false,
        'message' => 'Date, title, and amount are required.'
    ], JSON_PRETTY_PRINT);
    die();
}

$sql = "SELECT * FROM vnd_pay_period_bill_date_passed WHERE bill_id = '{$bill_id}';";
$existingRecord = getQuerySingle($sql);

if ($existingRecord) {
    // Update the existing record
    $sql = "UPDATE vnd_pay_period_bill_date_passed SET is_enabled = {$isEnabled} WHERE bill_id = '{$bill_id}' AND paycheck_date = '{$paycheck_date}' ";
    execQuery($sql);
} else {
    // Insert a new record
    $sql = "INSERT INTO vnd_pay_period_bill_date_passed (bill_date, title, amount, is_enabled, multiplier, bill_id, paycheck_date) VALUES ('{$date}', '{$title}', {$amount}, {$isEnabled}, 1, {$bill_id}, '{$paycheck_date}');";
    execQuery($sql);
}

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'success' => true,
    'message' => 'Bill date enabled status updated successfully.'
], JSON_PRETTY_PRINT);
die();

?>