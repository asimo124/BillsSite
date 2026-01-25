<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;

$title = isset($_REQUEST['title']) ? trim($_REQUEST['title']) : "";
$debt_owed = isset($_REQUEST['debt_owed']) ? floatval($_REQUEST['debt_owed']) : 0;
$credit_limit = isset($_REQUEST['credit_limit']) ? floatval($_REQUEST['credit_limit']) : 0;
$sort_order = isset($_REQUEST['sort_order']) ? intval($_REQUEST['sort_order']) : 0;
$milestone_order = isset($_REQUEST['milestone_order']) ? intval($_REQUEST['milestone_order']) : 0;

if ($title == "" || ($debt_owed <= 0 && $credit_limit <= 0)) {
    header("Location: edit.php?id=" . $id . "&Message=" . urlencode("You did not fill in all the required fields.") . "&error=1");
    exit;
}

$sql = "UPDATE cu_loan
        SET title = :title,
            debt_owed = :debt_owed,
            credit_limit = :credit_limit,
            sort_order = :sort_order,
            milestone_order = :milestone_order
        WHERE id = :id ";

execQuery($sql, [
    "title" => $title,
    "debt_owed" => $debt_owed,
    "credit_limit" => $credit_limit,
    "sort_order" => $sort_order,
    "milestone_order" => $milestone_order,
    "id" => $id
]);

//$lastId = $db_conn->lastInsertId();

header("Location: index.php?Message=" . urlencode("Loan/Card has been updated.") . "&" . $searchFilersQueryStr);
exit;