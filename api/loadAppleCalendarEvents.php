<?php
include "../inc/includes.php";
include "../inc/api_auth.php";
include "../inc/apple_calendar.php";

api_handle_preflight();
require_api_auth_or_session();

$paramsIn = array_merge($_REQUEST, api_read_json_body());

$keywordTitle = isset($paramsIn['keyword_title']) ? trim($paramsIn['keyword_title']) : '';
$keywordBody = isset($paramsIn['keyword_body']) ? trim($paramsIn['keyword_body']) : '';
$startDate = isset($paramsIn['start_date']) ? trim($paramsIn['start_date']) : '';
$endDate = isset($paramsIn['end_date']) ? trim($paramsIn['end_date']) : '';
$deletedOnly = isset($paramsIn['deleted']) && ($paramsIn['deleted'] === '1' || $paramsIn['deleted'] === 1 || $paramsIn['deleted'] === true || $paramsIn['deleted'] === 'true');
$page = isset($paramsIn['page']) ? max(1, intval($paramsIn['page'])) : 1;
$perPage = isset($paramsIn['per_page']) ? intval($paramsIn['per_page']) : 20;
$sortBy = isset($paramsIn['sort_by']) ? trim($paramsIn['sort_by']) : 'start_date';
$sortDir = isset($paramsIn['sort_dir']) ? strtoupper(trim($paramsIn['sort_dir'])) : 'DESC';

if (!in_array($perPage, array(20, 50, 100), true)) {
    $perPage = 20;
}

$allowedSortBy = array(
    'start_date' => 'start_date',
    'end_date' => 'end_date',
    'title' => 'title',
    'calendar_name' => 'calendar_name',
    'location' => 'location',
);

if (!isset($allowedSortBy[$sortBy])) {
    $sortBy = 'start_date';
} else {
    $sortBy = $allowedSortBy[$sortBy];
}

if ($sortDir !== 'ASC' && $sortDir !== 'DESC') {
    $sortDir = 'DESC';
}

$sqlWhere = $deletedOnly
    ? " AND (to_delete IS NULL OR to_delete = 0) "
    : "";
$params = array();

$titleTsQuery = apple_calendar_tsquery($keywordTitle);
if ($titleTsQuery !== '') {
    $sqlWhere .= " AND to_tsvector('english', coalesce(title, '')) @@ to_tsquery('english', :keyword_title) ";
    $params['keyword_title'] = $titleTsQuery;
}

$bodyTsQuery = apple_calendar_tsquery($keywordBody);
if ($bodyTsQuery !== '') {
    $sqlWhere .= " AND (
        to_tsvector('english', coalesce(description, '')) @@ to_tsquery('english', :keyword_body)
        OR to_tsvector('english', coalesce(location, '')) @@ to_tsquery('english', :keyword_location)
    ) ";
    $params['keyword_body'] = $bodyTsQuery;
    $params['keyword_location'] = $bodyTsQuery;
}

if ($startDate !== '') {
    $sqlWhere .= " AND DATE(start_date) >= :start_date ";
    $params['start_date'] = $startDate;
}

if ($endDate !== '') {
    $sqlWhere .= " AND DATE(start_date) <= :end_date ";
    $params['end_date'] = $endDate;
}

if ($startDate !== '' && $endDate !== '' && strtotime($startDate) > strtotime($endDate)) {
    api_json_response(array('error' => 'start_date must be before end_date'), 400);
}

$countSql = "SELECT COUNT(*) AS total FROM apple_calendar_events WHERE TRUE $sqlWhere";
$countRow = getQuerySingle4($countSql, $params);
$total = isset($countRow['total']) ? intval($countRow['total']) : 0;
$totalPages = $total > 0 ? (int) ceil($total / $perPage) : 1;

if ($page > $totalPages) {
    $page = $totalPages;
}

$offset = ($page - 1) * $perPage;

$sql = "SELECT id, id_str, title, calendar_name, location, start_date, end_date, all_day, description, url, to_delete
        FROM apple_calendar_events
        WHERE TRUE
        $sqlWhere
        ORDER BY $sortBy $sortDir, id DESC
        LIMIT $perPage OFFSET $offset";

$results = getQuery4($sql, $params);
if (!$results) {
    $results = array();
}

foreach ($results as $i => $row) {
    $results[$i]['id'] = intval($row['id']);
    $results[$i]['to_delete'] = isset($row['to_delete']) ? intval($row['to_delete']) : 0;
    $results[$i]['all_day'] = isset($row['all_day']) ? intval($row['all_day']) : 0;
}

api_json_response(array(
    'items' => $results,
    'total' => $total,
    'page' => $page,
    'per_page' => $perPage,
    'total_pages' => $totalPages,
));
