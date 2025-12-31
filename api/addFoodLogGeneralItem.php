<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;

include "../inc/includes.php";
//ini_set("display_errors", 1);

$title = isset($_REQUEST['title']) ? trim($_REQUEST['title']) : '';

if (!$title) {
    header("HTTP/1.1 400 Bad Request");
    echo "title is required";
    die();
}

$title2 = str_replace("'", "''", $title);

$sql = "SELECT id 
        FROM fs_food_general 
        WHERE title = '" . $title2 . "'
        ";

$result = getQuerySingle($sql);

if ($result) {
    header("HTTP/1.1 400 Bad Request");
    echo "A food general item with that title already exists";
    die();
}

$sql = "INSERT INTO fs_food_general 
        (title) 
        VALUES 
        ('" . $title2 . "')
        ";

execQuery($sql);

$foodId = $db_conn->lastInsertId();

$sql = "SELECT * FROM fs_food_general WHERE id = " . intval($foodId) . " LIMIT 1";

$item = getQuerySingle($sql);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'item' => $item
], JSON_PRETTY_PRINT);
die();

?>