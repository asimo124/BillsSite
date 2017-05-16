<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";
	include "../inc/QueryUtils.php";

$vnd_bill 				= isset($_REQUEST['vnd_bill']) ? trim($_REQUEST['vnd_bill']) : "";
$vnd_frequency_value 	= isset($_REQUEST['vnd_frequency_value']) ? ($_REQUEST['vnd_frequency_value']) : "";
$amount 				= isset($_REQUEST['amount']) ? floatval($_REQUEST['amount']) : 0;

$query = "INSERT INTO vnd_bills 
( vnd_user_id,  vnd_bill,  vnd_frequency_value,  amount,  vnd_is_auto,  vnd_frequency,  vnd_frequency_type,  vnd_entrydate,  multiplier,  is_future) VALUES 
(:vnd_user_id, :vnd_bill, :vnd_frequency_value, :amount, :vnd_is_auto, :vnd_frequency, :vnd_frequency_type, :vnd_entrydate, :multiplier, :is_future) ";

$data = array();
$data['vnd_user_id'] = 1;
$data['vnd_bill'] = $vnd_bill;
$data['vnd_frequency_value'] = $vnd_frequency_value;
$data['amount'] = $amount;
$data['vnd_is_auto'] = 0;
$data['vnd_frequency'] = "Once";
$data['vnd_frequency_type'] = "Once";
$data['vnd_entrydate'] = date("Y-m-d H:i:s");
$data['multiplier'] = 1;
$data['is_future'] = 1;

$sth = $db_conn->prepare($query);
$sth->execute($data);

$numReps = 25;
$user_id = 1;
	
$Bill = new Bills($numReps);
$Bill->deleteOldDates();
$Bill->setPayPeriod("");
$Bill->generateBillDatesByUserID($user_id);

header("Location: index.php?Message=" . urlencode("You have added a future expense."));
exit;
?>