<?php

function disposable_validate_uploaded_csv($uploadedFile) {
    if (!isset($uploadedFile['error']) || $uploadedFile['error'] !== UPLOAD_ERR_OK) {
        $errorMessage = 'No file uploaded or upload error occurred.';
        if (isset($uploadedFile['error'])) {
            switch ($uploadedFile['error']) {
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
        return array('ok' => false, 'message' => $errorMessage);
    }

    $fileExtension = strtolower(pathinfo($uploadedFile['name'], PATHINFO_EXTENSION));
    if (!in_array($fileExtension, array('csv'), true)) {
        return array('ok' => false, 'message' => 'Invalid file type. Please upload a CSV file.');
    }

    return array('ok' => true);
}

function disposable_save_uploaded_csv($uploadedFile) {
    $destinationDir = dirname(__FILE__) . '/../data/disposable_income_tracker';
    if (!is_dir($destinationDir)) {
        mkdir($destinationDir, 0755, true);
    }

    $destinationPath = $destinationDir . '/disposable_income_tracker_main.csv';
    if (!move_uploaded_file($uploadedFile['tmp_name'], $destinationPath)) {
        return array('ok' => false, 'message' => 'Failed to save uploaded file.');
    }

    return array('ok' => true, 'path' => $destinationPath);
}

function disposable_read_csv_rows($destinationPath) {
    $rows = array();
    $fh = fopen($destinationPath, 'r');
    if (!$fh) {
        return $rows;
    }
    while ($row = fgetcsv($fh)) {
        $rows[] = $row;
    }
    fclose($fh);
    return $rows;
}

function disposable_import_csv_from_path($db_conn, $destinationPath) {
    $sql = 'SELECT id FROM dt_transaction_category WHERE title = ?';
    $stmt_sel_trans_cat = $db_conn->prepare($sql);

    $sql = 'INSERT INTO dt_transaction_category (title) VALUES (?)';
    $stmt_ins_trans_cat = $db_conn->prepare($sql);

    $sql = 'SELECT id FROM dt_transaction WHERE 1
            AND transaction_date = ?
            AND amount = ?
            AND `description` = ? LIMIT 1 ';
    $stmt_sel_transaction = $db_conn->prepare($sql);

    $sql = 'INSERT INTO dt_transaction
        (transaction_date, account_type, account_name, account_number, institution_name, `name`, amount,
            `description`, transaction_category_id, is_covered, paycheck_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 0, ?)';
    $stmt_ins_transaction = $db_conn->prepare($sql);

    $rows = disposable_read_csv_rows($destinationPath);
    $imported = 0;
    $skipped = 0;
    $keys = array();
    $i = 0;

    foreach ($rows as $row) {
        if ($i == 0) {
            $keys = $row;
            $i++;
            continue;
        }

        $csvItem = array();
        foreach ($row as $index => $value) {
            $field = trim($keys[$index]);
            $csvItem[$field] = $value;
        }

        $desc = trim($csvItem['Description']);
        $desc = preg_replace('/[\r\n\t]/', '', $desc);
        $desc = str_replace('$', '', $desc);

        $data = array(
            'transaction_date' => $csvItem['Date'],
            'account_type' => $csvItem['Account Type'],
            'account_name' => $csvItem['Account Name'],
            'account_number' => $csvItem['Account Number'],
            'institution_name' => $csvItem['Institution Name'],
            'name' => trim(str_replace('$', '', $csvItem['Name'])),
            'amount' => $csvItem['Amount'],
            'description' => $desc,
        );

        $transactionDay = intval(date('d', strtotime($csvItem['Date'])));
        if ($transactionDay < 15) {
            $data['paycheck_date'] = date('Y-m-01', strtotime($csvItem['Date']));
        } else {
            $data['paycheck_date'] = date('Y-m-15', strtotime($csvItem['Date']));
        }

        $stmt_sel_trans_cat->execute(array($csvItem['Category']));
        $category = $stmt_sel_trans_cat->fetch(PDO::FETCH_ASSOC);

        if ($category) {
            $transactionCategoryId = $category['id'];
        } else {
            $stmt_ins_trans_cat->execute(array($csvItem['Category']));
            $transactionCategoryId = $db_conn->lastInsertId();
        }
        $data['transaction_category_id'] = $transactionCategoryId;

        $stmt_sel_transaction->execute(array(
            $data['transaction_date'],
            $data['amount'],
            $data['description'],
        ));

        if ($stmt_sel_transaction->fetch(PDO::FETCH_ASSOC)) {
            $skipped++;
            $i++;
            continue;
        }

        $stmt_ins_transaction->execute(array(
            $data['transaction_date'],
            $data['account_type'],
            $data['account_name'],
            $data['account_number'],
            $data['institution_name'],
            $data['name'],
            $data['amount'],
            $data['description'],
            $data['transaction_category_id'],
            $data['paycheck_date'],
        ));
        $imported++;
        $i++;
    }

    return array('imported' => $imported, 'skipped' => $skipped);
}

function disposable_csv_with_paycheck_dates($destinationPath) {
    $rows = disposable_read_csv_rows($destinationPath);
    $output = fopen('php://temp', 'r+');
    $keys = array();
    $i = 0;

    foreach ($rows as $row) {
        if ($i == 0) {
            $keys = $row;
            $header = $keys;
            $header[] = 'Paycheck Date';
            fputcsv($output, $header);
            $i++;
            continue;
        }

        $csvItem = array();
        foreach ($row as $index => $value) {
            $field = trim($keys[$index]);
            $csvItem[$field] = $value;
        }

        $transactionDay = intval(date('d', strtotime($csvItem['Date'])));
        if ($transactionDay < 15) {
            $transactionDate = date('Y-m-01', strtotime($csvItem['Date']));
        } else {
            $transactionDate = date('Y-m-15', strtotime($csvItem['Date']));
        }

        $csvItem['Paycheck Date'] = $transactionDate;
        fputcsv($output, array_values($csvItem));
    }

    rewind($output);
    $csv = stream_get_contents($output);
    fclose($output);
    return $csv;
}
