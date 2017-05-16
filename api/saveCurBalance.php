<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";
	
$user_id 			= isset($_REQUEST['user_id']) ? intval($_REQUEST['user_id']) : 0;
$current_balance 	= isset($_REQUEST['current_balance']) ? intval($_REQUEST['current_balance']) : 960;

$query = "
UPDATE vnd_user_settings
SET vnd_current_balance = :vnd_current_balance 
WHERE vnd_user_id = :vnd_user_id ";

$data = array();
$data['vnd_current_balance'] = $current_balance;
$data['vnd_user_id'] = $user_id;

$sth = $db_conn->prepare($query);
$sth->execute($data);

$retValArr = array("success" => 1);
echo json_encode($retValArr);
?>
