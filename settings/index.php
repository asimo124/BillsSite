<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";

if (!isset($_SESSION['user'])) {
	header("Location: /login.php");
	exit;
}

$testMode = isset($_SESSION['testMode']) ? $_SESSION['testMode'] : 0;

$ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$ipArr = explode(".", $ip);
$userAgentArr = explode(" ", $user_agent);
$string_to_hash = $ip[1] . SALT2 . $userAgentArr[2] . SALT1 . $ip[3] . $userAgentArr[0];
$hash_key = md5($string_to_hash);
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
$( function() {
	$( "#vnd_frequency_value" ).datepicker({ dateFormat: 'yy-mm-dd' });
} );
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

</style>
</head>
<body>

<div class="container">
    <form action="save_settings.php" method="post" name="frmAdd" id="frmAdd" >
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

            <br>

            Test Mode:
            <div class="btn-group btn-toggle">
                <button class="btn btn-sm <?php echo ($testMode == 1) ? "btn-primary active" : "btn-default" ?>" type="submit" name="turnOn">ON</button>
                <button class="btn btn-sm <?php echo ($testMode == 0) ? "btn-primary active" : "btn-default" ?>" type="submit" name="turnOff">OFF</button>
            </div>
            <br><br>

            <button class="btn btn-primary" type="submit" name="resetDb">Reset Test DB</button>

        </div>
        <input type="hidden" name="hash_key_token_cs" id="hash_key_token_cs" value="<?php echo $hash_key; ?>" />
    </form>
</div>

<script src="/js/nav.js" ></script>
</body>
</html>