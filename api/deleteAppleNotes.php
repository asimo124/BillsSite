<?php
include "../inc/includes.php";
//ini_set("display_errors", 1);

$ids = [];

if (isset($_REQUEST['ids'])) {
    if (is_array($_REQUEST['ids'])) {
        $ids = $_REQUEST['ids'];
    } else {
        $raw = trim($_REQUEST['ids']);
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
    header("Content-type: application/json");
    header('Access-Control-Allow-Origin: *');
    echo json_encode([
        'success' => false,
        'error' => 'No valid ids provided'
    ], JSON_PRETTY_PRINT);
    die();
}

$placeholders = implode(',', array_fill(0, count($ids), '?'));
$sql = "UPDATE apple_notes SET to_delete = 1 WHERE id IN ($placeholders)";
$result = execQuery($sql, $ids);

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'success' => true,
    'deleted_count' => count($ids)
], JSON_PRETTY_PRINT);
die();
