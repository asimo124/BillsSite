<?php
include "../inc/includes.php";

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    if (empty($_REQUEST['code'])) {
        $file = array();
        foreach ($_FILES as $getFile) {
            $file = $getFile;
            break;
        }
        if (UploadValidator::fileUploaded($file)) {
            if (!UploadValidator::validateImage($file)) {
                die("The file you uploaded is too big. Please try again.");
            }
            $retVal = UploadValidator::checkExtWhiteList($file, [
                ".txt",
                ".html",
                ".htm"
            ]);
            if (!$retVal) {
                die("Please upload either a .txt file or an .html file. Try again.");
            }
            $date = intval(date("d"));
            if ($date < 15) {
                $date = "01";
            } else {
                $date = "15";
            }
            $file_name = "charge_" . date("Ym" . $date) . ".txt";
            $newPath = dirname(__FILE__) . "/../../charges/" . $file_name;
            if (!move_uploaded_file($file['tmp_name'], $newPath)) {
                die("Unable to upload file. Please try again");
            }
            echo "File Uploaded.";
        }
    }
}
?>