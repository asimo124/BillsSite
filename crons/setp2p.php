<?php
ini_set("display_errors", "1");
require_once("../inc/includes.php");

$set9 = isset($_REQUEST['set9']) ? true : false;
$set_pes = isset($_REQUEST['set_pes']) ? true : false;

if ($set9) {

    $date3More = date("Y-m-d 19:00:00", strtotime("+8 months"));

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

            if (count($datesArr) >= 8 && $dayOfWeek == 3) {
                break;
            }
        }
    }

    $week = rand(0, 7);

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
            <button type="submit" name="set9" id="set9" value="" >Set 9 Months</button>
        </form>
        <div style="clear: both; height: 12px;" ></div>
<!--        <form action="setp2p.php" method="post">-->
<!--            <button type="submit" name="set_pes" id="set_pes" value="" >Set Pessimistic</button>-->
<!--        </form>-->
    </div>
</body>
</html>
