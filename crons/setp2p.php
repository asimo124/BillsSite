<?php
ini_set("display_errors", "1");
require_once("../inc/includes.php");

$set_opt = isset($_REQUEST['set_opt']) ? true : false;
$set_pes = isset($_REQUEST['set_pes']) ? true : false;

if ($set_opt || $set_pes) {

    $date3More = date("Y-m-d 19:00:00", strtotime("+3 months"));

    $datesArr = array();
    $date3More = date("Y-m-d H:i:s", strtotime($date3More . " -1 days"));

    $datesArr = array();
    $nextDate = $date3More;
    $months = [];
    for ($i = 1; $i <= 300; $i++) {

        $nextDate = date("Y-m-d", strtotime($nextDate . " +1 days"));
        $dayOfWeek = date("w", strtotime($nextDate));
        if ($dayOfWeek >= 1 && $dayOfWeek <= 3) {
            $weekOfYear = date("W", strtotime($nextDate));
            if (!isset($datesArr[$weekOfYear])) {
                $datesArr[$weekOfYear] = array();
                $months[] = $weekOfYear;
            }
            $datesArr[$weekOfYear][] = $nextDate;

            if (count($datesArr) >= 24 && $dayOfWeek == 3) {
                break;
            }
        }
    }

    $rand_num = rand(0, 100);
    if ($set_opt) {  // later

        $week = 1;
        if ($rand_num >= 100) {
            $week = 0;
        } else if ($rand_num >= 94) {
            $week = 1;
        } else if ($rand_num >= 88) {
            $week = 2;
        } else if ($rand_num >= 83) {
            $week = 3;
        } else if ($rand_num >= 78) {
            $week = 4;
        } else if ($rand_num >= 73) {
            $week = 5;
        } else if ($rand_num >= 68) {
            $week = 6;
        } else if ($rand_num >= 63) {
            $week = 7;
        } else if ($rand_num >= 58) {
            $week = 8;
        } else if ($rand_num >= 54) {
            $week = 9;
        } else if ($rand_num >= 50) {
            $week = 10;
        } else if ($rand_num >= 46) {
            $week = 11;
        } else if ($rand_num >= 42) {
            $week = 12;
        } else if ($rand_num >= 38) {
            $week = 13;
        } else if ($rand_num >= 34) {
            $week = 14;
        } else if ($rand_num >= 30) {
            $week = 15;
        } else if ($rand_num >= 26) {
            $week = 16;
        } else if ($rand_num >= 22) {
            $week = 17;
        } else if ($rand_num >= 18) {
            $week = 18;
        } else if ($rand_num >= 14) {
            $week = 19;
        } else if ($rand_num >= 11) {
            $week = 20;
        } else if ($rand_num >= 7) {
            $week = 21;
        } else if ($rand_num >= 3) {
            $week = 22;
        } else {                     // 2
            $week = 23;
        }

    } else {  // set later

        $week = 23;
        if ($rand_num >= 100) {
            $week = 23;
        } else if ($rand_num >= 94) {
            $week = 22;
        } else if ($rand_num >= 88) {
            $week = 21;
        } else if ($rand_num >= 83) {
            $week = 20;
        } else if ($rand_num >= 78) {
            $week = 19;
        } else if ($rand_num >= 73) {
            $week = 18;
        } else if ($rand_num >= 68) {
            $week = 17;
        } else if ($rand_num >= 63) {
            $week = 16;
        } else if ($rand_num >= 58) {
            $week = 15;
        } else if ($rand_num >= 54) {
            $week = 14;
        } else if ($rand_num >= 50) {
            $week = 13;
        } else if ($rand_num >= 46) {
            $week = 12;
        } else if ($rand_num >= 42) {
            $week = 11;
        } else if ($rand_num >= 38) {
            $week = 10;
        } else if ($rand_num >= 34) {
            $week = 9;
        } else if ($rand_num >= 30) {
            $week = 8;
        } else if ($rand_num >= 26) {
            $week = 7;
        } else if ($rand_num >= 22) {
            $week = 6;
        } else if ($rand_num >= 18) {
            $week = 5;
        } else if ($rand_num >= 14) {
            $week = 4;
        } else if ($rand_num >= 11) {
            $week = 3;
        } else if ($rand_num >= 7) {
            $week = 2;
        } else if ($rand_num >= 3) {
            $week = 1;
        } else {
            $week = 0;
        }
    }

    $day = rand(0, 2);
    $nextDate = $datesArr[$months[$week]][$day];

    $sql = "UPDATE p2p_settings
            SET attribute_value = :nextDate 
            WHERE attribute_key = 'sendDate' ";
    execQuery($sql, [
            "nextDate" => md5($nextDate)
    ]);

    echo "<pre>";
    echo "Date set \n";
    echo "</pre>";
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <div style="margin: 45px auto; width: 1152px;" >
        <form action="setp2p.php" method="post">
            <button type="submit" name="set_opt" id="set_opt" value="" >Set Optimistic</button>
        </form>
        <div style="clear: both; height: 12px;" ></div>
        <form action="setp2p.php" method="post">
            <button type="submit" name="set_pes" id="set_pes" value="" >Set Pessimistic</button>
        </form>
    </div>
</body>
</html>
