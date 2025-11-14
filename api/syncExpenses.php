<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;
include "../inc/Bills.php";
include "../inc/IpPayPeriod.php";
include "../inc/IpPayPeriodItem.php";
include "../inc/BillDateHelper.php";
include "../inc/includes.php";
//ini_set("display_errors", 1);

$sql = "SELECT vnd_id
        FROM vnd_bills b
        WHERE 1 ";

$oldExpenses = getQuery($sql);

$sql = "DELETE FROM vnd_bills WHERE vnd_id = :id ";
$stmt_del_expense = $db_conn->prepare($sql);

if ($oldExpenses) {
    $idsToDelete = [];
    foreach ($oldExpenses as $oldExpense) {

        /*/
        $sql = "DELETE FROM vnd_bills WHERE vnd_id = :id ";
        $stmt_del_expense->execute([
            ':id' => $oldExpense['vnd_id']
        ]);
        //*/
    }
}

$sql = "SELECT pp.id as pay_period_id 
        , pp.pay_period_date
        , up.id as upcoming_purchase_id
        , up.title as upcoming_purchase
        , up.description as `description`
        , up.cost as cost
        FROM ip_pay_period_item ppi 
        INNER JOIN ip_pay_period pp 
            ON ppi.pay_period_id = pp.id 
        INNER JOIN ip_upcoming_purchase up 
            ON ppi.id = up.pay_period_item_id
        WHERE 1 
        ORDER BY pp.pay_period_date; ";

$results = getQuery($sql);

$query = "INSERT INTO vnd_bills 
( vnd_user_id,  vnd_bill,  vnd_frequency_value,  amount,  vnd_is_auto,  
     vnd_frequency,  vnd_frequency_type,  vnd_entrydate,  multiplier,  is_future,  upcoming_purchase_id,  pay_period_id) VALUES 
(:vnd_user_id, :vnd_bill, :vnd_frequency_value, :amount, :vnd_is_auto, 
    :vnd_frequency, :vnd_frequency_type, :vnd_entrydate, :multiplier, :is_future, :upcoming_purchase_id, :pay_period_id) ";
$stmt_ins_expense = $db_conn->prepare($query);

$sql = "SELECT vnd_id
        FROM vnd_bills 
        WHERE 1 
        AND upcoming_purchase_id = :upcoming_purchase_id ";
$stmt_check_expense = $db_conn->prepare($sql);

foreach ($results as $index => $getItem) { 

    $payPeriodDate = $getItem['pay_period_date'];
    if (intval(date("d", strtotime($payPeriodDate))) < 15) {
        $frequencyTypeValue = date("Y-m-14", strtotime($payPeriodDate));
    } else {
        $frequencyTypeValue = date("Y-m-27", strtotime($payPeriodDate));
    }
    

    $query = "INSERT INTO vnd_bills 
    ( vnd_user_id,  vnd_bill,  vnd_frequency_value,  amount,  vnd_is_auto,  
        vnd_frequency,  vnd_frequency_type,  vnd_entrydate,  multiplier,  is_future,  pay_period_id) VALUES 
    (:vnd_user_id, :vnd_bill, :vnd_frequency_value, :amount, :vnd_is_auto, 
        :vnd_frequency, :vnd_frequency_type, :vnd_entrydate, :multiplier, :is_future, :pay_period_id) ";

    $data = array();
    $data['vnd_user_id'] = 1;
    $data['vnd_bill'] = $getItem['upcoming_purchase'];
    $data['vnd_frequency_value'] = $frequencyTypeValue;
    $data['amount'] = $getItem['cost'];
    $data['vnd_is_auto'] = 0;
    $data['vnd_frequency'] = "Once";
    $data['vnd_frequency_type'] = "Once";
    $data['vnd_entrydate'] = date("Y-m-d H:i:s");
    $data['multiplier'] = 1;
    $data['is_future'] = 1;
    $data['pay_period_id'] = $getItem['pay_period_id'];

    $stmt_ins_expense->execute($data);
}

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'success' => true,
    'error' => null
], JSON_PRETTY_PRINT);
die();
?>