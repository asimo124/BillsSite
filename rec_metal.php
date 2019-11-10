<?php

$metal_content = isset($_REQUEST['metal_content']) ? $_REQUEST['metal_content'] : "";

echo "metal_content: " . $metal_content;

if ($metal_content != "") {

	$fh = fopen("metal.txt", 'w');
	fwrite($fh, $metal_content);
	fclose($fh);
}


?>
