<?php

$rap_content = isset($_REQUEST['rap_content']) ? $_REQUEST['rap_content'] : "";

if ($rap_content != "") {

	$fh = fopen("rap.txt", 'w');
	fwrite($fh, $rap_content);
	fclose($fh);
}


?>