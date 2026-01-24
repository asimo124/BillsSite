<?php
ini_set("display_errors", 1);
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$title = isset($_REQUEST['title']) ? trim($_REQUEST['title']) : "";
$debt_owed = isset($_REQUEST['debt_owed']) ? floatval($_REQUEST['debt_owed']) : 0;
$credit_limit = isset($_REQUEST['credit_limit']) ? floatval($_REQUEST['credit_limit']) : 0;
$sort_order = isset($_REQUEST['sort_order']) ? intval($_REQUEST['sort_order']) : 0;

if (!$sort_order) {
    $sql = "select IFNULL( MAX(sort_order), 0 ) + 1 as next_sort_order from cu_loan";
    $result = getQuerySingle($sql);
    if ($result) {
        $sort_order = $result['next_sort_order'];
    } else {
        $sort_order = 1;
    }
}

if ($title == "" || ($debt_owed <= 0 && $credit_limit <= 0)) {
    header("Location: add.php?Message=" . urlencode("You did not fill in all the required fields.") . "&error=1");
    exit;
}

$sql = "INSERT INTO cu_loan  ( title,  debt_owed,  credit_limit, sort_order) VALUES
        ( :title, :debt_owed, :credit_limit, :sort_order ) ";
        

execQuery($sql, [
    ':title' => $title,
    ':debt_owed' => $debt_owed,
    ':credit_limit' => $credit_limit,
    ':sort_order' => $sort_order
]);

//$lastId = $db_conn->lastInsertId();

header("Location: index.php?Message=" . urlencode("Loan/Card has been created.") . "&" . $searchFilersQueryStr);
exit;