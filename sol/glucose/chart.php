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

$sql = "SELECT * FROM glu_glucose_log WHERE date_taken >= :firstToday ORDER BY date_taken ASC ";
$resultset = getQuery($sql, [
    "firstToday" => $firstToday
]);

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


    <canvas id="lineChart"></canvas>
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
                    <?php foreach ($resultset as $getItem) : ?>
                        "<?php echo date("D, jS", strtotime($getItem['date_taken'])); ?>",
                    <?php endforeach; ?>
                ],
                datasets: [
                    {
                        label: "Glucose Levels for Month of <?php echo $curMonthName; ?>",
                        fillColor: "rgba(151,187,205,0.2)",
                        strokeColor: "rgba(151,187,205,1)",
                        pointColor: "rgba(151,187,205,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(151,187,205,1)",
                        data: [
                            <?php foreach ($resultset as $getItem) : ?>
                                <?php echo $getItem['level']; ?>,
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