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

$transactionDate = isset($_REQUEST['transaction_date']) ? trim($_REQUEST['transaction_date']) : '';

if (!$transactionDate) {
    header("Content-type: application/json");
    header('Access-Control-Allow-Origin: *');
    echo json_encode([
        'error' => 'transaction_date parameter is required'
    ], JSON_PRETTY_PRINT);
    die();
}

$sql = "SELECT 
        tc.title as category_name, 
        SUM(t.amount) AS spent, 
        SUM(t.amount) AS accumulated_spent
        -- SUM(SUM(t.amount)) OVER (ORDER BY tc.title) AS accumulated_spent
        FROM dt_transaction t
        INNER JOIN dt_transaction_category tc 
            ON t.transaction_category_id = tc.id
        WHERE 1  
        AND t.is_covered = 0 
        AND t.amount > 0
        AND t.paycheck_date = ?
        AND t.transaction_date = ?
        GROUP BY tc.title
        ORDER BY tc.title ";

$results = getQuery($sql, [$paycheckDate, $transactionDate]);

$chartOptions = [
    'chart' => [
        'type' => 'bar',
    ],
    'xaxis' => [
        'categories' => array_column($results, 'category_name'),
    ],
];

$series = [
    [
        'name' => 'Spent',
        'data' => array_map(function($row) {
            return floatval($row['accumulated_spent']);
        }, $results),
    ],
];

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'chartOptions' => $chartOptions,
    'series' => $series,
], JSON_PRETTY_PRINT);
die();
?>