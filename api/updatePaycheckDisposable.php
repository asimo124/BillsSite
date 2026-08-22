<?php
$changeTestMode = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/includes.php";
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";
include "../inc/api_auth.php";

// Keep open for Angular Bills SPA + legacy admin; MyBudget still sends Bearer.
api_handle_preflight();

$paycheck_date = isset($_REQUEST['paycheck_date']) ? trim($_REQUEST['paycheck_date']) : '';
$amount = isset($_REQUEST['amount']) ? floatval($_REQUEST['amount']) : 0;

if (!$paycheck_date) {
    api_json_response(array(
        'success' => false,
        'error' => 'Invalid paycheck_date provided.',
    ), 400);
}

if ($amount <= 0) {
    api_json_response(array(
        'success' => false,
        'error' => 'Invalid amount provided.',
    ), 400);
}

$sql = "INSERT INTO dt_paycheck_disposable (paycheck_date, disposable_amount)
        VALUES (:paycheck_date, :amount)
        ON DUPLICATE KEY UPDATE disposable_amount = :amount_update";

execQuery($sql, array(
    'paycheck_date' => $paycheck_date,
    'amount' => $amount,
    'amount_update' => $amount,
));

api_json_response(array('success' => true));
