<?php
ini_set("display_errors", 1);
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$food_id = isset($_REQUEST['food_id']) ? intval($_REQUEST['food_id']) : 0;
$amount = isset($_REQUEST['amount']) ? floatval($_REQUEST['amount']) : 0.0;
$date_consumed = isset($_REQUEST['date_consumed']) ? $_REQUEST['date_consumed'] : "";
$meal_of_day_id = isset($_REQUEST['meal_of_day_id']) ? intval($_REQUEST['meal_of_day_id']) : 0;

if (!strtotime($date_consumed)) {
    header("Location: index.php?Message=" . urlencode("Invalid date format.") . "&error=1");
    exit;
}

$params = [
    'food_id' => $food_id,
    'amount' => $amount,
    'date_consumed' => $date_consumed,
    'meal_of_day_id' => $meal_of_day_id,
];

$sql = "INSERT INTO dl_food_log 
        ( food_id,  amount,  date_consumed,  meal_of_day_id) VALUES
        (:food_id, :amount, :date_consumed, :meal_of_day_id) ";
execQuery($sql, $params);

$lastId = $db_conn->lastInsertId();

header("Location: index.php?Message=" . urlencode("Food Log Item has been created.") . "&" . $searchFilersQueryStr);
exit;