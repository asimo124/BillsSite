<?php
include("inc/includes.php");

$username           = isset($_REQUEST['username']) ? trim($_REQUEST['username']) : "";
$password           = isset($_REQUEST['password']) ? ($_REQUEST['password']) : "";

$hash_key_token_cs  = isset($_REQUEST['hash_key_token_cs']) ? ($_REQUEST['hash_key_token_cs']) : "";

$ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$ipArr = explode(".", $ip);
$userAgentArr = explode(" ", $user_agent);
$string_to_hash = SALT2 . $userAgentArr[2] . SALT1 . $userAgentArr[0];
$hash_key = md5($string_to_hash);

echo "<pre>";
echo "hash_key_token_cs: " . $hash_key_token_cs . "\n";
echo "hash_key: " . $hash_key . "\n";

if ($hash_key_token_cs != $hash_key) {
    echo "You do not have access to this page. Please contact Site Admin.";
    die;
}

if ($username == "alex" && $password == "clownfrog38") {
    $_SESSION['user']['user_id'] = 1;
    header("Location: /bills");
    exit;
} else {
    header("Location: /login.php?Message=" . urlencode("You did not enter the correct username/password combination"));
    exit;
}
?>