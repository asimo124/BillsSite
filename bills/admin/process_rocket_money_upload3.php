<?php
ini_set("display_errors", 1);
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

// Handle file upload
if (isset($_FILES['rocket_money_file']) && $_FILES['rocket_money_file']['error'] === UPLOAD_ERR_OK) {
    $uploadedFile = $_FILES['rocket_money_file'];
    $fileName = $uploadedFile['name'];
    $tempPath = $uploadedFile['tmp_name'];
    $fileSize = $uploadedFile['size'];
    $fileExtension = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
    
    // Validate file extension
    $allowedExtensions = ['csv'];
    if (!in_array($fileExtension, $allowedExtensions)) {
        header("Location: audit_expenses_v3.php?error=" . urlencode("Invalid file type. Please upload a CSV file."));
        exit;
    }
    
    // Create destination directory if it doesn't exist
    $destinationDir = dirname(__FILE__) . '/../../data/audit_v2';
    if (!is_dir($destinationDir)) {
        mkdir($destinationDir, 0755, true);
    }
    
    // Generate unique filename with timestamp to avoid conflicts
    $timestamp = date('Y-m-d_H-i-s');
    $safeFileName = "rocket_money_expenses";
    $newFileName = $safeFileName . "." . $fileExtension;
    $destinationPath = $destinationDir . '/' . $newFileName;
    
    // Move uploaded file to destination
    if (move_uploaded_file($tempPath, $destinationPath)) {

        execQuery("TRUNCATE ae_rocket_money_item");

        $keys = [];
        $i = 0;
        $fh = fopen($destinationPath, 'r');;
        while ($row = fgetcsv($fh)) {

            if ($i == 0) {
                $keys = $row;
                $i++;
                continue;
            }

            $allowedKeys = [
                "Date",
                "Original_Date",
                "Account_Type",
                "Account_Name",
                "Account_Number",
                "Institution_Name",
                "Name",
                "Custom_Name",
                "Amount",
                "Description",
                "Category",
                "Note",
                "Ignored_From",
                "Tax_Deductible",
            ];

            $eachItem = [];
            foreach ($row as $index => $value) {
                $field = trim($keys[$index]);
                $field = str_replace(" ", "_", $field);
                if (!in_array($field, $allowedKeys)) {
                    continue;
                }
                $eachItem[$field] = $value;
            }

            $sql = "INSERT INTO ae_rocket_money_item (";
            $sql .= implode(", ", array_keys($eachItem));
            $sql .= ") VALUES (";
            $placeholders = array_fill(0, count($eachItem), '?');
            $sql .= implode(", ", $placeholders);
            $sql .= ")";
            execQuery($sql, array_values($eachItem));

            $i++;
        }
        fclose($fh);

        header("Location: audit_expenses_v3.php?Message=" . urlencode("File uploaded successfully: " . $newFileName));
        exit;
    } else {
        header("Location: audit_expenses_v3.php?error=" . urlencode("Failed to save uploaded file."));
        exit;
    }
} else {
    // Handle upload errors
    $errorMessage = "No file uploaded or upload error occurred.";
    if (isset($_FILES['rocket_money_file']['error'])) {
        switch ($_FILES['rocket_money_file']['error']) {
            case UPLOAD_ERR_INI_SIZE:
            case UPLOAD_ERR_FORM_SIZE:
                $errorMessage = "File is too large.";
                break;
            case UPLOAD_ERR_PARTIAL:
                $errorMessage = "File upload was interrupted.";
                break;
            case UPLOAD_ERR_NO_FILE:
                $errorMessage = "No file was selected for upload.";
                break;
            default:
                $errorMessage = "Unknown upload error.";
                break;
        }
    }
    header("Location: audit_expenses_v3.php?error=" . urlencode($errorMessage));
    exit;
}