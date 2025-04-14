<?php
ini_set("display_errors", 1);
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$vnd_bill = isset($_REQUEST['vnd_bill']) ? trim($_REQUEST['vnd_bill']) : "";
$amount = isset($_REQUEST['amount']) ? floatval($_REQUEST['amount']) : 0;
$vnd_is_auto = isset($_REQUEST['vnd_is_auto']) ? intval($_REQUEST['vnd_is_auto']) : 0;
$vnd_frequency_notes = isset($_REQUEST['vnd_frequency_notes']) ? trim($_REQUEST['vnd_frequency_notes']) : "";
$vnd_frequency = isset($_REQUEST['vnd_frequency']) ? ($_REQUEST['vnd_frequency']) : "";
$vnd_frequency_type = isset($_REQUEST['vnd_frequency_type']) ? ($_REQUEST['vnd_frequency_type']) : "";
$vnd_frequency_value = isset($_REQUEST['vnd_frequency_value']) ? trim($_REQUEST['vnd_frequency_value']) : "";

if ($vnd_bill == "" || $amount <= 0) {
    header("Location: add.php?Message=" . urlencode("You did not fill in all the required fields.") . "&error=1");
    exit;
}

$sql = "INSERT INTO vnd_bills
        ( vnd_bill,  amount,  vnd_is_auto,  vnd_frequency_notes,  vnd_frequency,  vnd_frequency_type,  vnd_frequency_value) VALUES
        (:vnd_bill, :amount, :vnd_is_auto, :vnd_frequency_notes, :vnd_frequency, :vnd_frequency_type, :vnd_frequency_value) ";

execQuery($sql, [
    "vnd_bill" => $vnd_bill,
    "amount" => $amount,
    "vnd_is_auto" => $vnd_is_auto,
    "vnd_frequency_notes" => $vnd_frequency_notes,
    "vnd_frequency" => $vnd_frequency,
    "vnd_frequency_type" => $vnd_frequency_type,
    "vnd_frequency_value"  => $vnd_frequency_value
]);

$lastId = $db_conn->lastInsertId();

header("Location: index.php?Message=" . urlencode("Bill has been created."));
exit;