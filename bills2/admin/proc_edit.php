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
        vnd_frequency_value = :vnd_frequency_value
        WHERE vnd_id = :id ";

execQuery($sql, [
    "vnd_bill" => $vnd_bill,
    "amount" => $amount,
    "vnd_is_auto" => $vnd_is_auto,
    "vnd_frequency_notes" => $vnd_frequency_notes,
    "vnd_frequency" => $vnd_frequency,
    "vnd_frequency_type" => $vnd_frequency_type,
    "vnd_frequency_value"  => $vnd_frequency_value,
    "id" => $id
]);

$lastId = $db_conn->lastInsertId();

header("Location: index.php?Message=" . urlencode("Bill has been updated."));
exit;