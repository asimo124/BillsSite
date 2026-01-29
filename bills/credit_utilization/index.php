<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$sort = isset($_REQUEST['sort']) ? $_REQUEST['sort'] : 'milestone_order';
$sort_dir = isset($_REQUEST['sort_dir']) ? $_REQUEST['sort_dir'] : 'ASC';

if ($sort_dir != 'ASC' && $sort_dir != 'DESC') {
    $sort_dir = 'ASC';
}

$increaseCreditLimitBy = isset($_REQUEST['increase_credit_limit_by']) ? floatval($_REQUEST['increase_credit_limit_by']) : 0;

if ($sort == "milestone_order") {
    $sort = "CASE WHEN milestone_order = 0 THEN 9999 ELSE milestone_order END";
}

$sql = "SELECT * FROM cu_loan ORDER BY $sort $sort_dir";
$loans = getQuery($sql);

$minPaymentAccum = 0;
$totalDebtOwed = 0;
$totalCreditLimit = 0;
foreach ($loans as $index => $loan) {
    $totalDebtOwed += floatval($loan['debt_owed']);
    $totalCreditLimit += floatval($loan['credit_limit']);
    $minPaymentAccum += floatval($loan['min_payment']);
    $loans[$index]['min_payment_accum'] = $minPaymentAccum;
}

$totalCreditLimit += $increaseCreditLimitBy;

$creditUtilization = ($totalCreditLimit > 0) ? round(($totalDebtOwed / $totalCreditLimit), 4) * 100 : 0;

$creditUtilizationOrig = $creditUtilization / 100;

$minHeader = 0.29;
$headerLength = round($creditUtilization / 100, 4) - 0.29;
if ($headerLength < 0) {
    $headerLength = 0;
}

$chartHeaders[] = 0.29;

$numHeaders = 4;

$increments = $headerLength / $numHeaders;
for ($i = 1; $i <= $numHeaders; $i++) {
    $minHeader += $increments;
    $chartHeaders[] = round($minHeader, 4);
}
$creditUtilPercentage = round($creditUtilization / 100, 4);

sort($chartHeaders);
$chartValues = [];
foreach ($chartHeaders as $header) {
    $chartValues[] = round(($header * $totalCreditLimit), 4);
   
}

$sql = "SELECT * FROM cu_loan WHERE milestone_order > 0 ORDER BY milestone_order ASC";
$loansByMilestone = getQuery($sql);


$totalDebtOwedNew = $totalDebtOwed;
$totalMinPayment = 0;

$chartMilestoneResults = [];
$chartMilestoneValues = [];
$chartMilestoneHeaders = [];
foreach ($loansByMilestone as $loan) {

    $title = $loan['title'];
    $debtOwed = floatval($loan['debt_owed']);
    $creditLimit = floatval($loan['credit_limit']);
    $totalMinPayment += floatval($loan['min_payment']);

    $totalDebtOwedNew -= $debtOwed;

    $creditUtilization2 = ($totalCreditLimit > 0) ? round(($totalDebtOwedNew / $totalCreditLimit), 4) * 100 : 0;

    $chartMilestoneHeaders[] = $title;
    $chartMilestoneValues[] = $creditUtilization2;
    $chartMilestoneResults[] = [
        'title' => $title,
        'value' => $creditUtilization2
    ];

    if ($totalDebtOwedNew < 0) {
        $totalDebtOwedNew = 0;
    }
}






$totalDebtOwed = number_format($totalDebtOwed, 2);
$totalCreditLimit = number_format($totalCreditLimit, 2);


$creditUtilization = number_format($creditUtilization, 2);

