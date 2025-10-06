<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/Bills.php";
include "../inc/includes.php";
ini_set("display_errors", 1);

if (!isset($_SESSION['user'])) {
    echo "Not logged in\n";
    exit;
}

$sql = "SELECT * FROM date_job WHERE `status` IN ('pending', 'running') ORDER BY created_at DESC LIMIT 1";
$runningJob = getQuery($sql, []);
if ($runningJob) {
    header("Content-type: text/json");
    echo json_encode([
        "return_status" => "running"
    ]);
    die();
}

header("Content-type: text/json");
echo json_encode([
    "return_status" => "done"
]);
die();