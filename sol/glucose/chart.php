<?php
//ini_set("display_errors", 1);
include "../../inc/includes.php";

/*/
if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}
//*/

$curMonth = intval(date("m"));
$curYear = date("Y");
if ($date2 == 1) {
    $lastMonth = 12;
    $lastYear = $curYear - 1;
} else {
    $lastMonth = $curMonth - 1;
    $lastYear = $curYear;
}

$lastMonthDateFirst = date($lastYear . "-" . $lastMonth . "-1");
$dateLast = date($lastYear . "-" . $lastMonth . "-1");
$lastMonthDateLast = date("Y-m-t 23:59:59", strtotime($dateLast));

$firstToday = date("Y-m-1");

$sql = "SELECT *,  
        CASE WHEN DATE_FORMAT(date_taken, '%k') <= 11 THEN
          'Morning' 
        ELSE 
          'Evening'
        END as time_of_day
        FROM glu_glucose_log 
        WHERE date_taken >= :firstToday  
        ORDER BY date_taken ASC ";
$resultset = getQuery($sql, [
    "firstToday" => $firstToday
]);

$allResults = array();
foreach ($resultset as $getItem) {

    if ($getItem['time_of_day'] == "Morning") {
        $allResults[date("Y-m-d", strtotime($getItem['date_taken']))]['morning'] = $getItem;
    } else {
        $allResults[date("Y-m-d", strtotime($getItem['date_taken']))]['evening'] = $getItem;
    }
}

$sql = "SELECT *,
        CASE WHEN DATE_FORMAT(date_taken, '%k') <= 11 THEN
          'Morning'
        ELSE
          'Evening'
        END as time_of_day
        FROM glu_glucose_log
        WHERE date_taken between :lastMonthDateFirst and :lastMonthDateLast
        ORDER BY date_taken ASC ";
$resultset = getQuery($sql, [
    "lastMonthDateFirst" => $lastMonthDateFirst,
    "lastMonthDateLast" => $lastMonthDateLast
]);

$allResultsLast = array();
foreach ($resultset as $getItem) {

    if ($getItem['time_of_day'] == "Morning") {
        $allResultsLast[date("Y-m-d", strtotime($getItem['date_taken']))]['morning'] = $getItem;
    } else {
        $allResultsLast[date("Y-m-d", strtotime($getItem['date_taken']))]['evening'] = $getItem;
    }
}

$lastMonthName = date("F", strtotime($lastMonthDateFirst));
$curMonthName = date("F");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Glucose Log</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h1>Glucose Log Chart</h1>

    <div style="clear: both; height: 7px"></div>
    <a href="index.php" >Back</a>
    <div style="clear: both; height: 7px;" ></div>

    <h2>Previous Month - <?php echo $lastMonthName; ?></h2>
    <canvas id="myChartLast" style="height: 370px; width: 100%;"></canvas>
    <div style="clear: both; height: 7px;" ></div>

    <h2>Current Month - <?php echo $curMonthName; ?></h2>
    <canvas id="myChartCurrent" style="height: 370px; width: 100%;"></canvas>



</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<?php /*<script src="/js/jquery.canvasjs.min.js" ></script>*/ ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.min.js" ></script>
<script src="/js/nav.js" ></script>
<script>

    var ctxCurrent = document.getElementById('myChartCurrent').getContext('2d');
    var myChartCurrent = new Chart(ctxCurrent, {
        type: 'line',
        data: {
            labels: [
            <?php foreach ($allResults as $date => $getItem) : ?>
                "<?php echo date("jS", strtotime($date)); ?>",
            <?php endforeach; ?>,
            ],
            datasets: [{
                label: 'Morning',
                data: [
                    <?php foreach ($allResults as $date => $getItem) : ?>
                        <?php if (isset($getItem['morning'])) { ?>
                            <?php echo $getItem['morning']['level']; ?>,
                        <?php } else if (isset($getItem['evening'])) { ?>
                            null,
                        <?php } ?>
                    <?php endforeach; ?>
                ],
                backgroundColor: "rgba(237,139,16,0.4)"
            }, {
                label: 'Evening',
                data: [
                    <?php foreach ($allResults as $date => $getItem) : ?>
                        <?php if (isset($getItem['evening'])) { ?>
                            <?php echo $getItem['evening']['level']; ?>,
                        <?php } else if (isset($getItem['morning'])) { ?>
                            null,
                        <?php } ?>
                    <?php endforeach; ?>
                ],
                backgroundColor: "rgba(68,138,252,0.4)"
            }]
        }
    });


    var ctxLast = document.getElementById('myChartLast').getContext('2d');
    var myChartLast = new Chart(ctxLast, {
        type: 'line',
        data: {
            labels: [
                <?php foreach ($allResultsLast as $date => $getItem) : ?>
                "<?php echo date("jS", strtotime($date)); ?>",
                <?php endforeach; ?>,
            ],
            datasets: [{
                label: 'Morning',
                data: [
                    <?php foreach ($allResultsLast as $date => $getItem) : ?>
                    <?php if (isset($getItem['morning'])) { ?>
                    <?php echo $getItem['morning']['level']; ?>,
                    <?php } else if (isset($getItem['evening'])) { ?>
                    null,
                    <?php } ?>
                    <?php endforeach; ?>
                ],
                backgroundColor: "rgba(237,139,16,0.4)"
            }, {
                label: 'Evening',
                data: [
                    <?php foreach ($allResultsLast as $date => $getItem) : ?>
                    <?php if (isset($getItem['evening'])) { ?>
                    <?php echo $getItem['evening']['level']; ?>,
                    <?php } else if (isset($getItem['morning'])) { ?>
                    null,
                    <?php } ?>
                    <?php endforeach; ?>
                ],
                backgroundColor: "rgba(68,138,252,0.4)"
            }]
        }
    });


</script>