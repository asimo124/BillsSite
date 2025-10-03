<?php

class IpPayPeriodItem {
    
    public function __construct() {
        
    }

    public function insertPayPeriodItem($payPeriodDate, $disposableAmount)
    {
        global $db_conn;

        $sql = "SELECT id
                FROM ip_pay_period 
                WHERE pay_period_date = :pay_period_date ";

        $payPeriod = getQuerySingle($sql, [':pay_period_date' => $payPeriodDate]);

        if (!$payPeriod) {
            return;
        }

        $sql = "SELECT * 
                FROM ip_pay_period_item ppi
                WHERE 1 
                AND ppi.pay_period_id = :pay_period_id ";

        $result = getQuerySingle($sql, [':pay_period_id' => $payPeriod['id']]);

        if (!$result) {
            $sql = "INSERT INTO ip_pay_period_item 
            ( pay_period_id,  disposable_amount,  remaining_amount) VALUES 
            (:pay_period_id, :disposable_amount, :remaining_amount) ";

            execQuery($sql, [
                ':pay_period_id' => $payPeriod['id'],
                ':disposable_amount' => $disposableAmount,
                ':remaining_amount' => $disposableAmount
            ]);
        }
    }
} 