<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";
	//ini_set("display_errors", 1);

$user_id 			= isset($_REQUEST['user_id']) ? intval($_REQUEST['user_id']) : 0;
$current_balance 	= isset($_REQUEST['current_balance']) ? intval($_REQUEST['current_balance']) : 960;
$pay_date 			= isset($_REQUEST['pay_date']) ? trim($_REQUEST['pay_date']) : "";

if ($pay_date == "") {
	$pay_date = date("Y-m-d");
}



$end_date = "";
$start_date = date("Y-m-d", strtotime($pay_date));
$start_day = intval(date("d", strtotime($start_date)));

if ($start_day < 16) {
	$end_date = date("Y-m-15", strtotime($start_date));
} else {
	$d = new DateTime($start_date);
	$end_date = $d->format( 'Y-m-t' );
}

/*/
echo "<pre>";
print_r("end_date: " . $end_date . "\n");
die();
//*/

$MyBills = array();
$Bill = new Bills();
$Bill->setPayPeriod($end_date, $start_date);
$billDates = $Bill->loadBillDatesByUserID($user_id);

foreach ($billDates as $getDate) {
	$newDate = array();
	$newDate['desc'] = $getDate['vnd_bill_desc'];
	$newDate['amount'] = $getDate['vnd_amount'];
	$key = strtotime(date("Y-m-d 00:00:00", strtotime($getDate['vnd_date'])));
	$MyBills[$key][] = $newDate;
}

$days_arr = array();
$full_cur_amount = $current_balance;

$timestamp = strtotime($start_date);
while ($timestamp <= strtotime($end_date)) {

	$cur_date = date("Y-m-d", $timestamp);
	$day = date("w", $timestamp);
	switch ($day) {
		case 0:
			$my_day = "Sunday";
			break;
		case 1:
			$my_day = "Monday";
			break;
		case 2:
			$my_day = "Tuesday";
			break;
		case 3:
			$my_day = "Wednesday";
			break;
		case 4:
			$my_day = "Thursday";
			break;
		case 5:
			$my_day = "Friday";
			break;
		case 6:
			$my_day = "Saturday";
			break;
    }
    $my_day .= ", " . getDaySuffix(intval(date("d", $timestamp)));

	$get_day = array();
	$get_day['Day'] = $my_day;
	$get_day['Timestamp'] = $timestamp;
	$get_day['Date'] = date("m/d/Y 00:00:00", $timestamp);
	$bills_desc = "";
	$hasBills = false;

	$billsDescArr = [];
	foreach ($MyBills[$timestamp] as $getBill) {

		$hasBills = true;
        $billsDescArr[] = $getBill['desc'] . " - $" . $getBill["amount"];
		$full_cur_amount -= $getBill["amount"];
	}
	$get_day['desc'] = $billsDescArr;
	//if ($hasBills == true) {
		$get_day['Balance'] = '$' . $full_cur_amount;
	/*} else {
		$get_day['Balance'] = "";
	}*/
	$timestamp = strtotime('+1 days', $timestamp);
	$days_arr[] = $get_day;

}

header("Content-type: text/json");


/**
 * TODO - Comment this
 */
header('Access-Control-Allow-Origin: *');



$results = array("results" => $days_arr);
echo json_encode($results);

function getDaySuffix($num) {

    switch ($num) {
        case 1:
            return $num . "st";
            break;
        case 2:
            return $num . "nd";
            break;
        case 3:
            return $num . "rd";
            break;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
            return $num . "th";
            break;
        case 21:
            return $num . "st";
            break;
        case 22:
            return $num . "nd";
            break;
        case 23:
            return $num . "rd";
            break;
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
            return $num . "th";
            break;
        case 31:
            return $num . "st";
            break;
        default: 
            return $num . "th";
    }
}
?>
