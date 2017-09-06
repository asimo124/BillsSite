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

$sql = "SELECT m.*, dt.time_desc
        FROM hth_meals m
        INNER JOIN hth_day_times dt
          ON m.time_eaten_id = dt.id
        ORDER BY date_eaten DESC, dt.id DESC
        LIMIT 50 ";
$resultset = getQuery($sql);

$workout_active = "";
$meals_active = "active";
$pills_active = "";
$bm_active = "";
?>
<!DOCTYPE html>
<html>
<head>
    <title>Health & Wellness</title>
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

    <h2>Meals</h2>

    <div style="clear: both; height: 12px"></div>

    <div class="row">
        <div class="col-md-12">
            <a href="add.php" class="btn btn-primary">Create Meal</a>
        </div>
    </div>
    <div style="clear: both; height: 12px"></div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Meal Desc</th>
                        <th>Location</th>
                        <th colspan="2">Actions</th>
                    </tr>
                </thead>
                <tbody>
                <?php if (count($resultset) > 0) { ?>
                    <?php foreach ($resultset as $getMeal) { ?>
                    <tr>
                        <td><?php echo date("m/d/Y", strtotime($getMeal['date_eaten'])); ?></td>
                        <td><?php echo substr($getMeal['meal_desc'], 0, 15); ?>...</td>
                        <td><?php echo ($getMeal['ate_out'] == "1") ? "Outside" : "Home-cooked"; ?></td>
                        <td><a href="edit.php?id=<?php echo $getMeal['id']; ?>" class="btn btn-primary">Edit</a></td>
                        <td><a class="btn btn-primary del_btn" id="" data-id="<?php echo $getMeal['id']; ?>" data-toggle="modal" data-target="#delMeal">Delete</a></td>
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
        <div class="modal fade" id="delMeal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Delete Meal</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you wish to delete this meal?</p>
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