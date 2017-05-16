<?php

function preformat2($str) {
	echo "<pre>" . print_r($str, true) . "\n</pre>";
}

define('MYSQL_SERVER', "localhost");
define('MYSQL_DATABASE', "billmgmt_db");
define('MYSQL_USERNAME', "alex");
define('MYSQL_PASSWORD', "gortex!22");

try {
	$db_conn = new PDO('mysql:host='.MYSQL_SERVER.';dbname='.MYSQL_DATABASE, MYSQL_USERNAME, MYSQL_PASSWORD);
	$db_conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
	echo 'ERROR: ' . $e->getMessage() . "<br />";
	echo 'Could not establish database connection';
	exit;
}

?>