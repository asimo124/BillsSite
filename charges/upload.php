<?php
define(CURRENT_PATH, dirname(__FILE__));
include "../inc/includes.php";

$ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$ipArr = explode(".", $ip);
$userAgentArr = explode(" ", $user_agent);
$string_to_hash = $ip[1] . SALT2 . $userAgentArr[2] . SALT1 . $ip[3] . $userAgentArr[0];
$hash_key = md5($string_to_hash);
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

            <?php include "../templates/nav.php"; ?>
            <div style="clear: both; height: 7px"></div>

            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Paste Code</label>
                <div class="col-md-4">
                    <textarea id="code" name="code" class="form-control input-md"></textarea
                </div>
            </div>
        </fieldset>
        <input type="hidden" name="hash_key_token_cs" id="hash_key_token_cs" value="<?php echo $hash_key; ?>" />
        <a href="javascript:void(0);" onclick="$('#frmUpload').submit();" class="btn btn-primary">Upload</a>
    </form>
</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js" ></script>