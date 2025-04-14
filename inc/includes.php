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

$testMode = isset($_SESSION['testMode']) ? $_SESSION['testMode'] : 0;
if (isset($changeTestMode)) {
	$testMode = $changeTestMode;
}

$mysqlDatabase = $testMode == 1 ? MYSQL_DATABASE3 : MYSQL_DATABASE;

try {
	$db_conn = new PDO('mysql:host='.MYSQL_SERVER.';dbname='.$mysqlDatabase, MYSQL_USERNAME, MYSQL_PASSWORD);
	$db_conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
	echo 'ERROR: ' . $e->getMessage() . "<br />";
	echo 'Could not establish database connection';
	exit;
}

try {
	$db_conn2 = new PDO('mysql:host='.MYSQL_SERVER.';dbname='.MYSQL_DATABASE2, MYSQL_USERNAME, MYSQL_PASSWORD);
	$db_conn2->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
	echo 'ERROR: ' . $e->getMessage() . "<br />";
	echo 'Could not establish database connection';
	exit;
}

try {
	$db_conn1 = new PDO('mysql:host='.MYSQL_SERVER.';dbname='.MYSQL_DATABASE, MYSQL_USERNAME, MYSQL_PASSWORD);
	$db_conn1->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
	echo 'ERROR: ' . $e->getMessage() . "<br />";
	echo 'Could not establish database connection';
	exit;
}

try {
	$db_conn3 = new PDO('mysql:host='.MYSQL_SERVER.';dbname='.MYSQL_DATABASE3, MYSQL_USERNAME, MYSQL_PASSWORD);
	$db_conn3->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
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

function execQuery2($sql, $data=array()) {
	global $db_conn2;

	$stmt = $db_conn2->prepare($sql);
	$stmt->execute($data);
}

function execQuery1($sql, $data=array()) {
	global $db_conn1;

	$stmt = $db_conn1->prepare($sql);
	$stmt->execute($data);
}

function execQuery3($sql, $data=array()) {
	global $db_conn3;

	$stmt = $db_conn3->prepare($sql);
	$stmt->execute($data);
}

function getQuery($sql, $data=array()) {
	global $db_conn;

	$stmt = $db_conn->prepare($sql);
	$stmt->execute($data);
	return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getQuery2($sql, $data=array()) {
	global $db_conn2;

	$stmt = $db_conn2->prepare($sql);
	$stmt->execute($data);
	return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getQuery1($sql, $data=array()) {
	global $db_conn1;

	$stmt = $db_conn1->prepare($sql);
	$stmt->execute($data);
	return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getQuery3($sql, $data=array()) {
	global $db_conn3;

	$stmt = $db_conn3->prepare($sql);
	$stmt->execute($data);
	return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function curlExec($requestMethod, $url, $data = [])
{
	switch ($requestMethod)
	{
		case "PUT":

			// Initialize cURL session
			$ch = curl_init($url);

			// Set cURL options
			curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PUT"); // Use PUT request
			if (!empyt($data)) {
				curl_setopt($ch, CURLOPT_POSTFIELDS, $data); // Attach the JSON payload

			}
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); // Return response as a string
			curl_setopt($ch, CURLOPT_HTTPHEADER, [
				'Content-Type: application/json', // Set content type to JSON
				'Content-Length: ' . strlen($data) // Set content length
			]);

			// Execute the request and get the response
			$response = curl_exec($ch);

			// Check for errors
			curl_close($ch);
			if (curl_errno($ch)) {
				echo 'Error: ' . curl_error($ch);
				die();
			} else {
				return $response;
			}
			break;
	}
}

function formatCurrency($amount) {

	return '$' . number_format($amount, 2);
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
