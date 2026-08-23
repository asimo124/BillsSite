<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;

include "../inc/includes.php";
include "../inc/api_auth.php";
api_handle_preflight();

//ini_set("display_errors", 1);

$sql = "SELECT DISTINCT account_number FROM dt_transaction WHERE 1 AND amount > 0 ORDER BY account_number";

$results = getQuery($sql);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'items' => $results
], JSON_PRETTY_PRINT);
die();

?>