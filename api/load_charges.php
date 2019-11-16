<?php
include "../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$date3ago = date("Y-m-d", strtotime("- 3 month"));

$sql = "SELECT *
        FROM vnd_bills_charges
        WHERE date >= :date3ago AND ifnull(category_id, '') = ''
        ORDER BY date DESC, description";

$resultset2 = getQuery($sql, [
    "date3ago" => $date3ago
]);

$resultset = array();
foreach ($resultset2 as $getItem2) {
    if (!isset($getItem[$getItem2['date']])) {
        $getItem[$getItem2['date']] = array();
    }
    $resultset[$getItem2['date']][] = $getItem2;
}

$sql = "SELECT * FROM vnd_bills_charge_categories ORDER BY cat_name ";
$categories = getQuery($sql);

header("Content-type: text/json");
echo json_encode([
   "categories" => $categories,
   "resultset" => $resultset
]);
die();