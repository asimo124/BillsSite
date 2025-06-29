<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$searchFiltersRequestArr = [];
$searchFilersQueryStr = "";
$vndBill = "";
$sort1 = "bill";
$sort1_dir = "ASC";
$sort2 = "";
$sort2_dir = "";
$frequencyShow = [
    "Every 1 Week" => 0,
    "Every 2 Weeks" => 0,
    "Every 4 Weeks" => 0,
    "Once Per Month - Day of Month" => 0,
    "Once Per Month - Starting From" => 0,
    "Every 3 Months" => 0,
    "Once" => 0
];

$vndBill = isset($_REQUEST['vnd_bill2']) ? $_REQUEST['vnd_bill2'] : "";
$vndBill2 = $vndBill;
if ($vndBill) {
    $vndBill = '%' . $vndBill . '%';
}
$sort1 = isset($_REQUEST['sort1']) ? $_REQUEST['sort1'] : "bill";
$sort1_dir = isset($_REQUEST['sort1_dir']) ? $_REQUEST['sort1_dir'] : "ASC";
$sort2 = isset($_REQUEST['sort2']) ? $_REQUEST['sort2'] : "";
$sort2_dir = isset($_REQUEST['sort2_dir']) ? $_REQUEST['sort2_dir'] : "";
$frequencyShow = isset($_REQUEST['frequency']) ? $_REQUEST['frequency'] : [
    "Every 1 Week" => 1,
    "Every 2 Weeks" => 1,
    "Every 4 Weeks" => 1,
    "Once Per Month - Day of Month" => 1,
    "Once Per Month - Starting From" => 1,
    "Every 3 Months" => 1,
    "Once" => 1
];
$btnSearch = isset($_REQUEST['btnSearch']) ? $_REQUEST['btnSearch'] : "";
$showAuditFields = isset($_REQUEST['showAuditFields']) ? intval($_REQUEST['showAuditFields']) : 0;

$searchFiltersRequestArr = [
    'vnd_bill2' => $vndBill,
    'sort1' => $sort1,
    'sort1_dir' => $sort1_dir,
    'sort2' => $sort2,
    'sort2_dir' => $sort2_dir,
    'frequency' => $frequencyShow,
    'btnSearch' => $btnSearch,
    'showAuditFields' => $showAuditFields,
];
$i = 0;
foreach ($searchFiltersRequestArr as $key => $value) {
    if ($key != "frequency") {

        if ($i == 0) {
            $searchFilersQueryStr = "$key=" . urlencode($value);
        } else {
            $searchFilersQueryStr .= "&$key=" . urlencode($value);
        }
    } else {

        foreach ($value as $getKey => $getValue) {

            $searchFilersQueryStr .= "&frequency[$getKey]=" . urlencode($getValue);
        }
    }
    $i++;
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Charge Catgories</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/css/nav.css" />
</head>

<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert <?php echo (isset($_REQUEST['error'])) ? "alert-danger" : "alert-success"; ?>" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <form class="form-horizontal" id="frmAddBill" action="proc_add.php?<?= $searchFilersQueryStr ?>" method="post" >
        <fieldset>
            <!-- Form Name -->
            <legend>Edit Bill</legend>

            <?php include "../../templates/nav.php"; ?>
            <div style="clear: both; height: 7px"></div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Bill</label>
                <div class="col-md-4">
                    <input id="vnd_bill" name="vnd_bill" type="text" placeholder="Bill Desc" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Amount</label>
                <div class="col-md-4">
                    <input id="amount" name="amount" type="text" placeholder="Amount" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Needs Monitoring</label>
                <div class="col-md-4">
                    <input type="checkbox" id="vnd_is_auto" name="vnd_is_auto" placeholder="Needs Monitoring" class="" value="1"  />&nbsp;Needs Monitoring
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Frequency</label>
                <div class="col-md-4">
                    <select name="vnd_frequency" id="vnd_frequency" class="form-control" >
                        <option value="Once Per Month" >Once Per Month</option>
                        <option value="Every 4 Weeks" >Every 4 Weeks</option>
                        <option value="Every 2 Weeks" >Every 2 Weeks</option>
                        <option value="Every 1 Week" >Every 1 Week</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Frequency Type</label>
                <div class="col-md-4">
                    <select name="vnd_frequency_type" id="vnd_frequency_type" class="form-control" >
                        <option value="Day of Month" >Day of Month</option>
                        <option value="Starting From" >Starting From</option>
                    </select>
                </div>
            </div>
            <div class="form-group value_orig" >
                <label class="col-md-4 control-label" for="textinput">Frequency Value Original</label>
                <div class="col-md-4">
                    <input id="vnd_frequency_value_original" name="vnd_frequency_value_original" type="text" placeholder="Frequency Value (Month Day, Start Date) - actual day" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Frequency Value</label>
                <div class="col-md-4">
                    <input id="vnd_frequency_value" name="vnd_frequency_value" type="text" placeholder="Frequency Value (Month Day, Start Date)" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">End Date</label>
                <div class="col-md-4">
                    <input id="end_date" name="end_date" type="text" placeholder="End Date" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Frequency Notes</label>
                <div class="col-md-4">
                    <input id="vnd_frequency_notes" name="vnd_frequency_notes" type="text" placeholder="Frequency Info" class="form-control input-md" value="" />
                </div>
            </div>
        </fieldset>
        <a href="javascript:void(0);" onclick="$('#frmAddBill').submit();" class="btn btn-primary">Create Bill</a>
    </form>

</div>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<script>
    $( function() {
        $( "#end_date" ).datepicker({ dateFormat: 'yy-mm-dd' });

        $('#vnd_frequency').change(function() {
            if ($(this).val() == 'Once Per Month') {
                $('.value_orig').show();
            } else {
                $('.value_orig').hide();
            }
            $('#vnd_frequency_value_original').val('');
        })

        $('#vnd_frequency_value_original').keyup(function() {
            var day2 = parseInt($(this).val());
            var day3 = null;
            if (day2 <= 14) {
                var day3 = day2 + 5;
                if (day3 > 14) {
                    day3 = 14;
                }
            } else {
                var day3 = day2 + 5;
                if (day3 > 31) {
                    day3 = 28;
                }
            }
            if (!isNaN(day3)) {
                $('#vnd_frequency_value').val(day3);
            }
        })
    } );
</script>
<script src="/js/nav.js" ></script>
