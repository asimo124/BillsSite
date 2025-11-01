<?php
include("inc/includes.php");

$username           = isset($_REQUEST['username']) ? trim($_REQUEST['username']) : "";
$password           = isset($_REQUEST['password']) ? ($_REQUEST['password']) : "";



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

    header("Location: /bills/admin/index.php");
    exit;
} else {
    header("Location: /login.php?Message=" . urlencode("You did not enter the correct username/password combination"));
    exit;
}
?>