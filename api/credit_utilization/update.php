<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$body = api_read_json_body();

$id = isset($body['id']) ? intval($body['id']) : 0;
$title = isset($body['title']) ? trim($body['title']) : '';
$debt_owed = isset($body['debt_owed']) ? floatval($body['debt_owed']) : 0;
$credit_limit = isset($body['credit_limit']) ? floatval($body['credit_limit']) : 0;
$min_payment = isset($body['min_payment']) ? floatval($body['min_payment']) : 0;
$amount_to_principal = isset($body['amount_to_principal']) ? floatval($body['amount_to_principal']) : 0;
$bill_id = isset($body['bill_id']) ? intval($body['bill_id']) : 0;
$can_update_end_date = !empty($body['can_update_end_date']) ? 1 : 0;
$sort_order = isset($body['sort_order']) && $body['sort_order'] !== '' ? intval($body['sort_order']) : 0;
$milestone_order = isset($body['milestone_order']) && $body['milestone_order'] !== '' ? intval($body['milestone_order']) : 0;
$adjust_disposable_amount = isset($body['adjust_disposable_amount']) ? floatval($body['adjust_disposable_amount']) : 0;

if ($id <= 0) {
    api_json_response(array('message' => 'Invalid loan id'), 400);
}

if ($title === '' || ($debt_owed <= 0 && $credit_limit <= 0)) {
    api_json_response(array('message' => 'You did not fill in all the required fields.'), 400);
}

$sql = "UPDATE cu_loan
        SET title = :title,
            debt_owed = :debt_owed,
            credit_limit = :credit_limit,
            min_payment = :min_payment,
            amount_to_principal = :amount_to_principal,
            sort_order = :sort_order,
            milestone_order = :milestone_order,
            can_update_end_date = :can_update_end_date,
            bill_id = :bill_id,
            adjust_disposable_amount = :adjust_disposable_amount
        WHERE id = :id";

execQuery($sql, array(
    'title' => $title,
    'debt_owed' => $debt_owed,
    'credit_limit' => $credit_limit,
    'min_payment' => $min_payment,
    'amount_to_principal' => $amount_to_principal,
    'sort_order' => $sort_order,
    'milestone_order' => $milestone_order,
    'can_update_end_date' => $can_update_end_date,
    'bill_id' => $bill_id,
    'adjust_disposable_amount' => $adjust_disposable_amount,
    'id' => $id,
));

api_json_response(array(
    'message' => 'Loan/Card has been updated.',
    'id' => $id,
));
