<?php
include '../../inc/includes.php';
include '../../inc/api_auth.php';

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

if (!isset($_FILES['rocket_money_file']) || $_FILES['rocket_money_file']['error'] !== UPLOAD_ERR_OK) {
    $errorMessage = 'No file uploaded or upload error occurred.';
    if (isset($_FILES['rocket_money_file']['error'])) {
        switch ($_FILES['rocket_money_file']['error']) {
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
        }
    }
    api_json_response(array('message' => $errorMessage), 400);
}

$uploadedFile = $_FILES['rocket_money_file'];
$fileExtension = strtolower(pathinfo($uploadedFile['name'], PATHINFO_EXTENSION));
if (!in_array($fileExtension, array('csv'), true)) {
    api_json_response(array('message' => 'Invalid file type. Please upload a CSV file.'), 400);
}

$destinationDir = dirname(__FILE__) . '/../../data/audit_v2';
if (!is_dir($destinationDir)) {
    mkdir($destinationDir, 0755, true);
}

$destinationPath = $destinationDir . '/rocket_money_expenses.csv';
if (!move_uploaded_file($uploadedFile['tmp_name'], $destinationPath)) {
    api_json_response(array('message' => 'Failed to save uploaded file.'), 500);
}

execQuery('TRUNCATE ae_rocket_money_item');
execQuery('TRUNCATE ae_title_match');
execQuery('UPDATE vnd_bills SET collapsed = 0');
execQuery('UPDATE ae_rocket_money_item SET collapsed = 0');

$allowedKeys = array(
    'Date',
    'Original_Date',
    'Account_Type',
    'Account_Name',
    'Account_Number',
    'Institution_Name',
    'Name',
    'Custom_Name',
    'Amount',
    'Description',
    'Category',
    'Note',
    'Ignored_From',
    'Tax_Deductible',
);

$keys = array();
$i = 0;
$imported = 0;
$fh = fopen($destinationPath, 'r');
while ($row = fgetcsv($fh)) {
    if ($i == 0) {
        $keys = $row;
        $i++;
        continue;
    }

    $eachItem = array();
    foreach ($row as $index => $value) {
        $field = trim($keys[$index]);
        $field = str_replace(' ', '_', $field);
        if (!in_array($field, $allowedKeys, true)) {
            continue;
        }
        $eachItem[$field] = $value;
    }

    if (empty($eachItem)) {
        $i++;
        continue;
    }

    $sql = 'INSERT INTO ae_rocket_money_item (' . implode(', ', array_keys($eachItem)) . ') VALUES (';
    $placeholders = array_fill(0, count($eachItem), '?');
    $sql .= implode(', ', $placeholders) . ')';
    execQuery($sql, array_values($eachItem));
    $imported++;
    $i++;
}
fclose($fh);

api_json_response(array(
    'success' => true,
    'message' => 'File uploaded successfully.',
    'imported' => $imported,
));
