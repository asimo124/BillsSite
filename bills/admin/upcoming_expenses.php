<?php
//ini_set("display_errors", 1);
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$pay_date = date("Y-m-d");

$numDays9 = 1;
$monthNum9 = intval(date("m", strtotime($pay_date)));
$dayNum9 = intval(date("d", strtotime($pay_date)));
$payPeriodNum = ($dayNum9 < 15) ? 1 : 2;

if (isset($_REQUEST['pay_period']) && $_REQUEST['pay_period']) {
    $payPeriodNum = $_REQUEST['pay_period'];
}

$sqlWhere = "AND CASE WHEN vnd_frequency_type = 'Day of Month' THEN 
        CAST(vnd_frequency_value AS UNSIGNED ) 
    ELSE 
        CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(vnd_frequency_value, '-', 3), '-', -1) AS UNSIGNED)
    END BETWEEN 1 AND 14";
if ($payPeriodNum == 2) {
    $sqlWhere = "AND CASE WHEN vnd_frequency_type = 'Day of Month' THEN 
        CAST(vnd_frequency_value AS UNSIGNED ) 
    ELSE 
        CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(vnd_frequency_value, '-', 3), '-', -1) AS UNSIGNED)
    END > 14 ";
}

$sql = "SELECT 
       vnd_id
    , vnd_bill
    , CASE WHEN vnd_frequency_type = 'Day of Month' THEN 
        CAST(vnd_frequency_value AS UNSIGNED ) 
    ELSE 
        CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(vnd_frequency_value, '-', 3), '-', -1) AS UNSIGNED)
    END as vnd_frequency_value
    , amount
    , vnd_frequency_type
    FROM vnd_bills 
    WHERE 1
    AND watch_flag = 1
    $sqlWhere
    ORDER BY CASE WHEN vnd_frequency_type = 'Day of Month' THEN 
        CAST(vnd_frequency_value AS UNSIGNED ) 
    ELSE 
        CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(vnd_frequency_value, '-', 3), '-', -1) AS UNSIGNED)
    END ";

$query = $db_conn->prepare($sql);
$query->execute();
$results = $query->fetchAll(2);

/*/
foreach ($results as $index => $getItem) {
    if ($getItem['vnd_frequency_type'] != "Day of Month") {
        $results[$index]['vnd_frequency_value'] = intval(date("d", strtotime($getItem['vnd_frequency_value'])));
    }
}
//*/
?>
<!DOCTYPE html>
<html>
<head>
    <title>Charge Catgories</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/css/nav.css"/>
    <link rel="stylesheet" href="/css/bills_admin.css"/>
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;"></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h2>Upcoming Expenses</h2>

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 16px"></div>

    <a href="upcoming_expenses.php" class="btn btn-primary">Today</a>&nbsp;
    <a href="upcoming_expenses.php?pay_period=1" class="btn btn-primary">Pay Period 1</a>&nbsp;
    <a href="upcoming_expenses.php?pay_period=2" class="btn btn-primary">Pay Period 2</a>
    <a href="javascript:void(0);" class="btn btn-default uncheck">Uncheck All</a>

    <div style="clear: both; height: 24px"></div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>Bill</th>
                    <th>Day of Month</th>
                    <th>Amount</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($results as $getBill) : ?>
                    <tr>
                        <td><input type="checkbox" value="1" class="completed_check" data-id="<?php echo $getBill['vnd_id']; ?>"></td>
                        <td><?php echo $getBill['vnd_bill']; ?></td>
                        <td>
                            <?php echo $getBill['vnd_frequency_value']; ?>
                        </td>
                        <td><?php echo formatCurrency($getBill['amount']); ?></td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

    <div style="clear: both; height: 15px;"></div>

</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js"></script>
<script>

    $(document).ready(function () {

        function loadCheckboxes() {
            var completedCheck = localStorage.getItem('completed_check');
            if (completedCheck !== null) {
                completedCheck = JSON.parse(completedCheck);
                $('.completed_check').each(function () {
                    var dataId = $(this).data("id");
                    for (var key in completedCheck) {
                        if (completedCheck.hasOwnProperty(key)) {
                            if (key == dataId) {
                                if (completedCheck[key]) {
                                    console.log('did check');
                                    $(this).attr("checked", "checked");
                                }
                            }
                        }
                    }
                })
            }
        }

        loadCheckboxes();

        $('.uncheck').click(function() {
            $('.completed_check').each(function () {
                $(this).removeAttr('checked');
            })
            localStorage.removeItem('completed_check');
        })

        $('.completed_check').click(function() {
            var isChecked = false;
            if ($(this).is(':checked')) {
                isChecked = true;
            }
            var dataId = $(this).data("id");

            var completedCheck = {};
            if (localStorage.getItem('completed_check') === null) {
                localStorage.setItem('completed_check', '{}');
            } else {
                completedCheck = localStorage.getItem('completed_check');
                completedCheck = JSON.parse(completedCheck);
            }
            completedCheck[dataId] = isChecked ? 1 : 0;

            localStorage.setItem('completed_check', JSON.stringify(completedCheck));
        })
    })
</script>