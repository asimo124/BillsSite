<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
if ($id <= 0) {
    api_json_response(array('message' => 'Invalid loan id'), 400);
}

$sql = "SELECT * FROM cu_loan WHERE id = :id";
$loan = getQuerySingle($sql, array('id' => $id));
if (!$loan) {
    api_json_response(array('message' => 'Loan/Card not found'), 404);
}

$loan['id'] = intval($loan['id']);
$loan['debt_owed'] = floatval($loan['debt_owed']);
$loan['credit_limit'] = floatval($loan['credit_limit']);
$loan['min_payment'] = floatval($loan['min_payment']);
$loan['amount_to_principal'] = floatval($loan['amount_to_principal']);
$loan['sort_order'] = intval($loan['sort_order']);
$loan['milestone_order'] = intval($loan['milestone_order']);
$loan['adjust_disposable_amount'] = floatval($loan['adjust_disposable_amount']);
$loan['bill_id'] = intval($loan['bill_id']);
$loan['can_update_end_date'] = intval($loan['can_update_end_date']);

$sql = "SELECT vnd_id, vnd_bill FROM vnd_bills ORDER BY vnd_bill ASC";
$bills = getQuery($sql);
if (!$bills) {
    $bills = array();
}
foreach ($bills as &$bill) {
    $bill['vnd_id'] = intval($bill['vnd_id']);
}
unset($bill);

api_json_response(array(
    'loan' => $loan,
    'bills' => $bills,
));
