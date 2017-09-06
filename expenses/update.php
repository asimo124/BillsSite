<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";

if (!isset($_SESSION['user'])) {
	header("Location: /login.php");
	exit;
}

$hash_key_token_cs  = isset($_REQUEST['hash_key_token_cs']) ? ($_REQUEST['hash_key_token_cs']) : "";

$ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$ipArr = explode(".", $ip);
$userAgentArr = explode(" ", $user_agent);
$string_to_hash = $ip[1] . SALT2 . $userAgentArr[2] . SALT1 . $ip[3] . $userAgentArr[0];
$hash_key = md5($string_to_hash);

if ($hash_key_token_cs != $hash_key) {
	echo "You do not have access to this page. Please contact Site Admin.";
	die;
}

$vnd_frequency_value 	= isset($_REQUEST['vnd_frequency_value']) ? ($_REQUEST['vnd_frequency_value']) : array();
$amount					= isset($_REQUEST['amount']) ? $_REQUEST['amount'] : array();

$queryUpdate = "
UPDATE vnd_bills 
SET vnd_frequency_value = :vnd_frequency_value,
amount = :amount
WHERE vnd_id = :vnd_id ";

$sthUpdate = $db_conn->prepare($queryUpdate);
foreach ($vnd_frequency_value as $vnd_id => $freq_val) {

	$freq_val = isset($freq_val) ? trim($freq_val) : "";
	if (!validateTags($freq_val)) {
		die("You have entered invalid content. Please re-enter");
	}
	$freq_val = strip_tags($freq_val);

	$data = array();
	$data['vnd_frequency_value'] = $freq_val;
	$data['amount'] = floatval($amount[$vnd_id]);
	$data['vnd_id'] = $vnd_id;

	$sthUpdate->execute($data);
}

header("Location: show_expenses.php?Message=" . urlencode("You have updated your Future Expenses."));
exit;
?>