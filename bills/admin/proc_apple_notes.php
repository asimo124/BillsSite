<?php
ini_set("display_errors", 0);
include "../../inc/includes.php";
include "../../inc/apple_notes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

if (isset($_FILES['apple_notes_file']) && $_FILES['apple_notes_file']['error'] === UPLOAD_ERR_OK) {
    $uploadedFile = $_FILES['apple_notes_file'];
    $fileExtension = strtolower(pathinfo($uploadedFile['name'], PATHINFO_EXTENSION));

    if ($fileExtension !== 'csv') {
        header("Location: apple_notes.php?error=" . urlencode("Invalid file type. Please upload a CSV file."));
        exit;
    }

    try {
        apple_notes_import_from_csv($uploadedFile['tmp_name']);
        header("Location: apple_notes.php?Message=" . urlencode("Apple Notes imported successfully"));
        exit;
    } catch (Exception $e) {
        header("Location: apple_notes.php?error=" . urlencode("Failed to import Apple Notes."));
        exit;
    }
}

$errorMessage = "No file uploaded or upload error occurred.";
if (isset($_FILES['apple_notes_file']['error'])) {
    $errorMessage = apple_notes_upload_error_message($_FILES['apple_notes_file']['error']);
}
header("Location: apple_notes.php?error=" . urlencode($errorMessage));
exit;
