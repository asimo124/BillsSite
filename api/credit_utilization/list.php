<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

$body = api_read_json_body();
$params = array_merge($_REQUEST, $body);

$sort = isset($params['sort']) ? trim($params['sort']) : 'milestone_order';
$sort_dir = isset($params['sort_dir']) ? strtoupper(trim($params['sort_dir'])) : 'ASC';
if ($sort_dir !== 'ASC' && $sort_dir !== 'DESC') {
    $sort_dir = 'ASC';
}

$increaseCreditLimitBy = isset($params['increase_credit_limit_by'])
    ? floatval($params['increase_credit_limit_by'])
    : 0;

$allowedSort = array(
    'sort_order' => 'sort_order',
    'debt_owed' => 'debt_owed',
    'title' => 'title',
    'milestone_order' => 'CASE WHEN milestone_order = 0 THEN 9999 ELSE milestone_order END',
);

if (!isset($allowedSort[$sort])) {
    $sort = 'milestone_order';
}
$orderBy = $allowedSort[$sort];

// Blank sort_order is always allowed — no filter on sort_order > 0.
$sql = "SELECT * FROM cu_loan WHERE 1 ORDER BY $orderBy $sort_dir";
$loans = getQuery($sql);
if (!$loans) {
    $loans = array();
}

$defaultdisposable = 3000 + (400 * 2) - (180 * 2);

$minPaymentAccum = 0;
$adjustDisposableAmountAccum = 0;
$totalDebtOwed = 0;
$totalCreditLimit = 0;

foreach ($loans as $index => $loan) {
    $debtOwed = floatval($loan['debt_owed']);
    $creditLimit = floatval($loan['credit_limit']);
    $minPayment = floatval($loan['min_payment']);
    $adjustDisposable = floatval($loan['adjust_disposable_amount']);

    $totalDebtOwed += $debtOwed;
    $totalCreditLimit += $creditLimit;

    if ($creditLimit > 0) {
        $loans[$index]['credit_utilization'] = round(($debtOwed / $creditLimit), 4) * 100;
    } else {
        $loans[$index]['credit_utilization'] = 0;
    }

    $adjustDisposableAmountAccum += $adjustDisposable;
    $loans[$index]['id'] = intval($loan['id']);
    $loans[$index]['debt_owed'] = $debtOwed;
    $loans[$index]['credit_limit'] = $creditLimit;
    $loans[$index]['min_payment'] = $minPayment;
    $loans[$index]['amount_to_principal'] = floatval($loan['amount_to_principal']);
    $loans[$index]['sort_order'] = intval($loan['sort_order']);
    $loans[$index]['milestone_order'] = intval($loan['milestone_order']);
    $loans[$index]['adjust_disposable_amount'] = $adjustDisposable;
    $loans[$index]['bill_id'] = intval($loan['bill_id']);
    $loans[$index]['can_update_end_date'] = intval($loan['can_update_end_date']);
    $loans[$index]['min_payment_accum'] = $minPaymentAccum;
    $loans[$index]['adjust_disposable_amount_accum'] = $adjustDisposableAmountAccum;
    $loans[$index]['min_payment_adjust_disposable'] = floatval($minPaymentAccum) + $adjustDisposableAmountAccum + $defaultdisposable;

    $minPaymentAccum += $minPayment;
}

$totalCreditLimitWithIncrease = $totalCreditLimit + $increaseCreditLimitBy;
$creditUtilization = ($totalCreditLimitWithIncrease > 0)
    ? round(($totalDebtOwed / $totalCreditLimitWithIncrease), 4) * 100
    : 0;
$creditUtilizationOrig = $creditUtilization / 100;

$minHeader = 0.29;
$headerLength = round($creditUtilization / 100, 4) - 0.29;
if ($headerLength < 0) {
    $headerLength = 0;
}

$chartHeaders = array(0.29);
$numHeaders = 4;
$increments = $headerLength / $numHeaders;
for ($i = 1; $i <= $numHeaders; $i++) {
    $minHeader += $increments;
    $chartHeaders[] = round($minHeader, 4);
}
sort($chartHeaders);

$chartValues = array();
foreach ($chartHeaders as $header) {
    $chartValues[] = round(($header * $totalCreditLimitWithIncrease), 4);
}

$sql = "SELECT * FROM cu_loan WHERE 1 AND milestone_order > 0 ORDER BY milestone_order ASC";
$loansByMilestone = getQuery($sql);
if (!$loansByMilestone) {
    $loansByMilestone = array();
}

$totalDebtOwedNew = $totalDebtOwed;
$totalMinPayment = 0;
$chartMilestoneResults = array();

foreach ($loansByMilestone as $loan) {
    $debtOwed = floatval($loan['debt_owed']);
    $totalMinPayment += floatval($loan['min_payment']);
    $totalDebtOwedNew -= $debtOwed;

    $creditUtilization2 = ($totalCreditLimitWithIncrease > 0)
        ? round(($totalDebtOwedNew / $totalCreditLimitWithIncrease), 4) * 100
        : 0;

    $chartMilestoneResults[] = array(
        'title' => $loan['title'],
        'value' => $creditUtilization2,
    );

    if ($totalDebtOwedNew < 0) {
        $totalDebtOwedNew = 0;
    }
}

api_json_response(array(
    'loans' => $loans,
    'summary' => array(
        'total_debt_owed' => round($totalDebtOwed, 2),
        'total_credit_limit' => round($totalCreditLimitWithIncrease, 2),
        'credit_utilization' => round($creditUtilization, 2),
        'total_min_payment' => round($totalMinPayment, 2),
        'increase_credit_limit_by' => $increaseCreditLimitBy,
    ),
    'chart' => array(
        'headers' => $chartHeaders,
        'values' => $chartValues,
        'credit_utilization_orig' => $creditUtilizationOrig,
    ),
    'milestones' => $chartMilestoneResults,
    'filters' => array(
        'sort' => isset($params['sort']) ? $params['sort'] : 'milestone_order',
        'sort_dir' => $sort_dir,
    ),
));
