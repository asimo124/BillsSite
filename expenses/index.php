<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";

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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
	
<form action="save_expense.php" method="post" name="frmAdd" id="frmAdd" >
	<div class="wrapper" >
		<span class="page_title" >Add Future Expense</span>
		<div class="clear" style="height: 12px;"></div>

		<?php if (isset($_REQUEST['Message'])) : ?>

			<div class="message" ><?php echo $_REQUEST['Message']; ?></div>
			<div class="clear" style="height: 12px;"></div>
		<?php endif; ?>
		<div style="clear: both; height: 12px"></div>

		<a href="/charges" class="nav_links" >Chart</a> | <a href="/bills" class="nav_links" >Bills</a> | <a href="/charges/upload.php" class="nav_links" >Upload</a> | <a href="/charges/cats" class="nav_links" >Categories</a>
		<div style="clear: both; height: 12px"></div>

		Desc:<br>
		<input type="text" name="vnd_bill" id="vnd_bill" value="" class="expense_field" />
		<div class="clear" style="height: 17px;"></div>

		Date:<br>
		<input type="text" name="vnd_frequency_value" id="vnd_frequency_value" value="" class="expense_field" />
		<div class="clear" style="height: 17px;"></div>

		Amount:<br>
		<input type="text" name="amount" id="amount" value="" class="expense_field" />
		<div class="clear" style="height: 17px;"></div>

		<a href="javascript:void(0);" onclick="$('#frmAdd').submit();" class="btn">Add</a>
		<div class="clear" style="height: 12px;"></div>

		<input type="hidden" name="hash_key_token_cs" id="hash_key_token_cs" value="<?php echo $hash_key; ?>" />
		<a href="show_expenses.php">All Future Expenses</a>
	</div>
</form>

</body>
</html>