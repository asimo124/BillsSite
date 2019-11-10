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

$sql = "SELECT * FROM glu_log_notes WHERE log_id = :id ";
$Notes = getQuery($sql, [
    "id" => $id
]);

$hash_key_token_cs  = isset($_REQUEST['hash_key_token_cs']) ? ($_REQUEST['hash_key_token_cs']) : "";

$ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$ipArr = explode(".", $ip);
$userAgentArr = explode(" ", $user_agent);
$string_to_hash = $ip[1] . SALT2 . $userAgentArr[2] . SALT1 . $ip[3] . $userAgentArr[0];
$hash_key = md5($string_to_hash);

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
        </fieldset>
    </form>

    <form class="form-horizontal" id="frmAddNote" action="proc_add_note.php" method="post" >
        <fieldset>
            <!--<legend>View Log</legend>-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Add New Note:</label>
                <div class="col-md-4">
                    <textarea name="notes" id="notes" class="form-control" rows="5" id="comment"></textarea>
                </div>
                <div style="clear: both; height: 7px;" ></div>
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <input type="hidden" name="log_id" id="log_id" value="<?php echo $id; ?>" />
                    <a href="javascript:void(0);" onclick="$('#frmAddNote').submit();" class="btn btn-primary">Add</a>
                </div>
            </div>
            <input type="hidden" name="hash_key_token_cs" id="hash_key_token_cs" value="<?php echo $hash_key; ?>" />
        </fieldset>
    </form>

    <?php foreach ($Notes as $getNote) { ?>
        <form class="form-horizontal" id="frmEditBill<?php echo $getNote['id']; ?>" action="proc_edit_note.php" method="post" >
            <fieldset>
                <!--<legend>View Log</legend>-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Note: <?php echo date("m/d/Y g:i A", strtotime($getNote['date_entered'])); ?></label>
                    <div class="col-md-4">
                        <textarea name="notes" id="notes" class="form-control" rows="5" id="comment"><?php echo $getNote['note']; ?></textarea>
                    </div>
                    <div style="clear: both; height: 7px;" ></div>
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <input type="hidden" name="log_id" id="log_id" value="<?php echo $id; ?>" />
                        <input type="hidden" name="id" id="id" value="<?php echo $getNote['id']; ?>" />
                        <a href="javascript:void(0);" onclick="$('#frmEditBill<?php echo $getNote['id']; ?>').submit();" class="btn btn-primary">Update</a>&nbsp; <a href="delete_note.php?id=<?php echo $getNote['id']; ?>&log_id=<?php echo $id; ?>&hash_key_token_cs=<?php echo $hash_key; ?>" class="btn btn-info">Delete</a>
                    </div>
                </div>
                <input type="hidden" name="hash_key_token_cs" id="hash_key_token_cs" value="<?php echo $hash_key; ?>" />
            </fieldset>
        </form>
    <?php } ?>
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