<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/includes.php";
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";

//ini_set("display_errors", 1);

$sql = "SELECT * FROM ae_rocket_money_item ORDER BY Name";
$results = getQuery($sql);

$sql = "UPDATE ae_rocket_money_item SET `Index` = :index WHERE id = :id";
$stmt_update_item = $db_conn->prepare($sql);

foreach ($results as $index => $item) {
    $id = $item['id'];
    
    $stmt_update_item->execute([
        'index' => $index, 
        'id' => $id
    ]);
}

$sql = "SELECT * FROM ae_rocket_money_item ORDER BY Name";
$results = getQuery($sql);

foreach ($results as &$item) {
    $item['Date'] = intval(date("d", strtotime($item['Date'])));
    $name = $item['Name'];
    $item['Name'] = substr($name, 0, 14);
    $item['MediumName'] = substr($name, 0, 18);
    $item['LongName'] = $name;
}

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'items' => $results
], JSON_PRETTY_PRINT);
die();
?>