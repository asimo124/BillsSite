<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";
	//ini_set("display_errors", 1);

$disposablePerMonth = isset($_REQUEST['disposable_per_month']) ? floatval($_REQUEST['disposable_per_month']) : 0;

$sql = "SELECT * FROM cu_loan WHERE milestone_order > 0 ORDER BY milestone_order ASC";
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



$totalThreshold = 0;
foreach ($results as $index => $getItem) {

	$totalThreshold += $results[$index]['months_left'];
	$results[$index]['threshold'] = $totalThreshold;
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

foreach ($results as $index => $getItem) {
	
	$colorIndex = $index % count($randomColors);
	$results[$index]['color'] = $randomColors[$colorIndex];
}

//echo "<pre>";

$currentMonth = intval(date("m")) - 1;
$currentYear = intval(date("Y"));

$yearGroups = [];

$previousThreshold = 0;
$resultsIndex = 0;
for ($i = 0; $i < $totalMonthsLeftAfter; $i++) {
	
	$monthIndex = ($currentMonth + 1 + $i) % 12; // Start from next month

	//print_r("monthIndex: $monthIndex\n");

    $yearOffset = floor(($currentMonth + 1 + $i) / 12); // Calculate year offset

	//print_r("yearOffset: $yearOffset\n");

    $displayYear = $currentYear + $yearOffset; // Full year
    $displayYearShort = substr($displayYear, -2); // Last two digits of year
    $monthYearString = $monthNames[$monthIndex] . ' ' . $displayYearShort;

	//print_r("monthYearString: $monthYearString\n");
	
    
    // Group by year
    if (!isset($yearGroups[$displayYear])) {
		$yearGroups[$displayYear][] = [
			"year_title" => $displayYear,
			"months" => []
		];
    }

	/*/
	print_r("i: $i \n");
	print_r("resultsIndex: $resultsIndex \n");
	print_r("previousThreshold: $previousThreshold \n");
	print_r("current threshold: " . $results[$resultsIndex]['threshold'] . "\n");
	//*/
	if ($i >= $previousThreshold && $i < $results[$resultsIndex]['threshold']) {

		$color = $results[$resultsIndex]['color'];

		//print_r("Using color: $color \n");
		
		$previousThreshold = $results[$resultsIndex]['threshold'];
		$resultsIndex++;
	}

	$yearGroups[$displayYear]['months'][] = [
		"month_year" => $monthYearString,
		"color" => $color,
	];
}

header("Content-type: text/json");

$yearGroups2 = $yearGroups;
$yearGroups = [];
foreach ($yearGroups2 as $year => $data) {
	$yearGroups[] = [
		"year_title" => $year,
		"months" => $data['months']
	];
}

$results = [
	"items" => $yearGroups,
	"loans" => $results
];
echo json_encode($results);
?>
