<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();

if ($_SERVER['REQUEST_METHOD'] !== 'GET' && $_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$user = require_api_auth();

api_json_response(array('user' => $user));
