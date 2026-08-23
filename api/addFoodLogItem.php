<?php
include "../inc/includes.php";
include "../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$params = array_merge($_REQUEST, api_read_json_body());

$food_id = isset($params['food_id']) ? intval($params['food_id']) : 0;
$food_general_id = isset($params['food_general_id']) ? intval($params['food_general_id']) : 0;
$consumed_date = isset($params['consumed_date']) ? trim($params['consumed_date']) : date('m/d/Y');

if ($food_id === 0 && $food_general_id === 0) {
    api_json_response(array('message' => 'food_id or food_general_id is required'), 400);
}

$timestamp = strtotime($consumed_date);
if ($timestamp === false) {
    api_json_response(array('message' => 'Invalid consumed_date'), 400);
}
$consumed_date2 = date('Y-m-d', $timestamp);

if ($food_id > 0) {
    $refTable = 'fs_food';
    $refTableId = $food_id;
} else {
    $refTable = 'fs_food_general';
    $refTableId = $food_general_id;
}

execQuery(
    "INSERT INTO fs_food_history (ref_table, ref_table_id, consumed_date) VALUES (:ref_table, :ref_table_id, :consumed_date)",
    array(
        'ref_table' => $refTable,
        'ref_table_id' => $refTableId,
        'consumed_date' => $consumed_date2,
    )
);

global $db_conn;
$newId = intval($db_conn->lastInsertId());

$item = getQuerySingle(
    "SELECT * FROM fs_food_history WHERE id = :id LIMIT 1",
    array('id' => $newId)
);

api_json_response(array(
    'item' => $item,
));
