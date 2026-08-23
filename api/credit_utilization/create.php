<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$body = api_read_json_body();

$title = isset($body['title']) ? trim($body['title']) : '';
$debt_owed = isset($body['debt_owed']) ? floatval($body['debt_owed']) : 0;
$credit_limit = isset($body['credit_limit']) ? floatval($body['credit_limit']) : 0;
$min_payment = isset($body['min_payment']) ? floatval($body['min_payment']) : 0;
$amount_to_principal = isset($body['amount_to_principal']) ? floatval($body['amount_to_principal']) : 0;
$sort_order = isset($body['sort_order']) && $body['sort_order'] !== '' ? intval($body['sort_order']) : 0;
$milestone_order = isset($body['milestone_order']) && $body['milestone_order'] !== '' ? intval($body['milestone_order']) : 0;

if (!$sort_order) {
    $result = getQuerySingle("SELECT IFNULL(MAX(sort_order), 0) + 1 AS next_sort_order FROM cu_loan");
    $sort_order = $result ? intval($result['next_sort_order']) : 1;
}

if ($title === '' || ($debt_owed <= 0 && $credit_limit <= 0)) {
    api_json_response(array('message' => 'You did not fill in all the required fields.'), 400);
}

$sql = "INSERT INTO cu_loan
        (title, debt_owed, credit_limit, sort_order, milestone_order, min_payment, amount_to_principal)
        VALUES
        (:title, :debt_owed, :credit_limit, :sort_order, :milestone_order, :min_payment, :amount_to_principal)";

execQuery($sql, array(
    'title' => $title,
    'debt_owed' => $debt_owed,
    'credit_limit' => $credit_limit,
    'sort_order' => $sort_order,
    'milestone_order' => $milestone_order,
    'min_payment' => $min_payment,
    'amount_to_principal' => $amount_to_principal,
));

$id = intval($db_conn->lastInsertId());

api_json_response(array(
    'message' => 'Loan/Card has been created.',
    'id' => $id,
));
