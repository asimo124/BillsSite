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

if ($food_id <= 0) {
    api_json_response(array('message' => 'food_id is required'), 400);
}

execQuery(
    "DELETE FROM fs_food_history WHERE id = :id",
    array('id' => $food_id)
);

api_json_response(array(
    'success' => true,
));
