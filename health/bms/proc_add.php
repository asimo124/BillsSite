<?php
include "../../inc/includes.php";

$cat_name = isset($_REQUEST['cat_name']) ? trim($_REQUEST['cat_name']) : "";

$sql = "SELECT id
        FROM vnd_bills_charge_categories
        WHERE cat_name = :cat_name ";

$HasCats = getQuery($sql, [
    "cat_name" => $cat_name
]);
if (count($HasCats) > 0) {
    header("Location: add.php?Message=" . urlencode("This category name already exists") . "&error=1");
    exit;
}

$sql = "INSERT INTO vnd_bills_charge_categories (cat_name) VALUES (:cat_name) ";

execQuery($sql, [
    "cat_name" => $cat_name
]);

$lastId = $db_conn->lastInsertId();

header("Location: index.php?Message=" . urlencode("Category has been added."));
exit;