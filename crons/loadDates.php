<?php
ini_set("display_errors", 1);
$path_file = dirname(__FILE__);

	// Check if running from CLI and get test_mode parameter
$test_mode = 0; // Default value
if (php_sapi_name() === 'cli') {
	// Running from command line
	if (isset($argv[1])) {
		$test_mode = intval($argv[1]);
	}
}

require_once($path_file . "/../inc/includes.php");
require_once($path_file . "/../inc/Bills.php");

$numReps = 50;
$user_id = 1;
	
$Bill = new Bills($numReps);
$Bill->deleteOldDates();
$Bill->setPayPeriod("");
$Bill->generateBillDatesByUserID($user_id);

echo "script completed. <a href='javascript:void(0);' onclick='window.history.back();' >Back</a>\n";
	
?>
