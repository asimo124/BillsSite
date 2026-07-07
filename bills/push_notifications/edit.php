<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;

$sql = "SELECT * FROM cpap_reminders WHERE id = :id";
$reminder = getQuerySingle($sql, [':id' => $id]);

if (!$reminder) {
    header("Location: index.php?Message=" . urlencode("Reminder not found.") . "&error=1");
    exit;
}

$createdAtValue = '';
if (!empty($reminder['created_at'])) {
    $createdAtValue = date('Y-m-d\TH:i:s', strtotime($reminder['created_at']));
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Reminder</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
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

    <form class="form-horizontal" id="frmEditReminder" action="proc_edit.php" method="post">
        <fieldset>
            <legend>Edit Reminder</legend>

            <?php include "../../templates/nav.php"; ?>
            <div style="clear: both; height: 7px"></div>

            <div class="form-group">
                <label class="col-md-4 control-label" for="task_name">Task Name</label>
                <div class="col-md-4">
                    <input id="task_name" name="task_name" type="text" maxlength="120" placeholder="Task Name" class="form-control input-md" value="<?php echo htmlspecialchars($reminder['task_name']); ?>" required />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="task_description">Task Description</label>
                <div class="col-md-4">
                    <textarea id="task_description" name="task_description" rows="4" placeholder="Task Description" class="form-control input-md"><?php echo htmlspecialchars($reminder['task_description']); ?></textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="frequency_days">Frequency (days)</label>
                <div class="col-md-4">
                    <input id="frequency_days" name="frequency_days" type="number" min="1" placeholder="Frequency in days" class="form-control input-md" value="<?php echo htmlspecialchars($reminder['frequency_days']); ?>" required />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="last_confirmed">Last Confirmed</label>
                <div class="col-md-4">
                    <input id="last_confirmed" name="last_confirmed" type="date" class="form-control input-md" value="<?php echo htmlspecialchars($reminder['last_confirmed']); ?>" />
                    <p class="help-block">Leave blank if this task has never been confirmed.</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="created_at">Created At</label>
                <div class="col-md-4">
                    <input id="created_at" name="created_at" type="datetime-local" step="1" class="form-control input-md" value="<?php echo htmlspecialchars($createdAtValue); ?>" />
                    <p class="help-block">Clear to set created_at to NULL.</p>
                </div>
            </div>
            <input type="hidden" name="id" id="id" value="<?php echo $id; ?>" />
        </fieldset>
        <a href="javascript:void(0);" onclick="$('#frmEditReminder').submit();" class="btn btn-primary">Update</a>
    </form>
</div>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js"></script>
</html>
