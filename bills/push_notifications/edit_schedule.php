<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;

$schedule = getQuerySingle("SELECT * FROM push_notification_schedule WHERE id = :id", [':id' => $id]);

if (!$schedule) {
    header("Location: index.php?tab=schedules&Message=" . urlencode("Schedule not found.") . "&error=1");
    exit;
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Schedule</title>
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

    <form class="form-horizontal" id="frmEditSchedule" action="proc_edit_schedule.php" method="post">
        <fieldset>
            <legend>Edit Schedule</legend>

            <?php include "../../templates/nav.php"; ?>
            <div style="clear: both; height: 7px"></div>

            <div class="form-group">
                <label class="col-md-4 control-label" for="title">Title</label>
                <div class="col-md-4">
                    <input id="title" name="title" type="text" maxlength="120" placeholder="Title" class="form-control input-md" value="<?php echo htmlspecialchars($schedule['title']); ?>" required />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label">Times</label>
                <div class="col-md-4">
                    <p class="help-block" style="margin-top: 0;">Minute (0–59) and hour (0–23). Day, month, and weekday stay <code>* * *</code>.</p>
                    <div id="cron_times"></div>
                    <button type="button" id="add_cron_time" class="btn btn-primary">+</button>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="cron_schedule">Cron Schedule</label>
                <div class="col-md-4">
                    <textarea id="cron_schedule" name="cron_schedule" rows="8" class="form-control input-md" readonly required><?php echo htmlspecialchars($schedule['cron_schedule']); ?></textarea>
                </div>
            </div>
            <input type="hidden" name="id" id="id" value="<?php echo $id; ?>" />
        </fieldset>
        <a href="javascript:void(0);" onclick="$('#frmEditSchedule').submit();" class="btn btn-primary">Update</a>
        <a href="index.php?tab=schedules" class="btn btn-default">Cancel</a>
    </form>
</div>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js"></script>
<script src="/js/push_notification_schedule.js"></script>
<script>
    $(document).ready(function() {
        $('#cron_times').cronTimeBuilder();
    });
</script>
</html>
