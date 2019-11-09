<?php
    include "../inc/includes.php";

$date = intval(date("d"));
if ($date < 15) {
    $date = 1;
} else {
    $date = 16;
}

$category_id = isset($_REQUEST['category_id']) ? intval($_REQUEST['category_id']) : 0;

$requestArr = array();
foreach ($_POST as $key => $value) {
    $requestArr[$key] = $value;
}
foreach ($_GET as $key => $value) {
    $requestArr[$key] = $value;
}

$totalRecords = 0;
$sql = "SELECT COUNT(c.id) AS count2
        FROM vnd_bills_charges c
        INNER JOIN vnd_bills_charge_categories cc
          ON c.category_id = cc.id
        WHERE category_id = :category_id
        ORDER BY charge DESC;";

$resultset = getQuery($sql, [
    "category_id" => $category_id
]);
if (count($resultset) > 0) {
    $totalRecords = $resultset[0]['count2'];
}

$columnsArr = array(
    "date",
    "description",
    "charge"
);
$sortOrder = new SortOrderHelper();
$orderBy = $sortOrder->getSortStr($columnsArr, $requestArr);

$sql = "SELECT
        c.date, c.description, c.charge, c.category_id,
        cc.cat_name
        FROM vnd_bills_charges c
        INNER JOIN vnd_bills_charge_categories cc
          ON c.category_id = cc.id
        WHERE category_id = :category_id
        ORDER BY $orderBy ";

$resultset = getQuery($sql, [
    "category_id" => $category_id
]);

header("Content-type: text/json");

$retVal = [
    "recordsTotal" => $totalRecords,
    "recordsFiltered" => $totalRecords,
    "data" => $resultset
];

echo json_encode($retVal);
?>