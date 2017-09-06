<?php
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$curPage = isset($_REQUEST['curPage']) ? intval($_REQUEST['curPage']) : 0;
$numPerPage = 10;
if ($curPage < 1)
    $curPage = 1;

$sql = "SELECT w.*, wt.workout_type, dt.time_desc
        FROM hth_workouts w
        INNER JOIN hth_workout_types wt
          ON w.workout_type_id = wt.id
        INNER JOIN hth_day_times dt
          ON w.workout_time_id = dt.id
        ORDER BY workout_date DESC, workout_time_id DESC
        LIMIT 50";
$resultset = getQuery($sql);

$workout_active = "active";
$meals_active = "";
$pills_active = "";
$bm_active = "";
?>
<!DOCTYPE html>
<html>
<head>
    <title>Charge Catgories</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
</head>
<body>
<div class="container">
    <?php include "../templates/header.php"; ?>

    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h2>Workouts</h2>

    <div style="clear: both; height: 12px"></div>

    <div class="row">
        <div class="col-md-12">
            <a href="add.php" class="btn btn-primary">Create Workout</a>
        </div>
    </div>
    <div style="clear: both; height: 12px"></div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Workout Type</th>
                        <th>Duration</th>
                        <th colspan="2">Actions</th>
                    </tr>
                </thead>
                <tbody>
                <?php if (count($resultset) > 0) { ?>
                    <?php foreach ($resultset as $getWorkout) { ?>
                    <tr>
                        <td><?php echo date("m/d/Y", strtotime($getWorkout['workout_date'])); ?></td>
                        <td><?php echo $getWorkout['workout_type']; ?></td>
                        <td><?php echo $getWorkout['duration_mins']; ?> mins.</td>
                        <td><a href="edit.php?id=<?php echo $getWorkout['id']; ?>" class="btn btn-primary">Edit</a></td>
                        <td><a class="btn btn-primary del_btn" id="" data-id="<?php echo $getWorkout['id']; ?>" data-toggle="modal" data-target="#delWorkout">Delete</a></td>
                    </tr>
                    <?php } ?>
                <?php } else { ?>
                    <tr>
                        <td colspan="5" align="center">No Workouts to Show</td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>

    <form action="delete.php" name="frmDel" id="frmDel" method="post">
        <div class="modal fade" id="delWorkout">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Delete Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you wish to delete this workout?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" id="save_del_btn" data-id="">Delete</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="hidden" name="id" id="del_id" value="" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script>

    $(document).ready(function() {
        $('.del_btn').click(function() {
            $('#del_id').val($(this).attr("data-id"));
        })
    })
</script>