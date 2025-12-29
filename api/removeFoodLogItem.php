<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;

include "../inc/includes.php";
//ini_set("display_errors", 1);

$food_id = isset($_REQUEST['food_id']) ? intval($_REQUEST['food_id']) : 0;

if (!$food_id) {
    header("HTTP/1.1 400 Bad Request");
    echo "food_id is required";
    die();
}

$sql = "DELETE FROM fs_food_history WHERE id = " . intval($food_id);

execQuery($sql);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'success' => true
], JSON_PRETTY_PRINT);
die();

?>