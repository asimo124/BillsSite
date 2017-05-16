<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";
	include "../inc/QueryUtils.php";

$vnd_frequency_value 	= isset($_REQUEST['vnd_frequency_value']) ? ($_REQUEST['vnd_frequency_value']) : array();
$amount					= isset($_REQUEST['amount']) ? $_REQUEST['amount'] : array();

$queryUpdate = "
UPDATE vnd_bills 
SET vnd_frequency_value = :vnd_frequency_value,
amount = :amount
WHERE vnd_id = :vnd_id ";

$sthUpdate = $db_conn->prepare($queryUpdate);
foreach ($vnd_frequency_value as $vnd_id => $freq_val) {

	$data = array();
	$data['vnd_frequency_value'] = $freq_val;
	$data['amount'] = $amount[$vnd_id];
	$data['vnd_id'] = $vnd_id;

	$sthUpdate->execute($data);
}

header("Location: show_expenses.php?Message=" . urlencode("You have updated your Future Expenses."));
exit;
?>