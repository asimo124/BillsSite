<?php
    include "../inc/includes.php";

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
$category_id = isset($_REQUEST['category_id']) ? intval($_REQUEST['category_id']) : 0;

header("Content-type: text/json");
if ($id > 0 && $category_id > 0) {

    $sql = "UPDATE vnd_bills_charges
            SET category_id = :category_id
            WHERE id = :id ";

    execQuery($sql, [
        "id" => $id,
        "category_id" => $category_id
    ]);
    echo json_encode([
        "results" => [
            "status" => "success"
        ]
    ]);
} else {

    echo json_encode([
        "results" => [
            "status" => "error"
        ]
    ]);
}
?>