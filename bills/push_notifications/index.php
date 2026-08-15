<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$activeTab = (isset($_REQUEST['tab']) && $_REQUEST['tab'] === 'schedules') ? 'schedules' : 'notifications';

$sql = "SELECT pn.*, pns.title AS schedule_title
        FROM push_notification pn
        LEFT JOIN push_notification_schedule pns ON pns.id = pn.schedule_id
        ORDER BY pn.task_name ASC";
$reminders = getQuery($sql);

$schedules = getQuery("SELECT * FROM push_notification_schedule ORDER BY title ASC");
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
    <link rel="stylesheet" href="/css/bills_admin.css" />
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;"></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert <?php echo (isset($_REQUEST['error'])) ? "alert-danger" : "alert-success"; ?>" role="alert">
            <?php echo htmlspecialchars($_REQUEST['Message']); ?>
        </div>
    <?php } ?>

    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 12px"></div>

    <h1>Push Notifications</h1>

    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="<?php echo $activeTab === 'notifications' ? 'active' : ''; ?>">
            <a href="#pushNotifications" aria-controls="pushNotifications" role="tab" data-toggle="tab">Push Notifications</a>
        </li>
        <li role="presentation" class="<?php echo $activeTab === 'schedules' ? 'active' : ''; ?>">
            <a href="#schedules" aria-controls="schedules" role="tab" data-toggle="tab">Schedules</a>
        </li>
    </ul>

    <div class="tab-content" style="margin-top: 20px;">
        <div role="tabpanel" class="tab-pane <?php echo $activeTab === 'notifications' ? 'active' : ''; ?>" id="pushNotifications">
            <div class="row">
                <div class="col-md-12">
                    <a href="add.php" class="btn btn-primary">Create Reminder</a>
                </div>
            </div>
            <div style="clear: both; height: 16px;"></div>

            <div class="row">
                <div class="col-md-12">
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th>Task Name</th>
                            <th>Description</th>
                            <th>Frequency (days)</th>
                            <th>Schedule</th>
                            <th>Last Confirmed</th>
                            <th>Created At</th>
                            <th colspan="2">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($reminders as $reminder) : ?>
                            <tr>
                                <td><?php echo htmlspecialchars($reminder['task_name']); ?></td>
                                <td><?php echo htmlspecialchars($reminder['task_description']); ?></td>
                                <td><?php echo htmlspecialchars($reminder['frequency_days']); ?></td>
                                <td>
                                    <form action="proc_update_schedule.php" method="post" style="margin: 0;">
                                        <input type="hidden" name="id" value="<?php echo $reminder['id']; ?>" />
                                        <select name="schedule_id" class="form-control" onchange="this.form.submit()">
                                            <option value="">— None —</option>
                                            <?php foreach ($schedules as $schedule) : ?>
                                                <option value="<?php echo $schedule['id']; ?>" <?php echo ((int)$reminder['schedule_id'] === (int)$schedule['id']) ? 'selected' : ''; ?>>
                                                    <?php echo htmlspecialchars($schedule['title']); ?>
                                                </option>
                                            <?php endforeach; ?>
                                        </select>
                                    </form>
                                </td>
                                <td><?php echo $reminder['last_confirmed'] ? htmlspecialchars($reminder['last_confirmed']) : '—'; ?></td>
                                <td><?php echo $reminder['created_at'] ? htmlspecialchars($reminder['created_at']) : '—'; ?></td>
                                <td><a href="edit.php?id=<?php echo $reminder['id']; ?>" class="btn btn-primary">Edit</a></td>
                                <td><a class="btn btn-primary del_btn" data-id="<?php echo $reminder['id']; ?>" data-toggle="modal" data-target="#delReminder">Delete</a></td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div role="tabpanel" class="tab-pane <?php echo $activeTab === 'schedules' ? 'active' : ''; ?>" id="schedules">
            <div class="row">
                <div class="col-md-12">
                    <a href="add_schedule.php" class="btn btn-primary">Create Schedule</a>
                </div>
            </div>
            <div style="clear: both; height: 16px;"></div>

            <div class="row">
                <div class="col-md-12">
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th>Title</th>
                            <th>Cron Schedule</th>
                            <th colspan="2">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($schedules as $schedule) : ?>
                            <tr>
                                <td><?php echo htmlspecialchars($schedule['title']); ?></td>
                                <td><pre style="margin: 0; white-space: pre-wrap;"><?php echo htmlspecialchars($schedule['cron_schedule']); ?></pre></td>
                                <td><a href="edit_schedule.php?id=<?php echo $schedule['id']; ?>" class="btn btn-primary">Edit</a></td>
                                <td><a class="btn btn-primary del_sched_btn" data-id="<?php echo $schedule['id']; ?>" data-toggle="modal" data-target="#delSchedule">Delete</a></td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <form action="delete.php" name="frmDel" id="frmDel" method="post">
        <div class="modal fade" id="delReminder">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Delete Reminder</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you wish to delete this reminder?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" id="save_del_btn">Delete</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="hidden" name="id" id="del_id" value="" />
                    </div>
                </div>
            </div>
        </div>
    </form>

    <form action="delete_schedule.php" name="frmDelSched" id="frmDelSched" method="post">
        <div class="modal fade" id="delSchedule">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Delete Schedule</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you wish to delete this schedule?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Delete</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="hidden" name="id" id="del_sched_id" value="" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js"></script>
<script>
    $(document).ready(function() {
        $('.del_btn').click(function() {
            $('#del_id').val($(this).attr("data-id"));
        });
        $('.del_sched_btn').click(function() {
            $('#del_sched_id').val($(this).attr("data-id"));
        });
    });
</script>
</html>
