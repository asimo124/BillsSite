<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;

include "../inc/includes.php";
//ini_set("display_errors", 1);

$sql = "SELECT DISTINCT tc.title AS category_name
        FROM dt_transaction t
        INNER JOIN dt_transaction_category tc ON t.transaction_category_id = tc.id
        WHERE t.amount > 0
        ORDER BY tc.title";

$results = getQuery($sql);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'items' => $results
], JSON_PRETTY_PRINT);
die();

?>
