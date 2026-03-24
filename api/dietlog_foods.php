<?php

include "../inc/includes.php";
include __DIR__ . "/dietlog_inc.php";

dietlog_require_user();

$foods = getQuery(dietlog_sql_foods());

dietlog_json_exit([
    'success' => true,
    'foods' => $foods,
]);
