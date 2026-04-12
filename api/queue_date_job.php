<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;

$base_path = dirname(__FILE__) . "/../";
session_start();

include $base_path . "inc/Bills.php";
include $base_path . "inc/includes.php";
ini_set("display_errors", 1);


if (php_sapi_name() !== 'cli' && !isset($_SESSION['user'])) {
    echo "Not logged in\n";
    exit;
}

$test_mode = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;


$sql = "DELETE FROM date_job WHERE `status` IN ('pending', 'done') ";
execQuery1($sql, []);


if ($test_mode == 1) {
    $sql = "INSERT INTO date_job 
    (`status`,  `command`,                 created_at,           updated_at, test_mode) VALUES 
    ('pending', 'generate_bill_dates:{}', UNIX_TIMESTAMP(NOW()), UNIX_TIMESTAMP(NOW()), 1)";
    execQuery1($sql, []);
} else {
    $sql = "INSERT INTO date_job 
    (`status`,  `command`,                 created_at,           updated_at) VALUES 
    ('pending', 'generate_bill_dates:{}', UNIX_TIMESTAMP(NOW()), UNIX_TIMESTAMP(NOW()))";
    execQuery1($sql, []);
}


header("Content-type: text/json");
echo json_encode([
    "return_status" => "success"
]);
die();