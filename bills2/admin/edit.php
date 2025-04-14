<?php
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;

$sql = "SELECT vnd_bill, amount, vnd_is_auto, vnd_frequency_notes,
        vnd_frequency, vnd_frequency_type, vnd_frequency_value
        FROM vnd_bills
        WHERE vnd_id = :id ";
$Bills = getQuery($sql, [
    "id" => $id
]);
$Bill = array();
if (count($Bills) > 0) {
    $Bill = $Bills[0];
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

    <form class="form-horizontal" id="frmEditBill" action="proc_edit.php" method="post" >
        <fieldset>
            <!-- Form Name -->
            <legend>Edit Bill</legend>

            <?php include "../../templates/nav.php"; ?>
            <div style="clear: both; height: 7px"></div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Bill</label>
                <div class="col-md-4">
                    <input id="vnd_bill" name="vnd_bill" type="text" placeholder="Bill Desc" class="form-control input-md" value="<?php echo $Bill['vnd_bill']; ?>" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Amount</label>
                <div class="col-md-4">
                    <input id="amount" name="amount" type="text" placeholder="Amount" class="form-control input-md" value="<?php echo $Bill['amount']; ?>" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Needs Monitoring</label>
                <div class="col-md-4">
                    <input type="checkbox" id="vnd_is_auto" name="vnd_is_auto" placeholder="Needs Monitoring" class="" value="1" <?php echo ($Bill['vnd_is_auto'] == "1") ? "CHECKED" : ""; ?> />&nbsp;Needs Monitoring
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Frequency</label>
                <div class="col-md-4">
                    <select name="vnd_frequency" id="vnd_frequency" class="form-control" >
                        <option value="Once Per Month" >Once Per Month</option>
                        <option value="Every 2 Weeks" <?php echo ($Bill['vnd_frequency_notes'] == "Every 2 Weeks") ? "SELECTED" : ""; ?>>Every 2 Weeks</option>
                        <option value="Every 1 Week" <?php echo ($Bill['vnd_frequency_notes'] == "Every 1 Week") ? "SELECTED" : ""; ?>>Every 1 Week</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Frequency Type</label>
                <div class="col-md-4">
                    <select name="vnd_frequency_type" id="vnd_frequency_type" class="form-control" >
                        <option value="Day of Month" >Day of Month</option>
                        <option value="Starting From" <?php echo ($Bill['vnd_frequency_type'] == "Starting From") ? "SELECTED" : ""; ?>>Starting From</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Frequency Value</label>
                <div class="col-md-4">
                    <input id="vnd_frequency_value" name="vnd_frequency_value" type="text" placeholder="Frequency Value (Month Day, Start Date)" class="form-control input-md" value="<?php echo $Bill['vnd_frequency_value']; ?>" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Frequency Notes</label>
                <div class="col-md-4">
                    <input id="vnd_frequency_notes" name="vnd_frequency_notes" type="text" placeholder="Frequency Info" class="form-control input-md" value="<?php echo $Bill['vnd_frequency_notes']; ?>" />
                </div>
            </div>
            <input type="hidden" name="id" id="id" value="<?php echo $id; ?>" />
        </fieldset>
        <a href="javascript:void(0);" onclick="$('#frmEditBill').submit();" class="btn btn-primary">Update</a>
    </form>

</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js" ></script>