<?php
ini_set("display_errors", 1);
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$blueberries = isset($_REQUEST['blueberries']) ? intval($_REQUEST['blueberries']) : 0;

$sql = "INSERT INTO dl_food_log 
(food_id,  amount, date_consumed, meal_of_day_id) VALUES 
(10,       1.5,    NOW(),         1) ";

execQuery($sql);

$sql = "INSERT INTO dl_food_log 
(food_id,  amount, date_consumed, meal_of_day_id) VALUES 
(16,       0.5,    NOW(),         1) ";
execQuery($sql);

$sql = "INSERT INTO dl_food_log 
(food_id,  amount, date_consumed, meal_of_day_id) VALUES 
(25,       1.5,    NOW(),         1) ";
execQuery($sql);

$sql = "INSERT INTO dl_food_log 
(food_id,  amount, date_consumed, meal_of_day_id) VALUES 
(22,       0.75,    NOW(),         1) ";
execQuery($sql);

$msg = "Oatmeal added.";
if ($blueberries) {
    $sql = "INSERT INTO dl_food_log
    (food_id,  amount, date_consumed, meal_of_day_id) VALUES 
    (17,       0.5,    NOW(),         1) ";
    execQuery($sql);
    $msg = "Oatmeal added with blueberries.";
}



header("Location: index.php?Message=" . urlencode($msg) . "&" . $searchFilersQueryStr);
exit;