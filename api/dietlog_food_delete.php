<?php

include "../inc/includes.php";
include __DIR__ . "/dietlog_inc.php";

dietlog_require_user();

$food_id = isset($_REQUEST['food_id']) ? intval($_REQUEST['food_id']) : 0;

if ($food_id <= 0) {
    dietlog_json_exit([
        'success' => false,
        'error' => 'food_id is required.',
    ], 400);
}

execQuery("DELETE FROM dl_food WHERE id = :food_id", [
    'food_id' => $food_id,
]);

dietlog_json_exit([
    'success' => true,
]);
