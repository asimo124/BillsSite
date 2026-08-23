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

$task_name = isset($params['task_name']) ? trim($params['task_name']) : '';
$task_description = isset($params['task_description']) ? trim($params['task_description']) : '';
$frequency_days = isset($params['frequency_days']) ? intval($params['frequency_days']) : 0;
$schedule_id_value = push_normalize_schedule_id(isset($params['schedule_id']) ? $params['schedule_id'] : 0);
$last_confirmed = isset($params['last_confirmed']) ? trim($params['last_confirmed']) : '';
$created_at_raw = isset($params['created_at']) ? trim($params['created_at']) : '';

if ($task_name === '' || $frequency_days <= 0) {
    api_json_response(array('message' => 'You did not fill in all the required fields.'), 400);
}

if (strlen($task_name) > 120) {
    api_json_response(array('message' => 'Task name must be 120 characters or fewer.'), 400);
}

$existing = getQuerySingle(
    "SELECT id FROM push_notification WHERE task_name = :task_name",
    array('task_name' => $task_name)
);
if ($existing) {
    api_json_response(array('message' => 'A reminder with that task name already exists.'), 400);
}

$created_at = push_parse_created_at($created_at_raw);
if ($created_at === false) {
    api_json_response(array('message' => 'Created At is not a valid date/time.'), 400);
}

$last_confirmed_value = ($last_confirmed !== '') ? $last_confirmed : null;
$task_description_value = ($task_description !== '') ? $task_description : null;

if ($created_at === null) {
    execQuery(
        "INSERT INTO push_notification (task_name, task_description, frequency_days, last_confirmed, schedule_id)
         VALUES (:task_name, :task_description, :frequency_days, :last_confirmed, :schedule_id)",
        array(
            'task_name' => $task_name,
            'task_description' => $task_description_value,
            'frequency_days' => $frequency_days,
            'last_confirmed' => $last_confirmed_value,
            'schedule_id' => $schedule_id_value,
        )
    );
} else {
    execQuery(
        "INSERT INTO push_notification (task_name, task_description, frequency_days, last_confirmed, created_at, schedule_id)
         VALUES (:task_name, :task_description, :frequency_days, :last_confirmed, :created_at, :schedule_id)",
        array(
            'task_name' => $task_name,
            'task_description' => $task_description_value,
            'frequency_days' => $frequency_days,
            'last_confirmed' => $last_confirmed_value,
            'created_at' => $created_at,
            'schedule_id' => $schedule_id_value,
        )
    );
}

global $db_conn;
$id = intval($db_conn->lastInsertId());

api_json_response(array(
    'message' => 'Reminder has been created.',
    'id' => $id,
));
