<?php

include "../inc/includes.php";
include __DIR__ . "/dietlog_inc.php";

dietlog_require_user();

$foodsLog = getQuery(dietlog_sql_log_entries());
$byDate = dietlog_aggregate_log_rows($foodsLog);

dietlog_json_exit([
    'success' => true,
    'by_date' => $byDate,
]);
