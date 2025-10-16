<?php

class IpPayPeriodItem {
    
    public function __construct() {
        
    }

    public function index()
    {
        global $db_conn;

        $sql = "SELECT vnd_id, vnd_bill, LEFT(vnd_bill, 10) as vnd_bill_short, amount, vnd_frequency_value 
                FROM vnd_bills 
                WHERE 1 
                AND vnd_frequency = 'Once'
                AND vnd_frequency_type = 'Once'
                AND STR_TO_DATE(vnd_frequency_value, '%Y-%m-%d') BETWEEN :start_date AND :end_date
                ORDER BY vnd_frequency_value ";
        $stmt_sel_expenses = $db_conn->prepare($sql);

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
                    AND up.moved = 0
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
            
            $payPeriodDate = "";
            $eachPayPeriod = [
                "id" => $items[0]['pay_period_item_id'],
                "pay_period_id" => $items[0]['pay_period_id'],
                "pay_period_date" => $items[0]['pay_period_date'],
                "pay_period" => $items[0]['pay_period'],
                "disposable_amount" => $items[0]['disposable_amount'],
                "total_disposable" => $items[0]['total_disposable'] ?? 0,
                "remaining_amount" => $items[0]['remaining_amount'],
                "upcoming_purchases" => [],
                "one_time_expenses" => []
            ];
            
            $expenseResults = [];

            $payPeriodDate = $items[0]['pay_period_date'];

            if (intval(date('d', strtotime($payPeriodDate))) >= 15) {
                $startDate = date('Y-m-15', strtotime($payPeriodDate));
                $endDate = date('Y-m-t', strtotime($payPeriodDate));
            } else {
                $startDate = date('Y-m-01', strtotime($payPeriodDate));
                $endDate = date('Y-m-14', strtotime($payPeriodDate));
            }

            $sql = "SELECT vnd_id, vnd_bill, amount, vnd_frequency_value 
            FROM vnd_bills 
            WHERE 1 
            AND vnd_frequency = 'Once'
            AND vnd_frequency_type = 'Once'
            AND STR_TO_DATE(vnd_frequency_value, '%Y-%m-%d') BETWEEN :start_date AND :end_date
            ORDER BY vnd_frequency_value ";

            $stmt_sel_expenses->execute([
                ':start_date' => $startDate,
                ':end_date' => $endDate
            ]);

            $expenseResults = $stmt_sel_expenses->fetchAll(PDO::FETCH_ASSOC);
            $eachPayPeriod['one_time_expenses'] = $expenseResults;

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

    
        $sql = "UPDATE ip_pay_period_item 
                SET remaining_amount = :remaining_amount
                WHERE id = :id";
        $stmt_update_pay_period_item = $db_conn->prepare($sql);
            
        foreach ($payPeriodResults as $ppIndex => $pp) {
            $totalAmountToSave = 0;
            if (count($pp['upcoming_purchases']) > 0) {
                foreach ($pp['upcoming_purchases'] as $purchaseIndex => $purchase) {
                    $totalAmountToSave += $purchase['amount_to_save'];
                }
            }
            $remainingAmount = $pp['disposable_amount'] - $totalAmountToSave;
            $sql = "UPDATE ip_pay_period_item 
                SET remaining_amount = :remaining_amount
                WHERE id = :id";
            $stmt_update_pay_period_item->execute([
                ':remaining_amount' => $remainingAmount,
                ':id' => $pp['id']
            ]);
            $payPeriodResults[$ppIndex]['remaining_amount'] = $remainingAmount;
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