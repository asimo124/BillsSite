<?php

include "../inc/includes.php";
include __DIR__ . "/dietlog_inc.php";

dietlog_require_user();

$req = dietlog_request();
$log_id = isset($req['log_id']) ? intval($req['log_id']) : 0;

if ($log_id <= 0) {
    dietlog_json_exit([
        'success' => false,
        'error' => 'log_id is required.',
    ], 400);
}

execQuery("DELETE FROM dl_food_log WHERE id = :id", [
    'id' => $log_id,
]);

dietlog_json_exit([
    'success' => true,
]);
