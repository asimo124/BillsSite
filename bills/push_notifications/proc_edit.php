<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

function parseCreatedAt($value) {
    $value = trim($value);
    if ($value === '') {
        return null;
    }

    $value = str_replace('T', ' ', $value);
    $timestamp = strtotime($value);
    if ($timestamp === false) {
        return false;
    }

    return date('Y-m-d H:i:s', $timestamp);
}

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
$task_name = isset($_REQUEST['task_name']) ? trim($_REQUEST['task_name']) : "";
$task_description = isset($_REQUEST['task_description']) ? trim($_REQUEST['task_description']) : "";
$frequency_days = isset($_REQUEST['frequency_days']) ? intval($_REQUEST['frequency_days']) : 0;
$last_confirmed = isset($_REQUEST['last_confirmed']) ? trim($_REQUEST['last_confirmed']) : "";
$created_at_raw = isset($_REQUEST['created_at']) ? trim($_REQUEST['created_at']) : "";

if ($id <= 0 || $task_name === "" || $frequency_days <= 0) {
    header("Location: edit.php?id=" . $id . "&Message=" . urlencode("You did not fill in all the required fields.") . "&error=1");
    exit;
}

if (strlen($task_name) > 120) {
    header("Location: edit.php?id=" . $id . "&Message=" . urlencode("Task name must be 120 characters or fewer.") . "&error=1");
    exit;
}

$sql = "SELECT id FROM cpap_reminders WHERE task_name = :task_name AND id != :id";
$existing = getQuerySingle($sql, [
    ':task_name' => $task_name,
    ':id' => $id
]);
if ($existing) {
    header("Location: edit.php?id=" . $id . "&Message=" . urlencode("A reminder with that task name already exists.") . "&error=1");
    exit;
}

$created_at = parseCreatedAt($created_at_raw);
if ($created_at === false) {
    header("Location: edit.php?id=" . $id . "&Message=" . urlencode("Created At is not a valid date/time.") . "&error=1");
    exit;
}

$last_confirmed_value = ($last_confirmed !== "") ? $last_confirmed : null;

$sql = "UPDATE cpap_reminders
        SET task_name = :task_name,
            task_description = :task_description,
            frequency_days = :frequency_days,
            last_confirmed = :last_confirmed,
            created_at = :created_at
        WHERE id = :id";

execQuery($sql, [
    "task_name" => $task_name,
    "task_description" => $task_description !== '' ? $task_description : null,
    "frequency_days" => $frequency_days,
    "last_confirmed" => $last_confirmed_value,
    "created_at" => $created_at,
    "id" => $id
]);

header("Location: index.php?Message=" . urlencode("Reminder has been updated."));
exit;
