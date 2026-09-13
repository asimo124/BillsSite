<?php
include "../../inc/includes.php";
include "../../inc/apple_notes.php";

$fileName = "apple_notes_export.csv";
$filePath = "data/$fileName";

apple_notes_import_from_csv($filePath);
