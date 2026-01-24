<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";

if (!isset($_SESSION['user'])) {
	header("Location: /login.php");
	exit;
}

$ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$ipArr = explode(".", $ip);
$userAgentArr = explode(" ", $user_agent);
$string_to_hash = $ip[1] . SALT2 . $userAgentArr[2] . SALT1 . $ip[3] . $userAgentArr[0];
$hash_key = md5($string_to_hash);

$query = "SELECT * FROM vnd_bills WHERE is_future = 1 ORDER BY vnd_frequency_value ";
$sth = $db_conn->prepare($query);

$sth->execute();
$expenses = $sth->fetchAll();
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<title>Add Expense</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/nav.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
	$( "[id^=vnd_frequency_value]" ).datepicker({ dateFormat: 'yy-mm-dd' });
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

.expenses_text {

	font-size: 15px;
	padding: 0px;
	width: 100%;
}

.expenses_text2 {

	font-size: 15px;
	margin-left: 4px;
	width: 88%;
}

</style>
</head>
<body>

<?php include "../templates/nav.php"; ?>
<div style="clear: both; height: 7px"></div>

<span class="page_title" >Future Expenses</span>
<div class="clear" style="height: 12px;"></div>

<a href="javascript:void(0);" onclick="$('#frmUpdate').submit();" class="btn">Update All</a>
<div style="clear: both; height: 12px"></div>

<form action="update.php" method="post" name="frmUpdate" id="frmUpdate" >
	<table width="100%" align="left" >
	<?php foreach ($expenses as $get_expense) : ?>
		<tr>
			<td width="22%">
				<?php echo $get_expense['vnd_bill']; ?>
			</td>
			<td width="22%">
				<input type="text" name="vnd_frequency_value[<?php echo $get_expense['vnd_id']; ?>]" id="vnd_frequency_value<?php echo $get_expense['vnd_id']; ?>" value="<?php echo $get_expense['vnd_frequency_value']; ?>" class="expenses_text" />
			</td>
			<td width="22%">
				<input type="text" name="amount[<?php echo $get_expense['vnd_id']; ?>]" id="amount<?php echo $get_expense['vnd_id']; ?>" value="<?php echo $get_expense['amount']; ?>" class="expenses_text2" />
			</td>
			<td width="22%" align="left" style="padding-left: 24px;">
				<input type="checkbox" name="watch_flag[<?php echo $get_expense['vnd_id']; ?>]" id="watch_flag<?php
					echo $get_expense['vnd_id']; ?>" value="1" <?php echo ($get_expense['watch_flag']) ? "CHECKED" : ""; ?> />&nbsp; Watched
			</td>
			<td width="12%">
				<a href="delete.php?vnd_id=<?php echo $get_expense['vnd_id']; ?>&hash_key_token_cs=<?php echo urlencode($hash_key); ?>" class="delete btn" >Delete</a>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
	<input type="hidden" name="hash_key_token_cs" id="hash_key_token_cs" value="<?php echo $hash_key; ?>" />
</form>
	
<form action="save_expense.php" method="post" name="frmAdd" id="frmAdd" >
	<div class="wrapper" >
		
		<span class="page_title" >Add Future Expense</span>
		<div class="clear" style="height: 12px;"></div>

		<?php if (isset($_REQUEST['Message'])) : ?>

			<div class="message" ><?php echo $_REQUEST['Message']; ?></div>
			<div class="clear" style="height: 12px;"></div>
		<?php endif; ?>
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
		
	</div>
</form>
<div style="clear: both; height: 16px;"></div>



<script src="/js/nav.js" ></script>
</body>
</html>