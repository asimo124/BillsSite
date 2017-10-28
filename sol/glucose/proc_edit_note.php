<?php
include "../../inc/includes.php";

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
$log_id = isset($_REQUEST['log_id']) ? intval($_REQUEST['log_id']) : 0;

$notes = isset($_REQUEST['notes']) ? trim($_REQUEST['notes']) : "";

$hash_key_token_cs  = isset($_REQUEST['hash_key_token_cs']) ? ($_REQUEST['hash_key_token_cs']) : "";

$ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$ipArr = explode(".", $ip);
$userAgentArr = explode(" ", $user_agent);
$string_to_hash = $ip[1] . SALT2 . $userAgentArr[2] . SALT1 . $ip[3] . $userAgentArr[0];
$hash_key = md5($string_to_hash);

if ($hash_key_token_cs != $hash_key) {
    echo "You do not have access to this page. Please contact Site Admin.";
    die;
}


if ($notes == "") {
    header("Location: view.php?id=" . $log_id . "&Message=" . urlencode("You did not enter a note to add.") . "&error=1");
    exit;
}


$sql = "UPDATE glu_log_notes
        SET note = :notes,
        date_entered = now()
        WHERE id = :id ";

execQuery($sql, [
    "notes" => $notes,
    "id" => $id
]);

$lastId = $db_conn->lastInsertId();

header("Location: view.php?id=" . $log_id . "&Message=" . urlencode("Log has been updated."));
exit;