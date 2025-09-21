<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/Bills.php";
include "../inc/includes.php";
ini_set("display_errors", 1);

if (!isset($_SESSION['user'])) {
    echo "Not logged in\n";
    exit;
}

$sql = "DELETE FROM date_job WHERE status_name IN ('pending', 'completed') ";
execQuery($sql, []);

$sql = "INSERT INTO date_job (status_name, created_at, updated_at) VALUES ('pending', NOW(), NOW())";
execQuery($sql, []);

header("Content-type: text/json");
echo json_encode([
    "return_status" => "success"
]);
die();