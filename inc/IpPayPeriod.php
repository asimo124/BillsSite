<?php

class IpPayPeriod {
    
    private $numPaychecks;

    public function __construct($numPaychecks=24) {
        $this->numPaychecks = $numPaychecks;
    }

    public function updatePayPeriods() {

        $date2 = date('Y-m-d');

        $day = intval(date('d', strtotime($date2)));
        $month = intval(date('m', strtotime($date2)));
        $year = intval(date('Y', strtotime($date2)));

        if ($day < 15) {
            $day = 15;
        } else {
            if ($month < 12) {
                $month += 1;
            } else {
                $month = 1;
                $year += 1;
            }
            $day = 1;
        }

        $payCheckDay = $day;
        $payCheckMonth = $month;
        $payCheckYear = $year;

        $sql = "INSERT INTO ip_pay_period 
        (pay_period, pay_period_date) VALUES 
        (:pay_period, :pay_period_date) ";
        $stmt_insert_bills = $db_conn->prepare($sql);

        $sql = "SELECT * FROM ip_pay_period WHERE pay_period_date = :pay_period_date ";
        $stmt_sel_pay_period = $db_conn->prepare($sql);

        $neededPayPeriods = [];
        for ($i = 0; $i <=$this->numPaychecks; $i++) {

            $payPeriodDate = date('Y-m-d', strtotime("$payCheckYear-$payCheckMonth-$payCheckDay"));

            $neededPayPeriods[] = $payPeriodDate;

            // Calculate next pay period
            if ($payCheckDay == 1) {
                $payCheckDay = 15;
            } else {
                $payCheckDay = 1;
                if ($payCheckMonth < 12) {
                    $payCheckMonth += 1;
                } else {
                    $payCheckMonth = 1;
                    $payCheckYear += 1;
                }
            }
        }

        $sql = "SELECT * FROM ip_pay_period ORDER BY pay_period_date ";
        $existingPayPeriods = getQuery($sql);
        $existingPayPeriodDates = [];
        foreach ($existingPayPeriods as $pp) {
            $existingPayPeriodDates[] = $pp['pay_period_date'];
        }

        foreach ($existingPayPeriods as $pp) {
            if (!in_array($pp['pay_period_date'], $neededPayPeriods)) {
                // Delete this pay period
                $sql = "DELETE FROM ip_pay_period WHERE pay_period_date = :pay_period_date ";
                $stmt_del = $db_conn->prepare($sql);
                $stmt_del->execute(['pay_period_date' => $pp['pay_period_date']]);
            }
        }

        $sql = "INSERT INTO ip_pay_period 
        (pay_period, pay_period_date) VALUES 
        (:pay_period, :pay_period_date) ";
        $stmt_insert_pay_period = $db_conn->prepare($sql);

        for ($i = 0; $i <=$this->numPaychecks; $i++) {
            $payPeriodDate = date('Y-m-d', strtotime("$payCheckYear-$payCheckMonth-$payCheckDay"));

            $sql = "SELECT * FROM ip_pay_period WHERE pay_period_date = :pay_period_date ";
            $stmt_sel_pay_period = $db_conn->prepare($sql);
            $stmt_sel_pay_period->execute(['pay_period_date' => $payPeriodDate]);
            $existing = $stmt_sel_pay_period->fetch(PDO::FETCH_ASSOC);  

            if (!$existing) {
                $stmt_insert_pay_period->execute([
                    'pay_period' => intval($payCheckMonth) . "/" . intval($payCheckDay),
                    'pay_period_date' => $payPeriodDate,
                ]);
            }

            // Calculate next pay period
            if ($payCheckDay == 1) {
                $payCheckDay = 15;
            } else {
                $payCheckDay = 1;
                if ($payCheckMonth < 12) {
                    $payCheckMonth += 1;
                } else {
                    $payCheckMonth = 1;
                    $payCheckYear += 1;
                }
            }
        }
    }
} 