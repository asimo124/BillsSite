<?php
include "../../inc/includes.php";

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;

$sql = "SELECT * FROM glu_glucose_log WHERE id = :id ";
$Logs = getQuery($sql, [
    "id" => $id
]);
$getLog = array();
if (count($Logs) > 0) {
    $getLog = $Logs[0];
}

/*/
if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}
//*/
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
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" href="/css/bootstrap-timepicker.min.css" />
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
            <legend>View Log</legend>

            <div style="clear: both; height: 7px"></div>

            <a href="index.php" >Back</a>
            <div style="clear: both; height: 7px;" ></div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">DateTime Recorded</label>
                <div class="col-md-4">
                    <div style="clear: both; height: 7px;" ></div>
                    <?php echo date("m/d/Y @ g:i A", strtotime($getLog['date_taken'])); ?>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Level</label>
                <div class="col-md-4">
                    <div style="clear: both; height: 7px;" ></div>
                    <?php echo $getLog['level']; ?>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Notes (Optional)</label>
                <div class="col-md-4">
                    <textarea name="notes" id="notes" class="form-control" rows="5" id="comment"><?php echo $getLog['notes']; ?></textarea>
                </div>
            </div>
        </fieldset>
        <input type="hidden" name="id" id="id" value="<?php echo $id; ?>" />
        <a href="javascript:void(0);" onclick="$('#frmEditBill').submit();" class="btn btn-primary">Update</a>
    </form>

</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/js/bootstrap-timepicker.min.js" ></script>
<script src="/js/nav.js" ></script>
<script>

    $(document).ready(function() {

        $('#date_taken').datepicker({});
        $('#time_taken').timepicker();

    })

</script>