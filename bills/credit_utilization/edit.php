<?php
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;

$sql = "SELECT * FROM cu_loan WHERE id = :id";
$Loan = getQuerySingle($sql, [':id' => $id]);

$sql = "SELECT * FROM vnd_bills ORDER BY vnd_bill ASC";
$Bills = getQuery($sql);

?>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Loan/Card</title>
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
            <legend>Edit Loan/Card</legend>

            <?php include "../../templates/nav.php"; ?>
            <div style="clear: both; height: 7px"></div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Title</label>
                <div class="col-md-4">
                    <input id="title" name="title" type="text" placeholder="Bill Desc" class="form-control input-md" value="<?php echo $Loan['title']; ?>" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Debt Owed</label>
                <div class="col-md-4">
                    <input id="debt_owed" name="debt_owed" type="number" placeholder="Debt Owed" class="form-control input-md" value="<?php echo $Loan['debt_owed']; ?>" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Credit Limit</label>
                <div class="col-md-4">
                    <input id="credit_limit" name="credit_limit" type="number" placeholder="Credit Limit" class="form-control input-md" value="<?php echo $Loan['credit_limit']; ?>" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Minimum Payment</label>
                <div class="col-md-4">
                    <input id="min_payment" name="min_payment" type="number" placeholder="Minimum Payment" class="form-control input-md" value="<?php echo $Loan['min_payment']; ?>" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Amount Goes To Principal</label>
                <div class="col-md-4">
                    <input id="amount_to_principal" name="amount_to_principal" type="number" placeholder="Amount Goes To Principal" class="form-control input-md" value="<?php echo $Loan['amount_to_principal']; ?>" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Vnd Bill</label>
                <div class="col-md-4">
                    <select name="bill_id" id="bill_id" class="form-control" >
                        <?php foreach ($Bills as $Bill) { ?>
                            <option value="<?php echo $Bill['vnd_id']; ?>" <?php echo ($Loan['bill_id'] == $Bill['vnd_id']) ? "SELECTED" : ""; ?>><?php echo $Bill['vnd_bill']; ?></option>
                        <?php } ?>
                    </select>
                </div> 
            </div>

            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Adjustment to Disposable Income</label>
                <div class="col-md-4">
                    <input id="adjust_disposable_amount" name="adjust_disposable_amount" type="number" placeholder="Disposable Income Adjustment" class="form-control input-md" value="<?php echo $Loan['adjust_disposable_amount']; ?>" />
                    <p class="help-block">This is the amount that will be added to the disposable income. This is in addition to the minimum payment.</p>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Should Update End Date?</label>
                <div class="col-md-4" style="padding-top: 4px;">
                    <input type="checkbox" name="can_update_end_date" id="can_update_end_date" value="1" <?php echo ($Loan['can_update_end_date'] == 1) ? "CHECKED" : ""; ?> />&nbsp;
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Sort Order</label>
                <div class="col-md-4">
                    <input id="sort_order" name="sort_order" type="number" placeholder="Sort Order" class="form-control input-md" value="<?php echo $Loan['sort_order']; ?>" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Milestone Order</label>
                <div class="col-md-4">
                    <input id="milestone_order" name="milestone_order" type="number" placeholder="Milestone Order" class="form-control input-md" value="<?php echo $Loan['milestone_order']; ?>" />
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
