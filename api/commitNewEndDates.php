<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";
	//ini_set("display_errors", 1);

$sql = "SELECT * FROM tmp_bill_end_date ORDER BY current_end_date ASC";
$results = getQuery($sql);


$sql = "UPDATE vnd_bills SET end_date = :new_end_date WHERE vnd_id = :bill_id";
$stmt_update_bill_end_date = $db_conn->prepare($sql);

foreach ($results as $getItem) {
	
	$sql = "UPDATE vnd_bills SET end_date = :new_end_date WHERE vnd_id = :bill_id ";
	$stmt_update_bill_end_date->execute([
		"new_end_date" => $getItem['new_end_date'],
		"bill_id" => $getItem['bill_id'],
	]);
}

header("Content-type: text/json");

$results = [
	"success" => true,
	"error" => null,
];
echo json_encode($results);
?>
