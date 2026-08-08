<?php
include "../inc/includes.php";
//ini_set("display_errors", 1);

$keywordTitle = isset($_REQUEST['keyword_title']) ? trim($_REQUEST['keyword_title']) : '';
$keywordBody = isset($_REQUEST['keyword_body']) ? trim($_REQUEST['keyword_body']) : '';
$startDate = isset($_REQUEST['start_date']) ? trim($_REQUEST['start_date']) : '';
$endDate = isset($_REQUEST['end_date']) ? trim($_REQUEST['end_date']) : '';
$page = isset($_REQUEST['page']) ? max(1, intval($_REQUEST['page'])) : 1;
$perPage = isset($_REQUEST['per_page']) ? intval($_REQUEST['per_page']) : 20;
$sortBy = isset($_REQUEST['sort_by']) ? trim($_REQUEST['sort_by']) : 'modification_date';
$sortDir = isset($_REQUEST['sort_dir']) ? strtoupper(trim($_REQUEST['sort_dir'])) : 'DESC';

if (!in_array($perPage, [20, 50, 100], true)) {
    $perPage = 20;
}

$allowedSortBy = [
    'modification_date' => 'modification_date',
    'creation_date' => 'creation_date',
    'name' => 'name',
    'folder' => 'folder'
];

if (!isset($allowedSortBy[$sortBy])) {
    $sortBy = 'modification_date';
} else {
    $sortBy = $allowedSortBy[$sortBy];
}

if ($sortDir !== 'ASC' && $sortDir !== 'DESC') {
    $sortDir = 'DESC';
}

$sqlWhere = " AND (to_delete IS NULL OR to_delete = 0) ";
$params = [];

if ($keywordTitle !== '') {
    $sqlWhere .= " AND name LIKE :keyword_title ";
    $params['keyword_title'] = '%' . $keywordTitle . '%';
}

if ($keywordBody !== '') {
    $sqlWhere .= " AND body LIKE :keyword_body ";
    $params['keyword_body'] = '%' . $keywordBody . '%';
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
        ORDER BY $sortBy $sortDir, id DESC
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
