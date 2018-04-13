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

    $desc = isset($_REQUEST['desc']) ? trim($_REQUEST['desc']) : "";
    $category_id = isset($_REQUEST['category_id']) ? intval($_REQUEST['category_id']) : 0;
    $min_range = isset($_REQUEST['min_range']) ? floatval($_REQUEST['min_range']) : 0;
    $max_range = isset($_REQUEST['max_range']) ? floatval($_REQUEST['max_range']) : 0;

    if ($desc == "" || $category_id < 1) {
        header("Location: categorize.php?Message=" . urlencode("You did not fill in all the required fields.") . "&error=1");
        exit;
    }

    $sql = "SELECT id
            FROM vnd_bills_charge_description_categories
            WHERE `desc` = :desc
            AND category_id = :category_id
            AND min_range = :min_range
            AND max_range = :max_range
            LIMIT 1 ";
    $HasRecord = getQuery($sql, [
        "desc" => $desc,
        "category_id" => $category_id,
        "min_range" => $min_range,
        "max_range" => $max_range
    ]);
    if (count($HasRecord) > 0) {
        $id = $HasRecord[0]['id'];

        $sql = "UPDATE vnd_bills_charge_description_categories
                SET category_id = :category_id
                WHERE id = :id ";
        execQuery($sql, [
            "category_id" => $category_id,
            "id" => $id
        ]);

    } else {

        $sql = "INSERT INTO vnd_bills_charge_description_categories 
                (`desc`, category_id,  min_range,  max_range) VALUES 
                (:desc, :category_id, :min_range, :max_range) ";
        execQuery($sql, [
            "desc" => $desc,
            "category_id" => $category_id,
            "min_range" => $min_range,
            "max_range" => $max_range
        ]);
        $id = $db_conn->lastInsertId();
    }

    $get_desc = '%' . $desc . '%';

    $dataParams = [
        "category_id" => $category_id,
        "description" => $get_desc
    ];
    $sql = "UPDATE vnd_bills_charges
            SET category_id = :category_id
            WHERE description LIKE :description
            AND ifnull(category_id, '') = '' ";

    if ($max_range > 0) {
        $sql .= "AND ABS(charge) BETWEEN :min_range AND :max_range ";
        $dataParams['min_range'] = $min_range;
        $dataParams['max_range'] = $max_range;
    }
    /*/
    preformat($sql);
    preformat($dataParams);
    die;
    //*/
    execQuery($sql, $dataParams);

    header("Location: categorize.php?Message=" . urlencode("Charges updated."));
    exit;

} else {
    die("You do not have access to this page.");
}
?>