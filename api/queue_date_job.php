<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/Bills.php";
include "../inc/includes.php";
ini_set("display_errors", 1);

if (!isset($_SESSION['user'])) {
    echo "Not logged in\n";
    exit;
}



$sql = "DELETE FROM date_job WHERE `status` IN ('pending', 'done') ";
execQuery1($sql, []);



$sql = "INSERT INTO date_job 
(`status`,  `command`,                 created_at, updated_at, test_mode) VALUES 
('pending', 'generate_bill_dates:{}', NOW(),      NOW(),       $changeTestMode)";
execQuery1($sql, []);

header("Content-type: text/json");
echo json_encode([
    "return_status" => "success"
]);
die();