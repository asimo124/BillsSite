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
$start_date = $pay_date;
$start_day = intval(date("d", strtotime($start_date)));

if ($start_day < 16) {
	$end_date = date("Y-m-15", strtotime($start_date));
} else {
	$d = new DateTime($start_date); 
	$end_date = $d->format( 'Y-m-t' );
}

$MyBills = array();
$Bill = new Bills();
$Bill->setPayPeriod($end_date, $start_date);
$billDates = $Bill->loadBillDatesByUserID($user_id);

foreach ($billDates as $getDate) {
	$newDate = array();
	$newDate['desc'] = $getDate['vnd_bill_desc'];
	$newDate['amount'] = $getDate['vnd_amount'];
	$newDate['is_future'] = $getDate['vnd_is_future'];
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
		
	$get_day = array();
	$get_day['Day'] = $my_day;
	$get_day['Timestamp'] = $timestamp;
	$get_day['Date'] = date("m/d/Y 00:00:00", $timestamp);
	$bills_desc = "";
	$hasBills = false;

	foreach ($MyBills[$timestamp] as $getBill) {

		$hasBills = true;
		
		if ($bills_desc == "") {
			$bills_desc = $getBill['desc'] . " - " . '<span class="use_money" >' . $getBill["amount"] . '</span>';
		} else {
			$bills_desc .= "<br>" . $getBill['desc'] . " - " . '<span class="use_money" >' . $getBill["amount"] . '</span>';
		}
		$full_cur_amount -= $getBill["amount"];
	}
	if ($getBill['is_future']) {
		$get_day['is_future'] = "color: #0000FF; font-size: 14px; font-weight: bold;";
	}
	$get_day['desc'] = $bills_desc;
	//if ($hasBills == true) {
		$get_day['Balance'] = $full_cur_amount;
	/*} else {
		$get_day['Balance'] = "";	
	}*/
	$timestamp = strtotime('+1 days', $timestamp);
	$days_arr[] = $get_day;

}

header("Content-type: text/json");

$results = array("results" => $days_arr);
echo json_encode($results);
?>