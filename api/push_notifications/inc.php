<?php
/**
 * Shared helpers for push_notifications API endpoints.
 */

if (!function_exists('api_handle_preflight')) {
    include_once __DIR__ . '/../../inc/api_auth.php';
}

function push_parse_created_at($value)
{
    $value = trim((string) $value);
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

function push_validate_cron_schedule($cron_schedule)
{
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

function push_normalize_schedule_id($schedule_id)
{
    $schedule_id = intval($schedule_id);
    return $schedule_id > 0 ? $schedule_id : null;
}
