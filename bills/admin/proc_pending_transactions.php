<?php
ini_set("display_errors", 1);
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$curBalance = isset($_REQUEST['cur_balance']) ? trim($_REQUEST['cur_balance']) : 0;
$pending_rows = isset($_REQUEST['pending_transactions']) ? trim($_REQUEST['pending_transactions']) : "";

$totalMargin = $curBalance;

$pendingRowsArr = explode("\n", $pending_rows);

echo '<div >';
foreach ($pendingRowsArr as $row) {
    
    $eachRow = trim($row);
    if (strpos($eachRow, "-") !== false) {
        $eachRow = floatval(str_replace("-", "", $eachRow));
        $eachRow *= -1;
    }


    $eachRow = floatval($eachRow);

    echo "<h1>Row: " . $eachRow . "</h1>";

    $totalMargin += (float)$eachRow;

    echo "<h1>Total Margin: " . $totalMargin . "</h1>";
    echo "<br>";
}

echo '<h1 onclick="javascript:history.back();">Back</h1>';
echo "<div style='clear: both; height: 120px;'></div>";
echo "</div>";
die();

