<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

execQuery3('TRUNCATE vnd_bills');

$sql = "INSERT INTO vnd_bills
    (vnd_user_id, vnd_bill, amount, vnd_is_auto, vnd_frequency_notes, vnd_frequency, vnd_frequency_type,
     vnd_frequency_value, vnd_entrydate, vnd_entryip, multiplier, is_future, is_heavy, watch_flag, end_date,
     vnd_frequency_value_original, audit_regex, audit_keyword1, audit_keyword2, start_date, can_be_multiplied_by)
    VALUES
    (:vnd_user_id, :vnd_bill, :amount, :vnd_is_auto, :vnd_frequency_notes, :vnd_frequency, :vnd_frequency_type,
     :vnd_frequency_value, :vnd_entrydate, :vnd_entryip, :multiplier, :is_future, :is_heavy, :watch_flag, :end_date,
     :vnd_frequency_value_original, :audit_regex, :audit_keyword1, :audit_keyword2, :start_date, :can_be_multiplied_by)";

global $db_conn3;
$stmtInsertBills = $db_conn3->prepare($sql);

$results = getQuery1('SELECT * FROM vnd_bills ORDER BY vnd_id');
if ($results) {
    foreach ($results as $getItem) {
        $stmtInsertBills->execute(array(
            'vnd_user_id' => $getItem['vnd_user_id'],
            'vnd_bill' => $getItem['vnd_bill'],
            'amount' => $getItem['amount'],
            'vnd_is_auto' => $getItem['vnd_is_auto'],
            'vnd_frequency_notes' => $getItem['vnd_frequency_notes'],
            'vnd_frequency' => $getItem['vnd_frequency'],
            'vnd_frequency_type' => $getItem['vnd_frequency_type'],
            'vnd_frequency_value' => $getItem['vnd_frequency_value'],
            'vnd_entrydate' => $getItem['vnd_entrydate'],
            'vnd_entryip' => $getItem['vnd_entryip'],
            'multiplier' => $getItem['multiplier'],
            'is_future' => $getItem['is_future'],
            'is_heavy' => $getItem['is_heavy'],
            'watch_flag' => $getItem['watch_flag'],
            'end_date' => $getItem['end_date'],
            'vnd_frequency_value_original' => $getItem['vnd_frequency_value_original'],
            'audit_regex' => $getItem['audit_regex'],
            'audit_keyword1' => $getItem['audit_keyword1'],
            'audit_keyword2' => $getItem['audit_keyword2'],
            'start_date' => $getItem['start_date'],
            'can_be_multiplied_by' => $getItem['can_be_multiplied_by'],
        ));
    }
}

execQuery3("UPDATE vnd_bills SET end_date = NULL WHERE end_date = '0000-00-00'");
execQuery3("UPDATE vnd_bills SET start_date = NULL WHERE start_date = '0000-00-00'");

execQuery3('TRUNCATE ip_pay_period');

$sql = 'INSERT INTO ip_pay_period (pay_period, pay_period_date) VALUES (:pay_period, :pay_period_date)';
$stmtInsertPayPeriod = $db_conn3->prepare($sql);

$results = getQuery1('SELECT * FROM ip_pay_period ORDER BY id');
if ($results) {
    foreach ($results as $getItem) {
        $stmtInsertPayPeriod->execute(array(
            'pay_period' => $getItem['pay_period'],
            'pay_period_date' => $getItem['pay_period_date'],
        ));
    }
}

execQuery3('TRUNCATE ip_pay_period_item');

$sql = 'INSERT INTO ip_pay_period_item (pay_period_id, disposable_amount, remaining_amount)
        VALUES (:pay_period_id, :disposable_amount, :remaining_amount)';
$stmtInsertPayPeriodItem = $db_conn3->prepare($sql);

$results = getQuery1('SELECT * FROM ip_pay_period_item ORDER BY id');
if ($results) {
    foreach ($results as $getItem) {
        $stmtInsertPayPeriodItem->execute(array(
            'pay_period_id' => $getItem['pay_period_id'],
            'disposable_amount' => $getItem['disposable_amount'],
            'remaining_amount' => $getItem['remaining_amount'],
        ));
    }
}

execQuery3('TRUNCATE ip_upcoming_purchase');

$sql = 'INSERT INTO ip_upcoming_purchase
        (pay_period_item_id, title, `description`, cost, amount_to_save, moved)
        VALUES (:pay_period_item_id, :title, :description, :cost, :amount_to_save, :moved)';
$stmtInsertUpcoming = $db_conn3->prepare($sql);

$results = getQuery1('SELECT * FROM ip_upcoming_purchase ORDER BY id');
if ($results) {
    foreach ($results as $getItem) {
        $stmtInsertUpcoming->execute(array(
            'pay_period_item_id' => $getItem['pay_period_item_id'],
            'title' => $getItem['title'],
            'description' => $getItem['description'],
            'cost' => $getItem['cost'],
            'amount_to_save' => $getItem['amount_to_save'],
            'moved' => $getItem['moved'],
        ));
    }
}

api_json_response(array(
    'success' => true,
    'message' => 'Test database has been reset from production.',
));
