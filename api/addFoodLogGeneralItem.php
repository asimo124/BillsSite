<?php
include "../inc/includes.php";
include "../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$params = array_merge($_REQUEST, api_read_json_body());
$title = isset($params['title']) ? trim($params['title']) : '';

if ($title === '') {
    api_json_response(array('message' => 'title is required'), 400);
}

$existing = getQuerySingle(
    "SELECT id FROM fs_food_general WHERE title = :title LIMIT 1",
    array('title' => $title)
);
if ($existing) {
    api_json_response(array('message' => 'A food general item with that title already exists'), 400);
}

execQuery(
    "INSERT INTO fs_food_general (title) VALUES (:title)",
    array('title' => $title)
);

global $db_conn;
$newId = intval($db_conn->lastInsertId());

$item = getQuerySingle(
    "SELECT * FROM fs_food_general WHERE id = :id LIMIT 1",
    array('id' => $newId)
);

api_json_response(array(
    'item' => $item,
));
