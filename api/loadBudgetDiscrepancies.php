<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/includes.php";
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";

//ini_set("display_errors", 1);

$amountMaxDiff = 2;
$daysMaxDiff = 4;

$sql = "SELECT tm.*
        FROM ae_title_match tm 
        INNER JOIN ae_rocket_money_item rmi 
            ON tm.rocket_money_id = rmi.id 
        INNER JOIN vnd_bills b 
            ON tm.expenses_app_id = b.vnd_id 
        ORDER BY rmi.Name, b.vnd_bill; ";
$results = getQuery($sql);

$maxChars = 21;

foreach ($results as &$item) {
    $item['rocket_money_title'] = substr($item['rocket_money_title'], 0, $maxChars);
    $item['expenses_app_title'] = substr($item['expenses_app_title'], 0, $maxChars);
    $item['rocket_money_amount'] = number_format($item['rocket_money_amount'], 2);
    $item['expenses_app_amount'] = number_format($item['expenses_app_amount'], 2);
    $rocketMoneyAmount = $item['rocket_money_amount'];
    $expensesAppAmount = $item['expenses_app_amount'];

    $rocketMoneyDate = $item['rocket_money_date'];
    $expensesAppDate = $item['expenses_app_date'];

    $amountDiff = abs($rocketMoneyAmount - $expensesAppAmount);
    $dateDiff = abs($rocketMoneyDate - $expensesAppDate);

    $item['is_discrepancy'] = false;
    if ($amountDiff > $amountMaxDiff || $dateDiff > $daysMaxDiff) {
        $item['is_discrepancy'] = true;
    }
}

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'items' => $results
], JSON_PRETTY_PRINT);
die();
?>