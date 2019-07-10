<?php
    include "../inc/includes.php";
    ini_set("display_errors", 1);

if (isset($_POST['doSubmit'])) {

    $password = isset($_REQUEST['password']) ? $_REQUEST['password'] : "";
    if ($password == "clownfrog38") {
        $_SESSION['User'] = true;
    }
}

$date3ago = date("Y-m-d", strtotime("- 3 month"));
$sql = "SELECT SUM(c.charge) as totalCharges
        FROM vnd_bills_charges c
        INNER JOIN vnd_bills_charge_categories cc
          ON c.category_id = cc.id
        WHERE date >= :date3ago
        AND ifnull(category_id, '') <> '' ";

$resultset = getQuery($sql, [
    "date3ago" => $date3ago
]);

$totalCharges = 0;
if (count($resultset) > 0) {
    $getResult = $resultset[0];
    $totalCharges = abs(floatval($getResult['totalCharges']));
}

$sql = "SELECT cc.cat_name, ROUND((SUM(ABS(ifnull(c.charge, 0))) / " . $totalCharges . ") * 100) as percent,
        ROUND((SUM(ABS(ifnull(c.charge, 0))))) AS category_amount
        FROM vnd_bills_charges c
        INNER JOIN vnd_bills_charge_categories cc
          ON c.category_id = cc.id
        WHERE date >= :date3ago
        AND ifnull(category_id, '') <> ''
        GROUP BY category_id
        ORDER BY ROUND((SUM(c.charge) / " . $totalCharges . ") * 100) ASC ";


$resultset = getQuery($sql, [
    "date3ago" => $date3ago
]);

$colors = [
    "#2ecc71",
    "#3498db",
    "#95a5a6",
    "#9b59b6",
    "#f1c40f",
    "#e74c3c",
    "#34495e",
    "#ff0000",
    "#00ff00",
    "#ffff00",
    "#0000ff",
    "#2ecc71",
    "#3498db",
    "#95a5a6",
    "#9b59b6",
    "#f1c40f",
    "#e74c3c",
    "#34495e",
    "#ff0000",
    "#00ff00",
    "#ffff00",
    "#0000ff",
    "#2ecc71",
    "#3498db",
    "#95a5a6",
    "#9b59b6",
    "#f1c40f",
    "#e74c3c",
    "#34495e",
    "#ff0000",
    "#00ff00",
    "#ffff00",
    "#0000ff"
];

$labels = [];
$datasets = [];
$datasets[0] = [
    "backgroundColor" => array()
];

setlocale(LC_MONETARY, 'en_US');

$totalPercent = 0;
foreach ($resultset as $i => $getResult) {
    $totalPercent += $getResult['percent'];
    if ($i == count($resultset) - 1) {
        $totalPercent = 100;
    }
    $labels[] = [
        "cat_name" => $getResult['cat_name'] . " - " . '$' . number_format($getResult['category_amount'], 2),
        "percent" => $totalPercent
    ];
    $datasets[0]['backgroundColor'][] = $colors[$i];
    $datasets[0]['data'][] = $getResult['percent'] . " - " . '$' . number_format($getResult['category_amount'], 2);
}
$data = [
    "labels" => $labels,
    "datasets" => $datasets,
];

//
?>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Charges</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <style type="text/css">
        textarea {
            width: 100%;
            height: 375px;
        }
        .span3 {
            width: 100%
            max-width: 800px;
            height: auto !important;
        }
        canvas{
            width: 100% !important;
            max-width: 800px;
            height: auto !important;
        }
        @media (max-width: 979px) {
            canvas {
                width: 100% !important;
                max-width: 800px;
                height: auto !important;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <h1>Charges</h1>
    <div style="clear: both; height: 20px;" ></div>

    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <?php include "../templates/nav.php"; ?>
    <div style="clear: both; height: 7px"></div>

    <div class="span3">
        <div id="chartContainer" style="height: 1000px; max-width: 920px; margin: 0px auto;"></div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
<script src="/js/nav.js" ></script>
<script>


    var data = <?php echo(json_encode($data, JSON_HEX_QUOT)); ?>

    //console.log(data);

    var use_data = [];
    $.each(data.labels, function(index, item) {

        console.log(item);
        var eachData = {
            type: "stackedColumn100",
            name: item.cat_name,
            showInLegend: true,
            yValueFormatString: "#,##0\"%\"",
            dataPoints: [
                { label: "Budget", y: item.percent },
            ]
        }
        use_data.push(eachData);
    });
    console.log("use_data: ", use_data);

        /*/
        [
            {
                type: "stackedColumn100",
                name: "WholeSale",
                showInLegend: true,
                yValueFormatString: "#,##0\"%\"",
                dataPoints: [
                    { label: "Q1", y: 44 },
                ]
            },
            {
                type: "stackedColumn100",
                name: "Retail",
                showInLegend: true,
                yValueFormatString: "#,##0\"%\"",
                dataPoints: [
                    { label: "Q1", y: 48 },
                ]
            },
            {
                type: "stackedColumn100",
                name: "Inside Sales",
                showInLegend: true,
                yValueFormatString: "#,##0\"%\"",
                dataPoints: [
                    { label: "Q1", y: 19 },
                ]
            },
            {
                type: "stackedColumn100",
                name: "Mail Order",
                showInLegend: true,
                yValueFormatString: "#,##0\"%\"",
                dataPoints: [
                    { label: "Q1", y: 20 },
                ]
            }
        ]
        //*/

    /*/
    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'pie',
        fullWidth: true,
        options: {
            responsive: true,
            fullWidth: true
        },
        data: data
    });
    $("#myChart").click(
        function(evt){
            var elements = myChart.getElementsAtEvent(evt);
            var label = null;
            if (elements[0]._model.label) {
                label = elements[0]._model.label;
            }
        }
    );
    /*/

    window.onload = function () {

//Better to construct options first and then pass it as a parameter
        var options = {
            animationEnabled: true,
            title:{
                text: "Budget Categories Breakdown"
            },
            axisY: {
                suffix: "%"
            },
            toolTip: {
                shared: true,
                reversed: true
            },
            legend: {
                reversed: true,
                verticalAlign: "center",
                horizontalAlign: "right"
            },
            data: use_data
        };

        $("#chartContainer").CanvasJSChart(options);
    }
    //*/
</script>