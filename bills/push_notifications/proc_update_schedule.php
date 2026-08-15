<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
$schedule_id = isset($_REQUEST['schedule_id']) ? intval($_REQUEST['schedule_id']) : 0;

if ($id <= 0) {
    header("Location: index.php?Message=" . urlencode("Reminder not found.") . "&error=1");
    exit;
}

$schedule_id_value = ($schedule_id > 0) ? $schedule_id : null;

if ($schedule_id_value !== null) {
    $schedule = getQuerySingle("SELECT id FROM push_notification_schedule WHERE id = :id", [':id' => $schedule_id_value]);
    if (!$schedule) {
        header("Location: index.php?Message=" . urlencode("Schedule not found.") . "&error=1");
        exit;
    }
}

execQuery(
    "UPDATE push_notification SET schedule_id = :schedule_id WHERE id = :id",
    [
        'schedule_id' => $schedule_id_value,
        'id' => $id
    ]
);

header("Location: index.php?Message=" . urlencode("Schedule has been updated."));
exit;
