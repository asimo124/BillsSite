<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;

$vnd_bill = isset($_REQUEST['vnd_bill']) ? trim($_REQUEST['vnd_bill']) : "";
$amount = isset($_REQUEST['amount']) ? floatval($_REQUEST['amount']) : 0;
$vnd_is_auto = isset($_REQUEST['vnd_is_auto']) ? intval($_REQUEST['vnd_is_auto']) : 0;
$vnd_frequency_notes = isset($_REQUEST['vnd_frequency_notes']) ? trim($_REQUEST['vnd_frequency_notes']) : "";
$vnd_frequency = isset($_REQUEST['vnd_frequency']) ? ($_REQUEST['vnd_frequency']) : "";
$vnd_frequency_type = isset($_REQUEST['vnd_frequency_type']) ? ($_REQUEST['vnd_frequency_type']) : "";
$vnd_frequency_value = isset($_REQUEST['vnd_frequency_value']) ? trim($_REQUEST['vnd_frequency_value']) : "";
$vnd_frequency_value_original = isset($_REQUEST['vnd_frequency_value_original']) ? trim($_REQUEST['vnd_frequency_value_original']) : null;
$end_date = isset($_REQUEST['end_date']) ? trim($_REQUEST['end_date']) : "";

if ($vnd_bill == "" || $amount <= 0) {
    header("Location: edit.php?id=" . $id . "&Message=" . urlencode("You did not fill in all the required fields.") . "&error=1");
    exit;
}

$sql = "UPDATE vnd_bills
        SET vnd_bill = :vnd_bill,
        amount = :amount,
        vnd_is_auto = :vnd_is_auto,
        vnd_frequency_notes = :vnd_frequency_notes,
        vnd_frequency = :vnd_frequency,
        vnd_frequency_type = :vnd_frequency_type,
        vnd_frequency_value = :vnd_frequency_value,
        vnd_frequency_value_original = :vnd_frequency_value_original,
        end_date = :end_date
        WHERE vnd_id = :id ";

execQuery($sql, [
    "vnd_bill" => $vnd_bill,
    "amount" => $amount,
    "vnd_is_auto" => $vnd_is_auto,
    "vnd_frequency_notes" => $vnd_frequency_notes,
    "vnd_frequency" => $vnd_frequency,
    "vnd_frequency_type" => $vnd_frequency_type,
    "vnd_frequency_value"  => $vnd_frequency_value,
    "vnd_frequency_value_original"  => $vnd_frequency_value_original,
    "end_date"  => $end_date,
    "id" => $id
]);

$lastId = $db_conn->lastInsertId();

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

execQuery3("UPDATE vnd_bills SET end_date = null WHERE end_date = '0000-00-00 00:00:00';");
execQuery("UPDATE vnd_bills SET end_date = null WHERE end_date = '0000-00-00 00:00:00';");

header("Location: index.php?Message=" . urlencode("Bill has been updated.") . "&" . $searchFilersQueryStr);
exit;