<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;

include "../inc/includes.php";
//ini_set("display_errors", 1);

$paycheckDate = isset($_REQUEST['paycheck_date']) ? trim($_REQUEST['paycheck_date']) : '';

if (!$paycheckDate) {
    $payCheckDay = date('d');
    if ($payCheckDay <= 15) {
        $paycheckDate = date('Y-m-15');
    } else {
        $paycheckDate = date('Y-m-t');
    }
}

$sql = "SELECT t.*, tc.title as category_name 
        FROM dt_transaction t
        INNER JOIN dt_transaction_category tc 
            ON t.transaction_category_id = tc.id 
        WHERE  1  
        AND t.is_covered = 0 
        AND t.amount > 0
        AND t.paycheck_date = ?
        ORDER BY t.transaction_date
        ";

$results = getQuery($sql, [$paycheckDate]);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'items' => $results
], JSON_PRETTY_PRINT);
die();

?>