<?php
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
$action = isset($_REQUEST['action']) ? $_REQUEST['action'] : "";

if ($action == "mark") {

    $sql = "UPDATE vnd_bills SET is_heavy = 1 WHERE vnd_id = :id ";
    execQuery($sql, [
        "id" => $id
    ]);

} else {

    $sql = "UPDATE vnd_bills SET is_heavy = 0 WHERE vnd_id = :id ";
    execQuery($sql, [
        "id" => $id
    ]);
}

header("Location: index.php?Message=" . urlencode("Bill has been updated."));
exit;