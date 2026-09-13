<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST' && $_SERVER['REQUEST_METHOD'] !== 'GET') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$sql = "SELECT id_str, title, calendar_name, location, start_date, end_date, all_day, description, url, to_delete
        FROM apple_calendar_events
        WHERE to_delete = 1
        ORDER BY start_date DESC, id DESC";

$results = getQuery4($sql);
if (!$results) {
    $results = array();
}

$filename = 'apple_calendar_events_to_delete_' . date('Y-m-d_H-i-s') . '.csv';

api_send_cors_headers();
header('Content-Type: text/csv; charset=utf-8');
header('Content-Disposition: attachment; filename="' . $filename . '"');
header('Pragma: no-cache');
header('Expires: 0');

$out = fopen('php://output', 'w');

fputcsv($out, array(
    'id',
    'title',
    'calendar',
    'location',
    'start_date',
    'end_date',
    'all_day',
    'description',
    'url',
    'to_delete',
));

foreach ($results as $row) {
    fputcsv($out, array(
        $row['id_str'],
        $row['title'],
        $row['calendar_name'],
        $row['location'],
        $row['start_date'],
        $row['end_date'],
        $row['all_day'],
        $row['description'],
        $row['url'],
        $row['to_delete'],
    ));
}

fclose($out);
exit;
