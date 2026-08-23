<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

$body = api_read_json_body();
$params = array_merge($_REQUEST, $body);
$id = isset($params['id']) ? intval($params['id']) : 0;

if ($id <= 0) {
    api_json_response(array('message' => 'id is required.'), 400);
}

$schedule = getQuerySingle(
    "SELECT * FROM push_notification_schedule WHERE id = :id",
    array('id' => $id)
);

if (!$schedule) {
    api_json_response(array('message' => 'Schedule not found.'), 404);
}

$schedule['id'] = intval($schedule['id']);

api_json_response(array(
    'schedule' => $schedule,
));
