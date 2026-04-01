<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;

include "../inc/includes.php";
//ini_set("display_errors", 1);

$categoryName = isset($_REQUEST['category_name']) ? trim($_REQUEST['category_name']) : '';
$startDate = isset($_REQUEST['start_date']) ? trim($_REQUEST['start_date']) : '';
$endDate = isset($_REQUEST['end_date']) ? trim($_REQUEST['end_date']) : '';
$sortBy = isset($_REQUEST['sort_by']) ? trim($_REQUEST['sort_by']) : '';
$sortDir = isset($_REQUEST['sort_dir']) ? trim($_REQUEST['sort_dir']) : '';

if (!$categoryName) {
    header("Content-type: application/json");
    header('Access-Control-Allow-Origin: *');
    echo json_encode([
        'error' => 'category_name parameter is required'
    ], JSON_PRETTY_PRINT);
    die();
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


switch ($sortBy) {
    case 'amount':
        $sortBy = 'SUM(t.amount)';
        break;
    case 'name':
        $sortBy = 't.name';
        break;
    default:
        $sortBy = 't.name';
        break;
}

if ($sortDir != 'DESC' && $sortDir != 'ASC') {
    $sortDir = 'ASC';
}

$sql = "SELECT t.name, t.amount, t.transaction_date
        FROM dt_transaction t 
        INNER JOIN dt_transaction_category tc 
            ON t.transaction_category_id = tc.id 
        WHERE 1 
        AND t.transaction_date BETWEEN ? AND ?
        AND tc.title = ? 
        ORDER BY $sortBy $sortDir ";

/*/
echo "<pre>";
echo "$sql";
print_r([$startDate, $endDate, $categoryName]);
echo "</pre>";
die();
//*/


$results = getQuery($sql, [$startDate, $endDate, $categoryName]);

$amountTotal = 0;
foreach ($results as $row) {

    $amountTotal += $row['amount'];
}

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'items' => $results,
    'amount_total' => $amountTotal
], JSON_PRETTY_PRINT);
die();

?>