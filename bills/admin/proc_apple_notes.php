<?php
ini_set("display_errors", 0);
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

// Handle file upload
if (isset($_FILES['apple_notes_file']) && $_FILES['apple_notes_file']['error'] === UPLOAD_ERR_OK) {
    $uploadedFile = $_FILES['apple_notes_file'];
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

        $sql = "TRUNCATE apple_notes";
        execQuery($sql);

        $sql = "INSERT INTO apple_notes
        (id_str, `name`, folder, account, creation_date, modification_date, body, to_delete) VALUES
        (?, ?, ?, ?, ?, ?, ?, ?)";

        $stmt_ins_notes = $db_conn->prepare($sql);

        foreach ($rows as $index => $row) {

            if ($index == 0) {
                continue;
            }

            $id_str = $row[0];
            $name = $row[1];
            $folder = $row[2];
            $account = $row[3];
            $creation_date = $row[4];
            $modification_date = $row[5];
            $body = $row[6];
            $to_delete = $row[7];

            $stmt_ins_notes->execute([$id_str, $name, $folder, $account, $creation_date, $modification_date, $body, $to_delete]);
        }

        $sql = "DELETE FROM apple_notes WHERE folder = 'Recently Deleted'; ";
        execQuery($sql);

        header("Location: apple_notes.php?Message=" . urlencode("Apple Notes imported successfully"));
        exit;
    }
} else {
    // Handle upload errors
    $errorMessage = "No file uploaded or upload error occurred.";
    if (isset($_FILES['apple_notes_file']['error'])) {
        switch ($_FILES['apple_notes_file']['error']) {
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
    header("Location: apple_notes.php?error=" . urlencode($errorMessage));
    exit;
}