<?php
include "../inc/includes.php";

$pay_date = isset($_REQUEST['pay_date']) ? trim($_REQUEST['pay_date']) : "";
$numDays = isset($_REQUEST['num_days']) ? intval($_REQUEST['num_days']) : 1;

$monthNum = intval(date("m", strtotime($pay_date)));
$day = intval(date("d", strtotime($pay_date)));
$payPeriodNum = ($day < 16) ? 1 : 2;

header("Access-Control-Allow-Origin: *");
header("Content-type: text/json");
if ($monthNum && $day && $payPeriodNum) {

    $sql = "SELECT vnd_id
            FROM vnd_pay_period_days 
            WHERE month_num = :month_num
            AND pay_period_num = :pay_period_num 
            LIMIT 1";
    $data = array();
    $data['month_num'] = $monthNum;
    $data['pay_period_num'] = $payPeriodNum;
    $sth = $db_conn->prepare($sql);

    $sth->execute($data);


    $HasNumDays = $sth->fetch(2);
    if ($HasNumDays) {

        $sql = "UPDATE vnd_pay_period_days SET num_days = :num_days WHERE vnd_id = :vnd_id ";
        execQuery($sql, [
            "num_days" => $numDays,
            "vnd_id" => $HasNumDays['vnd_id']
        ]);

    } else {

        $sql = "INSERT INTO vnd_pay_period_days 
                ( month_num,  pay_period_num,  num_days) VALUES 
                (:month_num, :pay_period_num, :num_days) ";
        execQuery($sql, [
            "month_num" => $monthNum,
            "pay_period_num" => $payPeriodNum,
            "num_days" => $numDays
        ]);
    }
    echo json_encode([
        "results" => [
            "status" => "success"
        ]
    ]);

} else {

    echo json_encode([
        "results" => [
            "status" => "error"
        ]
    ]);
}
?>