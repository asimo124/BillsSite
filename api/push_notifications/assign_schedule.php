<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";
include __DIR__ . "/inc.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$body = api_read_json_body();
$params = array_merge($_REQUEST, $body);

$id = isset($params['id']) ? intval($params['id']) : 0;
$schedule_id_value = push_normalize_schedule_id(isset($params['schedule_id']) ? $params['schedule_id'] : 0);

if ($id <= 0) {
    api_json_response(array('message' => 'Reminder not found.'), 400);
}

if ($schedule_id_value !== null) {
    $schedule = getQuerySingle(
        "SELECT id FROM push_notification_schedule WHERE id = :id",
        array('id' => $schedule_id_value)
    );
    if (!$schedule) {
        api_json_response(array('message' => 'Schedule not found.'), 400);
    }
}

execQuery(
    "UPDATE push_notification SET schedule_id = :schedule_id WHERE id = :id",
    array(
        'schedule_id' => $schedule_id_value,
        'id' => $id,
    )
);

api_json_response(array(
    'message' => 'Schedule has been updated.',
));
