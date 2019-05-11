<?php
define(CURRENT_PATH, dirname(__FILE__));
ini_set("display_errors", 1);
include "../inc/includes.php";

$days_range = 2;

$hash_key_token_cs  = isset($_REQUEST['hash_key_token_cs']) ? ($_REQUEST['hash_key_token_cs']) : "";

$ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$ipArr = explode(".", $ip);
$userAgentArr = explode(" ", $user_agent);
$string_to_hash = $ip[1] . SALT2 . $userAgentArr[2] . SALT1 . $ip[3] . $userAgentArr[0];
$hash_key = md5($string_to_hash);

if ($hash_key_token_cs != $hash_key) {
    //echo "You do not have access to this page. Please contact Site Admin.";
    //die;
}

//if ($_SERVER['REQUEST_METHOD'] == "POST") {

    if (empty($_REQUEST['code'])) {
        die("You did not paste any code");
        /*/
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
        //*/
    } else {

        $content = isset($_REQUEST['code']) ? $_REQUEST['code'] : "";
        /*/
        if (!validateTags($content)) {
            die("You have entered invalid content. Please re-enter");
        }
        $content = strip_tags($content);
        //*/
    }

    //logCharge2("content: ");
    //logCharge2($content);
    /*/ 
    if (!isset($_REQUEST['sora_regt_est'])) {
        logCharge2("not set sora");
    } else {
        logCharge2("sora_regt_est: " . $_REQUEST['sora_regt_est']);
    }
    //*/

    if (!isset($_REQUEST['sora_regt_est']) || $_REQUEST['sora_regt_est'] != "4920UGIRU@#%$!#@") {
        die("You do not have access to this page.");
        exit;    
    }


    $contentArr = preg_split('/accountTransactions.[^\>]{0,50}>/', $content);

    $content2 = "";
    if (count($contentArr) > 1) {
        $content2 = $contentArr[1];
    }


    $contentArr2 = explode("</table>", $content2);


    $content3 = "";
    if (count($contentArr2) > 0) {
        $content3 = $contentArr2[0];
    }
    $content = '<!doctype html><html lang="en"><head><meta charset="UTF-8"><title>Document</title></head><body><div id="accountTransactions" >' . $content3 . '</table></div></body></html>';

    //logCharge2("content at 2: ");
    //logCharge2($content);

    $doc = new DOMDocument();

    $config = array(
        'clean' => 'yes',
        'output-html' => 'yes',
    );
    $tidy = tidy_parse_string($content, $config, 'utf8');
    $tidy->cleanRepair();
    $tidy = $content;

    $is_desktop = isset($_REQUEST['desktop']);

    @$doc->loadHTML($tidy);
    $doc->preserveWhiteSpace = false;
    $accountDiv = $doc->getElementsByTagname('div')->item(0);
    $children = $accountDiv->childNodes;
    $contentText = $accountDiv->nodeValue;

    //logCharge2("contentText: ");
    //logCharge2($contentText);

    //preformat($contentText);

    $contentTextArr2 = preg_split("/[0-9]{2}\/[0-9]{2}\/[0-9]{4}/", $contentText);
    $contentTextArr = [];

    //logCharge2("contentTextArr2: ");
    //logCharge2($contentTextArr2);



    //preformat($contentTextArr2);

    foreach ($contentTextArr2 as $index => $getItem) {
        $itemArr = preg_split("/[\n]{1,2}/", $getItem);
        $itemArr2 = [];
        $i = 0;
        foreach ($itemArr as $index2 => $getCol) {
            if (trim($getCol) != "") {
                if ($i == 0) {
                    if ($is_desktop) {
                        $getCol = substr(trim($getCol), 0, strlen(trim($getCol))) . "/" . date("Y");
                    } else {
                        $getCol .= "/" . date("Y");
                    }
                }
                $itemArr2[] = trim($getCol);
                $i++;
            }
        }
        $contentTextArr[] = $itemArr2;
    }

    //logCharge2($contentTextArr);

    $sql = "DELETE FROM vnd_bills_charges";
    execQuery($sql, []);

    foreach ($contentTextArr as $index => $getItem) {

        if ($index > 0) {

            if ($is_desktop) {

                $date = $getItem[0];
                $desc = $getItem[1];

                $amount = floatval(strip_tags(str_replace("$", "", $getItem[2])));

                if ($amount < 0) {
                    $charge = abs($amount);
                    $credit = 0;
                } else {
                    $credit = $amount;
                    $charge = 0;
                }

                //$charge = $getItem[2];
                //$credit = $getItem[4];
            } else {
                
                $date = $getItem[0];
                $desc = $getItem[1];
                $charge = $getItem[2];
                $credit = $getItem[3];

            }

            $charge = str_replace("$", "", $charge);
            $charge = str_replace(",", "", $charge);
            $credit = str_replace("$", "", $credit);
            $credit = str_replace(",", "", $credit);

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

                    $id = $db_conn->lastInsertId();
                    
                }
            }
        }
    }

    $sql = "UPDATE vnd_bills_charges bc 
            INNER JOIN vnd_bills_charge_description_categories dc 
            SET bc.category_id = dc.category_id 
            WHERE bc.description LIKE CONCAT('%', dc.`desc`, '%')
            AND (ABS(bc.charge) BETWEEN dc.min_range AND dc.max_range
              OR dc.max_range = 0) ";
    execQuery($sql);

    die("success");
    header("Location: upload.php?Message=" . urlencode("Charge uploaded."));
    exit;

//} else {
    //die("You do not have access to this page.");
//}
?>
