<?php
	ini_set("display_errors", 1);
	include "../inc/includes.php";
	include "../inc/Bills.php";
	include "../inc/Audit.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$target_dir = "../data/audit/";
if (!is_dir($target_dir)) {
    mkdir($target_dir, 0775, true);
}

if(isset($_POST["submit"])) {

    $tempFileName = $_FILES["chaseFile"]["tmp_name"];
    $fh = fopen($tempFileName, 'r');

    $i = 0;
    $items = [];
    while (($lineArr = fgetcsv($fh)) !== false) {

        if ($i == 0) {
            $i++;
            continue;
        }

        $eachItem = [];
        $eachItem['date'] = Audit::cleanDate($lineArr[0]);
        $eachItem['description'] = $lineArr[1];
        $eachItem['type'] = $lineArr[2];
        $eachItem['amount'] = Audit::cleanAmount($lineArr[3]);

        if ($eachItem['amount']) {
            $items[] = $eachItem;
        }
        $i++;

    }

    $fh = fopen("spreadsheet/chase_data.csv", 'w');
    foreach ($items as $item) {
        $item = array_values($item);
        fputcsv($fh, $item);
    }
    fclose($fh);
}

header("Location: index.php?Message=" . urlencode("You have submitted the chase copied content."));
exit;
?>