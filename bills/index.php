<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";

$user_id = 1;

$ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$ipArr = explode(".", $ip);
$userAgentArr = explode(" ", $user_agent);
$string_to_hash = $ip[1] . SALT2 . $userAgentArr[2] . SALT1 . $ip[3] . $userAgentArr[0];
$hash_key = md5($string_to_hash);

?>
<!DOCTYPE html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script src="/js/jquery.EqualHeights.js"></script>
<script src="/js/handlebars-v4.0.5.js" type="text/javascript" ></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
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
			url: '/api/saveCurBalance.php?user_id=<?php echo $user_id; ?>&current_balance=' + $('#current_balance').val() + '&hash_key_token_cs=<?php echo urlencode($hash_key); ?>',
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

	$(window).resize(function() {

		fixWidths();
	})

});

function loadBillDates(data) {
	
	var script = $("#show_days").html();
	var template = Handlebars.compile(script);
	$('#days_content').html(template(data));
	
	setMoney();
	//fixHeights();
	fixWidths();
}

function fixWidths() {

	if ($(document).width() >= 600) {
		$('.day_col').each(function() {
			$(this).removeClass("col-xs-4");
			$(this).addClass("col-xs-3");
		})
	} else {
		$('.day_col').each(function() {
			$(this).removeClass("col-xs-3");
			$(this).addClass("col-xs-4");
		})
	}
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

		<div class="row">
			{{#results}}
			<div class="day_col col-md-2 col-sm-2 col-xs-4"  >
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
.container {
	background-color: #FF0000;
}
.row {
	padding-left: 1%;
	padding-right: 1%;
}
.wrapper h1 {
	color: #FFF;
	font-size: 22px;
}
.day_col {
	/*width: 11%;*/
	/*
	float: left;*/
	background-color: #fff;
	border-radius: 10px;
	/*margin: 5px 1% 5px 0;
	padding: 5px;*/
	border: 1px solid  #000;
	margin-bottom: 12px;
	min-height: 150px;
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

a.nav_links:active {
	color: #FFF;
}
a.nav_links:visited {
	color: #FFF;
}
a.nav_links:link {
	color: #FFF;
}
a.nav_links:hover {
	color: #FFF;
}

.nav {
	color: #FFF;
}

</style>

<div class="container" >

	<h1>Pay Period</h1>
	<div style="clear: both; height: 0px;" ></div>

	<div class="nav">
		<a href="/charges" class="nav_links" >Chart</a> | <a href="/expenses" class="nav_links" >Add Expense</a> | <a href="/crons/loadDates.php" class="nav_links" >Dates CRON</a> | <a href="/charges/upload.php" class="nav_links" >Upload</a> | <a href="/charges/cats" class="nav_links" >Categories</a> | <a href="/logout.php" class="nav_links" >Logout</a>
	</div>
	<div style="clear: both; height: 7px"></div>

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
