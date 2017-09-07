<?php
include "inc/includes.php";

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
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<div class="container">
    <div style="clear: both; height: 17px"></div>
    <form name="frmLogin" id="frmLogin" method="post" action="proc_login.php" >

        <fieldset>
            <!-- Form Name -->
            <legend>Login</legend>
            <?php if (isset($_REQUEST['Message'])) : ?>
                <div class="alert alert-danger" ><?php echo $_REQUEST['Message']; ?></div>
            <?php endif; ?>

            <!-- Text input-->
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Username</label>
                        <div class="col-md-4">
                            <input id="username" name="username" type="text" placeholder="Username" class="form-control input-md">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Password</label>
                        <div class="col-md-4">
                            <input id="password" name="password" type="password" placeholder="Password" class="form-control input-md">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12" style="margin-left: 15px;">
                    <input type="hidden" name="hash_key_token_cs" id="hash_key_token_cs" value="<?php echo $hash_key; ?>" />
                    <button name="btnLogin" id="btnLogin" class="btn btn-primary" type="submit" >Login</button>
                </div>
            </div>
        </fieldset>
    </form>
</div>

</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>