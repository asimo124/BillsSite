<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$defaultCreatedAt = date('Y-m-d\TH:i');
?>
<!DOCTYPE html>
<html>
<head>
    <title>Push Notifications</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;"></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert <?php echo (isset($_REQUEST['error'])) ? "alert-danger" : "alert-success"; ?>" role="alert">
            <?php echo htmlspecialchars($_REQUEST['Message']); ?>
        </div>
    <?php } ?>

    <form class="form-horizontal" id="frmAddReminder" action="proc_add.php" method="post">
        <fieldset>
            <legend>Create Reminder</legend>

            <?php include "../../templates/nav.php"; ?>
            <div style="clear: both; height: 7px"></div>

            <div class="form-group">
                <label class="col-md-4 control-label" for="task_name">Task Name</label>
                <div class="col-md-4">
                    <input id="task_name" name="task_name" type="text" maxlength="120" placeholder="Task Name" class="form-control input-md" value="" required />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="task_description">Task Description</label>
                <div class="col-md-4">
                    <textarea id="task_description" name="task_description" rows="4" placeholder="Task Description" class="form-control input-md"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="frequency_days">Frequency (days)</label>
                <div class="col-md-4">
                    <input id="frequency_days" name="frequency_days" type="number" min="1" placeholder="Frequency in days" class="form-control input-md" value="" required />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="last_confirmed">Last Confirmed</label>
                <div class="col-md-4">
                    <input id="last_confirmed" name="last_confirmed" type="date" class="form-control input-md" value="" />
                    <p class="help-block">Leave blank if this task has never been confirmed.</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="created_at">Created At</label>
                <div class="col-md-4">
                    <input id="created_at" name="created_at" type="datetime-local" step="1" class="form-control input-md" value="<?php echo $defaultCreatedAt; ?>" />
                    <p class="help-block">Defaults to the current date and time. Clear to let the database set it automatically.</p>
                </div>
            </div>
        </fieldset>
        <a href="javascript:void(0);" onclick="$('#frmAddReminder').submit();" class="btn btn-primary">Create Reminder</a>
    </form>
</div>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js"></script>
</html>
