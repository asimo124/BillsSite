<?php
ini_set("display_errors", 1);
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$item = [];
$item['stage1_start_date'] = isset($_REQUEST['stage1_start_date']) ? $_REQUEST['stage1_start_date'] : "";
$item['stage1_remaining_balance'] = isset($_REQUEST['stage1_remaining_balance']) ? $_REQUEST['stage1_remaining_balance'] : 0;
$item['stage1_min_payment_principal1'] = isset($_REQUEST['stage1_min_payment_principal1']) ? $_REQUEST['stage1_min_payment_principal1'] : 0;
$item['stage1_mom_principal'] = isset($_REQUEST['stage1_mom_principal']) ? $_REQUEST['stage1_mom_principal'] : 0;
$item['stage1_me_principal'] = isset($_REQUEST['stage1_me_principal']) ? $_REQUEST['stage1_me_principal'] : 0;
$item['stage2_start_date'] = isset($_REQUEST['stage2_start_date']) ? $_REQUEST['stage2_start_date'] : "";
$item['stage2_remaining_balance'] = isset($_REQUEST['stage2_remaining_balance']) ? $_REQUEST['stage2_remaining_balance'] : 0;
$item['stage2_min_payment_principal1'] = isset($_REQUEST['stage2_min_payment_principal1']) ? $_REQUEST['stage2_min_payment_principal1'] : 0;
$item['stage2_min_payment_principal2'] = isset($_REQUEST['stage2_min_payment_principal2']) ? $_REQUEST['stage2_min_payment_principal2'] : 0;
$item['stage2_mom_principal'] = isset($_REQUEST['stage2_mom_principal']) ? $_REQUEST['stage2_mom_principal'] : 0;
$item['stage2_me_principal'] = isset($_REQUEST['stage2_me_principal']) ? $_REQUEST['stage2_me_principal'] : 0;
$item['stage3_start_date'] = isset($_REQUEST['stage3_start_date']) ? $_REQUEST['stage3_start_date'] : "";
$item['stage3_remaining_balance'] = isset($_REQUEST['stage3_remaining_balance']) ? $_REQUEST['stage3_remaining_balance'] : 0;
$item['stage3_min_payment_principal1'] = isset($_REQUEST['stage3_min_payment_principal1']) ? $_REQUEST['stage3_min_payment_principal1'] : 0;
$item['stage3_mom_principal'] = isset($_REQUEST['stage3_mom_principal']) ? $_REQUEST['stage3_mom_principal'] : 0;
$item['stage3_me_principal'] = isset($_REQUEST['stage3_me_principal']) ? $_REQUEST['stage3_me_principal'] : 0;
$item['entrydate'] = date("Y-m-d H:i:s");

$sql = "INSERT INTO dp_snapshot 
(stage1_start_date,  stage1_remaining_balance,  stage1_min_payment_principal1,  stage1_mom_principal,  
    stage1_me_principal,  stage2_start_date,  stage2_remaining_balance,  stage2_min_payment_principal1,  
 stage2_min_payment_principal2,  stage2_mom_principal,  stage2_me_principal,  stage3_start_date,  
    stage3_remaining_balance,  stage3_min_payment_principal1,  stage3_mom_principal,  stage3_me_principal, entrydate
) VALUES 
(:stage1_start_date, :stage1_remaining_balance, :stage1_min_payment_principal1, :stage1_mom_principal, 
    :stage1_me_principal, :stage2_start_date, :stage2_remaining_balance, :stage2_min_payment_principal1, 
 :stage2_min_payment_principal2, :stage2_mom_principal, :stage2_me_principal, :stage3_start_date, 
    :stage3_remaining_balance, :stage3_min_payment_principal1, :stage3_mom_principal, :stage3_me_principal, :entrydate)";

execQuery($sql, $item);

execQuery("
UPDATE dp_snapshot 
SET stage1_start_date = null 
WHERE stage1_start_date = '0000-00-00 00:00:00';");

execQuery("
UPDATE dp_snapshot 
SET stage2_start_date = null 
WHERE stage2_start_date = '0000-00-00 00:00:00';");

execQuery("
UPDATE dp_snapshot 
SET stage3_start_date = null 
WHERE stage3_start_date = '0000-00-00 00:00:00';");

header("Location: debt_progress.php?Message=" . urlencode("Snapshot has been created."));
exit;