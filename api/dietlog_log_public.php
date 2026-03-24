<?php
/**
 * Same JSON as dietlog_log.php — no session (for public read-only /dietlog/index.php).
 */

include "../inc/includes.php";
include __DIR__ . "/dietlog_inc.php";

$foodsLog = getQuery(dietlog_sql_log_entries());
$byDate = dietlog_aggregate_log_rows($foodsLog);

dietlog_json_exit([
    'success' => true,
    'by_date' => $byDate,
]);
