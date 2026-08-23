<?php
include "../inc/includes.php";
include "../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

$paramsIn = array_merge($_REQUEST, api_read_json_body());
$ids = array();

if (isset($paramsIn['ids'])) {
    if (is_array($paramsIn['ids'])) {
        $ids = $paramsIn['ids'];
    } else {
        $raw = trim((string) $paramsIn['ids']);
        if ($raw !== '') {
            $decoded = json_decode($raw, true);
            if (is_array($decoded)) {
                $ids = $decoded;
            } else {
                $ids = explode(',', $raw);
            }
        }
    }
}

$ids = array_values(array_unique(array_filter(array_map('intval', $ids), function ($id) {
    return $id > 0;
})));

if (count($ids) === 0) {
    api_json_response(array(
        'success' => false,
        'error' => 'No valid ids provided',
        'message' => 'No valid ids provided',
    ), 400);
}

$placeholders = implode(',', array_fill(0, count($ids), '?'));
$sql = "UPDATE apple_notes SET to_delete = 1 WHERE id IN ($placeholders)";
execQuery($sql, $ids);

api_json_response(array(
    'success' => true,
    'deleted_count' => count($ids),
    'message' => 'Marked ' . count($ids) . ' note(s) for deletion.',
));
