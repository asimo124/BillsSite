<?php

	include "../inc/includes.php";
	include "../inc/Bills.php";
	
$user_id = isset($_REQUEST['user_id']) ? intval($_REQUEST['user_id']) : 0;

$query = "
SELECT * FROM vnd_user_settings 
WHERE vnd_user_id = :vnd_user_id ";

$data = array();
$data['vnd_user_id'] = $user_id;

$sth = $db_conn->prepare($query);
$sth->execute($data);

$cur_bal = 960;
$settings = $sth->fetchAll();
if (count($settings) > 0) {
	$cur_bal = $settings[0]['vnd_current_balance'];	
}

$retValArr = array("CurBalance" => $cur_bal);
echo json_encode($retValArr);