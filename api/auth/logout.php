<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();

if ($_SERVER['REQUEST_METHOD'] !== 'POST' && $_SERVER['REQUEST_METHOD'] !== 'GET') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$token = api_get_bearer_token();
if ($token === '') {
    api_json_response(array('message' => 'Unauthorized'), 401);
}

$sql = "DELETE FROM hth_user_sessions WHERE session_key = :session_key";
execQuery($sql, array('session_key' => $token));

api_json_response(array('message' => 'Logged out'));
