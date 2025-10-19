<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";
include "../inc/includes.php";
//ini_set("display_errors", 1);

set_time_limit(300);

$billDateId = isset($_REQUEST['bill_date_id']) ? intval($_REQUEST['bill_date_id']) : 0;
$payPeriodId = isset($_REQUEST['pay_period_id']) ? intval($_REQUEST['pay_period_id']) : 0;
$isEnabled    = isset($_REQUEST['is_enabled']) ? intval($_REQUEST['enabled']) : 0;

$sql = "SELECT * FROM vnd_pay_period_bill_date_passed WHERE bill_date_id = {$billDateId} AND pay_period_id = {$payPeriodId} LIMIT 1;";
$existingRecord = getQuerySingle($sql);

if ($existingRecord) {
    // Update the existing record
    $sql = "UPDATE vnd_pay_period_bill_date_passed SET is_enabled = {$isEnabled} WHERE bill_date_id = {$billDateId} AND pay_period_id = {$payPeriodId};";
    execQuery($sql);
} else {
    // Insert a new record
    $sql = "INSERT INTO vnd_pay_period_bill_date_passed (bill_date_id, pay_period_id, is_enabled) VALUES ({$billDateId}, {$payPeriodId}, {$isEnabled});";
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