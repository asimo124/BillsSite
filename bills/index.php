<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";

$user_id = 1;
?>
<!DOCTYPE html>
<head>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script src="/js/jquery.EqualHeights.js"></script>
<script src="/js/handlebars-v4.0.5.js" type="text/javascript" ></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
	$( "#pay_date" ).datepicker({ dateFormat: 'yy-mm-dd' });
} );

$(document).ready(function() {

	window.current_balance = 960;
	$.ajax({
		url: '/api/getCurBalance.php?user_id=<?php echo $user_id; ?>',
		type: "GET",
		dataType: "json",
		success: function (data) {
	
			$.each(data, function(key, value) {
				window.current_balance = value;	
				$('#current_balance').val(window.current_balance);
				return false;
			});
			
			$.ajax({
				url: '/api/loadBillDates.php?user_id=<?php echo $user_id; ?>&current_balance=' + window.current_balance + '&pay_date=' + $('#pay_date').val(),
				type: "GET",
				dataType: "json",
				success: function (data) {
					loadBillDates(data);
				}
			});
		}
	});

	$('.send_form').click(function() {
		$.ajax({
			url: '/api/saveCurBalance.php?user_id=<?php echo $user_id; ?>&current_balance=' + $('#current_balance').val(),
			type: "GET",
			dataType: "json",
			success: function (data) {
				$.ajax({
					url: '/api/loadBillDates.php?user_id=<?php echo $user_id; ?>&current_balance=' + $('#current_balance').val() + '&pay_date=' + $('#pay_date').val(),
					type: "GET",
					dataType: "json",
					success: function (data) {
						loadBillDates(data);
					}
				});
			}
		});
	});
});

function loadBillDates(data) {
	
	var script = $("#show_days").html();
	var template = Handlebars.compile(script);
	$('#days_content').html(template(data));
	
	setMoney();
	fixHeights();
}

function fixHeights() {
		
	var max_height = 0;
	$('.day_col').each(function() {
		if ($(this).height() > max_height) {
			max_height = $(this).height();
		}
	});
	$('.day_col').each(function() {
		$(this).css("min-height", max_height + "px")
	});
}

function setMoney() {
	
	$('.use_money').each(function() {
		var temp_val = $(this).html();
		if (temp_val.indexOf('$') == -1) {
			$(this).html(formatMoney(temp_val));
		}
	});
}

function formatMoney(number2) {
	if (!isNaN(number2)) {
		number3 = Number(number2)	
	}
	else {
		number3 = 0	
	}
	number3 = number3.toFixed(2);
	number3 = numberWithCommas(number3);
	number3 = "$" + number3;
	return number3;
}

function numberWithCommas (x) {
	var parts = x.toString().split(".");
	parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	return parts.join(".");
}
	
</script>
<script id="show_days" type="text/x-handlebars-template">
	<div class="week_row" data-equal="div">
		{{#results}}
		<div class="day_col"  >
			<span ><strong>{{Day}}</strong></span>
			<div style="clear: both; height: 15px;" ></div>
			{{{desc}}}
			<div style="clear: both; height: 7px;" ></div>
			<strong style="color: #FF0000;">Balance:</strong> <span class="use_money" style="font-weight: bold;" >{{Balance}}</span>
		</div>
		{{/results}}
		<div style="clear: both; height: 22px;" ></div>
	</div>
</script>

<body>

<style type="text/css">

body {
	
	background-color: #000;
}

body, table, tr, td, th {
	
	font-size: 13px;
	font-family: Verdana;
}

.wrapper {
	
	width: 97%;
	min-height: 150px;
	margin: 30px auto 0;
	padding: 4px 15px 15px;
	background-color: #FF0000;
	border-radius: 10px;
}

.wrapper h1 {
	
	color: #FFF;
	font-size: 22px;
}

.day_col {

	width: 11%;
	min-height: 150px;
	float: left;
	background-color: #fff;
	border-radius: 10px;
	margin: 5px 1% 5px 0;
	padding: 5px;
	border: 4px solid  #000;
}

.btn {
	
	background-color: #000;
	border-radius: 5px;
	color: #FFF;
	font-weight: bold;
	padding: 4px 7px;
}

.txt {
	
	border-radius: 5px;
}

</style>

<div class="wrapper" >

	<h1>Pay Period</h1>
	<div style="clear: both; height: 0px;" ></div>
	
	<input type="text" class="txt" name="current_balance" id="current_balance" placeholder="Current Bank Balance" value="<?php echo $current_balance; ?>" />
    <div style='clear: both; height: 7px;' ></div>
    <input type="text" class="txt" name="pay_date" id="pay_date" placeholder="Pay Period" value="" />
    &nbsp;<a href="javascript:void(0);" style="text-decoration: none;" class="btn send_form" >Submit</a>
	<div style="clear: both; height: 7px;" ></div>
	
	<div id="days_content">
	
	</div>
</div>




</body>
</html>
