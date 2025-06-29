<?php
	ini_set("display_errors", 1);
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
	//echo "You do not have access to this page. Please contact Site Admin.";
	//die;
}


$vnd_bill 				= isset($_REQUEST['vnd_bill']) ? trim($_REQUEST['vnd_bill']) : "";
$vnd_frequency_value 	= isset($_REQUEST['vnd_frequency_value']) ? ($_REQUEST['vnd_frequency_value']) : "";
$amount 				= isset($_REQUEST['amount']) ? floatval($_REQUEST['amount']) : 0;

$vnd_bill = isset($_REQUEST['vnd_bill']) ? trim($_REQUEST['vnd_bill']) : "";
if (!validateTags($vnd_bill)) {
	die("You have entered invalid content. Please re-enter");
}
$vnd_bill = strip_tags($vnd_bill);

$vnd_frequency_value = isset($_REQUEST['vnd_frequency_value']) ? trim($_REQUEST['vnd_frequency_value']) : "";
if (!validateTags($vnd_frequency_value)) {
	die("You have entered invalid content. Please re-enter");
}
$vnd_frequency_value = strip_tags($vnd_frequency_value);

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
