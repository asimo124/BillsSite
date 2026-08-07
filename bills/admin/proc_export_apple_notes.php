<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$sql = "SELECT id_str, name, folder, account, creation_date, modification_date, body, to_delete
        FROM apple_notes
        WHERE to_delete = 1
        ORDER BY modification_date DESC, id DESC";

$results = getQuery($sql);

$filename = 'apple_notes_to_delete_' . date('Y-m-d_H-i-s') . '.csv';

header('Content-Type: text/csv; charset=utf-8');
header('Content-Disposition: attachment; filename="' . $filename . '"');
header('Pragma: no-cache');
header('Expires: 0');

$out = fopen('php://output', 'w');

fputcsv($out, [
    'id',
    'name',
    'folder',
    'account',
    'creation_date',
    'modification_date',
    'body',
    'to_delete',
    'has_duplicates'
]);

foreach ($results as $row) {
    fputcsv($out, [
        $row['id_str'],
        $row['name'],
        $row['folder'],
        $row['account'],
        $row['creation_date'],
        $row['modification_date'],
        $row['body'],
        $row['to_delete'],
        0
    ]);
}

fclose($out);
exit;
