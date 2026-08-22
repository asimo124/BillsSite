<?php
$changeTestMode = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/Bills.php";
include "../inc/includes.php";
include "../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

$sql = "SELECT * FROM date_job WHERE `status` IN ('pending', 'running') ORDER BY created_at DESC LIMIT 1";
$runningJob = getQuery($sql, array());
if ($runningJob) {
    api_json_response(array(
        "return_status" => "running"
    ));
}

api_json_response(array(
    "return_status" => "done"
));
