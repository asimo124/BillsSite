<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";
	
$user_id 			= 1;
$pay_date 			= "2016-07-15";

$MyBills = array();
$Bill = new Bills();
$Bill->setPayPeriod($pay_date);
$billDates = $Bill->loadBillDatesByUserID($user_id);

echo json_encode($billDates);
?>
