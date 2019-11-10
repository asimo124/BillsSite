<?php
include "../../inc/includes.php";

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
    echo "You do not have access to this page. Please contact Site Admin.";
    die;
}

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
$cat_name = isset($_REQUEST['cat_name']) ? trim($_REQUEST['cat_name']) : "";

if (!validateTags($cat_name)) {
    die("You have entered invalid content. Please re-enter");
}
$cat_name = strip_tags($cat_name);

$sql = "SELECT id
        FROM vnd_bills_charge_categories
        WHERE cat_name = :cat_name and id <> :id ";

$HasCats = getQuery($sql, [
    "cat_name" => $cat_name,
    "id" => $id
]);
if (count($HasCats) > 0) {
    header("Location: edit.php?id=" . $id . "&Message=" . urlencode("This category name already exists") . "&error=1");
    exit;
}

$sql = "UPDATE vnd_bills_charge_categories
        SET cat_name = :cat_name
        WHERE id = :id ";

execQuery($sql, [
    "cat_name" => $cat_name,
    "id" => $id
]);

$lastId = $db_conn->lastInsertId();

header("Location: index.php?Message=" . urlencode("Category has been updated."));
exit;