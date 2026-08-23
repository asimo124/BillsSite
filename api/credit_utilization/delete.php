<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$body = api_read_json_body();
$id = isset($body['id']) ? intval($body['id']) : 0;

if ($id <= 0) {
    api_json_response(array('message' => 'Invalid loan id'), 400);
}

$sql = "DELETE FROM cu_loan WHERE id = :id";
execQuery($sql, array('id' => $id));

api_json_response(array(
    'message' => 'You have deleted a Loan/Card.',
    'id' => $id,
));
