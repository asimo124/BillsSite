<?php
include "../inc/includes.php";
//ini_set("display_errors", 1);

$keyword = isset($_REQUEST['keyword']) ? trim($_REQUEST['keyword']) : '';
$startDate = isset($_REQUEST['start_date']) ? trim($_REQUEST['start_date']) : '';
$endDate = isset($_REQUEST['end_date']) ? trim($_REQUEST['end_date']) : '';
$page = isset($_REQUEST['page']) ? max(1, intval($_REQUEST['page'])) : 1;
$perPage = isset($_REQUEST['per_page']) ? intval($_REQUEST['per_page']) : 20;

if (!in_array($perPage, [20, 50, 100], true)) {
    $perPage = 20;
}

$sqlWhere = " AND (to_delete IS NULL OR to_delete = 0) ";
$params = [];

if ($keyword !== '') {
    $sqlWhere .= " AND (name LIKE :keyword_name OR body LIKE :keyword_body) ";
    $params['keyword_name'] = '%' . $keyword . '%';
    $params['keyword_body'] = '%' . $keyword . '%';
}

if ($startDate !== '') {
    $sqlWhere .= " AND DATE(modification_date) >= :start_date ";
    $params['start_date'] = $startDate;
}

if ($endDate !== '') {
    $sqlWhere .= " AND DATE(modification_date) <= :end_date ";
    $params['end_date'] = $endDate;
}

if ($startDate !== '' && $endDate !== '' && strtotime($startDate) > strtotime($endDate)) {
    header("Content-type: application/json");
    header('Access-Control-Allow-Origin: *');
    echo json_encode([
        'error' => 'start_date must be before end_date'
    ], JSON_PRETTY_PRINT);
    die();
}

$countSql = "SELECT COUNT(*) AS total FROM apple_notes WHERE 1 $sqlWhere";
$countRow = getQuerySingle($countSql, $params);
$total = isset($countRow['total']) ? intval($countRow['total']) : 0;
$totalPages = $total > 0 ? (int) ceil($total / $perPage) : 1;

if ($page > $totalPages) {
    $page = $totalPages;
}

$offset = ($page - 1) * $perPage;

$sql = "SELECT id, id_str, name, folder, account, creation_date, modification_date, body, to_delete
        FROM apple_notes
        WHERE 1
        $sqlWhere
        ORDER BY modification_date DESC, id DESC
        LIMIT $perPage OFFSET $offset";

$results = getQuery($sql, $params);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'items' => $results,
    'total' => $total,
    'page' => $page,
    'per_page' => $perPage,
    'total_pages' => $totalPages
], JSON_PRETTY_PRINT);
die();
