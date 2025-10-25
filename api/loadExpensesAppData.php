<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";
include "../inc/includes.php";
//ini_set("display_errors", 1);

set_time_limit(300);

$sql = "SELECT b.vnd_id 
        , b.vnd_bill as title 
        , b.vnd_frequency_value as day_of_month
        , b.amount
        FROM vnd_bills b
        WHERE 1 
        AND b.vnd_frequency = 'Once Per Month'
        AND b.vnd_frequency_type = 'Day of Month'
        AND IFNULL(vnd_frequency_value, '') <> ''
        ORDER BY b.vnd_frequency_value ASC ";

$results = getQuery($sql);

$content_str = "";
foreach ($results as $row) {
    $content_str .= $row['title'] . "\t" . $row['day_of_month'] . "\t" . $row['amount'] . "\n";
}

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'content' => $content_str,
    'items' => $results
], JSON_PRETTY_PRINT);
die();

?>