?>
<!DOCTYPE html>
<html>
<head>
    <title>Credit Utilization</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <!-- Font Awesome for hamburger icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="/css/bills_admin.css" />
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 0px"></div>

    <h1>Credit Utilization</h1>

    <form action="index.php" id="frmSort" method="get">
        <div class="row">
            <div class="col-md-4">
                <select class="form-control" id="sort" name="sort">
                    <option value="sort_order" <?= (isset($_REQUEST['sort']) && $_REQUEST['sort'] == 'sort_order') ? 'selected' : ''; ?>>Sort Order</option>
                    <option value="debt_owed" <?= (isset($_REQUEST['sort']) && $_REQUEST['sort'] == 'debt_owed') ? 'selected' : ''; ?>>Debt Owed</option>
                    <option value="title" <?= (isset($_REQUEST['sort']) && $_REQUEST['sort'] == 'title') ? 'selected' : ''; ?>>Name</option>
                </select>
            </div>
            <div class="col-md-4">
                <select class="form-control" id="sort_dir" name="sort_dir">
                    <option value="ASC" <?= (isset($_REQUEST['sort_dir']) && $_REQUEST['sort_dir'] == 'ASC') ? 'selected' : ''; ?>>ASC</option>
                    <option value="DESC" <?= (isset($_REQUEST['sort_dir']) && $_REQUEST['sort_dir'] == 'DESC') ? 'selected' : ''; ?>>DESC</option>
                    
                </select>
            </div>
            <div class="col-md-4">
                <a href="javascript:void(0);" onclick="$('#frmSort').submit();" class="btn btn-primary">Sort</a>
            </div>
        </div>

       
    </form>
    <div style="clear: both; height: 32px;"></div>

     <div class="row">
        <div class="col-md-12">
            <a href="add.php" class="btn btn-primary">Create Loan/Card</a>
        </div>
    </div>
    <div style="clear: both; height: 0px;"></div>

    <h2>Credit Utilization Summary</h2>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered summary-table">
                <tr>
                    <th>Total Debt Owed</th>
                    <th>Total Credit Limit</th>
                    <th>Credit Utilization (%)</th>
                </tr>
                <tr>
                    <td><?php echo '$' . $totalDebtOwed; ?></td>
                    <td><?php echo '$' . $totalCreditLimit; ?></td>
                    <td><?php echo $creditUtilization . '%'; ?></td>
                </tr>
            </table>
        </div>
    </div>
    <div style="clear: both; height: 16px;"></div>

    

    <div class="row">
        <div class="col-md-12">
            
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>Loan/Card</th>
                    <th>Debt Owed</th>
                    <th>Credit Limit</th>
                    <th colspan="2">Min Payment</th>
                    <th>Milestone Order</th>
                    <th colspan="2">Actions</th>
                </tr>
                </thead>
                <tbody>
                    <?php foreach ($loans as $loan) : ?>
                    <tr>
                        <td><?php echo htmlspecialchars($loan['title']); ?></td>
                        <td><?php echo '$' . number_format($loan['debt_owed'], 2); ?></td>
                        <td><?php echo '$' . number_format($loan['credit_limit'], 2); ?></td>
                        <td><?php echo '$' . number_format($loan['min_payment'], 2); ?></td>
                        <td><?php echo '$' . number_format($loan['min_payment_accum'], 2); ?></td>
                        <td><?php echo htmlspecialchars($loan['milestone_order']); ?></td>
                        <td><a href="edit.php?id=<?php echo $loan['id']; ?>" class="btn btn-primary">Edit</a></td>
                        <td><a class="btn btn-primary del_btn" data-id="<?php echo $loan['id']; ?>" data-toggle="modal" data-target="#delBill">Delete</a></td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            Total Paying Monthly: <?= '$' . number_format($totalMinPayment, 2); ?>
        </div>
    </div>
    <div style="clear: both; height: 16px;"></div>

    <form action="index.php" id="frmIncreaseCreditLimit" method="post">
        <div class="row">
            <div class="col-md-12">
                <input type="number" name="increase_credit_limit_by" id="increase_credit_limit_by" placeholder="Increase Credit Limit By Amount" class="form-control" style="width: 300px; display: inline-block;" value="<?= $increaseCreditLimitBy; ?>" />
                <a href="javascript:void(0);" onclick="$('#frmIncreaseCreditLimit').submit();" class="btn btn-primary">Increase Credit Limit</a>
            </div>
        </div>
    </form>
    <div style="clear: both; height: 16px;"></div>

    <h2>Credit Utilization Chart Out of $<?=$totalCreditLimit; ?></h2>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered summary-table">
                <tr>
                    <?php foreach ($chartHeaders as $header) : ?>
                    <th <?= (($creditUtilizationOrig == $header) ? 'style="color: red;"' : (($header == 0.29) ? 'style="color: green;"' : '')); ?>>
                    <?= ($header * 100) . '% of Credit Used'; ?></th>
                    <?php endforeach; ?>
                </tr>
                <tr>
                    <?php foreach ($chartValues as $value) : ?>
                    
                    <td ><?php echo '$' . number_format($value, 2); ?></td>
                    <?php endforeach; ?>
                </tr>
            </table>
        </div>
    </div>
    <div style="clear: both; height: 16px;"></div>

    <h2>Credit Milestones Chart Out of $<?=$totalCreditLimit; ?></h2>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered summary-table">
                <tr>
                    <th>When Milestone Paid</th>
                    <th>Credit Utilization (%)</th> 
                </tr>
                <?php foreach ($chartMilestoneResults as $milestone) : ?>
                <tr>
                    <td style="font-weight: bold;<?= ($milestone['value'] < 30) ? 'color: green; "' : 'color: red; "'; ?>"><?php echo $milestone['title']; ?></td>
                    <td style="font-weight: bold;<?= ($milestone['value'] < 30) ? 'color: green; "' : 'color: red; "'; ?>"><?php echo $milestone['value'] . '%'; ?></td>
                </tr>
                <?php endforeach; ?>
            </table>
        </div>
    </div>
    <div style="clear: both; height: 16px;"></div>

    
    

    <form action="delete.php?" name="frmDel" id="frmDel" method="post">
        <div class="modal fade" id="delBill">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Delete Loan/Card</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you wish to delete this Loan/Card?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" id="save_del_btn" data-id="">Delete</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="hidden" name="id" id="del_id" value="" />
                    </div>
                </div>
            </div>
        </div>
</div>

</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js" ></script>
<script>

    $(document).ready(function() {
        $('.del_btn').click(function() {
            $('#del_id').val($(this).attr("data-id"));
        })
    })
</script>