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

    <div class="row">
        <div class="col-md-12">
            <form>
                <fieldset>
                    <!-- Form Name -->
                    <legend>Track Bills</legend>

                    <?php include "../../templates/nav.php"; ?>
                    <div style="clear: both; height: 7px"></div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Input Transactions</label>
                        <div class="col-md-4">
                            <textarea id="transactions" name="transactions" type="text" placeholder="Transactions" class="form-control input-md" style="width: 100%; height: 125px;"></textarea>
                        </div>
                    </div>
                </fieldset>
                <a href="javascript:void(0);" onclick="" class="btn btn-primary">Submit</a>
            </form>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js" ></script>
<script>

</script>