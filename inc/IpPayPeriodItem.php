<?php

class IpPayPeriodItem {
    
    public function __construct() {
        
    }

    public function index()
    {
        global $db_conn;

        $sql = "SELECT 
                ppi.id as pay_period_item_id 
                , ppi.pay_period_id 
                , pp.pay_period_date
                , pp.pay_period
                , ppi.disposable_amount
                , ppi.remaining_amount 
                , up.id as upcoming_purchase_id 
                , up.title as upcoming_purchase 
                , up.description as upcoming_desc
                , up.cost 
                , up.amount_to_save 
                FROM ip_pay_period_item ppi 
                INNER JOIN ip_pay_period pp 
                    ON ppi.pay_period_id = pp.id 
                LEFT JOIN ip_upcoming_purchase up 
                    oN pp.id = up.pay_period_item_id
                WHERE 1 
                ORDER BY pp.pay_period_date, ppi.id, up.id ";

        $result = getQuery($sql);

        $payPeriodsArr = [];
        foreach ($result as $index => $getItem) {
            if (!isset($payPeriodsArr[$getItem['pay_period_id']])) {
                $payPeriodsArr[$getItem['pay_period_id']] = [];
            }
            $payPeriodsArr[$getItem['pay_period_id']][] = $getItem;
        }
        
        $payPeriodResults = [];
        foreach ($payPeriodsArr as $ppId => $items) {
            
            $eachPayPeriod = [
                "id" => $items[0]['pay_period_item_id'],
                "pay_period_id" => $items[0]['pay_period_id'],
                "pay_period_date" => $items[0]['pay_period_date'],
                "pay_period" => $items[0]['pay_period'],
                "disposable_amount" => $items[0]['disposable_amount'],
                "remaining_amount" => $items[0]['remaining_amount'],
                "upcoming_purchases" => []
            ];
            
            $upcomingPurchases = [];
            foreach ($items as $item) {

                if ($item['upcoming_purchase_id'] === null) {
                    continue;
                }
                $upcomingPurchases[] = [
                    "id" => $item['upcoming_purchase_id'],
                    "title" => $item['upcoming_purchase'],
                    "description" => $item['upcoming_desc'],
                    "cost" => $item['cost'],
                    "amount_to_save" => $item['amount_to_save']
                ];
            }
            $eachPayPeriod['upcoming_purchases'] = $upcomingPurchases;
            $payPeriodResults[] = $eachPayPeriod;
            
        }

        return $payPeriodResults;
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