<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

?>
<!DOCTYPE html>
<html>
<head>
    <title>Credit Utilization</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

    <form class="form-horizontal" id="frmAddBill" action="proc_add.php" method="post" >
        <fieldset>
            <!-- Form Name -->
            <legend>Create Loan/Card</legend>

            <?php include "../../templates/nav.php"; ?>
            <div style="clear: both; height: 7px"></div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Loan/Card</label>
                <div class="col-md-4">
                    <input id="title" name="title" type="text" placeholder="Loan/Card Desc" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Debt Owed</label>
                <div class="col-md-4">
                    <input id="debt_owed" name="debt_owed" type="number" placeholder="Debt Owed" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Credit Limit</label>
                <div class="col-md-4">
                    <input id="credit_limit" name="credit_limit" type="number" placeholder="Credit Limit" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Mininum Payment</label>
                <div class="col-md-4">
                    <input id="min_payment" name="min_payment" type="number" placeholder="Minimum Payment" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Amount Goes To Principal</label>
                <div class="col-md-4">
                    <input id="amount_to_principal" name="amount_to_principal" type="number" placeholder="Amount Goes To Principal" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Sort Order</label>
                <div class="col-md-4">
                    <input id="sort_order" name="sort_order" type="number" placeholder="Sort Order" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Milestone Order</label>
                <div class="col-md-4">
                    <input id="milestone_order" name="milestone_order" type="number" placeholder="Milestone Order" class="form-control input-md" value="" />
                </div>
            </div>
        </fieldset>
        <a href="javascript:void(0);" onclick="$('#frmAddBill').submit();" class="btn btn-primary">Create Loan/Card</a>
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
