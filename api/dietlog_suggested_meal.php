<?php

include "../inc/includes.php";
include __DIR__ . "/dietlog_inc.php";

dietlog_require_user();

$meals = getQuery("SELECT * FROM dl_meal_of_day ORDER BY id ASC");
$slot = dietlog_chicago_meal_slot();
$id = dietlog_resolve_meal_id_for_slot($meals, $slot);

if ($id === null && count($meals) > 0) {
    $id = (int) $meals[0]['id'];
}

dietlog_json_exit([
    'success' => true,
    'meal_of_day_id' => $id,
]);
