<?php

function preformat2($str) {
	echo "<pre>" . print_r($str, true) . "\n</pre>";
}


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

?>
