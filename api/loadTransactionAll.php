<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;

include "../inc/includes.php";
include "../inc/api_auth.php";
api_handle_preflight();

//ini_set("display_errors", 1);

$categoryName = isset($_REQUEST['category_name']) ? trim($_REQUEST['category_name']) : '';
$startDate = isset($_REQUEST['start_date']) ? trim($_REQUEST['start_date']) : '';
$endDate = isset($_REQUEST['end_date']) ? trim($_REQUEST['end_date']) : '';
$accountName = isset($_REQUEST['account_name']) ? trim($_REQUEST['account_name']) : '';
$accountNumber = isset($_REQUEST['account_number']) ? trim($_REQUEST['account_number']) : '';
$accountType = isset($_REQUEST['account_type']) ? trim($_REQUEST['account_type']) : '';
$institutionName = isset($_REQUEST['institution_name']) ? trim($_REQUEST['institution_name']) : '';

$name1 = isset($_REQUEST['name1']) ? trim($_REQUEST['name1']) : '';
$name2 = isset($_REQUEST['name2']) ? trim($_REQUEST['name2']) : '';
$name3 = isset($_REQUEST['name3']) ? trim($_REQUEST['name3']) : '';

$amountStart = isset($_REQUEST['amount_start']) ? trim($_REQUEST['amount_start']) : '';
$amountEnd = isset($_REQUEST['amount_end']) ? trim($_REQUEST['amount_end']) : '';

$sortBy = isset($_REQUEST['sort_by1']) ? trim($_REQUEST['sort_by1']) : '';
$sortDir = isset($_REQUEST['sort_dir1']) ? trim($_REQUEST['sort_dir1']) : '';

$sortBy2 = isset($_REQUEST['sort_by2']) ? trim($_REQUEST['sort_by2']) : '';
$sortDir2 = isset($_REQUEST['sort_dir2']) ? trim($_REQUEST['sort_dir2']) : '';

switch ($sortBy) {
    case 'amount':
        $sortBy = 't.amount';
        break;
    case 'name':
        $sortBy = 't.name';
        break;
    case 'transaction_date':
        $sortBy = 't.transaction_date';
        break;
    case 'category':
        $sortBy = 'tc.title';
        break;
    default:
        $sortBy = 't.transaction_date';
        break;
}

if ($sortDir !== 'DESC' && $sortDir !== 'ASC') {
    $sortDir = 'DESC';
}

switch ($sortBy2) {
    case 'amount':
        $sortBy2 = 't.amount';
        break;
    case 'name':
        $sortBy2 = 't.name';
        break;
    case 'transaction_date':
        $sortBy2 = 't.transaction_date';
        break;
    case 'category':
        $sortBy2 = 'tc.title';
        break;
    default:
        $sortBy2 = 't.name';
        break;
}

if ($sortDir2 !== 'DESC' && $sortDir2 !== 'ASC') {
    $sortDir2 = 'ASC';
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

$sqlWhere = "";
$params = [];

if ($categoryName !== '') {
    $sqlWhere .= " AND tc.title = :category_name ";
    $params['category_name'] = $categoryName;
}

$sqlWhere .= " AND t.transaction_date BETWEEN :start_date AND :end_date ";
$params['start_date'] = $startDate;
$params['end_date'] = $endDate;

if ($accountName !== '') {
    $sqlWhere .= " AND t.account_name = :account_name ";
    $params['account_name'] = $accountName;
}
if ($accountNumber !== '') {
    $sqlWhere .= " AND t.account_number = :account_number ";
    $params['account_number'] = $accountNumber;
}
if ($accountType !== '') {
    $sqlWhere .= " AND t.account_type = :account_type ";
    $params['account_type'] = $accountType;
}
if ($institutionName !== '') {
    $sqlWhere .= " AND t.institution_name = :institution_name ";
    $params['institution_name'] = $institutionName;
}

$nameOrParts = [];
if ($name1 !== '') {
    $nameOrParts[] = 't.name LIKE :name1';
    $params['name1'] = '%' . $name1 . '%';
}
if ($name2 !== '') {
    $nameOrParts[] = 't.name LIKE :name2';
    $params['name2'] = '%' . $name2 . '%';
}
if ($name3 !== '') {
    $nameOrParts[] = 't.name LIKE :name3';
    $params['name3'] = '%' . $name3 . '%';
}
if (count($nameOrParts) > 0) {
    $sqlWhere .= ' AND (' . implode(' OR ', $nameOrParts) . ') ';
}

if ($amountStart !== '' && $amountEnd !== '') {
    $sqlWhere .= ' AND t.amount BETWEEN :amount_start AND :amount_end ';
    $params['amount_start'] = floatval($amountStart);
    $params['amount_end'] = floatval($amountEnd);
} elseif ($amountStart !== '') {
    $sqlWhere .= ' AND t.amount >= :amount_start ';
    $params['amount_start'] = floatval($amountStart);
} elseif ($amountEnd !== '') {
    $sqlWhere .= ' AND t.amount <= :amount_end ';
    $params['amount_end'] = floatval($amountEnd);
}

$sql = "SELECT tc.title as category_name, t.transaction_date, t.account_number, t.name, t.amount
        FROM dt_transaction t 
        INNER JOIN dt_transaction_category tc 
            ON t.transaction_category_id = tc.id 
        WHERE 1 
        $sqlWhere
        ORDER BY $sortBy $sortDir, $sortBy2 $sortDir2 ";

$results = getQuery($sql, $params);

$amountTotal = 0;
foreach ($results as $row) {
    $amountTotal += floatval($row['amount']);
}

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'items' => $results,
    'amount_total' => $amountTotal
], JSON_PRETTY_PRINT);
die();

?>
