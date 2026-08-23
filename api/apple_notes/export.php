<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST' && $_SERVER['REQUEST_METHOD'] !== 'GET') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$sql = "SELECT id_str, name, folder, account, creation_date, modification_date, body, to_delete
        FROM apple_notes
        WHERE to_delete = 1
        ORDER BY modification_date DESC, id DESC";

$results = getQuery($sql);
if (!$results) {
    $results = array();
}

$filename = 'apple_notes_to_delete_' . date('Y-m-d_H-i-s') . '.csv';

api_send_cors_headers();
header('Content-Type: text/csv; charset=utf-8');
header('Content-Disposition: attachment; filename="' . $filename . '"');
header('Pragma: no-cache');
header('Expires: 0');

$out = fopen('php://output', 'w');

fputcsv($out, array(
    'id',
    'name',
    'folder',
    'account',
    'creation_date',
    'modification_date',
    'body',
    'to_delete',
    'has_duplicates',
));

foreach ($results as $row) {
    fputcsv($out, array(
        $row['id_str'],
        $row['name'],
        $row['folder'],
        $row['account'],
        $row['creation_date'],
        $row['modification_date'],
        $row['body'],
        $row['to_delete'],
        0,
    ));
}

fclose($out);
exit;
