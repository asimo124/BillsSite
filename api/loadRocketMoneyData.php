<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/includes.php";
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";

//ini_set("display_errors", 1);

$uploadedFilePath = isset($_SESSION['rocket_money_uploaded_file']) ? $_SESSION['rocket_money_uploaded_file'] : '';
if ($uploadedFilePath) {

    $results = [];
    $i = 0;
    $keys = [];
    
    $fh = fopen($uploadedFilePath, 'r');;
    while (($line = fgetcsv($fh)) !== false) {
        
        if ($i == 0) {
            $keys = $line;
            $i++;
            continue;
        }
        
        $eachItem = [];
        foreach ($line as $index => $value) {
            $eachItem[$keys[$index]] = $value;
        }

        $results[] = $eachItem;
        $i++;
    }
    fclose($fh);

    foreach ($results as $index => $item) {
        
        $longName = $item['Name'];
        $shortName = substr($longName, 0, 18);
        $results[$index]['Date'] = intval(date("d", strtotime($item['Date'])));
        $results[$index]['Name'] = $shortName;
        $mediumName = substr($longName, 0, 21);
        $results[$index]['MediumName'] = $mediumName;
        $results[$index]['LongName'] = $longName;
    }

    // Sort rocket_money_titles array by 'title' key
    $titles = array_column($results, 'Name');
    array_multisort($titles, SORT_ASC, SORT_FLAG_CASE | SORT_NATURAL, $results); 

    header("Content-type: application/json");
    header('Access-Control-Allow-Origin: *');
    echo json_encode([
        'items' => $results
    ], JSON_PRETTY_PRINT);
    die();

} else {

    header("Content-type: application/json");
    header('Access-Control-Allow-Origin: *');
    echo json_encode([], JSON_PRETTY_PRINT);
    die();
}

?>