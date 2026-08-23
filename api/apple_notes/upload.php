<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

if (!isset($_FILES['apple_notes_file']) || $_FILES['apple_notes_file']['error'] !== UPLOAD_ERR_OK) {
    $errorMessage = 'No file uploaded or upload error occurred.';
    if (isset($_FILES['apple_notes_file']['error'])) {
        switch ($_FILES['apple_notes_file']['error']) {
            case UPLOAD_ERR_INI_SIZE:
            case UPLOAD_ERR_FORM_SIZE:
                $errorMessage = 'File is too large.';
                break;
            case UPLOAD_ERR_PARTIAL:
                $errorMessage = 'File upload was interrupted.';
                break;
            case UPLOAD_ERR_NO_FILE:
                $errorMessage = 'No file was selected for upload.';
                break;
            default:
                $errorMessage = 'Unknown upload error.';
                break;
        }
    }
    api_json_response(array('message' => $errorMessage), 400);
}

$uploadedFile = $_FILES['apple_notes_file'];
$fileName = $uploadedFile['name'];
$tempPath = $uploadedFile['tmp_name'];
$fileExtension = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));

if ($fileExtension !== 'csv') {
    api_json_response(array('message' => 'Invalid file type. Please upload a CSV file.'), 400);
}

$destinationDir = dirname(__FILE__) . '/../../data/apple_notes';
if (!is_dir($destinationDir)) {
    mkdir($destinationDir, 0755, true);
}

$destinationPath = $destinationDir . '/apple_notes_import.csv';

if (!move_uploaded_file($tempPath, $destinationPath)) {
    api_json_response(array('message' => 'Failed to save uploaded file.'), 500);
}

$rows = array();
$fh = fopen($destinationPath, 'r');
if ($fh === false) {
    api_json_response(array('message' => 'Failed to read uploaded file.'), 500);
}

while (($row = fgetcsv($fh)) !== false) {
    $rows[] = $row;
}
fclose($fh);

execQuery('TRUNCATE apple_notes');

$sql = "INSERT INTO apple_notes
        (id_str, `name`, folder, account, creation_date, modification_date, body, to_delete) VALUES
        (?, ?, ?, ?, ?, ?, ?, ?)";

global $db_conn;
$stmt = $db_conn->prepare($sql);

$imported = 0;
foreach ($rows as $index => $row) {
    if ($index === 0) {
        continue;
    }
    if (!is_array($row) || count($row) < 7) {
        continue;
    }

    $id_str = $row[0];
    $name = $row[1];
    $folder = $row[2];
    $account = $row[3];
    $creation_date = $row[4];
    $modification_date = $row[5];
    $body = $row[6];
    $to_delete = isset($row[7]) ? $row[7] : 0;

    $stmt->execute(array(
        $id_str,
        $name,
        $folder,
        $account,
        $creation_date,
        $modification_date,
        $body,
        $to_delete,
    ));
    $imported++;
}

execQuery("DELETE FROM apple_notes WHERE folder = 'Recently Deleted'");

api_json_response(array(
    'success' => true,
    'message' => 'Apple Notes imported successfully.',
    'imported' => $imported,
));
