<?php
include "../../inc/includes.php";

exit;

$sql = "INSERT INTO glu_log_notes 
        ( log_id,  date_entered,  note) VALUES 
        (:log_id, :date_entered, :note) ";

$stmt_ins_notes = $db_conn->prepare($sql);


$sql = "SELECT * FROM glu_glucose_log WHERE ifnull(notes, '') <> '' ";
$resultset = getQuery($sql);

foreach ($resultset as $getItem) {

    $stmt_ins_notes->execute([
        "log_id" => $getItem['id'],
        "date_entered" => $getItem['date_taken'],
        "note" => $getItem['notes']
    ]);
}

echo "Script completed";