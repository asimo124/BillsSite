<?php

$indie_content = isset($_REQUEST['indie_content']) ? $_REQUEST['indie_content'] : "";

echo "indie_content: " . $indie_content;

if ($indie_content != "") {

	$fh = fopen("indie.txt", 'w');
	fwrite($fh, $indie_content);
	fclose($fh);
}


?>
