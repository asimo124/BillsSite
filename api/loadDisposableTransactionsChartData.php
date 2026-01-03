<?php
$changeTestMode            = isset($_REQUEST['test_mode']) ? intval($_REQUEST['test_mode']) : 0;

include "../inc/includes.php";
//ini_set("display_errors", 1);

$paycheckDate = isset($_REQUEST['paycheck_date']) ? trim($_REQUEST['paycheck_date']) : '';

if (!$paycheckDate) {
    $payCheckDay = date('d');
    if ($payCheckDay <= 15) {
        $paycheckDate = date('Y-m-15');
    } else {
        $paycheckDate = date('Y-m-t');
    }
}

$sql = "SELECT 
        t.transaction_date, 
        SUM(t.amount) AS spent, 
        SUM(t.amount) AS accumulated_spent
        -- SUM(SUM(t.amount)) OVER (ORDER BY t.transaction_date) AS accumulated_spent
        FROM dt_transaction t
        WHERE 1  
        AND t.is_covered = 0 
        AND t.amount > 0
        AND t.paycheck_date = ?
        GROUP BY t.transaction_date
        ORDER BY t.transaction_date ";

$results = getQuery($sql, [$paycheckDate]);

function addOrdinalSuffix($day) {
    if (!in_array(($day % 100), [11, 12, 13])) {
        switch ($day % 10) {
            case 1: return $day . 'st';
            case 2: return $day . 'nd';
            case 3: return $day . 'rd';
        }
    }
    return $day . 'th';
}

foreach ($results as &$row) {
    $transactionDay = intval(date("j", strtotime($row['transaction_date'])));
    $transactionDay = addOrdinalSuffix($transactionDay);

    $transactionWeekDay = date("D", strtotime($row['transaction_date']));

    $row['transaction_day'] = $transactionWeekDay . ', ' . $transactionDay;
}

/*/
chartOptions: {
    chart: {
        type: 'bar',
    },
    xaxis: {
        categories: ['A', 'B', 'C'],
    },
    },
    series: [
    {
        name: 'Test',
        data: [10, 20, 30],
    },
    ],
//*/

$chartOptions = [
    'chart' => [
        'type' => 'bar',
    ],
    'xaxis' => [
        'categories' => array_column($results, 'transaction_day'),
    ],
];

$series = [
    [
        'name' => 'Spent',
        'data' => array_map(function($row) {
            return floatval($row['accumulated_spent']);
        }, $results),
    ],
];

header("Content-type: application/json");
header('Access-Control-Allow-Origin: *');
echo json_encode([
    'chartOptions' => $chartOptions,
    'series' => $series,
], JSON_PRETTY_PRINT);
die();
?>