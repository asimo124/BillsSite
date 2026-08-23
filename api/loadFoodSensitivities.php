<?php
include "../inc/includes.php";
include "../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

$params = array_merge($_REQUEST, api_read_json_body());

$title = isset($params['title']) ? trim($params['title']) : '';
$sortBy1 = isset($params['sort_by1']) ? trim($params['sort_by1']) : 'percentage_towards_inflammation';
$sortDir1 = isset($params['sort_dir1']) ? trim($params['sort_dir1']) : 'DESC';
$sortBy2 = isset($params['sort_by2']) ? trim($params['sort_by2']) : '';
$sortDir2 = isset($params['sort_dir2']) ? trim($params['sort_dir2']) : 'ASC';

if ($sortDir1 !== 'ASC' && $sortDir1 !== 'DESC') {
    $sortDir1 = 'ASC';
}
if ($sortDir2 !== 'ASC' && $sortDir2 !== 'DESC') {
    $sortDir2 = 'ASC';
}

$allowedSort = array(
    'percentage_towards_inflammation' => 'percentage_towards_inflammation',
    'title' => 'title',
    'is_inflammation' => 'is_inflammation',
);
if (!isset($allowedSort[$sortBy1])) {
    $sortBy1 = 'percentage_towards_inflammation';
}
if ($sortBy2 !== '' && !isset($allowedSort[$sortBy2])) {
    $sortBy2 = '';
}

$whereSql = '';
$queryParams = array();
if ($title !== '') {
    $whereSql .= ' AND title LIKE :title ';
    $queryParams['title'] = '%' . $title . '%';
}

$orderBySql = ' ORDER BY ' . $allowedSort[$sortBy1] . ' ' . $sortDir1;
if ($sortBy2 !== '') {
    $orderBySql .= ', ' . $allowedSort[$sortBy2] . ' ' . $sortDir2;
}

$sql = "SELECT *
        FROM fs_food
        WHERE 1
        $whereSql
        $orderBySql";

$results = getQuery($sql, $queryParams);
if (!$results) {
    $results = array();
}

foreach ($results as $i => $row) {
    $results[$i]['id'] = intval($row['id']);
    $results[$i]['is_inflammation'] = intval($row['is_inflammation']);
}

api_json_response(array(
    'items' => $results,
));
