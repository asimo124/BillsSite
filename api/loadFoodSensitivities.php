<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;

include "../inc/includes.php";
//ini_set("display_errors", 1);

$title = isset($_REQUEST['title']) ? trim($_REQUEST['title']) : '';
$sortBy1 = isset($_REQUEST['sort_by1']) ? trim($_REQUEST['sort_by1']) : 'percentage_towards_inflammation';
$sortDir1 = isset($_REQUEST['sort_dir1']) ? trim($_REQUEST['sort_dir1']) : 'DESC';

if ($sortDir1 != 'ASC' && $sortDir1 != 'DESC') {
    $sortDir1 = 'ASC';
}

$sortBy2 = isset($_REQUEST['sort_by2']) ? trim($_REQUEST['sort_by2']) : '';
$sortDir2 = isset($_REQUEST['sort_dir2']) ? trim($_REQUEST['sort_dir2']) : 'ASC';

if ($sortDir2 != 'ASC' && $sortDir2 != 'DESC') {
    $sortDir2 = 'ASC';
}

$whereSql = "";
if ($title) {
    $title2 = str_replace("'", "''", $title);
    $whereSql .= " AND title LIKE '%" . $title2 . "%' ";
}

$orderBySql = "";
if ($sortBy1) {
    $orderBySql .= " ORDER BY $sortBy1 $sortDir1 ";
    if ($sortBy2) {
        $orderBySql .= ", $sortBy2 $sortDir2 ";
    }
}

$sql = "SELECT * 
        FROM fs_food 
        WHERE 1 
        $whereSql 
        $orderBySql
        ";

$results = getQuery($sql);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'items' => $results
], JSON_PRETTY_PRINT);
die();

?>