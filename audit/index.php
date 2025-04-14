<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";

if (!isset($_SESSION['user'])) {
	header("Location: /login.php");
	exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<title>Document</title>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/css/nav.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

</script>
<style type="text/css">

body {
	font-size: 15px;
	font-family: Verdana;
	color: #333;
}

.wrapper {
	width: 96%;
	min-height: 16px;
	margin-top: 20px;
}

input.expense_field {

	width: 90%;
	height: 16px;
	padding: 4px;
	font-size: 15px;
	color: #666666;
}

.page_title {

	font-size: 22px;
	font-weight: bold;
}

.clear {
	clear: both;
}

a.btn {

	background-color: #333;
	color: #fff;
	padding: 7px;
	border-radius: 5px;
}

.message {

	color: #FF0000;
	font-weight: bold;
}

.text-content {
    border: 1px solid #ddd;
    width: 100%;
    border-radius: 8px;
    height: 175px;

}

</style>
</head>
<body>

<div class="container">
    <form action="proc_audit.php" method="post" name="frmAdd" id="frmAdd" >
        <div class="wrapper" >
            <span class="page_title" >Add Future Expense</span>
            <div class="clear" style="height: 12px;"></div>

            <?php if (isset($_REQUEST['Message'])) : ?>

                <div class="message" ><?php echo $_REQUEST['Message']; ?></div>
                <div class="clear" style="height: 12px;"></div>
            <?php endif; ?>
            <div style="clear: both; height: 12px"></div>

            <?php include "../templates/nav.php"; ?>
            <div style="clear: both; height: 7px"></div>

            <h3>Audit Expenses</h3>

            <p>Upload Chase Data File Here</p>
            <form action="proc_audit.php" method="post" enctype="multipart/form-data" id="chaseForm">
                <div class="row">
                    <div class="col-xs-12">
                        <input type="file" name="fileToUpload" id="fileToUpload">
                    </div>
                </div>
                <div style="clear: both; height: 16px;"></div>
                <div class="row">
                    <div class="col-xs-12">
                        <input type="submit" class="btn btn-primary submitContent" value="Submit" />
                    </div>
                </div>
            </form>

        </div>
    </form>
</div>

<script src="/js/nav.js" ></script>
<script type="text/javascript">

</script>
</body>
</html>