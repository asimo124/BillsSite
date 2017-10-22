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

$lastMonthDate = date($lastYear . "-" . $lastMonth . "-1");

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
$morningResults = array();
$eveningResults = array();
foreach ($resultset as $getItem) {

    if ($getItem['time_of_day'] == "Morning") {
        $allResults[date("Y-m-d", strtotime($getItem['date_taken']))]['morning'] = $getItem;
    } else {
        $allResults[date("Y-m-d", strtotime($getItem['date_taken']))]['evening'] = $getItem;
    }
}



$lastMonthName = date("M", strtotime($lastMonthDate));
$curMonthName = date("M");
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
    <link rel="stylesheet" href="/css/mdb.min.css" />
    <link rel="stylesheet" href="/css/style_mdb.css" />
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h2>Glucose Log Chart</h2>

    <div style="clear: both; height: 7px"></div>
    <a href="index.php" >Back</a>
    <div style="clear: both; height: 7px;" ></div>


    <canvas id="lineChart" colours="colours"></canvas>
</div>

</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.5/popper.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.1/js/mdb.min.js" ></script>
<script src="/js/nav.js" ></script>
<script>

    $(document).ready(function() {

        var ctxL = document.getElementById("lineChart").getContext('2d');
        var myLineChart = new Chart(ctxL, {
            type: 'line',
            data: {
                labels: [
                    <?php foreach ($allResults as $date => $getItem) : ?>
                        "<?php echo date("D, jS", strtotime($date)); ?>",
                    <?php endforeach; ?>
                ],
                datasets: [
                    {
                        label: "<?php echo $curMonthName; ?> Levels in Morning",
                        fillColor: "rgba(252,196,128,0.2)",
                        strokeColor: "rgba(237,139,16,1)",
                        pointColor: "rgba(242,110,110,1)",
                        pointStrokeColor: "#ed8b10",
                        pointHighlightFill: "#ed8b10",
                        pointHighlightStroke: "rgba(237,139,16,1)",
                        data: [
                            <?php foreach ($allResults as $date => $getItem) : ?>
                                <?php if (isset($getItem['morning'])) : ?>
                                    <?php echo $getItem['morning']['level']; ?>,
                                <?php /*elseif (isset($getItem['evening'])) : ?>
                                    <?php echo $getItem['evening']['level'];*/ ?>
                                <?php endif; ?>
                            <?php endforeach; ?>
                        ]
                    },
                    {
                        label: "<?php echo $curMonthName; ?> Levels in Evening",
                        fillColor: "rgba(252,196,128,0.2)",
                        strokeColor: "rgba(237,139,16,1)",
                        pointColor: "rgba(242,110,110,1)",
                        pointStrokeColor: "#ed8b10",
                        pointHighlightFill: "#ed8b10",
                        pointHighlightStroke: "rgba(237,139,16,1)",
                        data: [
                            <?php foreach ($allResults as $date => $getItem) : ?>
                                <?php if (isset($getItem['evening'])) : ?>
                                    <?php echo $getItem['evening']['level']; ?>,
                                <?php /*elseif (isset($getItem['morning'])) : ?>
                                    <?php echo $getItem['morning']['level'];*/ ?>
                                <?php endif; ?>
                            <?php endforeach; ?>
                        ]
                    }
                ]
            },
            options: {
                responsive: true
            }
        });

    })
</script>