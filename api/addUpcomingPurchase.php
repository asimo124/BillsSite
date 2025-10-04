<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";
include "../inc/includes.php";
//ini_set("display_errors", 1);

$payPeriodId = isset($_REQUEST['pay_period_id']) ? intval($_REQUEST['pay_period_id']) : 0;

if ($payPeriodId <= 0) {
    return [
        'item' => null,
        'error' => 'Invalid pay_period_id provided.'
    ]; 
}

$title = isset($_REQUEST['item']['title']) ? $_REQUEST['item']['title'] : '';
$description = isset($_REQUEST['item']['description']) ? $_REQUEST['item']['description'] : '';
$cost = isset($_REQUEST['item']['cost']) ? floatval($_REQUEST['item']['cost']) : 0;
$amount_to_save = isset($_REQUEST['item']['amount_to_save']) ? floatval($_REQUEST['item']['amount_to_save']) : 0;

if (!$title || $cost <= 0 || $amount_to_save <= 0) {
    return [
        'item' => null,
        'error' => 'Missing or invalid required fields (title, cost, amount_to_save).'
    ]; 
}

$sql = "INSERT INTO ip_upcoming_purchase 
    (title, description, cost, amount_to_save, pay_period_item_id) VALUES 
    (:title, :description, :cost, :amount_to_save, :pay_period_item_id) ";  
$query = $db_conn->prepare($sql);
$query->execute([
    ':title' => $title,
    ':description' => $description,
    ':cost' => $cost,
    ':amount_to_save' => $amount_to_save,
    ':pay_period_item_id' => $payPeriodId
]);

$id = $db_conn->lastInsertId();
$newPurchase = getQuerySingle("SELECT * FROM ip_upcoming_purchase WHERE id = :id", [':id' => $id]);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'item' => $newPurchase,
    'error' => null
], JSON_PRETTY_PRINT);
die();

?>