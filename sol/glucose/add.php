<?php
include "../../inc/includes.php";

/*/
if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}
//*/
$ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$ipArr = explode(".", $ip);
$userAgentArr = explode(" ", $user_agent);
$string_to_hash = $ip[1] . SALT2 . $userAgentArr[2] . SALT1 . $ip[3] . $userAgentArr[0];
$hash_key = md5($string_to_hash);
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

    <form class="form-horizontal" id="frmAddBill" action="proc_add.php" method="post" >
        <fieldset>
            <!-- Form Name -->
            <legend>Add Log</legend>

            <div style="clear: both; height: 7px"></div>

            <a href="index.php" >Back</a>
            <div style="clear: both; height: 7px;" ></div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Date Recorded</label>
                <div class="col-md-4">
                    <input id="date_taken" name="date_taken" type="text" placeholder="Date Taken" class="form-control input-md" value="<?php echo date("m/d/Y"); ?>" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Time Recorded</label>
                <div class="col-md-4">
                    <input id="time_taken" name="time_taken" type="text" placeholder="Time Taken" class="form-control input-small" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Level</label>
                <div class="col-md-4">
                    <input id="level" name="level" type="text" placeholder="Glucose Level (Numbers Only)" class="form-control input-md" value="" />
                </div>
            </div>
            <?php /*<div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Notes (Optional)</label>
                <div class="col-md-4">
                    <textarea name="notes" id="notes" class="form-control" rows="5" id="comment"></textarea>
                </div>
            </div>*/ ?>
        </fieldset>
        <a href="javascript:void(0);" onclick="$('#frmAddBill').submit();" class="btn btn-primary">Create Log</a>
        <input type="hidden" name="hash_key_token_cs" id="hash_key_token_cs" value="<?php echo $hash_key; ?>" />
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