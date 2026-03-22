<?php
ini_set("display_errors", 1);
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$foodId = isset($_REQUEST['food_id']) ? intval($_REQUEST['food_id']) : 0;

if ($foodId) {
    execQuery("DELETE FROM dl_food WHERE id = :food_id", [
        "food_id" => $foodId
    ]);
    header("Location: /bills/dietlog/index.php?Message=Food item deleted successfully");
    exit;
}