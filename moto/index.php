<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";

if (isset($_REQUEST['send_moto'])) {

    $cur_date2 = isset($_REQUEST['cur_date']) ? $_REQUEST['cur_date'] : date("Y-m-d");
    $balance = isset($_REQUEST['balance']) ? floatval($_REQUEST['balance']) : 0;
    $rate = isset($_REQUEST['rate']) ? floatval($_REQUEST['rate']) : 0;

    if ($rate <= 0) {
        if (strtotime($cur_date2) == 0) {
            echo "Invalid date \n";
            exit;
        }
        if ($balance <= 0) {
            echo "Balance is 0, are you done?. \n";
            exit;
        }

        $cur_date = date("Y-m-d", strtotime($cur_date2));

        $year = date("Y", strtotime($cur_date));
        $month = intval(date("m", strtotime($cur_date)));
        $day = intval(date("d", strtotime($cur_date)));

        $payPeriodsLeft = 1;
        if ($year < 2018) {

            $extraPeriod = 0;
            if ($day < 8) {
                $monthsLastYear = 13 - $month;
            } else {
                $monthsLastYear = 12 - $month;
                $extraPeriod = 0.5;
            }
            $monthsLastYear += $extraPeriod;

            $monthsLeft = 5 + $monthsLastYear;
            $payPeriodsLeft = $monthsLeft * 2;

        } else {

            $extraPeriod = 0;
            if ($day < 8) {
                $monthsThisYear = 6 - $month;
            } else {
                $monthsThisYear = 5 - $month;
                $extraPeriod = 0.5;
            }
            $monthsThisYear += $extraPeriod;

            $payPeriodsLeft = $monthsThisYear * 2;
        }

        $amountPerPeriod = number_format($balance / $payPeriodsLeft, '2', '.', '');

    } else {

        $payPeriods = $balance / $rate;

        $currentDate = date("Y-m-d");
        $currentDay = intval(date("d", strtotime($currentDate)));

        $currentYear = date("Y", strtotime($currentDate));
        $currentMonth = intval(date("m", strtotime($currentDate)));

        $monthsFloat = $payPeriods / 2;
        $monthsInt = intval($payPeriods / 2);

        $addPayPeriod = 0;
        if ($currentDay >= 15) {
            $addDayPeriod = 0.5;
        }
        $monthPaid = $currentMonth + (intval($payPeriods) / 2);
        $dayPaid = 1;
        $yearPaid = $currentYear;
        if ($monthPaid > 12) {
            $monthPaid = $monthPaid - 12;;
            $yearPaid++;
        }
        if ($monthsFloat - $monthsInt > 0.65) {
            $monthPaid += 1;
        } else if ($monthsFloat - $monthsInt > 0.15) {
            $monthPaid += 0.5;
        }
        $monthPaid += $addDayPeriod;
        $monthPaidInt = intval($monthPaid);
        if ($monthPaid - $monthPaidInt > 0) {
            $dayPaid = 15;
        } else {
            $dayPaid = 1;
        }
        $monthsToPay = round($payPeriods / 2, 2);
        $dayPaid = date("m/d/Y", strtotime($yearPaid . "-" . $monthPaidInt . "-" . $dayPaid));
    }
}
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
<link rel="stylesheet" href="/css/nav.css" />
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
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

	<h1>Moto</h1>
	<div style="clear: both; height: 0px;" ></div>

	<?php include "../templates/nav.php"; ?>
	<div style="clear: both; height: 22px;"></div>

    <form action="index.php" name="frmMoto" id="frmMoto" method="post">
        <input type="text" class="txt" name="cur_date" id="cur_date" placeholder="Current Date" value="<?php echo date("m/d/Y"); ?>" />
        <div style="clear: both; height: 7px;" ></div>
        <input type="text" class="txt" name="balance" id="balance" placeholder="Balance" value="" />

        <div style="clear: both; height: 7px;" ></div>
        <input type="text" class="txt" name="rate" id="rate" placeholder="Rate" value="" />

        &nbsp;<a href="javascript:void(0);" style="text-decoration: none;" class="btn send_form" >Submit</a>
        <input type="hidden" name="send_moto" id="send_moto" value="1" />
    </form>
    <?php if (isset($_REQUEST['send_moto'])) { ?>
<pre>
<?php if ($rate <= 0) { ?>
Pay per month: $<?php echo $amountPerPeriod; ?>
<?php } else { ?>
Months will be paid off: <?php echo $monthsToPay . "\n"; ?>
Date will be paid off: <?php echo $dayPaid; ?>
<?php } ?>
</pre>
    <?php } ?>
	<div style="clear: both; height: 7px;" ></div>

</div>



<script src="/js/nav.js" ></script>
<script>

    $(document).ready(function() {

        $( "#cur_date" ).datepicker({ dateFormat: 'mm/dd/yy' });
        if (localStorage.getItem("balance")) {
            $('#balance').val(localStorage.getItem("balance"));
        }

        $('.send_form').click(function() {

            localStorage.setItem("balance", $('#balance').val());
            $('#frmMoto').submit();
        })
    })

</script>
</body>
</html>
