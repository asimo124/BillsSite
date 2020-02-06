<?php
session_start();
date_default_timezone_set("America/Chicago");

function preformat2($str) {
	echo "<pre>" . print_r($str, true) . "\n</pre>";
}
function preformat($str) {
	preformat2($str);
}

function printArray($str) {
	echo "<pre>" . print_r($str, true) . "\n</pre>";
}

function logCharge($str) {

	return false;
	if (defined("CURRENT_PATH")) {

		$file_name = "log_" . date("Ymd") . ".txt";
		$file_path = CURRENT_PATH . "/logs/" . $file_name;
		$fh = fopen($file_path, 'a');
		fwrite($fh, $str . "\n\n");
		fclose($fh);
	}

}

function logCharge2($str) {

	//return false;
	//if (defined("CURRENT_PATH")) {

		$file_name = "log_" . date("Ymd") . ".txt";
		$file_path = "/usr/home/asimo124/public_html/logs/" . $file_name;
		$fh = fopen($file_path, 'a');
		fwrite($fh, print_r($str, true) . "\n\n");
		fclose($fh);
	//}

}

include "config.php";
include "UploadValidator.php";
include "QueryUtils.php";
include "SortOrderHelper.php";

try {
	$db_conn = new PDO('mysql:host='.MYSQL_SERVER.';dbname='.MYSQL_DATABASE, MYSQL_USERNAME, MYSQL_PASSWORD);
	$db_conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
	echo 'ERROR: ' . $e->getMessage() . "<br />";
	echo 'Could not establish database connection';
	exit;
}

function cleanRS($rs) {
	foreach ($rs as $index => $item) {
		for ($i = 0; $i < 200; $i++) {
			unset($item[$i]);
		}
		$rs[$index] = $item;
	}
	return $rs;
}

function execQuery($sql, $data=array()) {
	global $db_conn;

	$stmt = $db_conn->prepare($sql);
	$stmt->execute($data);
}

function getQuery($sql, $data=array()) {
	global $db_conn;

	$stmt = $db_conn->prepare($sql);
	$stmt->execute($data);
	return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function formatCurrency($amount) {

	$formatter = new NumberFormatter('en_US', NumberFormatter::CURRENCY);
	return $formatter->formatCurrency($amount, 'USD');
}

function validateTags($str) {

	if (strpos($str, "<") !== false || strpos($str, ">") !== false
		|| strpos($str, "&gt;") !== false || strpos($str, "&lt;") !== false
		|| strpos($str, "<script") !== false)
	{
		return false;
	}
	return true;
}
?>
