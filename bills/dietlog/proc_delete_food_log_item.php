<?php
ini_set("display_errors", 1);
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$logId = isset($_REQUEST['log_id']) ? intval($_REQUEST['log_id']) : 0;

if ($logId) {
    execQuery("DELETE FROM dl_food_log WHERE id = :id", [
        "id" => $logId
    ]);
    header("Location: /bills/dietlog/index.php?Message=Log item deleted successfully");
    exit;
}