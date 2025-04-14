<?php
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
$action = isset($_REQUEST['action']) ? $_REQUEST['action'] : "";

$searchFiltersRequestArr = [];
$searchFilersQueryStr = "";
$vndBill = "";
$sort1 = "bill";
$sort1_dir = "ASC";
$sort2 = "";
$sort2_dir = "";
$frequencyShow = [
    "Every 1 Week" => 0,
    "Every 2 Weeks" => 0,
    "Every 4 Weeks" => 0,
    "Once Per Month - Day of Month" => 0,
    "Once Per Month - Starting From" => 0,
    "Every 3 Months" => 0,
    "Once" => 0
];

$vndBill = isset($_REQUEST['vnd_bill2']) ? $_REQUEST['vnd_bill2'] : "";
$vndBill2 = $vndBill;
if ($vndBill) {
    $vndBill = '%' . $vndBill . '%';
}
$sort1 = isset($_REQUEST['sort1']) ? $_REQUEST['sort1'] : "bill";
$sort1_dir = isset($_REQUEST['sort1_dir']) ? $_REQUEST['sort1_dir'] : "ASC";
$sort2 = isset($_REQUEST['sort2']) ? $_REQUEST['sort2'] : "";
$sort2_dir = isset($_REQUEST['sort2_dir']) ? $_REQUEST['sort2_dir'] : "";
$frequencyShow = isset($_REQUEST['frequency']) ? $_REQUEST['frequency'] : [
    "Every 1 Week" => 1,
    "Every 2 Weeks" => 1,
    "Every 4 Weeks" => 1,
    "Once Per Month - Day of Month" => 1,
    "Once Per Month - Starting From" => 1,
    "Every 3 Months" => 1,
    "Once" => 1
];
$btnSearch = isset($_REQUEST['btnSearch']) ? $_REQUEST['btnSearch'] : "";

$searchFiltersRequestArr = [
    'vnd_bill2' => $vndBill,
    'sort1' => $sort1,
    'sort1_dir' => $sort1_dir,
    'sort2' => $sort2,
    'sort2_dir' => $sort2_dir,
    'frequency' => $frequencyShow,
    'btnSearch' => $btnSearch
];
$i = 0;
foreach ($searchFiltersRequestArr as $key => $value) {
    if ($key != "frequencyShow") {

        if ($i == 0) {
            $searchFilersQueryStr = "$key=" . urlencode($value);
        } else {
            $searchFilersQueryStr .= "&$key=" . urlencode($value);
        }
    } else {

        foreach ($value as $getKey => $getValue) {

            $searchFilersQueryStr .= "&frequency[$getKey]=" . urlencode($getValue);
        }
    }
    $i++;
}

if ($action == "mark") {

    $sql = "UPDATE vnd_bills SET is_heavy = 1 WHERE vnd_id = :id ";
    execQuery($sql, [
        "id" => $id
    ]);

} else {

    $sql = "UPDATE vnd_bills SET is_heavy = 0 WHERE vnd_id = :id ";
    execQuery($sql, [
        "id" => $id
    ]);
}

header("Location: index.php?Message=" . urlencode("Bill has been updated.") . "&" . $searchFilersQueryStr);
exit;