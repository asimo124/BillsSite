<?php
ini_set("display_errors", 1);
include "../../inc/includes.php";

/*/
if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}
//*/

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


$date_taken = isset($_REQUEST['date_taken']) ? trim($_REQUEST['date_taken']) : "";
$time_taken = isset($_REQUEST['time_taken']) ? trim($_REQUEST['time_taken']) : "";
$level = isset($_REQUEST['level']) ? intval($_REQUEST['level']) : 0;
$notes = isset($_REQUEST['notes']) ? trim($_REQUEST['notes']) : "";

$date_taken2 = date("Y/m/d H:i:s", strtotime($date_taken . " " . $time_taken));

if (strtotime($date_taken2) == 0) {
    header("Location: add.php?Message=" . urlencode("You did not enter a valid Date/Time taken.") . "&error=1");
    exit;
}

if ($level <= 0) {
    header("Location: add.php?Message=" . urlencode("Enter a number greater than 0 for Level.") . "&error=1");
    exit;
}

$sql = "INSERT INTO glu_glucose_log
        ( date_taken,  level) VALUES
        (:date_taken, :level) ";

execQuery($sql, [
    "date_taken" => $date_taken2,
    "level" => $level
]);

$lastId = $db_conn->lastInsertId();

if ($notes != "") {

    $sql = "INSERT INTO glu_log_notes 
           ( log_id,  date_entered,  note) VALUES  
           (:log_id, :date_entered, :note) ";

    execQuery($sql, [
        "log_id" => $lastId,
        "date_entered" => date("Y-m-d H:i:s"),
        "note" => $notes
    ]);
}

header("Location: index.php?Message=" . urlencode("Log has been created."));
exit;