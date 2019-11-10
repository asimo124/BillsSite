<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
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

    <form class="form-horizontal" id="frmAddBill" action="proc_add.php" method="post" >
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
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Frequency Value</label>
                <div class="col-md-4">
                    <input id="vnd_frequency_value" name="vnd_frequency_value" type="text" placeholder="Frequency Value (Month Day, Start Date)" class="form-control input-md" value="" />
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
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js" ></script>
