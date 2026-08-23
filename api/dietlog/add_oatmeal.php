<?php

include '../../inc/includes.php';
include __DIR__ . '/../dietlog_inc.php';

dietlog_require_user();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    dietlog_json_exit(array('success' => false, 'error' => 'Method not allowed'), 405);
}

$req = dietlog_request();
$blueberries = isset($req['blueberries']) ? intval($req['blueberries']) : 0;

$sql = "INSERT INTO dl_food_log (food_id, amount, date_consumed, meal_of_day_id) VALUES (10, 1.5, NOW(), 1)";
execQuery($sql);

$sql = "INSERT INTO dl_food_log (food_id, amount, date_consumed, meal_of_day_id) VALUES (16, 0.5, NOW(), 1)";
execQuery($sql);

$sql = "INSERT INTO dl_food_log (food_id, amount, date_consumed, meal_of_day_id) VALUES (25, 1.5, NOW(), 1)";
execQuery($sql);

$sql = "INSERT INTO dl_food_log (food_id, amount, date_consumed, meal_of_day_id) VALUES (22, 0.75, NOW(), 1)";
execQuery($sql);

$msg = 'Oatmeal added.';
if ($blueberries) {
    $sql = "INSERT INTO dl_food_log (food_id, amount, date_consumed, meal_of_day_id) VALUES (17, 0.5, NOW(), 1)";
    execQuery($sql);
    $msg = 'Oatmeal added with blueberries.';
}

dietlog_json_exit(array(
    'success' => true,
    'message' => $msg,
));
