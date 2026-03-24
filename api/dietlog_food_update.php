<?php

include "../inc/includes.php";
include __DIR__ . "/dietlog_inc.php";

dietlog_require_user();

$food_id = isset($_REQUEST['food_id']) ? intval($_REQUEST['food_id']) : 0;
$title = isset($_REQUEST['title']) ? trim($_REQUEST['title']) : '';
$macro_type_id = isset($_REQUEST['macro_type_id']) ? intval($_REQUEST['macro_type_id']) : 0;
$type_id = isset($_REQUEST['type_id']) ? intval($_REQUEST['type_id']) : 0;
$has_fiber = isset($_REQUEST['has_fiber']) ? intval($_REQUEST['has_fiber']) : 0;
$percent_fiber = isset($_REQUEST['percent_fiber']) ? floatval($_REQUEST['percent_fiber']) : 0.0;
$percent_soluble_fiber = isset($_REQUEST['percent_soluble_fiber']) ? floatval($_REQUEST['percent_soluble_fiber']) : 0.0;
$is_cruciferous = isset($_REQUEST['is_cruciferous']) ? intval($_REQUEST['is_cruciferous']) : 0;
$unit_of_measure_id = isset($_REQUEST['unit_of_measure_id']) ? intval($_REQUEST['unit_of_measure_id']) : 0;
$default_amount = isset($_REQUEST['default_amount']) ? floatval($_REQUEST['default_amount']) : 0.0;

if ($food_id <= 0) {
    dietlog_json_exit([
        'success' => false,
        'error' => 'food_id is required.',
    ], 400);
}

if ($title === '' || $macro_type_id <= 0 || $unit_of_measure_id <= 0) {
    dietlog_json_exit([
        'success' => false,
        'error' => 'title, macro_type_id, and unit_of_measure_id are required.',
    ], 400);
}

$percent_fiber = round($percent_fiber / 100, 4);
$percent_soluble_fiber = round($percent_soluble_fiber / 100, 4);

$is_soluble_fiber = ($percent_soluble_fiber >= 0.3) ? 1 : 0;

$params = [
    'food_id' => $food_id,
    'title' => $title,
    'macro_type_id' => $macro_type_id,
    'type_id' => $type_id,
    'has_fiber' => $has_fiber,
    'percent_fiber' => $percent_fiber,
    'percent_soluble_fiber' => $percent_soluble_fiber,
    'is_cruciferous' => $is_cruciferous,
    'unit_of_measure_id' => $unit_of_measure_id,
    'is_soluble_fiber' => $is_soluble_fiber,
    'default_amount' => $default_amount,
];

$sql = "UPDATE dl_food SET
        title = :title,
        macro_type_id = :macro_type_id,
        type_id = :type_id,
        has_fiber = :has_fiber,
        percent_fiber = :percent_fiber,
        percent_soluble_fiber = :percent_soluble_fiber,
        is_cruciferous = :is_cruciferous,
        unit_of_measure_id = :unit_of_measure_id,
        is_soluble_fiber = :is_soluble_fiber,
        default_amount = :default_amount
        WHERE id = :food_id";

execQuery($sql, $params);

dietlog_json_exit([
    'success' => true,
    'id' => $food_id,
]);
