<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

$reminders = getQuery(
    "SELECT pn.*, pns.title AS schedule_title
     FROM push_notification pn
     LEFT JOIN push_notification_schedule pns ON pns.id = pn.schedule_id
     ORDER BY pn.task_name ASC"
);
if (!$reminders) {
    $reminders = array();
}

$schedules = getQuery("SELECT * FROM push_notification_schedule ORDER BY title ASC");
if (!$schedules) {
    $schedules = array();
}

foreach ($reminders as $i => $row) {
    $reminders[$i]['id'] = intval($row['id']);
    $reminders[$i]['frequency_days'] = intval($row['frequency_days']);
    $reminders[$i]['schedule_id'] = $row['schedule_id'] !== null ? intval($row['schedule_id']) : null;
}

foreach ($schedules as $i => $row) {
    $schedules[$i]['id'] = intval($row['id']);
}

api_json_response(array(
    'reminders' => $reminders,
    'schedules' => $schedules,
));
