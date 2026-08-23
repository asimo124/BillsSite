<?php
include "../inc/includes.php";
include "../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

$sql = "SELECT *
        FROM fs_food_general
        WHERE 1
        ORDER BY title ASC";

$results = getQuery($sql);
if (!$results) {
    $results = array();
}

foreach ($results as $i => $row) {
    $results[$i]['id'] = intval($row['id']);
}

api_json_response(array(
    'items' => $results,
));
