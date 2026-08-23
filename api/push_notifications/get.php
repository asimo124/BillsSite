<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";
include __DIR__ . "/inc.php";

api_handle_preflight();
require_api_auth_or_session();

$body = api_read_json_body();
$params = array_merge($_REQUEST, $body);
$id = isset($params['id']) ? intval($params['id']) : 0;

if ($id <= 0) {
    api_json_response(array('message' => 'id is required.'), 400);
}

$reminder = getQuerySingle(
    "SELECT * FROM push_notification WHERE id = :id",
    array('id' => $id)
);

if (!$reminder) {
    api_json_response(array('message' => 'Reminder not found.'), 404);
}

$schedules = getQuery("SELECT * FROM push_notification_schedule ORDER BY title ASC");
if (!$schedules) {
    $schedules = array();
}

$reminder['id'] = intval($reminder['id']);
$reminder['frequency_days'] = intval($reminder['frequency_days']);
$reminder['schedule_id'] = $reminder['schedule_id'] !== null ? intval($reminder['schedule_id']) : null;

foreach ($schedules as $i => $row) {
    $schedules[$i]['id'] = intval($row['id']);
}

api_json_response(array(
    'reminder' => $reminder,
    'schedules' => $schedules,
));
