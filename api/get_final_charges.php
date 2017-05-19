<?php
    include "../inc/includes.php";

$date = intval(date("d"));
if ($date < 15) {
    $date = 1;
} else {
    $date = 16;
}

$sql = "SELECT id, description, charge FROM vnd_bills_charges
        WHERE date >= DATE(DATE_ADD(:date, INTERVAL -1 DAY))
        AND ifnull(category_id, '') <> ''
        AND ifnull(charge, 0) > 0
        ORDER BY date ASC ";

ob_start();
QueryUtils::showQuery($sql, [
    "date" => date("Y-m-" . $date)
]);
$get_query = ob_get_contents();
$get_query = str_replace("\n", " ", str_replace("\r", "", $get_query));
ob_end_clean();
$resultset = getQuery($sql, [
    "date" => date("Y-m-" . $date)
]);

header("Content-type: text/json");

$retVal = [
    "query" => $get_query,
    "results" => $resultset
];

echo json_encode($retVal);
?>