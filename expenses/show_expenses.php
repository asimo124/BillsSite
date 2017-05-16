<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";

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
	<title>Document</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
	padding: 4px;
	width: 100%;
}

</style>
</head>
<body>
	

<div class="wrapper" >
	<span class="page_title" >Future Expense</span>
	<div class="clear" style="height: 12px;"></div>

	<?php if (isset($_REQUEST['Message'])) : ?>
		<div class="message" ><?php echo $_REQUEST['Message']; ?></div>
		<div class="clear" style="height: 12px;"></div>
	<?php endif; ?>
	
	<a href="javascript:void(0);" onclick="$('#frmUpdate').submit();" class="btn">Update All</a>

	<form action="update.php" method="post" name="frmUpdate" id="frmUpdate" >
		<table width="100%" align="left" >
		<?php foreach ($expenses as $get_expense) : ?>
			<tr>
				<td width="29%">
					<?php echo $get_expense['vnd_bill']; ?>
				</td>
				<td width="29%">
					<input type="text" name="vnd_frequency_value[<?php echo $get_expense['vnd_id']; ?>]" id="vnd_frequency_value<?php echo $get_expense['vnd_id']; ?>" value="<?php echo $get_expense['vnd_frequency_value']; ?>" class="expenses_text" />
				</td>
				<td width="29%">
					<input type="text" name="amount[<?php echo $get_expense['vnd_id']; ?>]" id="amount<?php echo $get_expense['vnd_id']; ?>" value="<?php echo $get_expense['amount']; ?>" class="expenses_text" />
				</td>
				<td width="12%">
					<a href="delete.php?vnd_id=<?php echo $get_expense['vnd_id']; ?>" class="delete btn" >Delete</a>
				</td>
			</tr>
		<?php endforeach; ?>
		</table>
	</form>
</div>


</body>
</html>