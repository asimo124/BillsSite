<?php
include "../../inc/includes.php";
ini_set("display_errors", 1);

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

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;

$place_name = isset($_REQUEST['place_name']) ? trim($_REQUEST['place_name']) : "";
$google_link = isset($_REQUEST['google_link']) ? trim($_REQUEST['google_link']) : "";
$category_id = isset($_REQUEST['category_id']) ? intval($_REQUEST['category_id']) : 0;
$close_easy = isset($_REQUEST['close_easy']) ? intval($_REQUEST['close_easy']) : 0;
$sol_likes = isset($_REQUEST['sol_likes']) ? intval($_REQUEST['sol_likes']) : 0;
$alex_likes = isset($_REQUEST['alex_likes']) ? intval($_REQUEST['alex_likes']) : 0;

if (!$place_name) {
    header("Location: add.php?Message=" . urlencode("You did not enter a Restaurant Name.") . "&error=1");
    exit;
}

if ($category_id <= 0) {
    header("Location: add.php?Message=" . urlencode("You did not select a category.") . "&error=1");
    exit;
}

if ($google_link) {
    if (strpos($google_link, "https://") === false && strpos($google_link, "http://") === false) {
        header("Location: add.php?Message=" . urlencode("The google link must contain the 'https://' at the beginning.") . "&error=1");
        exit;
    }
}

$sql = "UPDATE res_places
        SET place_name = :place_name,
        google_link = :google_link,
        category_id = :category_id,
        close_easy = :close_easy,
        sol_likes = :sol_likes,
        alex_likes = :alex_likes
        WHERE id = :id ";

execQuery($sql, [
    "place_name" => $place_name,
    "google_link" => $google_link,
    "category_id" => $category_id,
    "close_easy" => $close_easy,
    "sol_likes" => $sol_likes,
    "alex_likes" => $alex_likes,
    "id" => $id
]);

header("Location: index.php?Message=" . urlencode("Restaurant has been updated."));
exit;