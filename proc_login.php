<?php
include("inc/includes.php");

$username           = isset($_REQUEST['username']) ? trim($_REQUEST['username']) : "";
$password           = isset($_REQUEST['password']) ? ($_REQUEST['password']) : "";

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

$sql = "SELECT id, username, fname, lname, email
        FROM hth_users
        WHERE username = :username
        and password = :password LIMIT 1 ";
$resultset = getQuery($sql, array(
    "username" => strtolower($username),
    "password" => md5($password)
));


if (count($resultset) > 0) {
    $_SESSION['user']['user_id'] = $resultset[0]['id'];

    $sql = "INSERT INTO hth_user_sessions
            ( session_key,  user_id,  last_until) VALUES
            (:session_key, :user_id, :last_until) ";

    $session_key = uniqid();
    $last_until = date("Y-m-d H:i:s", strtotime('+1 hours'));
    $dataParams = array(
        "session_key" => $session_key,
        "user_id" => $resultset[0]['id'],
        "last_until" => $last_until
    );
    execQuery($sql, $dataParams);

    header("Location: /bills");
    exit;
} else {
    header("Location: /login.php?Message=" . urlencode("You did not enter the correct username/password combination"));
    exit;
}
?>