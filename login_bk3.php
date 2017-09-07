<?php
include("inc/includes.php");

$ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$ipArr = explode(".", $ip);
$userAgentArr = explode(" ", $user_agent);
$string_to_hash = $ip[1] . SALT2 . $userAgentArr[2] . SALT1 . $ip[3] . $userAgentArr[0];
$hash_key = md5($string_to_hash);
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Bills/Health</title>

    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
    <div class="wrapper">
        <form name="frmLogin" id="frmLogin" method="post" action="proc_login.php" >
            <div class="login_container">
                <h1>Login</h1>
                <?php if (isset($_REQUEST['Message'])) : ?>
                    <div class="message" ><?php echo $_REQUEST['Message']; ?></div>
                <?php endif; ?>
                <div style="clear: both; height: 17px"></div>
                Username:
                <div style="clear: both; height: 4px"></div>
                <input type="text" name="username" id="username" value="" />
                <div style="clear: both; height: 17px"></div>
                Password:
                <div style="clear: both; height: 4px"></div>
                <input type="password" name="password" id="password" value="" />
                <div style="clear: both; height: 22px"></div>

                <input type="hidden" name="hash_key_token_cs" id="hash_key_token_cs" value="<?php echo $hash_key; ?>" />
                <button name="btnLogin" id="btnLogin" class="button" type="submit" >Login</button>
            </div>
        </form>
    </div>
</body>
</html>