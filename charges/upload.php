<?php include "../inc/includes.php"; ?>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Charges</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <style type="text/css">
        textarea {
            width: 100%;
            height: 375px;
        }
    </style>
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
    <div class="alert alert-success" role="alert">
        <?php echo $_REQUEST['Message']; ?>
    </div>
    <?php } ?>
    <form class="form-horizontal" id="frmUpload" action="proc_upload.php" method="post" enctype="multipart/form-data">
        <fieldset>
            <!-- Form Name -->
            <legend>Upload Charges</legend>

            <a href="/bills" >Bills</a> | <a href="cats/index.php" >Charge Categories</a> | <a href="/charges" >Chart</a>
            <div style="clear: both; height: 7px"></div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Upload Charge File</label>
                <div class="col-md-4">
                    <input type="file" name="FName" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">OR Paste Code</label>
                <div class="col-md-4">
                    <textarea id="code" name="code" class="form-control input-md"></textarea
                </div>
            </div>
        </fieldset>
        <a href="javascript:void(0);" onclick="$('#frmUpload').submit();" class="btn btn-primary">Upload</a>
    </form>
</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>