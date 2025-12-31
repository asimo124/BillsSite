<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;

include "../inc/includes.php";
//ini_set("display_errors", 1);

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
$title = isset($_REQUEST['title']) ? trim($_REQUEST['title']) : '';

if (!$id) {
    header("HTTP/1.1 400 Bad Request");
    echo "id is required";
    die();
}

if (!$title) {
    header("HTTP/1.1 400 Bad Request");
    echo "title is required";
    die();
}

$title2 = str_replace("'", "''", $title);

$sql = "SELECT id 
        FROM fs_food_general 
        WHERE title = '" . $title2 . "'
        AND id <> " . intval($id) . "
        ";

$result = getQuerySingle($sql);

if ($result) {
    header("HTTP/1.1 400 Bad Request");
    echo "A food general item with that title already exists";
    die();
}

$sql = "UPDATE fs_food_general 
        SET title = '" . $title2 . "'
        WHERE id = " . intval($id) . "
        ";

execQuery($sql);

$foodId = $db_conn->lastInsertId();

$sql = "SELECT * FROM fs_food_general WHERE id = " . intval($id) . " LIMIT 1";

$item = getQuerySingle($sql);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'item' => $item
], JSON_PRETTY_PRINT);
die();

?>