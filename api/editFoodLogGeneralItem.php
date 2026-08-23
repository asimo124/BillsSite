<?php
include "../inc/includes.php";
include "../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$params = array_merge($_REQUEST, api_read_json_body());

$id = isset($params['id']) ? intval($params['id']) : 0;
$title = isset($params['title']) ? trim($params['title']) : '';

if ($id <= 0) {
    api_json_response(array('message' => 'id is required'), 400);
}
if ($title === '') {
    api_json_response(array('message' => 'title is required'), 400);
}

$existing = getQuerySingle(
    "SELECT id FROM fs_food_general WHERE title = :title AND id <> :id LIMIT 1",
    array('title' => $title, 'id' => $id)
);
if ($existing) {
    api_json_response(array('message' => 'A food general item with that title already exists'), 400);
}

execQuery(
    "UPDATE fs_food_general SET title = :title WHERE id = :id",
    array('title' => $title, 'id' => $id)
);

$item = getQuerySingle(
    "SELECT * FROM fs_food_general WHERE id = :id LIMIT 1",
    array('id' => $id)
);

api_json_response(array(
    'item' => $item,
));
