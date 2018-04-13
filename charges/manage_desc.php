<?php
    include "../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$sql = "SELECT * FROM vnd_bills_charge_description_categories ORDER BY `desc`, min_range, max_range ";
$resultset = getQuery($sql);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Charges</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/css/nav.css" />

</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <h1>Categorize Charges</h1>
    <div style="clear: both; height: 20px;" ></div>

    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <?php include "../templates/nav.php"; ?>
    <div style="clear: both; height: 7px"></div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>Desc</th>
                    <th>Min Range</th>
                    <th>Max Range</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <?php if (count($resultset) > 0) { ?>
                    <?php foreach ($resultset as $getDesc) { ?>
                        <tr>
                            <td><?php echo $getDesc['desc']; ?></td>
                            <td><?php echo $getDesc['min_range']; ?></td>
                            <td><?php echo $getDesc['max_range']; ?></td>
                            <td><a class="btn btn-primary del_btn" data-id="<?php echo $getDesc['id']; ?>" data-toggle="modal" data-target="#delBill">Delete</a></td>
                        </tr>
                    <?php } ?>
                <?php } else { ?>
                    <tr>
                        <td colspan="2" align="center">No Descs to Show</td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<form action="delete_desc.php" name="frmDel" id="frmDel" method="post">
    <div class="modal fade" id="delBill">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Delete Bill</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you wish to delete this Bill?</p>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="save_del_btn" data-id="">Delete</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="hidden" name="id" id="del_id" value="" />
                </div>
            </div>
        </div>
    </div>
</form>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js" ></script>
<script>

    $(document).ready(function() {
        $('.del_btn').click(function() {
            $('#del_id').val($(this).attr("data-id"));
        })
    })
</script>