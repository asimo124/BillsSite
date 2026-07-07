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

$task_name = isset($_REQUEST['task_name']) ? trim($_REQUEST['task_name']) : "";
$task_description = isset($_REQUEST['task_description']) ? trim($_REQUEST['task_description']) : "";
$frequency_days = isset($_REQUEST['frequency_days']) ? intval($_REQUEST['frequency_days']) : 0;
$last_confirmed = isset($_REQUEST['last_confirmed']) ? trim($_REQUEST['last_confirmed']) : "";
$created_at_raw = isset($_REQUEST['created_at']) ? trim($_REQUEST['created_at']) : "";

if ($task_name === "" || $frequency_days <= 0) {
    header("Location: add.php?Message=" . urlencode("You did not fill in all the required fields.") . "&error=1");
    exit;
}

if (strlen($task_name) > 120) {
    header("Location: add.php?Message=" . urlencode("Task name must be 120 characters or fewer.") . "&error=1");
    exit;
}

$sql = "SELECT id FROM cpap_reminders WHERE task_name = :task_name";
$existing = getQuerySingle($sql, [':task_name' => $task_name]);
if ($existing) {
    header("Location: add.php?Message=" . urlencode("A reminder with that task name already exists.") . "&error=1");
    exit;
}

$created_at = parseCreatedAt($created_at_raw);
if ($created_at === false) {
    header("Location: add.php?Message=" . urlencode("Created At is not a valid date/time.") . "&error=1");
    exit;
}

$last_confirmed_value = ($last_confirmed !== "") ? $last_confirmed : null;

if ($created_at === null) {
    $sql = "INSERT INTO cpap_reminders (task_name, task_description, frequency_days, last_confirmed)
            VALUES (:task_name, :task_description, :frequency_days, :last_confirmed)";
    execQuery($sql, [
        ':task_name' => $task_name,
        ':task_description' => $task_description !== '' ? $task_description : null,
        ':frequency_days' => $frequency_days,
        ':last_confirmed' => $last_confirmed_value
    ]);
} else {
    $sql = "INSERT INTO cpap_reminders (task_name, task_description, frequency_days, last_confirmed, created_at)
            VALUES (:task_name, :task_description, :frequency_days, :last_confirmed, :created_at)";
    execQuery($sql, [
        ':task_name' => $task_name,
        ':task_description' => $task_description !== '' ? $task_description : null,
        ':frequency_days' => $frequency_days,
        ':last_confirmed' => $last_confirmed_value,
        ':created_at' => $created_at
    ]);
}

header("Location: index.php?Message=" . urlencode("Reminder has been created."));
exit;
