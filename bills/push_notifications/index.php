<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$sql = "SELECT * FROM cpap_reminders ORDER BY task_name ASC";
$reminders = getQuery($sql);
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
        <div class="alert alert-success" role="alert">
            <?php echo htmlspecialchars($_REQUEST['Message']); ?>
        </div>
    <?php } ?>

    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 12px"></div>

    <h1>Push Notifications</h1>

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
    });
</script>
</html>
