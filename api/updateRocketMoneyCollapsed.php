<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/includes.php";
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";

//ini_set("display_errors", 1);

// $json = file_get_contents('php://input');
// // Decode the JSON data
// $data = json_decode($json, true);
// // Access the parameters
// $id = $data['index'] ?? 0;
// $ids_list = $data['ids_list'] ?? [];
// $ids_arr = is_array($ids_list) ? $ids_list : explode(",", $ids_list);
// $collapsed = $data['collapsed'] ?? 0;

$index = isset($_REQUEST['index']) ? intval($_REQUEST['index']) : 0;
$collapsed = isset($_REQUEST['collapsed']) ? intval($_REQUEST['collapsed']) : 0;

$sql = "UPDATE ae_rocket_money_item SET Collapsed = $collapsed WHERE `Index` <= $index";

execQuery($sql);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'success' => true
], JSON_PRETTY_PRINT);
die();
?>