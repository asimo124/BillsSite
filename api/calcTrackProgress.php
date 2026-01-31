<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";
	//ini_set("display_errors", 1);

$disposablePerMonth = isset($_REQUEST['disposable_per_month']) ? floatval($_REQUEST['disposable_per_month']) : 0;

$allowBlankSortOrder = isset($_REQUEST['allow_blank_sort_order']) ? intval($_REQUEST['allow_blank_sort_order']) : 0;

$whereSql = "";
if ($allowBlankSortOrder == 0) {
	$whereSql = " AND sort_order > 0 ";
}

$sql = "SELECT * FROM cu_loan 
		WHERE 1
		$whereSql
		AND milestone_order > 0 
		ORDER BY milestone_order ASC";
$results = getQuery($sql);

$totalBalance = 0;
$totalMinPayment = 0;
foreach ($results as $getItem) {
    $totalBalance += floatval($getItem['debt_owed']);
    $totalMinPayment += floatval($getItem['min_payment']);
}

$totalMonthsLeft = 0;
$totalAmountPrincipal = 0;
$minPaymentAccum = 0;
$previousItem = [];
foreach ($results as $index => $getItem) {

	$totalAmountPrincipal += floatval($getItem['amount_to_principal']);
    $results[$index]['total_principal_monthly'] = $disposablePerMonth + $minPaymentAccum +  $getItem['amount_to_principal'];

	$results[$index]['months_left'] = round($getItem['debt_owed'] / $results[$index]['total_principal_monthly'], 1);

	$totalMonthsLeft += $results[$index]['months_left'];

	$results[$index]['months_left_accum'] = round($totalMonthsLeft, 1);

	$minPaymentAccum += floatval($getItem['min_payment']);
}

$totalPaychecksLeft = round(($totalMonthsLeft * 2));

$curDay = intval(date("d"));
if ($curDay > 15) {
	$totalPaychecksLeft += 1;
}

$totalMonthsLeftAfter = round(($totalPaychecksLeft / 2));

$monthsLeftArr = [];
$monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
					'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

$lastThreshold = 0;
$totalThreshold = 0;
foreach ($results as $index => $getItem) {

	$totalThreshold += $results[$index]['months_left'];
	$results[$index]['threshold'] = $totalThreshold;
	$lastThreshold = $totalThreshold;
}

$randomColors = [
	"#670daf", // (Deep Purple)
	"#253e05", // (Dark Olive)
	"#c9f733", // (Lime Green)
	"#5017d0", // (Bright Blue)
	"#0c153b", // (Navy Blue)
	"#92c244", // (Light Green)
	"#21ed9c", // (Aqua Green)
	"#75ba7b", // (Sage Green)
	"#e6a105", // (Golden Orange)
	"#b0e5da", // (Pale Mint)
	"#6c7af6", // (Soft Blue)
	"#56773a", // (Olive Green)
	"#7648ef", // (Violet)
	"#c24440", // (Soft Red)
	"#45297a", // (Deep Indigo)
	"#8446fa", // (Purple) 
];

//print_r($randomColors);

$startDate = "";
$currentDay = intval(date("d"));
if ($currentDay < 15) {
	$startDate = date("Y-m-1");
} else {
	$startDate = date("Y-m-15");
}

$startDate = strtotime($startDate);



$categories = [];
$resultsArr = [];
$seriesData = [];
foreach ($results as $index => $getItem) {
    

	$colorIndex = $index % count($randomColors);
	$results[$index]['color'] = $randomColors[$colorIndex];

    $endDate = strtotime("+" . floor($getItem['months_left']) . " months", $startDate);

	// Account for fractional months
	$fractionalDays = ($getItem['months_left'] - floor($getItem['months_left'])) * 30; // Approximate days in a month
	$endDate = strtotime("+" . round($fractionalDays) . " days", $endDate);

	$categories[] = $getItem['title'];

	$seriesData[] = [
		"name" => $getItem['title'],
		"value" => [$startDate * 1000, $endDate * 1000],
		"itemStyle" => [ "color" => $results[$index]['color']],
	];

	$resultsArr[] = [
		"title" => $getItem['title'],
		"start_date" => $startDate,
		"end_date" => $endDate,
	];

	$startDate = strtotime(date("Y-m-d", ($endDate + 86400)));
}

$resultsFinal = [
	"categories" => $categories,
	"series" => [
		[
			"name" => "Loan Durations",
			"type" => "bar",
			"data" => $seriesData,
		],
	],
];

$currentYear = intval(date("Y"));
$currentMonth = intval(date("m")) - 1;
$currentYear = intval(date("Y"));
$currentDate = date("Y-m-d");

$yearGroups = [];


header("Content-type: text/json");

$results = [
	"items" => $resultsFinal,
	"loans" => $results,
];
echo json_encode($results);
?>
