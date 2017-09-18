<?php

$content = file_get_contents("http://alexhawley.info/bills/index.php");

$fh = fopen("test2.txt", 'w');
fwrite($content);
fclose($fh);
echo "Script completed \n";

?>
