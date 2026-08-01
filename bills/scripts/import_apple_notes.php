<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

$fileName = "apple_notes_export.csv";
$filePath = "data/$fileName";

$file = fopen($filePath, "r");

// Skip header row
fgetcsv($file);

$sql = "INSERT INTO apple_notes
(id_str, `name`, folder, account, creation_date, modification_date, body, to_delete) VALUES
(?, ?, ?, ?, ?, ?, ?, ?)";

$stmt_ins_notes = $db_conn->prepare($sql);

while (($row = fgetcsv($file)) !== FALSE) {
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

fclose($file);