<?php
$test_mode = 0;
ini_set("display_errors", 1);
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$title_lookup_rocket_money_titles = isset($_POST['title_lookup_rocket_money_titles']) ? $_POST['title_lookup_rocket_money_titles'] : [];
$title_lookup_expenses_app_titles = isset($_POST['title_lookup_expenses_app_titles']) ? $_POST['title_lookup_expenses_app_titles'] : [];

$file = isset($_POST['file']) ? $_POST['file'] : '';
if (!$file) {
    header("Location: audit_expenses_v2.php?error=" . urlencode("No file specified for processing."));
    exit;
}

//*/
$amountMaxDiff = 2;
$daysMaxDiff = 4;
/*/
$rangeAmountLow = 0.01;
$rangeAmountHigh = 0.01;
$rangeDateLow = 0.01;
$rangeDateHigh = 0.01;
//*/

$resultsArr = [];
$sql = "SELECT b.vnd_id 
        , b.vnd_bill as title 
        , b.vnd_frequency_value as day_of_month
        , b.amount
        FROM vnd_bills b
        WHERE 1 
        AND b.vnd_frequency = 'Once Per Month'
        AND b.vnd_frequency_type = 'Day of Month'
        AND IFNULL(vnd_frequency_value, '') <> ''
        ORDER BY b.vnd_frequency_value ASC ";

$results = getQuery($sql);

foreach ($results as $row) {
    if (in_array($row['title'], $title_lookup_expenses_app_titles)) {
        $resultsArr[$row['title']] = $row;
    }
}



$rocketMoneyResults = [];
$i = 0;
$keys = [];

$fh = fopen($file, 'r');
while (($line = fgetcsv($fh)) !== false) {
    
    if ($i == 0) {
        $keys = $line;
        $i++;
        continue;
    }
    
    $eachItem = [];
    foreach ($line as $index => $value) {
        $eachItem[$keys[$index]] = $value;
    }

    $rocketMoneyResults[] = $eachItem;
    $i++;
}
fclose($fh);

$rocketMoneyResultsArr = [];
foreach ($rocketMoneyResults as $index => $rocketRow) {

    if (in_array($rocketRow['Name'], $title_lookup_rocket_money_titles)) {
        $rocketMoneyResultsArr[$rocketRow['Name']] = $rocketRow;
    }
}

$items = [];
foreach ($rocketMoneyResultsArr as $rocketTitle => $rocketRow) {

    $rocketIndex = -1;
    foreach ($title_lookup_rocket_money_titles as $index => $lookupTitle) {
        if ($rocketTitle == $lookupTitle) {
            $rocketIndex = $index;
            break;
        }
    }

    $expensesAppTitle = '';
    if ($rocketIndex > -1) {
        $expensesAppTitle = $title_lookup_expenses_app_titles[$rocketIndex];
    }

    $eachItem = [];
    $eachItem['Rocket Money Title'] = $rocketTitle;
    $eachItem['Expenses App Title'] = $expensesAppTitle;
    $eachItem['Rocket Money Amount'] = '$' . number_format($rocketRow['Amount'], 2);
    $eachItem['Expenses App Amount'] = '$' . number_format(isset($resultsArr[$expensesAppTitle]) ? $resultsArr[$expensesAppTitle]['amount'] : 0, 2);
    $eachItem['Rocket Money Date'] = intval(date("d", strtotime($rocketRow['Date'])));
    $eachItem['Expenses App Day of Month'] = isset($resultsArr[$expensesAppTitle]) ? $resultsArr[$expensesAppTitle]['day_of_month'] : 'N/A';
    $valid = validateRow($eachItem);
    $eachItem['Valid'] = $valid;

    $items[] = $eachItem;
}

function validateRow($row) {

    global $amountMaxDiff, $daysMaxDiff;

    $rocketMoneyAmount = floatval(str_replace(['$', ','], '', $row['Rocket Money Amount']));
    $expensesAppAmount = floatval(str_replace(['$', ','], '', $row['Expenses App Amount']));

    

    if (abs($rocketMoneyAmount - $expensesAppAmount) > $amountMaxDiff) {
        return false;
    }
    

    $rocketMoneyDate = intval($row['Rocket Money Date']);
    $expensesAppDate = intval($row['Expenses App Day of Month']);
    

    if (abs($rocketMoneyDate - $expensesAppDate) > $daysMaxDiff) {
        return false;
    }

    return true;
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Income Purchases</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <!-- Font Awesome for hamburger icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="/css/bills_admin.css" />
    <link rel="stylesheet" href="/css/income_purchases.css?version=1" />
</head>
<body>
<div class="container" id="app">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>
    <?php if (isset($_REQUEST['error'])) { ?>
        <div class="alert alert-danger" role="alert">
            <?php echo $_REQUEST['error']; ?>
        </div>
    <?php } ?>
    
    <h2>Process Audit Expenses V2</h2>

    <div style="clear: both; height: 12px"></div>


    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 24px"></div>

    <a href="javascript:void(0);" onclick="window.history.back();">&laquo; Back</a>
    <div style="clear: both; height: 12px"></div>

    <div class="row">
        <div class="col-xs-12" >
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Rocket Money Title</th>
                        <th>Expenses App Title</th>
                        <th>Rocket Money Amount</th>
                        <th>Expenses App Amount</th>
                        <th>Rocket Money Date</th>
                        <th>Expenses App Day of Month</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($items as $item) { ?>
                        <tr style="background-color: <?php echo $item['Valid'] ? '#ffffff' : '#f8d7da'; ?>;">
                            <td style="background-color: <?php echo $item['Valid'] ? '#ffffff' : '#f8d7da'; ?>;"><?php echo htmlspecialchars($item['Rocket Money Title']); ?></td>
                            <td style="background-color: <?php echo $item['Valid'] ? '#ffffff' : '#f8d7da'; ?>;"><?php echo htmlspecialchars($item['Expenses App Title']); ?></td>
                            <td style="background-color: <?php echo $item['Valid'] ? '#ffffff' : '#f8d7da'; ?>;"><?php echo htmlspecialchars($item['Rocket Money Amount']); ?></td>
                            <td style="background-color: <?php echo $item['Valid'] ? '#ffffff' : '#f8d7da'; ?>;"><?php echo htmlspecialchars($item['Expenses App Amount']); ?></td>
                            <td style="background-color: <?php echo $item['Valid'] ? '#ffffff' : '#f8d7da'; ?>;"><?php echo htmlspecialchars($item['Rocket Money Date']); ?></td>
                            <td style="background-color: <?php echo $item['Valid'] ? '#ffffff' : '#f8d7da'; ?>;"><?php echo htmlspecialchars($item['Expenses App Day of Month']); ?></td>
                        </tr>
                    <?php } ?>
                </tbody>
        </div>
    </div>
    <div style="clear: both; height: 8px;"></div>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script>
    $( function() {
       
       

    } );
</script>
</body>
</html>





