<?php
ini_set("display_errors", 0);
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
        header("Location: disposable_income_tracker.php?error=" . urlencode("Invalid file type. Please upload a CSV file."));
        exit;
    }
    
    // Create destination directory if it doesn't exist
    $destinationDir = dirname(__FILE__) . '/../../data/disposable_income_tracker';
    if (!is_dir($destinationDir)) {
        mkdir($destinationDir, 0755, true);
    }
    
    // Generate unique filename with timestamp to avoid conflicts
    $timestamp = date('Y-m-d_H-i-s');
    $safeFileName = "disposable_income_tracker_main";
    $newFileName = $safeFileName . "." . $fileExtension;
    $destinationPath = $destinationDir . '/' . $newFileName;

    $safeFileNameOutput = "disposable_income_tracker_main_output";
    $newFileNameOutput = $safeFileNameOutput . "." . $fileExtension;
    $destinationPathOutput = $destinationDir . '/' . $newFileNameOutput;
    
    // Move uploaded file to destination
    if (move_uploaded_file($tempPath, $destinationPath)) {

        $rows = [];
        $keys = [];
        $i = 0;
        $fh = fopen($destinationPath, 'r');;
        while ($row = fgetcsv($fh)) {

            $rows[] = $row;

        }
        fclose($fh);

        // Open output buffer to generate CSV for download
        ob_start();
        $output = fopen('php://output', 'w');

        // Write the data rows
        foreach ($rows as $row) {
            if ($i == 0) {

                $keys = $row;
                $keys[] = 'Paycheck Date';
                fputcsv($output, $keys);

                $i++;
                continue;
            }

            $csvItem = [];
            foreach ($row as $index => $value) {
                $field = trim($keys[$index]);
                $csvItem[$field] = $value;
            }

            $transactionDate = "";
            $transactionDay = intval(date("d", strtotime($csvItem['Date'])));
            if ($transactionDay < 15) {
                $transactionDate = date("Y-m-01", strtotime($csvItem['Date']));
            } else {
                $transactionDate = date("Y-m-15", strtotime($csvItem['Date']));
            }

            $csvItem['Paycheck Date'] = $transactionDate;

            $newRow = array_values($csvItem);
            fputcsv($output, $newRow);
        }

        fclose($output);

        // Set headers to trigger download
        header('Content-Type: text/csv');
        header('Content-Disposition: attachment; filename="disposable_income_tracker_main_output.csv"');

        // Flush the output buffer
        ob_end_flush();
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
    header("Location: disposable_income_tracker.php?error=" . urlencode($errorMessage));
    exit;
}