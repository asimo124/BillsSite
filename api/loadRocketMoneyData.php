<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";
include "../inc/includes.php";
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

    

    // Sort rocket_money_titles array by 'title' key
    $titles = array_column($results, 'title');
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