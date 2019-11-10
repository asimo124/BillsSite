<?php
define(CURRENT_PATH, dirname(__FILE__));
ini_set("display_errors", 1);
include "../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$days_range = 2;

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

if ($_SERVER['REQUEST_METHOD'] == "POST") {

    $sql = "TRUNCATE vnd_bills_charges ";
    execQuery($sql);

    echo "Success";
} else {
    echo "You do not have access.";
    exit;
}
?>