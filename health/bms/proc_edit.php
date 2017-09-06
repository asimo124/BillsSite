<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
$cat_name = isset($_REQUEST['cat_name']) ? trim($_REQUEST['cat_name']) : "";

$sql = "SELECT id
        FROM vnd_bills_charge_categories
        WHERE cat_name = :cat_name and id <> :id ";

$HasCats = getQuery($sql, [
    "cat_name" => $cat_name,
    "id" => $id
]);
if (count($HasCats) > 0) {
    header("Location: edit.php?id=" . $id . "&Message=" . urlencode("This category name already exists") . "&error=1");
    exit;
}

$sql = "UPDATE vnd_bills_charge_categories
        SET cat_name = :cat_name
        WHERE id = :id ";

execQuery($sql, [
    "cat_name" => $cat_name,
    "id" => $id
]);

$lastId = $db_conn->lastInsertId();

header("Location: index.php?Message=" . urlencode("Category has been updated."));
exit;