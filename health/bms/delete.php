<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;

$sql = "DELETE FROM vnd_bills_charge_categories WHERE id = :id ";

execQuery($sql, [
    "id" =>  $id
]);

header("Location: index.php?Message=" . urlencode("You have deleted a category"));
exit;