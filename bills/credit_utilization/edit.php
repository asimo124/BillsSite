<?php
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;

$sql = "SELECT * FROM cu_loan WHERE id = :id";
$Bill = getQuerySingle($sql, [':id' => $id]);

?>
<!DOCTYPE html>
<html>
<head>
    <title>Charge Catgories</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/css/nav.css" />
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert <?php echo (isset($_REQUEST['error'])) ? "alert-danger" : "alert-success"; ?>" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <form class="form-horizontal" id="frmEditBill" action="proc_edit.php?<?= $searchFilersQueryStr ?>" method="post" >
        <fieldset>
            <!-- Form Name -->
            <legend>Edit Bill</legend>

            <?php include "../../templates/nav.php"; ?>
            <div style="clear: both; height: 7px"></div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Title</label>
                <div class="col-md-4">
                    <input id="title" name="title" type="text" placeholder="Bill Desc" class="form-control input-md" value="<?php echo $Bill['title']; ?>" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Debt Owed</label>
                <div class="col-md-4">
                    <input id="debt_owed" name="debt_owed" type="number" placeholder="Debt Owed" class="form-control input-md" value="<?php echo $Bill['debt_owed']; ?>" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Credit Limit</label>
                <div class="col-md-4">
                    <input id="credit_limit" name="credit_limit" type="number" placeholder="Credit Limit" class="form-control input-md" value="<?php echo $Bill['credit_limit']; ?>" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Sort Order</label>
                <div class="col-md-4">
                    <input id="sort_order" name="sort_order" type="number" placeholder="Sort Order" class="form-control input-md" value="<?php echo $Bill['sort_order']; ?>" />
                </div>
            </div>
            <input type="hidden" name="id" id="id" value="<?php echo $id; ?>" />
        </fieldset>
        <a href="javascript:void(0);" onclick="$('#frmEditBill').submit();" class="btn btn-primary">Update</a>
    </form>

</div>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script>
    $( function() {
       
    } );
</script>
<script src="/js/nav.js" ></script>
