<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
api_use_live_db();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$body = api_read_json_body();
$username = isset($body['username']) ? trim($body['username']) : '';
$password = isset($body['password']) ? $body['password'] : '';

if ($username === '' || $password === '') {
    // Also accept form-encoded fallbacks
    $username = isset($_REQUEST['username']) ? trim($_REQUEST['username']) : $username;
    $password = isset($_REQUEST['password']) ? $_REQUEST['password'] : $password;
}

if ($username === '' || $password === '') {
    api_json_response(array('message' => 'Username and password are required'), 400);
}

$sql = "SELECT id, username, fname, lname, email
        FROM hth_users
        WHERE username = :username
          AND password = :password
        LIMIT 1";

$resultset = getQuery($sql, array(
    'username' => strtolower($username),
    'password' => md5($password),
));

if (!$resultset || count($resultset) === 0) {
    api_json_response(array('message' => 'Invalid username or password'), 401);
}

$userRow = $resultset[0];
$token = bin2hex(random_bytes(32));
$last_until = date('Y-m-d H:i:s', strtotime('+30 days'));

$sql = "INSERT INTO hth_user_sessions
        (session_key, user_id, last_until) VALUES
        (:session_key, :user_id, :last_until)";

execQuery($sql, array(
    'session_key' => $token,
    'user_id' => $userRow['id'],
    'last_until' => $last_until,
));

api_json_response(array(
    'token' => $token,
    'expires_at' => $last_until,
    'user' => array(
        'id' => intval($userRow['id']),
        'username' => $userRow['username'],
        'fname' => $userRow['fname'],
        'lname' => $userRow['lname'],
        'email' => $userRow['email'],
    ),
));
