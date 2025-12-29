<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;

include "../inc/includes.php";
//ini_set("display_errors", 1);

$title = isset($_REQUEST['title']) ? trim($_REQUEST['title']) : '';
$sortBy1 = isset($_REQUEST['sort_by1']) ? trim($_REQUEST['sort_by1']) : 'consumed_date';
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
/*/
if ($title) {
    $title2 = str_replace("'", "''", $title);
    $whereSql .= " AND title LIKE '%" . $title2 . "%' ";
}
//*/

$orderBySql = "";
/*/
if ($sortBy1) {
    $orderBySql .= " ORDER BY $sortBy1 $sortDir1 ";
    if ($sortBy2) {
        $orderBySql .= ", $sortBy2 $sortDir2 ";
    }
}
//*/

$sql = "SELECT 
        fh.id 
        , CASE 
        WHEN f.id iS NOT NULL THEN 
            f.title 
        ELSE
            fg.title 
        END as title
        , DATE_FORMAT(fh.consumed_date, '%m/%d/%Y') as consumed_date
        , CASE 
        WHEN f.id iS NOT NULL THEN 
            f.is_inflammation 
        ELSE
            0 
        END as is_inflammation 
        , CASE 
        WHEN f.id iS NOT NULL THEN 
            ROUND(f.percentage_towards_inflammation, 2) 
        ELSE
            30 
        END as percentage_towards_inflammation
        FROM fs_food_history fh 
        LEFT JOIN fs_food f 
            ON fh.ref_table = 'fs_food'
            AND fh.ref_table_id = f.id 
        LEFT JOIN fs_food_general fg  
            ON fh.ref_table = 'fs_food_general'
            AND fh.ref_table_id = fg.id 
        WHERE 1 
        AND (
            f.id iS NOT NULL 
            OR fg.id IS NOT NULL 
        )
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