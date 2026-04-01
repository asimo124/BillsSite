<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;

include "../inc/includes.php";
//ini_set("display_errors", 1);

$startDate = isset($_REQUEST['start_date']) ? trim($_REQUEST['start_date']) : '';
$endDate = isset($_REQUEST['end_date']) ? trim($_REQUEST['end_date']) : '';
$sortBy = isset($_REQUEST['sort_by']) ? trim($_REQUEST['sort_by']) : '';
$sortDir = isset($_REQUEST['sort_dir']) ? trim($_REQUEST['sort_dir']) : '';


switch ($sortBy) {
    case 'amount':
        $sortBy = 'SUM(t.amount)';
        break;
    case 'title':
        $sortBy = 'tc.title';
        break;
    default:
        $sortBy = 'tc.title';
        break;
}

if ($sortDir != 'DESC' && $sortDir != 'ASC') {
    $sortDir = 'ASC';
}

if (!$startDate) {
    $startDate = date('Y-m-d', strtotime('-3 months'));
}

if (!$endDate) {
    $endDate = date('Y-m-d');
}   

if (strtotime($startDate) > strtotime($endDate)) {
    header("Content-type: application/json");
    header('Access-Control-Allow-Origin: *');
    echo json_encode([
        'error' => 'start_date must be before end_date'
    ], JSON_PRETTY_PRINT);
    die();
}

$sql = "SELECT tc.title, SUM(t.amount) as amount_per_category
        FROM dt_transaction t 
        INNER JOIN dt_transaction_category tc 
            ON t.transaction_category_id = tc.id 
        WHERE 1 
        AND t.transaction_date BETWEEN ? AND ?
        GROUP BY tc.title 
        ORDER BY $sortBy $sortDir ";

$results = getQuery($sql, [$startDate, $endDate]);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'items' => $results
], JSON_PRETTY_PRINT);
die();

?>