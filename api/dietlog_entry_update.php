<?php

include "../inc/includes.php";
include __DIR__ . "/dietlog_inc.php";

dietlog_require_user();

$req = dietlog_request();
$log_id = isset($req['log_id']) ? intval($req['log_id']) : 0;
$food_id = isset($req['food_id']) ? intval($req['food_id']) : 0;
$amount = isset($req['amount']) ? floatval($req['amount']) : 0.0;
$date_consumed = isset($req['date_consumed']) ? trim($req['date_consumed']) : '';
$meal_of_day_id = isset($req['meal_of_day_id']) ? intval($req['meal_of_day_id']) : 0;

if ($log_id <= 0) {
    dietlog_json_exit([
        'success' => false,
        'error' => 'log_id is required.',
    ], 400);
}

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
    'log_id' => $log_id,
    'food_id' => $food_id,
    'amount' => $amount,
    'date_consumed' => $date_consumed,
    'meal_of_day_id' => $meal_of_day_id,
];

$sql = "UPDATE dl_food_log SET
        food_id = :food_id,
        amount = :amount,
        date_consumed = :date_consumed,
        meal_of_day_id = :meal_of_day_id
        WHERE id = :log_id";

execQuery($sql, $params);

dietlog_json_exit([
    'success' => true,
    'id' => $log_id,
]);
