<?php
	ini_set("display_errors", 1);
	include "../inc/includes.php";
	include "../inc/Bills.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$target_dir = "../data/audit/";
if (!is_dir($target_dir)) {
    mkdir($target_dir, 0775, true);
}

print_r($_FILES);
die();

$target_file = $target_dir . basename($_FILES["chaseFile"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));


if(isset($_POST["submit"])) {

    $tempFileName = $_FILES["chaseFile"]["tmp_name"];
    $fh = fopen($tempFileName, 'r');

    while (($line = fgets($fh)) !== false) {
        $lineArr = explode("\t", $line);
        print_r($lineArr);
    }
}

$content = isset($_REQUEST['content']) ? $_REQUEST['content'] : '';
$content = trim($content);
if ($content) {

    $contentLines = preg_split("/\r\n|\n|\r/", $content);
    foreach ($contentLines as $line) {

        $lineArr = explode("\t", $line);
        print_r($lineArr);

    }
}
//*/
die();
//*/

header("Location: index.php?Message=" . urlencode("You have submitted the chase copied content."));
exit;
?>