<?php
define(CURRENT_PATH, dirname(__FILE__));
ini_set("display_errors", 1);
include "../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$days_range = 2;

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

if ($_SERVER['REQUEST_METHOD'] == "POST") {

    $all_cats = isset($_REQUEST['category_id']) ? $_REQUEST['category_id'] : array();
    $all_ids = isset($_REQUEST['id']) ? $_REQUEST['id'] : array();

    if (count($all_cats) == 0 || count($all_ids) == 0) {
        echo("You did not fill in all the required fields.");
        exit;
    }

    foreach ($all_cats as $i => $category_id) {

        $id = $all_ids[$i];

        $sql = "UPDATE vnd_bills_charges
                SET category_id = :category_id
                WHERE id = :id ";
        execQuery($sql, [
            "category_id" => $category_id,
            "id" => $id
        ]);
    }

    echo "Success";

    //header("Location: categorize.php?Message=" . urlencode("Charges updated."));
    //exit;

} else {
    die("You do not have access to this page.");
}
?>