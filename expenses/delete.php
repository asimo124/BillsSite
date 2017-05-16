<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";
	include "../inc/QueryUtils.php";

$vnd_id = isset($_REQUEST['vnd_id']) ? intval($_REQUEST['vnd_id']) : 0;

$query = "SELECT * FROM vnd_bills WHERE vnd_id = :vnd_id ";
$sth = $db_conn->prepare($query);

$data = array();
$data['vnd_id'] = $vnd_id;

$sth->execute($data);

$bills = $sth->fetchAll();
if (count($bills) > 0) {
	$getBill = $bills[0];
}

$query = "
DELETE FROM vnd_bill_dates 
WHERE vnd_bill_desc = :vnd_bill 
and vnd_date = :vnd_frequency_value ";
$sth = $db_conn->prepare($query);

$data = array();
$data['vnd_bill'] = $getBill['vnd_bill'];
$data['vnd_frequency_value'] = $getBill['vnd_frequency_value'];
$sth->execute($data);


$query = "DELETE FROM vnd_bills WHERE vnd_id = :vnd_id ";
$sth = $db_conn->prepare($query);

$data = array();
$data['vnd_id'] = $vnd_id;

$sth->execute($data);



header("Location: show_expenses.php?Message=" . urlencode("You have deleted a future expense."));
exit;
?>