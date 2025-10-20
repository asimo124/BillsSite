<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";
include "../inc/includes.php";
//ini_set("display_errors", 1);

$purchaseId = isset($_REQUEST['purchase_id']) ? intval($_REQUEST['purchase_id']) : 0;

if ($purchaseId <= 0) {

    header("Content-type: application/json");
    header('Access-Control-Allow-Origin: *');
    echo json_encode([
        'success' => false,
        'error' => 'Invalid pay_period_id or purchase_id provided.'
    ], JSON_PRETTY_PRINT);
    die();
}

$sql = "DELETE FROM ip_upcoming_purchase WHERE id = :id ";
$query = $db_conn->prepare($sql);
$query->execute([
    ':id' => $purchaseId,
]);

$sql = "UPDATE vnd_bills SET upcoming_purchase_id = null WHERE upcoming_purchase_id = :id ";
$query = $db_conn->prepare($sql);
$query->execute([
    ':id' => $purchaseId,
]);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'success' => true,
    'error' => null
], JSON_PRETTY_PRINT);
die();

?>