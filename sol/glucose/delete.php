<?php
include "../../inc/includes.php";

/*/
if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}
//*/

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

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;

$sql = "DELETE FROM glu_glucose_log WHERE id = :id ";

execQuery($sql, [
    "id" =>  $id
]);

$sql = "DELETE FROM glu_log_notes WHERE log_id = :id ";

execQuery($sql, [
    "id" =>  $id
]);

header("Location: index.php?Message=" . urlencode("You have deleted a log."));
exit;