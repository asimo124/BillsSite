<?php
    include "../inc/includes.php";

$date = intval(date("d"));
if ($date < 15) {
    $date = 1;
} else {
    $date = 16;
}

$category_id = isset($_REQUEST['category_id']) ? intval($_REQUEST['category_id']) : 0;
$from_date = isset($_REQUEST['from_date']) ? $_REQUEST['from_date'] : '';
$to_date = isset($_REQUEST['to_date']) ? $_REQUEST['to_date'] : '';

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
        WHERE category_id = :category_id ";

if (strtotime($from_date) > 0 && strtotime($to_date) > 0) {
    $sql .=" and c.date BETWEEN :from_date AND :to_date 
    ";
}

$sql .= "ORDER BY charge DESC;";

$dataParams = [
    "category_id" => $category_id
];
if (strtotime($from_date) > 0 && strtotime($to_date) > 0) {
    $dataParams['from_date'] = $from_date;
    $dataParams['to_date'] = $to_date;
}

$resultset = getQuery($sql, $dataParams);
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
        WHERE category_id = :category_id ";

if (strtotime($from_date) > 0 && strtotime($to_date) > 0) {
    $sql .=" and c.date BETWEEN :from_date AND :to_date 
    ";
}

$sql .= "ORDER BY $orderBy ";

$dataParams = [
    "category_id" => $category_id
];
if (strtotime($from_date) > 0 && strtotime($to_date) > 0) {
    $dataParams['from_date'] = $from_date;
    $dataParams['to_date'] = $to_date;
}

$resultset = getQuery($sql, $dataParams);

header("Content-type: text/json");

$retVal = [
    "recordsTotal" => $totalRecords,
    "recordsFiltered" => $totalRecords,
    "data" => $resultset
];

echo json_encode($retVal);
?>