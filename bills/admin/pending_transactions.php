<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

?>
<!DOCTYPE html>
<html>
<head>
    <title>Charge Catgories</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <!-- Font Awesome for hamburger icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="/css/bills_admin.css" />
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h2>Pending Transactions</h2>

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 24px"></div>

    <form action="proc_pending_transactions.php" method="post" id="pending_transactions_form">
        <input type="hidden" name="action" value="save_pending_transactions" />
        <div class="row">
            <div class="col-xs-12">
                <label for="init_balance" class="control-label">Current Balance:</label><br>
                <input type="text" name="cur_balance" class="form-control" placeholder="Current Balance" id="init_balance" style="width: 325px; " />
            </div>
            <div class="col-xs-12">
                <label for="init_balance" class="control-label">Pending Transactions:</label><br>
                <textarea class="form-control" name="pending_transactions" placeholder="Pending Transactions" id="pending_transactions" style="width: 325px" rows="20"></textarea>
            </div>
            <div class="col-xs-12">
                <button class="btn btn-primary" id="calculate_balance">Calculate Balance</button>
            </div>
        </div>
        <div style="clear: both; height: 16px;"></div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js" ></script>
<script>

    $(document).ready(function() {


    })
</script>