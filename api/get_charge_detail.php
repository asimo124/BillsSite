<?php
    include "../inc/includes.php";

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;

$sql = "SELECT id, date, description, charge, category_id
        FROM vnd_bills_charges
        WHERE id = :id LIMIT 1 ";

$resultset = getQuery($sql, [
    "id" => $id
]);

$getResult = array();
if (count($resultset) > 0) {
    $getResult = $resultset[0];
}

header("Content-type: text/json");
$retVal = [
    "results" => $getResult
];

echo json_encode($retVal);
?>