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
    
    // Move uploaded file to destination
    if (move_uploaded_file($tempPath, $destinationPath)) {

        $sql = "SELECT id FROM dt_transaction_category WHERE title = ?";
        $stmt_sel_trans_cat = $db_conn->prepare($sql);

        $sql = "INSERT INTO dt_transaction_category (title) VALUES (?)";
        $stmt_ins_trans_cat = $db_conn->prepare($sql);

        $sql = "SELECT id FROM dt_transaction WHERE 1
                AND transaction_date = ? 
                AND amount = ?  
                AND `description` = ? LIMIT 1 ";
        $stmt_sel_transaction = $db_conn->prepare($sql);

        $sql = "INSERT INTO dt_transaction 
        (transaction_date, account_type, account_name, account_number, institution_name, `name`, amount, 
            `description`, transaction_category_id, is_covered, paycheck_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 0, ?)";
        $stmt_ins_transaction = $db_conn->prepare($sql);


        $rows = [];
        $keys = [];
        $i = 0;
        $fh = fopen($destinationPath, 'r');;
        while ($row = fgetcsv($fh)) {

            $rows[] = $row;

        }
        fclose($fh);

        $csvItemsUniqueArr = [];
        $keys = [];
        $i = 0;
        foreach ($rows as $row) {

            if ($i == 0) {
                $keys = $row;
                $i++;
                continue;
            }

            $csvItem = [];
            foreach ($row as $index => $value) {
                $field = trim($keys[$index]);
                $csvItem[$field] = $value;
            }

            $date = $csvItem['Date'];
            $amount = $csvItem['Amount'];
            $description = $csvItem['Description'];

            if (!isset($csvItemsUniqueArr[$date . '{}|' . $amount . '{}|' . $description])) {
                $csvItemsUniqueArr[$date . '{}|' . $amount . '{}|' . $description] = $csvItem;
            }

            $i++;
        }

        $keys = [];
        $i = 0;
        foreach ($rows as $row) {

            if ($i == 0) {
                $keys = $row;
                $i++;
                continue;
            }

            $csvItem = [];
            foreach ($row as $index => $value) {
                $field = trim($keys[$index]);
                $csvItem[$field] = $value;
            }

            $desc = trim($csvItem['Description']);
            $desc = preg_replace("/[\r\n\t]/", "", $desc);

            $desc = str_replace("$", "", $desc);

            $data['transaction_date'] = $csvItem['Date'];
            $data['account_type'] = $csvItem['Account Type'];
            $data['account_name'] = $csvItem['Account Name'];
            $data['account_number'] = $csvItem['Account Number'];
            $data['institution_name'] = $csvItem['Institution Name'];
            $data['name '] = trim(str_replace("$", "", $csvItem['Name']));
            $data['amount'] = $csvItem['Amount'];
            $data['description'] = $desc;

            $transactionDate = "";
            $transactionDay = intval(date("d", strtotime($csvItem['Date'])));
            if ($transactionDay < 15) {
                $transactionDate = date("Y-m-01", strtotime($csvItem['Date']));
            } else {
                $transactionDate = date("Y-m-15", strtotime($csvItem['Date']));
            }

            $data['paycheck_date'] = $transactionDate;

            $sql = "SELECT id FROM dt_transaction_category WHERE title = ?";
            $stmt_sel_trans_cat->execute([$csvItem['Category']]);

            $category = $stmt_sel_trans_cat->fetch(PDO::FETCH_ASSOC);

            $transactionCategoryId = 0;
            if ($category) {
                $transactionCategoryId = $category['id'];
            } else {

                $sql = "INSERT INTO dt_transaction_category (title) VALUES (?)";
                $stmt_ins_trans_cat->execute([$csvItem['Category']]);
                $transactionCategoryId = $db_conn->lastInsertId();
            }
            $data['transaction_category_id'] = $transactionCategoryId;

            $sql = "SELECT id FROM dt_transaction WHERE 1
                AND transaction_date = ? 
                AND amount = ?  
                AND `description` = ? 
                LIMIT 1 ";

            $stmt_sel_transaction->execute([
                $data['transaction_date'],
                $data['amount'],
                $data['description']
            ]);

            $hasTransaction = $stmt_sel_transaction->fetch(PDO::FETCH_ASSOC);

            if ($hasTransaction) {
                // Skip inserting duplicate transaction
                $i++;
                continue;
            }

            $sql = "INSERT INTO dt_transaction 
            (transaction_date, account_type, account_name, account_number, institution_name, `name`, amount, 
            `description`, transaction_category_id, is_covered, paycheck_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 0, ?)";
            $stmt_ins_transaction->execute([
                $data['transaction_date'],
                $data['account_type'],
                $data['account_name'],
                $data['account_number'],
                $data['institution_name'],
                $data['name '],
                $data['amount'],
                $data['description'],
                $data['transaction_category_id'],
                $data['paycheck_date']
            ]);

            $i++;
        }

        header("Location: disposable_income_tracker.php?Message=" . urlencode("File uploaded successfully: " . $newFileName));
        exit;
    } else {
        header("Location: disposable_income_tracker.php?error=" . urlencode("Failed to save uploaded file."));
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