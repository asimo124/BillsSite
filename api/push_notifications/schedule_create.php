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

$title = isset($params['title']) ? trim($params['title']) : '';
$cron_schedule = isset($params['cron_schedule']) ? trim($params['cron_schedule']) : '';

if ($title === '' || $cron_schedule === '') {
    api_json_response(array('message' => 'You did not fill in all the required fields.'), 400);
}

if (strlen($title) > 120) {
    api_json_response(array('message' => 'Title must be 120 characters or fewer.'), 400);
}

if (!push_validate_cron_schedule($cron_schedule)) {
    api_json_response(array('message' => 'Each cron line must have 5 fields (minute hour day month weekday).'), 400);
}

execQuery(
    "INSERT INTO push_notification_schedule (title, cron_schedule) VALUES (:title, :cron_schedule)",
    array(
        'title' => $title,
        'cron_schedule' => $cron_schedule,
    )
);

global $db_conn;
$id = intval($db_conn->lastInsertId());

api_json_response(array(
    'message' => 'Schedule has been created.',
    'id' => $id,
));
