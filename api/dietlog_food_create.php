<?php

include "../inc/includes.php";
include __DIR__ . "/dietlog_inc.php";

dietlog_require_user();

$req = dietlog_request();
$title = isset($req['title']) ? trim($req['title']) : '';
$macro_type_id = isset($req['macro_type_id']) ? intval($req['macro_type_id']) : 0;
$type_id = isset($req['type_id']) ? intval($req['type_id']) : 0;
$has_fiber = isset($req['has_fiber']) ? intval($req['has_fiber']) : 0;
$percent_fiber = isset($req['percent_fiber']) ? floatval($req['percent_fiber']) : 0.0;
$percent_soluble_fiber = isset($req['percent_soluble_fiber']) ? floatval($req['percent_soluble_fiber']) : 0.0;
$is_cruciferous = isset($req['is_cruciferous']) ? intval($req['is_cruciferous']) : 0;
$unit_of_measure_id = isset($req['unit_of_measure_id']) ? intval($req['unit_of_measure_id']) : 0;
$default_amount = isset($req['default_amount']) ? floatval($req['default_amount']) : 0.0;

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

$sql = "INSERT INTO dl_food
        (title,   macro_type_id,  type_id,  has_fiber,  percent_fiber,  percent_soluble_fiber,  is_cruciferous,  unit_of_measure_id,  is_soluble_fiber,  default_amount) VALUES
        (:title, :macro_type_id, :type_id, :has_fiber, :percent_fiber, :percent_soluble_fiber, :is_cruciferous, :unit_of_measure_id, :is_soluble_fiber, :default_amount) ";

execQuery($sql, $params);

$lastId = $db_conn->lastInsertId();

dietlog_json_exit([
    'success' => true,
    'id' => (int) $lastId,
]);
