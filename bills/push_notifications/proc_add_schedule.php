<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

function validateCronSchedule($cron_schedule) {
    $lines = preg_split("/\r\n|\r|\n/", $cron_schedule);
    $validLines = 0;

    foreach ($lines as $line) {
        $line = trim($line);
        if ($line === '') {
            continue;
        }

        $parts = preg_split('/\s+/', $line);
        if (count($parts) !== 5) {
            return false;
        }

        foreach ($parts as $part) {
            if (!preg_match('/^(\*|\d+|\*\/\d+|\d+-\d+|\d+(,\d+)+)$/', $part)) {
                return false;
            }
        }

        $validLines++;
    }

    return $validLines > 0;
}

$title = isset($_REQUEST['title']) ? trim($_REQUEST['title']) : "";
$cron_schedule = isset($_REQUEST['cron_schedule']) ? trim($_REQUEST['cron_schedule']) : "";

if ($title === "" || $cron_schedule === "") {
    header("Location: add_schedule.php?Message=" . urlencode("You did not fill in all the required fields.") . "&error=1");
    exit;
}

if (strlen($title) > 120) {
    header("Location: add_schedule.php?Message=" . urlencode("Title must be 120 characters or fewer.") . "&error=1");
    exit;
}

if (!validateCronSchedule($cron_schedule)) {
    header("Location: add_schedule.php?Message=" . urlencode("Each cron line must have 5 fields (minute hour day month weekday).") . "&error=1");
    exit;
}

execQuery(
    "INSERT INTO push_notification_schedule (title, cron_schedule) VALUES (:title, :cron_schedule)",
    [
        ':title' => $title,
        ':cron_schedule' => $cron_schedule
    ]
);

header("Location: index.php?tab=schedules&Message=" . urlencode("Schedule has been created."));
exit;
