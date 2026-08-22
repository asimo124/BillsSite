<?php
$changeTestMode = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;

$base_path = dirname(__FILE__) . "/../";
session_start();

include $base_path . "inc/Bills.php";
include $base_path . "inc/includes.php";
include $base_path . "inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

$test_mode = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;

$sql = "DELETE FROM date_job WHERE `status` IN ('pending', 'done') ";
execQuery1($sql, array());

if ($test_mode == 1) {
    $sql = "INSERT INTO date_job
    (`status`,  `command`,                 created_at,           updated_at, test_mode) VALUES
    ('pending', 'generate_bill_dates:{}', UNIX_TIMESTAMP(NOW()), UNIX_TIMESTAMP(NOW()), 1)";
    execQuery1($sql, array());
} else {
    $sql = "INSERT INTO date_job
    (`status`,  `command`,                 created_at,           updated_at) VALUES
    ('pending', 'generate_bill_dates:{}', UNIX_TIMESTAMP(NOW()), UNIX_TIMESTAMP(NOW()))";
    execQuery1($sql, array());
}

api_json_response(array(
    "return_status" => "success"
));
