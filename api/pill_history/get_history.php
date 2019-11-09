<?php
include "../inc/includes.php";

$day = date('w');

$i = 0;
$firstDayOfWeek = 0;
$firstDayOfLastWeek = 0;
$curDay = date("w");
$firstDayOfWeek = strtotime('-'.$curDay.' days');
$firstDayOfLastWeek = strtotime('-7 day', $firstDayOfWeek);

$daysArr = [];
$daysLength = 21;
$lastIndex = $firstDayOfLastWeek + (86400 * $daysLength);
for ($i = $firstDayOfLastWeek; $i < $lastIndex; $i += 86400) {

    $daysArr[date("Y-m-d", $i)] = [
        "metformin" => 0,
        "diaplex" => 0,
        "multivitamin" => 0,
        "vitamin_d" => 0,
        "b12" => 0,
        "b12_complex" => 0,
    ];
}
/*/
echo "<pre>";
print_r($daysArr);
//*/
header("Content-type: text/json");
echo json_encode($daysArr);