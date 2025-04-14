<?php
	ini_set("display_errors", 1);
	include "../inc/includes.php";
	include "../inc/Bills.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$hash_key_token_cs  = isset($_REQUEST['hash_key_token_cs']) ? ($_REQUEST['hash_key_token_cs']) : "";

$ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$ipArr = explode(".", $ip);
$userAgentArr = explode(" ", $user_agent);
$string_to_hash = $ip[1] . SALT2 . $userAgentArr[2] . SALT1 . $ip[3] . $userAgentArr[0];
$hash_key = md5($string_to_hash);

if ($hash_key_token_cs != $hash_key) {
	//echo "You do not have access to this page. Please contact Site Admin.";
	//die;
}

$turnOn = isset($_REQUEST['turnOn']) ? 1 : 0;
$turnOff = isset($_REQUEST['turnOff']) ? 1 : 0;
$resetDb = isset($_REQUEST['resetDb']) ? 1 : 0;
if ($turnOn) {
    $_SESSION['testMode'] = 1;
}
if ($turnOff) {
    $_SESSION['testMode'] = 0;
}

if ($resetDb) {

    execQuery3("TRUNCATE vnd_bills");

    $sql = "INSERT INTO vnd_bills 
    (vnd_user_id,  vnd_bill,  amount,  vnd_is_auto,  vnd_frequency_notes,  vnd_frequency,  vnd_frequency_type,  
        vnd_frequency_value,   vnd_entrydate,  vnd_entryip,  multiplier,  is_future,  is_heavy,  watch_flag,  end_date,  
     vnd_frequency_value_original,   audit_regex,  audit_keyword1,  audit_keyword2) VALUES 
    (:vnd_user_id, :vnd_bill, :amount, :vnd_is_auto, :vnd_frequency_notes, :vnd_frequency, :vnd_frequency_type, 
        :vnd_frequency_value, :vnd_entrydate, :vnd_entryip, :multiplier, :is_future, :is_heavy, :watch_flag, :end_date, 
     :vnd_frequency_value_original, :audit_regex, :audit_keyword1, :audit_keyword2) ";
    $stmt_insert_bills = $db_conn3->prepare($sql);

    $sql = "SELECT * FROM vnd_bills ORDER BY vnd_id ";
    $results = getQuery1($sql);
    foreach ($results as $getItem) {

        $sql = "INSERT INTO vnd_bills 
    (vnd_user_id,  vnd_bill,  amount,  vnd_is_auto,  vnd_frequency_notes,  vnd_frequency,  vnd_frequency_type,  
        vnd_frequency_value,   vnd_entrydate,  vnd_entryip,  multiplier,  is_future,  is_heavy,  watch_flag,  end_date,  
     vnd_frequency_value_original,   audit_regex,  audit_keyword1,  audit_keyword2) VALUES 
    (:vnd_user_id, :vnd_bill, :amount, :vnd_is_auto, :vnd_frequency_notes, :vnd_frequency, :vnd_frequency_type, 
        :vnd_frequency_value, :vnd_entrydate, :vnd_entryip, :multiplier, :is_future, :is_heavy, :watch_flag, :end_date, 
     :vnd_frequency_value_original, :audit_regex, :audit_keyword1, :audit_keyword2) ";

        $stmt_insert_bills->execute([
            'vnd_user_id' => $getItem['vnd_user_id'],
            'vnd_bill' => $getItem['vnd_bill'],
            'amount' => $getItem['amount'],
            'vnd_is_auto' => $getItem['vnd_is_auto'],
            'vnd_frequency_notes' => $getItem['vnd_frequency_notes'],
            'vnd_frequency' => $getItem['vnd_frequency'],
            'vnd_frequency_type' => $getItem['vnd_frequency_type'],
            'vnd_frequency_value' => $getItem['vnd_frequency_value'],

            'vnd_entrydate' => $getItem['vnd_entrydate'],
            'vnd_entryip' => $getItem['vnd_entryip'],
            'multiplier' => $getItem['multiplier'],
            'is_future' => $getItem['is_future'],
            'is_heavy' => $getItem['is_heavy'],
            'watch_flag' => $getItem['watch_flag'],
            'end_date' => $getItem['end_date'],
            'vnd_frequency_value_original' => $getItem['vnd_frequency_value_original'],
            'audit_regex' => $getItem['audit_regex'],
            'audit_keyword1' => $getItem['audit_keyword1'],
            'audit_keyword2' => $getItem['audit_keyword2']
        ]);
    }

    execQuery3("UPDATE vnd_bills SET end_date = null WHERE end_date = '0000-00-00 00:00:00';");
}

header("Location: index.php?Message=" . urlencode("You have added updated your settings."));
exit;
?>