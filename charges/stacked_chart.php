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

$sql = "SELECT cc.cat_name, ROUND((SUM(ABS(ifnull(c.charge, 0))) / " . $totalCharges . ") * 100) as percent, cc.id as category_id,
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

$catNameIds = [];
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
    $catNameIds[$getResult['cat_name'] . " - " . '$' . number_format($getResult['category_amount'], 2)] = $getResult['category_id'];
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

    <link rel="stylesheet" href='/js/DataTables/media/css/jquery.dataTables.min.css' />
    <link rel="stylesheet" href='/js/DataTables/media/css/buttons.dataTables.min.css' />
    <link rel="stylesheet" href='/js/DataTables/media/css/select.dataTables.min.css' />
    <link rel="stylesheet" href='/js/DataTables/media/css/editor.bootstrap.min.css' />
    <link rel="stylesheet" href='/js/DataTables/media/css/buttons.bootstrap.min.css' />

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
            max-width: 1152px;
            height: auto !important;
        }
        canvas{
            width: 100% !important;
            max-width: 1152px;
            height: auto !important;
        }
        @media (max-width: 979px) {
            canvas {
                width: 100% !important;
                max-width: 1152px;
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
        <div id="chartContainer" style="height: 1000px; max-width: 1152px; margin: 0px auto;"></div>
    </div>
    <input type="hidden" name="category_id" id="category_id" value="0" />

    <div class="row">
        <col-md-12>
            <h2 id="category_name"></h2>
            <table class="table-bordered" id="certificates_table">
                <thead>
                <tr>
                    <th >Date</th>
                    <th >Description</th>
                    <th >Charge</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </col-md-12>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
<script type="text/javascript" src="/js/DataTables/media/js/jquery.dataTables.min.js" ></script>
<script type="text/javascript" src="/js/DataTables/media/js/dataTables.bootstrap.min.js" ></script>
<script type="text/javascript" src="/js/DataTables/media/js/dataTables.editor.min.js" ></script>
<script type="text/javascript" src="/js/DataTables/media/js/editor.bootstrap.min.js" ></script>
<script type="text/javascript" src="/js/DataTables/media/js/dataTables.keyTable.min.js" ></script>
<script type="text/javascript" src="/js/DataTables/media/js/dataTables.buttons.min.js" ></script>
<script type="text/javascript" src="/js/DataTables/media/js/dataTables.select.min.js" ></script>
<script type="text/javascript" src="/js/DataTables/media/js/buttons.bootstrap.min.js" ></script>
<script src="/js/nav.js" ></script>
<script>


    var data = <?php echo(json_encode($data, JSON_HEX_QUOT)); ?>;
    var catNameIds = <?php echo(json_encode($catNameIds, JSON_HEX_QUOT)); ?>;

    window.loadedTable = false;
    var loadChargesTable = function(category_id, categoryName) {

        if (loadedTable == false) {
            window.cert_dataTable = $('#certificates_table').DataTable({
                dom: " B <'dt-toolbar'<'col-xs-12 col-sm-6'<'title-company-contracts'>><'col-sm-6 col-xs-12 hidden-xs'fl<'xtra-company-contracts'>>r>" +
                    "t " +
                    "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
                ajax: {
                    url: "/api/get_charges_by_category.php",
                    data: function ( d ) {
                        d.category_id = $('#category_id').val();
                    }
                },
                "serverSide": true,
                order: [[1, 'asc']],
                "language": {
                    "lengthMenu": '<select name="invoices_disbursements_table_length" aria-controls="invoices_disbursements_table" class="form-control">' +
                        '<option value="500">500</option>' +
                        '               </select>',
                    "sSearch": ""
                },
                columns: [
                    {data: "date"},
                    {data: "description"},
                    {data: "charge"}
                ],
                select: {
                    style: 'os',
                    selector: 'td:first-child'
                },
                buttons: []
            });

            setTimeout(function () {
                $('[name$="_table_length"]').val(500).change();

            }, 200);
            window.loadedTable = true;

        } else {

            window.cert_dataTable.page(0).draw(true)
        }
        $('#category_name').html(categoryName);
        $(document).scrollTop( $("#certificates_table").offset().top );
    }

    var use_data = [];
    var percentCategoryNames = {};
    $.each(data.labels, function(index, item) {

        console.log(item);
        var eachData = {
            type: "stackedColumn100",
            name: item.cat_name,
            showInLegend: true,
            yValueFormatString: "#,##0\"%\"",
            click: function(e){
                var pointPercent = String(e.dataPoint.y);
                var categoryName = percentCategoryNames[pointPercent];
                var categoryId = catNameIds[categoryName];
                $('#category_id').val(categoryId);
                loadChargesTable(categoryId, categoryName);
                //alert("categoryId: " + categoryId);
            },
            dataPoints: [
                { label: "Budget", y: item.percent },
            ]
        }
        console.log(item.cat_name + ": " + item.percent);
        var getPercent = String(item.percent);
        percentCategoryNames[getPercent] = item.cat_name;
        use_data.push(eachData);
    });

    window.onload = function () {

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