<?php
ini_set("display_errors", 1);
include "../inc/includes.php";

$days_range = 2;

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
            $file_path = $newPath;
            $content = file_get_contents($file_path);
        }
    } else {
        $content = isset($_REQUEST['code']) ? $_REQUEST['code'] : "";
    }
    $doc = new DOMDocument();

    /*/
    $config = array(
        'clean' => 'yes',
        'output-html' => 'yes',
    );
    $tidy = tidy_parse_string($content, $config, 'utf8');
    $tidy->cleanRepair();
    //*/
    $tidy = $content;

    $doc->loadHTML($tidy);
    $doc->preserveWhiteSpace = false;
    $accountDiv = $doc->getElementById('accountTransactions');
    $children = $accountDiv->childNodes;


    foreach ($children as $child) {
        $children2 = $child->childNodes;
        foreach ($children2 as $i => $child2) {
            if ($i == 2) {
                $children3 = $child2->childNodes;
                foreach ($children3 as $j => $child3) {
                    $date = "";
                    $desc = "";
                    $charge = "";
                    $credit = "";
                    $children4 = $child3->childNodes;
                    foreach ($children4 as $k => $child4) {
                        switch ($k)
                        {
                            case 0:
                                $date = (string)$child4->nodeValue;
                                break;
                            case 2:
                                $desc = (string)$child4->nodeValue;
                                break;
                            case 3:
                                if ($child4->nodeValue) {
                                    $charge = (string)$child4->nodeValue;
                                }
                                $charge = str_replace("$", "", $charge);
                                $charge = str_replace(",", "", $charge);
                                break;
                            case 4:
                                if ($child4->nodeValue) {
                                    $credit = (string)$child4->nodeValue;
                                }
                                $credit = str_replace("$", "", $credit);
                                $credit = str_replace(",", "", $credit);
                        }
                    }
                    if ($desc != "") {
                        if ($charge != "") {
                            $sql = "SELECT id from vnd_bills_charges
                                    WHERE date between DATE(DATE_ADD(:date, INTERVAL -$days_range DAY))
                                    AND DATE(DATE_ADD(:date, INTERVAL $days_range DAY))
                                    AND description = :desc and CAST(charge AS DECIMAL(4,2)) = CAST(:charge AS DECIMAL(4,2)) ";
                            $data = [
                                "date" => date("Y-m-d", strtotime($date)),
                                "desc" => preg_replace("/[0-9]{2}\/[0-9]{2}/", "", $desc),
                                "charge" => $charge
                            ];
                            $ins_data = $data;
                            $ins_data['credit'] = "";
                        } else if ($credit != "") {
                            $sql = "SELECT id from vnd_bills_charges
                                    WHERE date between DATE(DATE_ADD(:date, INTERVAL -$days_range DAY))
                                    AND DATE(DATE_ADD(:date, INTERVAL $days_range DAY))
                                    AND description = :desc and CAST(credit AS DECIMAL(4,2)) = CAST(:credit AS DECIMAL(4,2)) ";
                            $data = [
                                "date" => date("Y-m-d", strtotime($date)),
                                "desc" => preg_replace("/[0-9]{2}\/[0-9]{2}/", "", $desc),
                                "credit" => $credit
                            ];
                            $ins_data = $data;
                            $ins_data['charge'] = "";
                        }
                        $results = getQuery($sql, $data);
                        if (count($results) == 0) {
                            $sql = "INSERT INTO vnd_bills_charges
                                    ( date,  description, charge,  credit, entrydate) VALUES
                                    (:date, :desc,       :charge, :credit, now()) ";
                            execQuery($sql, $ins_data);
                        }
                    }
                }
            }
        }
    }

    header("Location: upload.php?Message=" . urlencode("Charge uploaded."));
} else {
    die("You do not have access to this page.");
}
?>