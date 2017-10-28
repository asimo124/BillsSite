<?php
include "../../inc/includes.php";

exit;

/*/
if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}
//*/

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;

$notes = isset($_REQUEST['notes']) ? ($_REQUEST['notes']) : "";

/*/
if ($vnd_bill == "" || $amount <= 0) {
    header("Location: edit.php?id=" . $id . "&Message=" . urlencode("You did not fill in all the required fields.") . "&error=1");
    exit;
}
//*/

$sql = "UPDATE glu_glucose_log
        SET notes = :notes
        WHERE id = :id ";

execQuery($sql, [
    "notes" => $notes,
    "id" => $id
]);

$lastId = $db_conn->lastInsertId();

header("Location: index.php?Message=" . urlencode("Log has been updated."));
exit;