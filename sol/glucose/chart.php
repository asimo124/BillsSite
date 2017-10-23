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



$lastMonthName = date("F", strtotime($lastMonthDate));
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

    <h2>Glucose Log Chart</h2>

    <div style="clear: both; height: 7px"></div>
    <a href="index.php" >Back</a>
    <div style="clear: both; height: 7px;" ></div>

    <canvas id="myChart" style="height: 370px; width: 100%;"></canvas>
    <?php /*<div id="chartContainer" style="height: 370px; width: 100%;"></div>*/ ?>
</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<?php /*<script src="/js/jquery.canvasjs.min.js" ></script>*/ ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.min.js" ></script>
<script src="/js/nav.js" ></script>
<script>
    <?php/*
    window.onload = function () {

//Better to construct options first and then pass it as a parameter
        var options = {
            responsive: true,
            exportEnabled: true,
            animationEnabled: true,
            title: {
                text: "<?php echo $curMonthName; ?> Glucose Levels"
            },
            data: [
                {
                    color: "orange",
                    legendText: "Morning",
                    showInLegend: true,
                    type: "splineArea", //change it to line, area, bar, pie, etc
                    dataPoints: [
                        <?php foreach ($allResults as $date => $getItem) : ?>
                            <?php if (isset($getItem['morning'])) { ?>
                                { y: <?php echo $getItem['morning']['level']; ?>, label: "<?php echo date("jS", strtotime($getItem['morning']['date_taken'])); ?>"},
                            <?php } else if (isset($getItem['evening'])) { ?>
                                { y: null, label: "<?php echo date("jS", strtotime($getItem['evening']['date_taken'])); ?>"},
                            <?php } ?>
                        <?php endforeach; ?>
                    ]
                },
                {
                    color: "blue",
                    legendText: "Evening",
                    showInLegend: true,
                    type: "splineArea", //change it to line, area, bar, pie, etc
                    dataPoints: [
                        <?php foreach ($allResults as $date => $getItem) : ?>
                            <?php if (isset($getItem['evening'])) { ?>
                                { y: <?php echo $getItem['evening']['level']; ?>, label: "<?php echo date("jS", strtotime($getItem['evening']['date_taken'])); ?>"},
                            <?php } else if (isset($getItem['morning'])) { ?>
                                { y: null, label: "<?php echo date("jS", strtotime($getItem['morning']['date_taken'])); ?>"},
                            <?php } ?>
                        <?php endforeach; ?>
                    ]
                }
            ]
        };
        $("#chartContainer").CanvasJSChart(options);

    }*/ ?>

    /*
    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });*/

    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
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
</script>