<?php

function apple_notes_tsquery($keyword)
{
    $keyword = trim((string) $keyword);
    if ($keyword === '') {
        return '';
    }

    if (!preg_match_all('/[A-Za-z0-9]+/', $keyword, $matches) || empty($matches[0])) {
        return '';
    }

    $parts = array();
    foreach ($matches[0] as $word) {
        $parts[] = $word . ':*';
    }

    return implode(' & ', $parts);
}

function apple_notes_nullable_datetime($value)
{
    $value = trim((string) $value);
    if ($value === '' || $value === '0000-00-00' || $value === '0000-00-00 00:00:00') {
        return null;
    }

    return $value;
}

function apple_notes_import_from_csv($path)
{
    global $db_conn4;

    $fh = fopen($path, 'r');
    if ($fh === false) {
        throw new RuntimeException('Failed to read CSV file.');
    }

    $rows = array();
    while (($row = fgetcsv($fh)) !== false) {
        $rows[] = $row;
    }
    fclose($fh);

    $sql = "INSERT INTO apple_notes
            (id_str, name, folder, account, creation_date, modification_date, body, to_delete, has_duplicates)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $db_conn4->prepare($sql);

    $imported = 0;
    $db_conn4->beginTransaction();
    try {
        execQuery4('TRUNCATE TABLE apple_notes RESTART IDENTITY');

        foreach ($rows as $index => $row) {
            if ($index === 0) {
                continue;
            }
            if (!is_array($row) || count($row) < 7) {
                continue;
            }

            $stmt->execute(array(
                $row[0],
                $row[1],
                $row[2],
                $row[3],
                apple_notes_nullable_datetime($row[4]),
                apple_notes_nullable_datetime($row[5]),
                $row[6],
                isset($row[7]) && $row[7] !== '' ? (int) $row[7] : 0,
                isset($row[8]) && $row[8] !== '' ? (int) $row[8] : 0,
            ));
            $imported++;
        }

        execQuery4("DELETE FROM apple_notes WHERE folder = 'Recently Deleted'");
        $db_conn4->commit();
    } catch (Exception $e) {
        if ($db_conn4->inTransaction()) {
            $db_conn4->rollBack();
        }
        throw $e;
    }

    return $imported;
}

function apple_notes_upload_error_message($code)
{
    switch ($code) {
        case UPLOAD_ERR_INI_SIZE:
        case UPLOAD_ERR_FORM_SIZE:
            return 'File is too large.';
        case UPLOAD_ERR_PARTIAL:
            return 'File upload was interrupted.';
        case UPLOAD_ERR_NO_FILE:
            return 'No file was selected for upload.';
        default:
            return 'Unknown upload error.';
    }
}

function require_apple_notes_import_token()
{
    if (!empty($GLOBALS['api_user'])) {
        return $GLOBALS['api_user'];
    }

    $expected = getenv('APPLE_NOTES_IMPORT_TOKEN') ?: '';
    $provided = function_exists('api_get_bearer_token') ? api_get_bearer_token() : '';
    if ($expected === '' || $provided === '' || !hash_equals($expected, $provided)) {
        api_json_response(array('message' => 'Unauthorized'), 401);
    }

    $user = array(
        'id' => 0,
        'username' => 'apple-notes-import',
        'fname' => '',
        'lname' => '',
        'email' => '',
    );
    $GLOBALS['api_user'] = $user;

    return $user;
}
