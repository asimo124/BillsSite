<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;

if ($id <= 0) {
    header("Location: index.php?tab=schedules&Message=" . urlencode("Schedule not found.") . "&error=1");
    exit;
}

$inUse = getQuerySingle(
    "SELECT id FROM push_notification WHERE schedule_id = :id LIMIT 1",
    [':id' => $id]
);

if ($inUse) {
    header("Location: index.php?tab=schedules&Message=" . urlencode("This schedule is assigned to one or more push notifications and cannot be deleted.") . "&error=1");
    exit;
}

execQuery("DELETE FROM push_notification_schedule WHERE id = :id", [
    "id" => $id
]);

header("Location: index.php?tab=schedules&Message=" . urlencode("You have deleted a schedule."));
exit;
