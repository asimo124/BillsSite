<?php
    include "../inc/includes.php";

if (isset($_POST['doSubmit'])) {

    $password = isset($_REQUEST['password']) ? $_REQUEST['password'] : "";
    if ($password == "clownfrog38") {
        $_SESSION['User'] = true;
    }
}

$date = intval(date("d"));
if ($date < 15) {
    $date = 1;
} else {
    $date = 16;
}
$sql = "SELECT SUM(c.charge) as totalCharges
        FROM vnd_bills_charges c
        INNER JOIN vnd_bills_charge_categories cc
          ON c.category_id = cc.id
        WHERE date >= DATE(DATE_ADD(:date, INTERVAL -1 DAY))
        AND ifnull(category_id, '') <> ''
        AND ifnull(charge, 0) > 0
        AND cc.cat_name <> 'Bills' ";

$resultset = getQuery($sql, [
    "date" => date("Y-m-" . $date)
]);

$totalCharges = 0;
if (count($resultset) > 0) {
    $getResult = $resultset[0];
    $totalCharges = floatval($getResult['totalCharges']);
}

$sql = "SELECT cc.cat_name, ROUND((SUM(ifnull(c.charge, 0)) / " . $totalCharges . ") * 100) as percent
        FROM vnd_bills_charges c
        INNER JOIN vnd_bills_charge_categories cc
          ON c.category_id = cc.id
        WHERE date >= DATE(DATE_ADD(:date, INTERVAL -1 DAY))
        AND ifnull(category_id, '') <> ''
        AND ifnull(charge, 0) > 0
        AND cc.cat_name <> 'Bills'
        GROUP BY category_id
        ORDER BY ROUND((SUM(c.charge) / " . $totalCharges . ") * 100) DESC ";

$resultset = getQuery($sql, [
    "date" => date("Y-m-" . $date)
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
foreach ($resultset as $i => $getResult) {
    $labels[] = $getResult['cat_name'] . " (" . $getResult['percent'] . "%)";
    $datasets[0]['backgroundColor'][] = $colors[$i];
    $datasets[0]['data'][] = $getResult['percent'];
}
$data = [
    "labels" => $labels,
    "datasets" => $datasets,
];
?>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Charges</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
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

    <a href="/bills" >Bills</a> | <a href="/bills/admin" >Bills Admin</a> | <a href="upload.php" >Upload Charges</a> | <a href="/charges/cats" >Charge Categories</a>
    <div style="clear: both; height: 12px"></div>

    <?php /*if (!isset($_SESSION['User'])) { ?>
    <form class="form-horizontal" id="frmLogin" action="index.php" method="post" >
        <fieldset>
            <!-- Form Name -->
            <legend>Login</legend>

            <a href="workouts/index.php" >Charge Categories</a>
            <div style="clear: both; height: 7px"></div>

            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Password</label>
                <div class="col-md-4">
                    <input id="password" name="password" type="password" placeholder="Password" class="form-control input-md" value="">
                </div>
            </div>
        </fieldset>
        <a href="javascript:void(0);" onclick="$('#frmLogin').submit();" class="btn btn-primary">Login</a>
        <input type="hidden" name="doSubmit" id="doSubmit" value="1" />
    </form>
    <?php //} else {*/ ?>
    <div class="span3">
        <canvas id="myChart" width="100%"></canvas>
    </div>
    <?php //} ?>
</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0-rc.1/Chart.js" ></script>
<script>
    var data = <?php echo(json_encode($data, JSON_HEX_QUOT)); ?>;
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
</script>