<?php
    include "../inc/includes.php";

$sql = "SELECT id, cat_name
        FROM vnd_bills_charge_categories ORDER BY cat_name ";

$resultset = getQuery($sql);

header("Content-type: text/json");
$retVal = [
    "results" => $resultset
];

echo json_encode($retVal);
?>