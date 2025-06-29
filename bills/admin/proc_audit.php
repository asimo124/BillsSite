<?php
ini_set("display_errors", 1);
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$audit_regex = isset($_REQUEST['audit_regex']) ? $_REQUEST['audit_regex'] : [];
$audit_keyword1 = isset($_REQUEST['audit_keyword1']) ? $_REQUEST['audit_keyword1'] : [];
$audit_keyword2 = isset($_REQUEST['audit_keyword2']) ? $_REQUEST['audit_keyword2'] : [];

$sql = "UPDATE vnd_bills SET audit_regex = :audit_regex
                   , audit_keyword1 = :audit_keyword1
                   , audit_keyword2 = :audit_keyword2 
        WHERE vnd_id = :vnd_id";

foreach ($audit_regex as $vnd_id => $value) {

    $audit_regex_val = $value;
    $audit_keyword1_val = isset($audit_keyword1[$vnd_id]) ? $audit_keyword1[$vnd_id] : "";
    $audit_keyword2_val = isset($audit_keyword2[$vnd_id]) ? $audit_keyword2[$vnd_id] : "";

    execQuery($sql, [
        "vnd_id" => $vnd_id,
        "audit_regex" => $audit_regex_val,
        "audit_keyword1" => $audit_keyword1_val,
        "audit_keyword2" => $audit_keyword2_val
    ]);
}

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
$showAuditFields = isset($_REQUEST['showAuditFields']) ? intval($_REQUEST['showAuditFields']) : 0;

$searchFiltersRequestArr = [
    'vnd_bill2' => $vndBill,
    'sort1' => $sort1,
    'sort1_dir' => $sort1_dir,
    'sort2' => $sort2,
    'sort2_dir' => $sort2_dir,
    'frequency' => $frequencyShow,
    'btnSearch' => $btnSearch,
    'showAuditFields' => $showAuditFields
];
$i = 0;
foreach ($searchFiltersRequestArr as $key => $value) {
    if ($key != "frequency") {
        $value = (String)$value;

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

header("Location: index.php?Message=" . urlencode("Updated audit fields.") . "&" . $searchFilersQueryStr);
exit;