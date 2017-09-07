<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";

$hash_key_token_cs  = isset($_REQUEST['hash_key_token_cs']) ? ($_REQUEST['hash_key_token_cs']) : "";

$ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$ipArr = explode(".", $ip);
$userAgentArr = explode(" ", $user_agent);
$string_to_hash = SALT2 . $userAgentArr[2] . SALT1 . $userAgentArr[0];
$hash_key = md5($string_to_hash);

if ($hash_key_token_cs != $hash_key) {
	$retValArr = array("fail" => 1);
	echo json_encode($retValArr);
	exit;
}

$user_id 			= isset($_REQUEST['user_id']) ? intval($_REQUEST['user_id']) : 0;
$current_balance 	= isset($_REQUEST['current_balance']) ? intval($_REQUEST['current_balance']) : 960;

if (!validateTags($current_balance)) {
	die("You have entered invalid content. Please re-enter");
}
$current_balance = strip_tags($current_balance);

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
