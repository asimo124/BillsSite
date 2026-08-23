<?php

include "../inc/includes.php";
include __DIR__ . "/dietlog_inc.php";

dietlog_require_user();

$req = dietlog_request();
$food_id = isset($req['food_id']) ? intval($req['food_id']) : 0;
$amount = isset($req['amount']) ? floatval($req['amount']) : 0.0;
$date_consumed = isset($req['date_consumed']) ? trim($req['date_consumed']) : '';
$meal_of_day_id = isset($req['meal_of_day_id']) ? intval($req['meal_of_day_id']) : 0;

if ($food_id <= 0 || $meal_of_day_id <= 0 || $date_consumed === '') {
    dietlog_json_exit([
        'success' => false,
        'error' => 'food_id, date_consumed, and meal_of_day_id are required.',
    ], 400);
}

if (!strtotime($date_consumed)) {
    dietlog_json_exit([
        'success' => false,
        'error' => 'Invalid date format.',
    ], 400);
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

dietlog_json_exit([
    'success' => true,
    'id' => (int) $lastId,
]);
