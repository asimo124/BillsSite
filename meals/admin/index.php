<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /bills/admin/login.php");
    exit;
}

?>
<!DOCTYPE html>
<html>
<head>
    <title>Meals</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h2>Meals</h2>

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav2.php"; ?>
    <div style="clear: both; height: 7px"></div>

<!--    <div class="row">-->
<!--        <div class="col-md-12">-->
<!--            <a href="add.php" class="btn btn-primary">Create</a>-->
<!--        </div>-->
<!--    </div>-->
<!--    <div style="clear: both; height: 12px"></div>-->


    <div style="clear: both; height: 15px;"></div>
    <form action="index.php" method="POST" >
        <div class="row">
            <div class="col-md-3 col-xs-4">

            </div>
        </div>
        <div style="clear: both; height: 15px;"></div>
        <div class="row">
            <div class="col-md-2">

            </div>
        </div>
        <button type="submit" class="btn btn-primary" name="btnSearch">Search</button>
        <div style="clear: both; height: 7px;"></div>
    </form>

    <div class="row">
        <div class="col-md-12">

        </div>
    </div>

    <form action="delete.php" name="frmDel" id="frmDel" method="post">
        <div class="modal fade" id="delBill">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Delete</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you wish to delete?</p>
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
<script src="/js/nav.js" ></script>
<script>

    $(document).ready(function() {
        $('.del_btn').click(function() {
            $('#del_id').val($(this).attr("data-id"));
        })
    })
</script>