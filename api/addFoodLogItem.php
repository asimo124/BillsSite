<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;

include "../inc/includes.php";
//ini_set("display_errors", 1);

$food_id = isset($_REQUEST['food_id']) ? intval($_REQUEST['food_id']) : 0;
$food_general_id = isset($_REQUEST['food_general_id']) ? intval($_REQUEST['food_general_id']) : 0;
$consumed_date = isset($_REQUEST['consumed_date']) ? trim($_REQUEST['consumed_date']) : date("m/d/Y");

if ($food_id === 0 && $food_general_id === 0) {
    header("HTTP/1.1 400 Bad Request");
    echo "food_id or food_general_id is required";
    die();
}

$consumed_date2 = date("Y-m-d", strtotime($consumed_date));

$refTable = "";
$refTableId = 0;
if ($food_id) {
    $refTableId = $food_id;
    $refTable = "fs_food";
} else {
    $refTableId = $food_general_id;
    $refTable = "fs_food_general";
}


$sql = "INSERT INTO fs_food_history 
        (ref_table, ref_table_id, consumed_date) 
        VALUES 
        ('" . $refTable . "', " . intval($refTableId) . ", '" . $consumed_date2 . "')
        ";  

execQuery($sql);

$foodId = $db_conn->lastInsertId();

$sql = "SELECT * FROM fs_food_history WHERE id = " . intval($foodId) . " LIMIT 1";

$item = getQuery($sql);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'item' => $item
], JSON_PRETTY_PRINT);
die();

?>