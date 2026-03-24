<?php
/**
 * Same JSON as dietlog_foods.php — no session (for public read-only /dietlog/index.php).
 */

include "../inc/includes.php";
include __DIR__ . "/dietlog_inc.php";

$foods = getQuery(dietlog_sql_foods());

dietlog_json_exit([
    'success' => true,
    'foods' => $foods,
]);
