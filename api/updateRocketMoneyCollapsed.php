<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/includes.php";
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";

//ini_set("display_errors", 1);

$json = file_get_contents('php://input');

// Decode the JSON data
$data = json_decode($json, true);

// Access the parameters
$id = $data['id'] ?? 0;
$ids_list = $data['ids_list'] ?? [];
$ids_arr = is_array($ids_list) ? $ids_list : explode(",", $ids_list);
$collapsed = $data['collapsed'] ?? 0;

if ($id > 0) {
    $sql = "UPDATE ae_rocket_money_item SET Collapsed = $collapsed WHERE id = $id";
    $result = execQuery($sql);
}

if (count($ids_arr) > 0) {
    $ids_str = implode(",", array_map('intval', $ids_arr));
    $sql = "UPDATE ae_rocket_money_item SET Collapsed = $collapsed WHERE id IN ($ids_str)";
    $result = execQuery($sql);
}

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'success' => true
], JSON_PRETTY_PRINT);
die();
?>