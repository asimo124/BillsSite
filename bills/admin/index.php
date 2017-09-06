<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$sql = "SELECT vnd_id, vnd_bill, amount, vnd_frequency, vnd_frequency_type, vnd_frequency_value
        FROM vnd_bills ORDER BY amount DESC";
$resultset = getQuery($sql);
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
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h2>Bills</h2>

    <div style="clear: both; height: 12px"></div>

    <a href="../../charges/upload.php" >Upload Charges</a> | <a href="/charges/cats" >Charge Categories</a> | <a href="/bills" >Bills</a> | <a href="/charges" >Chart</a>
    <div style="clear: both; height: 12px"></div>

    <div class="row">
        <div class="col-md-12">
            <a href="add.php" class="btn btn-primary">Create Bill</a>
        </div>
    </div>
    <div style="clear: both; height: 12px"></div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Bill</th>
                    <th>Amount</th>
                    <th>Frequency</th>
                    <th>Frequency Info</th>
                    <th colspan="2">Actions</th>
                </tr>
                </thead>
                <tbody>
                <?php if (count($resultset) > 0) { ?>
                    <?php foreach ($resultset as $getBill) { ?>
                        <tr>
                            <td><?php echo $getBill['vnd_id']; ?></td>
                            <td><?php echo $getBill['vnd_bill']; ?></td>
                            <td><?php echo formatCurrency($getBill['amount']); ?></td>
                            <td><?php echo $getBill['vnd_frequency']; ?></td>
                            <td><?php echo $getBill['vnd_frequency_type']; ?>&nbsp(<?php echo $getBill['vnd_frequency_value']; ?>)</td>
                            <td><a href="edit.php?id=<?php echo $getBill['vnd_id']; ?>" class="btn btn-primary">Edit</a></td>
                            <td><a class="btn btn-primary del_btn" data-id="<?php echo $getBill['vnd_id']; ?>" data-toggle="modal" data-target="#delBill">Delete</a></td>
                        </tr>
                    <?php } ?>
                <?php } else { ?>
                    <tr>
                        <td colspan="2" align="center">No Charge Categories to Show</td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>

    <form action="delete.php" name="frmDel" id="frmDel" method="post">
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