<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/includes.php";
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";

//ini_set("display_errors", 1);

$paycheck_date = isset($_REQUEST['paycheck_date']) ? trim($_REQUEST['paycheck_date']) : '';
$amount = isset($_REQUEST['amount']) ? floatval($_REQUEST['amount']) : 0;

if (!$paycheck_date) {
    header("Content-type: application/json");
    header('Access-Control-Allow-Origin: *');
    echo json_encode([
        'success' => false,
        'error' => 'Invalid paycheck_date provided.'
    ], JSON_PRETTY_PRINT);
    die();
}

if ($amount <= 0) {
    header("Content-type: application/json");
    header('Access-Control-Allow-Origin: *');
    echo json_encode([
        'success' => false,
        'error' => 'Invalid amount provided.'
    ], JSON_PRETTY_PRINT);
    die();
}


$sql = "INSERT INTO dt_paycheck_disposable (paycheck_date, disposable_amount) 
        VALUES (:paycheck_date, :amount)
        ON DUPLICATE KEY UPDATE disposable_amount = :amount_update
        ";
$result = execQuery($sql, [
    ':paycheck_date' => $paycheck_date,
    ':amount' => $amount,
    ':amount_update' => $amount
]);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'success' => true
], JSON_PRETTY_PRINT);
die();

?>