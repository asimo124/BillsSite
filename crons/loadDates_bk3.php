<?php
	ini_set("display_errors", 1);
	$path_file = dirname(__FILE__);
	require_once($path_file . "/../inc/includes.php");
	require_once($path_file . "/../inc/Bills.php");

$numReps = 25;
$user_id = 1;
	
$Bill = new Bills($numReps);
$Bill->deleteOldDates();
$Bill->setPayPeriod("");
$Bill->generateBillDatesByUserID($user_id);

echo "script completed \n";
	
?>
