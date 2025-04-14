<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$sql = "SELECT id, entrydate FROM dp_snapshot ORDER BY entrydate DESC ";
$items = getQuery($sql);

?>
<!DOCTYPE html>
<html>
<head>
    <title>Debt Progress</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="/css/bills_admin.css" />
    <link rel="stylesheet" href="/css/debt_progress.css?version=3" />
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h2>Debt Progress</h2>

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav.php"; ?>

    <form class="form-horizontal" id="frmSendSnapshot" action="proc_add_snapshot.php" method="post" name="frmSendSnapshot">

        <fieldset>
            <legend>Snapshots</legend>

            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Select Snapshot</label>
                <div class="col-md-4">
                    <select name="snapshot" id="snapshot" class="form-control" width: 70%;">
                        <option value="" > - Select One - </option>
                        <?php foreach ($items as $getItem): ?>
                            <option value="<?php echo $getItem['id']; ?>" >Snapshot on <?php echo date("Y-m-d", strtotime($getItem['entrydate'])); ?></option>
                        <?php endforeach; ?>
                    </select>
                    <div style="clear: both; height: 8px;"></div>
                    <a href="javascript:void(0);" class="btn btn-primary" id="snapshot_link" target="_blank">View Snapshot</a>
                </div>
            </div>
        </fieldset>

        <fieldset>
            <legend>Settings</legend>

            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Snowball Constant</label>
                <div class="col-md-4">
                    <input id="snowball_constant" name="snowball_constant" type="text" placeholder="Snowball Constant" class="form-control input-md" value="" />
                </div>
            </div>
        </fieldset>

        <fieldset>
            <legend>Stage 1 - SoFi Loan</legend>

            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Starting Point</label>
                <div class="col-md-4">
                    <input id="stage1_start_date" name="stage1_start_date" type="text" placeholder="Starting Point"
                           class="form-control input-md input-blur" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Remaining Balance</label>
                <div class="col-md-4">
                    <input id="stage1_remaining_balance" name="stage1_remaining_balance" type="
                    text" placeholder="Remaining Balance" class="form-control input-md input-blur" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">How much of min payment goes to principal?</label>
                <div class="col-md-4">
                    <input id="stage1_min_payment_principal1" name="stage1_min_payment_principal1"
                           type="text" placeholder="Min Payment to principal" class="form-control input-md input-blur" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">How much does Mom pay to principal every month?</label>
                <div class="col-md-4">
                    <input id="stage1_mom_principal" name="stage1_mom_principal" type="text"
                           placeholder="Mom Pays to principal monthly" class="form-control input-md input-blur" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">How much does I pay to principal every month?</label>
                <div class="col-md-4">
                    <input id="stage1_me_principal" name="stage1_me_principal" type="text"
                           placeholder="I pay to principal monthly" class="form-control input-md input-blur" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Stage 1 Paid?</label>
                <div class="btn-group btn-toggle">
                    <button class="btn btn-sm" type="button" id="paid1" data-item="1">Paid</button>
                    <button class="btn btn-sm active btn-primary" type="button" id="notPaid1" data-item="0">Not Paid</button>
                </div>
            </div>

        </fieldset>

        <fieldset>
            <legend>Stage 2 - SSFCU Mastercard & Credit Human Card</legend>

            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Starting Point</label>
                <div class="col-md-4">
                    <input id="stage2_start_date" name="stage2_start_date" type="text" placeholder="Starting Point"
                           class="form-control input-md input-blur" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Remaining Balance</label>
                <div class="col-md-4">
                    <input id="stage2_remaining_balance" name="stage2_remaining_balance" type="text"
                           placeholder="Remaining Balance" class="form-control input-md input-blur" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">SSFCU - How much of min payment goes to principal?</label>
                <div class="col-md-4">
                    <input id="stage2_min_payment_principal1" name="stage2_min_payment_principal1" type="text"
                           placeholder="SSFCU min payment to principal" class="form-control input-md input-blur" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Credit Human - How much of min payment goes to principal?</label>
                <div class="col-md-4">
                    <input id="stage2_min_payment_principal2" name="stage2_min_payment_principal2" type="text"
                           placeholder="Mastercard min payment to principal" class="form-control input-md input-blur" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">How much does Mom pay to principal every month?</label>
                <div class="col-md-4">
                    <input id="stage2_mom_principal" name="stage2_mom_principal" type="text"
                           placeholder="Mom pays to principal monthly" class="form-control input-md input-blur" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">How much does I pay to principal every month?</label>
                <div class="col-md-4">
                    <input id="stage2_me_principal" name="stage2_me_principal" type="text"
                           placeholder="I pay to principal monthly" class="form-control input-md input-blur" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Stage 2 Paid?</label>
                <div class="btn-group btn-toggle">
                    <button class="btn btn-sm" type="button" id="paid2" data-item="1">Paid</button>
                    <button class="btn btn-sm active btn-primary" type="button" id="notPaid2" data-item="0">Not Paid</button>
                </div>
            </div>


        </fieldset>

        <fieldset>
            <legend>Stage 3 - IRS</legend>

            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Starting Point</label>
                <div class="col-md-4">
                    <input id="stage3_start_date" name="stage3_start_date" type="text" placeholder="Starting Point" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Remaining Balance</label>
                <div class="col-md-4">
                    <input id="stage3_remaining_balance" name="stage3_remaining_balance" type="text" placeholder="Remaining Balance" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">How much of min payment goes to principal?</label>
                <div class="col-md-4">
                    <input id="stage3_min_payment_principal1" name="stage3_min_payment_principal1" type="text" placeholder="Min payment goes to principal" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">How much does Mom pay to principal every month?</label>
                <div class="col-md-4">
                    <input id="stage3_mom_principal" name="stage3_mom_principal" type="text" placeholder="Mom pays to principal monthly" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">How much does I pay to principal every month?</label>
                <div class="col-md-4">
                    <input id="stage3_me_principal" name="stage3_me_principal" type="text" placeholder="I pay to principal monthly" class="form-control input-md" value="" />
                </div>
            </div>
            <button type="submit" name="btnSendSnapshot" id="btnSendSnapshot" class="btn btn-primary" >Create Snapshot</button>

        </fieldset>
    </form>
    <div style="clear: both; height: 128px"></div>

    <div class="months-holder" id="monthDates">
    </div>
    <div class="months-holder" id="remainingBalances">
    </div>
    <div class="progress-bar-holder" id="progressBars">
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js" ></script>
<script>

    class ProgressBarMonths {

        stage = 1;

        snowBallConstant = 0;

        startDate = '';
        remainingBalance = '';
        minPaymentPrincipal1 = '';
        minPaymentPrincipal2 = '';
        momPrincipal = '';
        mePrincipal = '';

        totalPrincipal = 0;

        numMonths = 0;
        monthsWidth = 0;
        monthsWidthLess1 = 0;
        monthsList = [];

        constructor() {}

        parseIntegers() {
            this.remainingBalance = parseInt(this.remainingBalance);
            this.minPaymentPrincipal1 = parseInt(this.minPaymentPrincipal1);
            this.minPaymentPrincipal2 = parseInt(this.minPaymentPrincipal2);
            this.momPrincipal = parseInt(this.momPrincipal);
            this.mePrincipal = parseInt(this.mePrincipal);
        }

        calculate() {

            this.parseIntegers();
            var numMonthsBefore = 0;
            if (this.stage != 2) {


                this.totalPrincipal = (this.minPaymentPrincipal1 + this.momPrincipal + this.mePrincipal);
                    /// this.snowBallConstant;

                numMonthsBefore = this.remainingBalance /
                    (this.totalPrincipal)
            } else {

                this.totalPrincipal = (this.minPaymentPrincipal1 + this.minPaymentPrincipal2 + this.momPrincipal
                    + this.mePrincipal); /// this.snowBallConstant;

                numMonthsBefore = this.remainingBalance /
                    (this.totalPrincipal)
            }

            if (numMonthsBefore - Math.floor(numMonthsBefore) < 0.5) {
                numMonthsBefore = Math.floor(numMonthsBefore);
            } else {
                numMonthsBefore = Math.ceil(numMonthsBefore);
            }
            this.numMonths = numMonthsBefore * this.snowBallConstant;

            if (this.numMonths - Math.floor(this.numMonths) < 0.5) {
                this.numMonths = Math.floor(this.numMonths);
            } else {
                this.numMonths = Math.ceil(this.numMonths);
            }

            //this.numMonths++;
            return this.numMonths;
        }

        calcMonthsWidth() {

            this.monthsWidth = (100 / (this.numMonths - 1));

            this.monthsWidth = this.monthsWidth * 0.79
            this.monthsWidth = this.monthsWidth.toFixed(2);
            this.monthsWidth = this.monthsWidth.toString();

            if (this.numMonths == 2) {
                this.monthsWidthLess1 = 100 / this.numMonths;
            } else if (this.numMonths == 1) {
                this.monthsWidthLess1 =  100 / this.numMonths;
            } else {
                this.monthsWidthLess1 =  (100 / (this.numMonths - 2));
            }

            this.monthsWidthLess1 = this.monthsWidthLess1 * 0.69
            this.monthsWidthLess1 = this.monthsWidthLess1.toFixed(2);
            this.monthsWidthLess1 = this.monthsWidthLess1.toString();

            return this.monthsWidth;
        }
    }

    class ProgressBar {

        stage1IsPaid = 0;
        stage2IsPaid = 0;

        stage1StartDateObj = new Date();
        stage2StartDateObj = new Date();
        stage3StartDateObj = new Date();

        stage1NumMonths = 0;
        stage2NumMonths = 0;
        stage3NumMonths = 0;

        stage1MonthsWidth = '0';
        stage2MonthsWidth = '0';
        stage3MonthsWidth = '0';

        stage1MonthsWidthLess1 = '0';
        stage2MonthsWidthLess1 = '0';
        stage3MonthsWidthLess1 = '0';

        stage1RemainingBalance = 0;
        stage2RemainingBalance = 0;
        stage3RemainingBalance = 0;

        stage1TotalPrincipal = 0;
        stage2TotalPrincipal = 0;
        stage3TotalPrincipal = 0;

        stagesMonthSum = 0;
        stage1Width = 0;
        stage2Width = 0;
        stage3Width = 0;

        monthsList = [];

        constructor() {}

        calcStagesWidth() {

            if (!this.stage1IsPaid) {

                if (!this.stage2IsPaid) {

                    this.stagesMonthSum = this.stage1NumMonths + this.stage2NumMonths + this.stage3NumMonths;

                    this.stage1Width = this.stage1NumMonths / this.stagesMonthSum * 100;
                    this.stage1Width = this.stage1Width - (this.stage1Width * 0.01);
                    this.stage1Width = this.stage1Width.toFixed(2);
                    this.stage1Width = this.stage1Width.toString();

                    this.stage2Width = this.stage2NumMonths / this.stagesMonthSum * 100;
                    this.stage2Width = this.stage2Width - (this.stage2Width * 0.01);
                    this.stage2Width = this.stage2Width.toFixed(2);
                    this.stage2Width = this.stage2Width.toString();

                    this.stage3Width = this.stage3NumMonths / this.stagesMonthSum * 100;
                    this.stage3Width = this.stage3Width - (this.stage3Width * 0.01);
                    this.stage3Width = this.stage3Width.toFixed(2);
                    this.stage3Width = this.stage3Width.toString();

                } else {

                    this.stagesMonthSum = this.stage2NumMonths + this.stage3NumMonths;

                    this.stage3Width = this.stage3NumMonths / this.stagesMonthSum * 100;
                    this.stage3Width = this.stage3Width - (this.stage3Width * 0.01);
                    this.stage3Width = this.stage3Width.toFixed(2);
                    this.stage3Width = this.stage3Width.toString();
                }

            } else {

                this.stagesMonthSum = this.stage2NumMonths + this.stage3NumMonths;

                this.stage2Width = this.stage2NumMonths / this.stagesMonthSum * 100;
                this.stage2Width = this.stage2Width - (this.stage2Width * 0.01);
                this.stage2Width = this.stage2Width.toFixed(2);
                this.stage2Width = this.stage2Width.toString();

                this.stage3Width = this.stage3NumMonths / this.stagesMonthSum * 100;
                this.stage3Width = this.stage3Width - (this.stage3Width * 0.01);
                this.stage3Width = this.stage3Width.toFixed(2);
                this.stage3Width = this.stage3Width.toString();
            }
        }

        formatRemainingBalance(remainingBalance) {

            remainingBalance = parseFloat(remainingBalance);

            if (remainingBalance - Math.floor(remainingBalance) < 0.5) {
                remainingBalance = Math.floor(remainingBalance);
            } else {
                remainingBalance = Math.ceil(remainingBalance);
            }

            remainingBalance = remainingBalance.toString();
            remainingBalance += 'k';

            return remainingBalance;
        }

        calcMonthsList() {

            if (!this.stage1IsPaid) {

                var runningRemainingBalance1 = this.stage1RemainingBalance;

                // Stage 1
                const stage1 = {
                    stage: 1,
                    width: this.stage1Width + '%',
                    months: []
                }
                const monthsArr = [];

                var curYear = this.stage1StartDateObj.getFullYear();
                curYear = curYear.toString().slice(-2);
                curYear = parseInt(curYear);

                var curMonth = parseInt(this.stage1StartDateObj.getMonth()) + 1;
                var curDate = parseInt(this.stage1StartDateObj.getDate());
                if (curDate > 15) {
                    if (curMonth < 12) {
                        curMonth++;
                    } else {
                        curMonth = 1;
                        curYear++;
                    }
                }

                var lastI = 0;
                for (var i = 0; i < this.stage1NumMonths; i++) {
                    monthsArr.push({
                        stage: 1,
                        monthNum: i,
                        monthDate: curMonth + '/' + curYear,
                        balance: this.formatRemainingBalance(runningRemainingBalance1),
                        width: this.stage1MonthsWidth + '%'
                    });
                    if (curMonth < 12) {
                        curMonth++;
                    } else {
                        curMonth = 1;
                        curYear++;
                    }

                    runningRemainingBalance1 -= this.stage1TotalPrincipal;

                    lastI = i;
                }

                stage1.months = monthsArr;
                this.monthsList.push(stage1);

                if (!this.stage2IsPaid) {


                    // Stage 2
                    const stage2 = {
                        stage: 2,
                        width: this.stage2Width + '%',
                        months: []
                    }

                    var runningRemainingBalance2 = this.stage2RemainingBalance;

                    const monthsArr2 = [];

                    /*/
                    if (curMonth > 1) {
                        curMonth--;
                    } else {
                        curMonth = 12;
                        curYear--;
                    }
                    //*/

                    var lastI2 = 0;

                    var t = 0;
                    for (var i = lastI; i < lastI + this.stage2NumMonths; i++) {

                        var monthDate = curMonth + '/' + curYear;
                        /*/
                        if (t == 0) {
                            monthDate = '';
                        }
                        //*/

                        monthsArr2.push({
                            stage: 2,
                            monthNum: i,
                            monthDate: monthDate,
                            balance: this.formatRemainingBalance(runningRemainingBalance2),
                            width: this.stage2MonthsWidthLess1 + '%'
                        });
                        if (curMonth < 12) {
                            curMonth++;
                        } else {
                            curMonth = 1;
                            curYear++;
                        }

                        runningRemainingBalance2 -= this.stage2TotalPrincipal;

                        lastI2 = i;
                        t++;
                    }

                    stage2.months = monthsArr2;
                    this.monthsList.push(stage2);

                    // Stage 3
                    const stage3 = {
                        stage: 3,
                        width: this.stage3Width + '%',
                        months: []
                    }

                    var runningRemainingBalance3 = this.stage3RemainingBalance;

                    /*/
                    if (curMonth > 1) {
                        curMonth--;
                    } else {
                        curMonth = 12;
                        curYear--;
                    }
                    //*/

                    const monthsArr3 = [];

                    t = 0;
                    for (var i = lastI2; i < lastI2 + this.stage3NumMonths; i++) {

                        var monthDate = curMonth + '/' + curYear;
                        /*/
                        if (t == 0) {
                            monthDate = '';
                        }
                        //*/

                        monthsArr3.push({
                            stage: 3,
                            monthNum: i,
                            monthDate: monthDate,
                            balance: this.formatRemainingBalance(runningRemainingBalance3),
                            width: this.stage3MonthsWidthLess1 + '%'
                        });
                        if (curMonth < 12) {
                            curMonth++;
                        } else {
                            curMonth = 1;
                            curYear++;
                        }

                        runningRemainingBalance3 -= this.stage3TotalPrincipal;
                        t++;
                    }

                    stage3.months = monthsArr3;
                    this.monthsList.push(stage3);


                } else {

                    var runningRemainingBalance3 = this.stage3RemainingBalance;

                    // Stage 3
                    const stage3 = {
                        stage: 3,
                        width: this.stage3Width + '%',
                        months: []
                    }

                    const monthsArr3 = [];

                    var curYear = this.stage3StartDateObj.getFullYear();
                    curYear = curYear.toString().slice(-2);
                    curYear = parseInt(curYear);

                    var curMonth = parseInt(this.stage3StartDateObj.getMonth()) + 1;
                    var curDate = parseInt(this.stage3StartDateObj.getDate());
                    if (curDate > 15) {
                        if (curMonth < 12) {
                            curMonth++;
                        } else {
                            curMonth = 1;
                            curYear++;
                        }
                    }

                    for (i = lastI; i < lastI + this.stage3NumMonths; i++) {

                        var monthDate = curMonth + '/' + curYear;

                        monthsArr3.push({
                            stage: 3,
                            monthNum: i,
                            monthDate: monthDate,
                            balance: this.formatRemainingBalance(runningRemainingBalance3),
                            width: this.stage3MonthsWidth + '%'
                        });
                        if (curMonth < 12) {
                            curMonth++;
                        } else {
                            curMonth = 1;
                            curYear++;
                        }

                        runningRemainingBalance3 -= this.stage3TotalPrincipal;
                    }

                    stage3.months = monthsArr3;
                    this.monthsList.push(stage3);
                }

            } else {

                if (!this.stage2IsPaid) {

                    // stage 2
                    const stage2 = {
                        stage: 2,
                        width: this.stage2Width + '%',
                        months: []
                    }

                    var runningRemainingBalance2 = this.stage2RemainingBalance;

                    const monthsArr2 = [];

                    var curYear = this.stage2StartDateObj.getFullYear();
                    curYear = curYear.toString().slice(-2);
                    curYear = parseInt(curYear);

                    var curMonth = parseInt(this.stage2StartDateObj.getMonth()) + 1;
                    var curDate = parseInt(this.stage2StartDateObj.getDate());
                    if (curDate > 15) {
                        if (curMonth < 12) {
                            curMonth++;
                        } else {
                            curMonth = 1;
                            curYear++;
                        }
                    }

                    var lastI = 0;
                    for (var i = 0; i < this.stage2NumMonths; i++) {

                        var monthDate = curMonth + '/' + curYear;

                        monthsArr2.push({
                            stage: 2,
                            monthNum: i,
                            monthDate: monthDate,
                            balance: this.formatRemainingBalance(runningRemainingBalance2),
                            width: this.stage2MonthsWidth + '%'
                        });
                        if (curMonth < 12) {
                            curMonth++;
                        } else {
                            curMonth = 1;
                            curYear++;
                        }

                        lastI = i;
                        runningRemainingBalance2 -= this.stage2TotalPrincipal;



                    }

                    stage2.months = monthsArr2;
                    this.monthsList.push(stage2);

                    // stage 3
                    const stage3 = {
                        stage: 3,
                        width: this.stage3Width + '%',
                        months: []
                    }

                    var runningRemainingBalance3 = this.stage3RemainingBalance;

                    /*/
                    if (curMonth > 1) {
                        curMonth--;
                    } else {
                        curMonth = 12;
                        curYear--;
                    }
                    //*/

                    const monthsArr3 = [];

                    var t = 0;
                    for (var i = lastI; i < lastI + this.stage3NumMonths; i++) {

                        var monthDate = curMonth + '/' + curYear;
                        /*/
                        if (t == 0) {
                            monthDate = '';
                        }
                        //*/

                        monthsArr3.push({
                            stage: 3,
                            monthNum: i,
                            monthDate: monthDate,
                            balance: this.formatRemainingBalance(runningRemainingBalance3),
                            width: this.stage3MonthsWidthLess1 + '%'
                        });
                        if (curMonth < 12) {
                            curMonth++;
                        } else {
                            curMonth = 1;
                            curYear++;
                        }

                        runningRemainingBalance3 -= this.stage3TotalPrincipal;

                        t++;
                    }

                    stage3.months = monthsArr3;
                    this.monthsList.push(stage3);

                } else {

                    // Stage 3
                    const stage3 = {
                        stage: 3,
                        width: this.stage3Width + '%',
                        months: []
                    }

                    var runningRemainingBalance3 = this.stage3RemainingBalance;

                    const monthsArr3 = [];

                    var curYear = this.stage3StartDateObj.getFullYear();
                    curYear = curYear.toString().slice(-2);
                    curYear = parseInt(curYear);

                    var curMonth = parseInt(this.stage3StartDateObj.getMonth()) + 1;
                    var curDate = parseInt(this.stage3StartDateObj.getDate());
                    if (curDate > 15) {
                        if (curMonth < 12) {
                            curMonth++;
                        } else {
                            curMonth = 1;
                            curYear++;
                        }
                    }

                    for (var i = 0; i < this.stage3NumMonths; i++) {

                        var monthDate = curMonth + '/' + curYear;

                        monthsArr3.push({
                            stage: 3,
                            monthNum: i,
                            monthDate: monthDate,
                            balance: this.formatRemainingBalance(runningRemainingBalance3),
                            width: this.stage3MonthsWidthLess1 + '%'
                        });
                        if (curMonth < 12) {
                            curMonth++;
                        } else {
                            curMonth = 1;
                            curYear++;
                        }

                        runningRemainingBalance3 -= this.stage3TotalPrincipal;
                    }

                    stage3.months = monthsArr3;
                    this.monthsList.push(stage3);
                }
            }
        }
    }

    $(document).ready(function() {

        var defaultStage1IsPaid = 1;
        var defaultStage2IsPaid = 1;

        var stage1IsPaid = localStorage.getItem('stage1IsPaid') ? localStorage.getItem('stage1IsPaid') : defaultStage1IsPaid;
        stage1IsPaid--;

        var stage2IsPaid = localStorage.getItem('stage2IsPaid') ? localStorage.getItem('stage2IsPaid') : defaultStage2IsPaid;
        stage2IsPaid--;

        // hardcoded defaults
        var defaultSnowBallConstant = 1;

        var defaultStage1RemainingBalance = 12900;
        var defaultStage1MinPaymentPrincipal1 = 310; // is this correct?
        var defaultStage1MomPrincipal = 500;
        var defaultStage1MePrincipal = 500;

        var defaultStage2RemainingBalance = 24000;
        var defaultStage2MinPaymentPrincipal1 = 139; // is this correct?
        var defaultStage2MinPaymentPrincipal2 = 240; // is this correct?
        var defaultStage2MomPrincipal = 500;
        var defaultStage2MePrincipal = 1120;

        var defaultStage3RemainingBalance = 4000;
        var defaultStage3MinPaymentPrincipal1 = 110; // is this correct?
        var defaultStage3MomPrincipal = 0;
        var defaultStage3MePrincipal = 1740;

        var calculate = function() {

            // Stage 1
            const progressBarStage1 = new ProgressBarMonths();

            progressBarStage1.stage = 1;

            // set properties from jquery values
            progressBarStage1.snowBallConstant = $('#snowball_constant').val();
            progressBarStage1.startDate = $('#stage1_start_date').val();
            progressBarStage1.remainingBalance = $('#stage1_remaining_balance').val();
            progressBarStage1.minPaymentPrincipal1 = $('#stage1_min_payment_principal1').val();
            progressBarStage1.momPrincipal = $('#stage1_mom_principal').val();
            progressBarStage1.mePrincipal = $('#stage1_me_principal').val();

            // calculate months num
            progressBarStage1.calculate();


            // Stage 2
            const progressBarStage2 = new ProgressBarMonths();

            progressBarStage2.stage = 2;

            // set properties from jquery values
            progressBarStage2.snowBallConstant = $('#snowball_constant').val();
            progressBarStage2.startDate = $('#stage2_start_date').val();
            progressBarStage2.remainingBalance = $('#stage2_remaining_balance').val();
            progressBarStage2.minPaymentPrincipal1 = $('#stage2_min_payment_principal1').val();
            progressBarStage2.minPaymentPrincipal2 = $('#stage2_min_payment_principal2').val();
            progressBarStage2.momPrincipal = $('#stage2_mom_principal').val();
            progressBarStage2.mePrincipal = $('#stage2_me_principal').val();

            // calculate months num
            progressBarStage2.calculate();


            // Stage 3
            const progressBarStage3 = new ProgressBarMonths();

            progressBarStage3.stage = 3;

            // set properties from jquery values
            progressBarStage3.snowBallConstant = $('#snowball_constant').val();
            progressBarStage3.startDate = $('#stage3_start_date').val();
            progressBarStage3.remainingBalance = $('#stage3_remaining_balance').val();
            progressBarStage3.minPaymentPrincipal1 = $('#stage3_min_payment_principal1').val();
            progressBarStage3.momPrincipal = $('#stage3_mom_principal').val();
            progressBarStage3.mePrincipal = $('#stage3_me_principal').val();

            // calculate months num
            progressBarStage3.calculate();


            progressBarStage1.calcMonthsWidth();
            var stage1MonthsWidth = progressBarStage1.monthsWidth;
            var stage1MonthsWidthLess1 = progressBarStage1.monthsWidthLess1;

            progressBarStage2.calcMonthsWidth();
            var stage2MonthsWidth = progressBarStage2.monthsWidth;
            var stage2MonthsWidthLess1 = progressBarStage2.monthsWidthLess1;

            progressBarStage3.calcMonthsWidth();
            var stage3MonthsWidth = progressBarStage3.monthsWidth;
            var stage3MonthsWidthLess1 = progressBarStage3.monthsWidthLess1;

            const progressBar = new ProgressBar();

            progressBar.stage1IsPaid = stage1IsPaid;
            progressBar.stage2IsPaid = stage2IsPaid;

            progressBar.stage1StartDateObj = stage1StartDateObj;
            progressBar.stage2StartDateObj = stage2StartDateObj;
            progressBar.stage3StartDateObj = stage3StartDateObj;

            progressBar.stage1NumMonths = progressBarStage1.numMonths;
            progressBar.stage2NumMonths = progressBarStage2.numMonths;
            progressBar.stage3NumMonths = progressBarStage3.numMonths;

            progressBar.stage1MonthsWidth = stage1MonthsWidth;
            progressBar.stage1MonthsWidthLess1 = stage1MonthsWidthLess1;
            progressBar.stage2MonthsWidth = stage2MonthsWidth;
            progressBar.stage2MonthsWidthLess1 = stage2MonthsWidthLess1;
            progressBar.stage3MonthsWidth = stage3MonthsWidth;
            progressBar.stage3MonthsWidthLess1 = stage3MonthsWidthLess1;

            var remainingBalance1 = progressBarStage1.remainingBalance;
            remainingBalance1 = remainingBalance1 / 1000;
            remainingBalance1 = remainingBalance1.toFixed(2);

            var remainingBalance2 = progressBarStage2.remainingBalance;
            remainingBalance2 = remainingBalance2 / 1000;
            remainingBalance2 = remainingBalance2.toFixed(2);

            var remainingBalance3 = progressBarStage3.remainingBalance;
            remainingBalance3 = remainingBalance3 / 1000;
            remainingBalance3 = remainingBalance3.toFixed(2);

            var totalPrincipal1 = progressBarStage1.totalPrincipal;
            totalPrincipal1 = totalPrincipal1 / 1000;
            totalPrincipal1 = totalPrincipal1.toFixed(2);

            var totalPrincipal2 = progressBarStage2.totalPrincipal;
            totalPrincipal2 = totalPrincipal2 / 1000;
            totalPrincipal2 = totalPrincipal2.toFixed(2);

            var totalPrincipal3 = progressBarStage3.totalPrincipal;
            totalPrincipal3 = totalPrincipal3 / 1000;
            totalPrincipal3 = totalPrincipal3.toFixed(2);

            progressBar.stage1RemainingBalance = remainingBalance1;
            progressBar.stage2RemainingBalance = remainingBalance2;
            progressBar.stage3RemainingBalance = remainingBalance3;

            progressBar.stage1TotalPrincipal = totalPrincipal1;
            progressBar.stage2TotalPrincipal = totalPrincipal2;
            progressBar.stage3TotalPrincipal = totalPrincipal3;

            progressBar.calcStagesWidth();
            progressBar.calcMonthsList();

            // monthDates
            var index = 0;
            var monthDatesHtml = '';
            progressBar.monthsList.forEach(function(eachStage) {

                monthDatesHtml += '<div class="stage-' + eachStage.stage + '-months" style="width: ' + eachStage.width + ';">';

                var innerIndex = 0;
                eachStage.months.forEach(function(month) {
                    monthDatesHtml += '<div class="month-milestone" style="width: ' + month.width + ';">' + month.monthDate + '</div>';

                    innerIndex++;
                });

                var monthDateArr = eachStage.months[eachStage.months.length - 1].monthDate.split('/');
                var curMonth = parseInt(monthDateArr[0]);
                var curYear = (monthDateArr.length > 1) ? parseInt(monthDateArr[1]) : 0;
                if (curMonth < 12) {
                    curMonth++;
                } else {
                    curMonth = 1;
                    curYear++;
                }
                if (index == progressBar.monthsList.length - 1) {
                    monthDatesHtml += '<div class="month-milestone" style="width: 0.5%;">' + curMonth + '/' + curYear + '</div>';
                }

                monthDatesHtml += '</div>';
                index++;
            });
            $('#monthDates').html(monthDatesHtml);

            index = 0;
            var remainingBalanceHtml = '';
            progressBar.monthsList.forEach(function(eachStage) {

                remainingBalanceHtml += '<div class="stage-' + eachStage.stage + '-months" style="width: ' + eachStage.width + ';">';

                var innerIndex = 0;
                eachStage.months.forEach(function(month) {
                    remainingBalanceHtml += '<div class="month-milestone" style="width: ' + month.width + ';">' + month.balance + '</div>';
                    innerIndex++;
                });

                if (index == progressBar.monthsList.length - 1) {
                    remainingBalanceHtml += '<div class="month-milestone" style="width: 0.5%;">0k</div>';
                }

                remainingBalanceHtml += '</div>';
                index++;

            });
            $('#remainingBalances').html(remainingBalanceHtml);


            // progressBars
            var progressBarsHtml = '';
            progressBar.monthsList.forEach(function(eachStage) {

                progressBarsHtml += '<div class="stage-' + eachStage.stage + '-total" style="width: ' + eachStage.width + ';"></div>';
            });
            $('#progressBars').html(progressBarsHtml);
        }

        // datepickers initialization
        $("#stage1_start_date").datepicker({dateFormat: 'yy-mm-dd'});
        $("#stage2_start_date").datepicker({dateFormat: 'yy-mm-dd'});
        $("#stage3_start_date").datepicker({dateFormat: 'yy-mm-dd'});

        $('#snapshot').change(function() {
            console.log('changed at 2');
            var id2 = $(this).val();
            $('#snapshot_link').attr('href', 'debt_progress_snap.php?id=' + id2);
        })

        $('input').blur(function() {
            localStorage.setItem('snowball_constant', $('#snowball_constant').val());
            localStorage.setItem('stage1_remaining_balance', $('#stage1_remaining_balance').val());
            localStorage.setItem('stage2_remaining_balance', $('#stage2_remaining_balance').val());
            localStorage.setItem('stage3_remaining_balance', $('#stage3_remaining_balance').val());

            localStorage.setItem('stage1_min_payment_principal1', $('#stage1_min_payment_principal1').val());
            localStorage.setItem('stage1_mom_principal', $('#stage1_mom_principal').val());
            localStorage.setItem('stage1_me_principal', $('#stage1_me_principal').val());

            localStorage.setItem('stage2_min_payment_principal1', $('#stage2_min_payment_principal1').val());
            localStorage.setItem('stage2_min_payment_principal2', $('#stage2_min_payment_principal2').val());
            localStorage.setItem('stage2_mom_principal', $('#stage2_mom_principal').val());
            localStorage.setItem('stage2_me_principal', $('#stage2_me_principal').val());

            localStorage.setItem('stage3_min_payment_principal1', $('#stage3_min_payment_principal1').val());
            localStorage.setItem('stage3_mom_principal', $('#stage3_mom_principal').val());
            localStorage.setItem('stage3_me_principal', $('#stage3_me_principal').val());
            calculate();
        })

        $('#paid1').click(function() {

            $(this).addClass('active');
            $(this).removeClass('btn-default');
            $(this).addClass('btn-primary');

            $('#notPaid1').removeClass('active');
            $('#notPaid1').removeClass('btn-primary');
            $('#notPaid1').addClass('btn-default');

            stage1IsPaid = 1;
            localStorage.setItem('stage1IsPaid', 2);
            $('#stage2_start_date').datepicker('setDate', new Date());

            if (stage1IsPaid) {
                $('#stage2_start_date').datepicker('setDate', new Date());
                stage2StartDateObj = new Date($("#stage1_start_date").datepicker("getDate"));
            } else {
                stage2StartDateObj = null;
            }

            if (stage2IsPaid) {
                $('#stage3_start_date').datepicker('setDate', new Date());
                stage3StartDateObj = new Date($("#stage1_start_date").datepicker("getDate"));
            } else {

                stage3StartDateObj = null;
            }
            calculate();
        });

        $('#notPaid1').click(function() {

            $(this).addClass('active');
            $(this).removeClass('btn-default');
            $(this).addClass('btn-primary');

            $('#paid1').removeClass('active');
            $('#paid1').removeClass('btn-primary');
            $('#paid1').addClass('btn-default');

            stage1IsPaid = 0;
            localStorage.setItem('stage1IsPaid', 1);

            if (stage1IsPaid) {
                $('#stage2_start_date').datepicker('setDate', new Date());
                stage2StartDateObj = new Date($("#stage1_start_date").datepicker("getDate"));
            } else {
                stage2StartDateObj = null;
            }

            if (stage2IsPaid) {
                $('#stage3_start_date').datepicker('setDate', new Date());
                stage3StartDateObj = new Date($("#stage1_start_date").datepicker("getDate"));
            } else {

                stage3StartDateObj = null;
            }
            calculate();
        });

        $('#paid2').click(function() {

            $(this).addClass('active');
            $(this).removeClass('btn-default');
            $(this).addClass('btn-primary');

            $('#notPaid2').removeClass('active');
            $('#notPaid2').removeClass('btn-primary');
            $('#notPaid2').addClass('btn-default');

            stage2IsPaid = 1;
            localStorage.setItem('stage2IsPaid', 2);
            $('#stage3_start_date').datepicker('setDate', new Date());

            if (stage2IsPaid) {
                $('#stage3_start_date').datepicker('setDate', new Date());
                stage3StartDateObj = new Date($("#stage1_start_date").datepicker("getDate"));
            } else {

                stage3StartDateObj = null;
            }
            calculate();
        });

        $('#notPaid2').click(function() {

            $(this).addClass('active');
            $(this).removeClass('btn-default');
            $(this).addClass('btn-primary');

            $('#paid2').removeClass('active');
            $('#paid2').removeClass('btn-primary');
            $('#paid2').addClass('btn-default');

            stage2IsPaid = 0;
            localStorage.setItem('stage2IsPaid', 1);

            if (stage2IsPaid) {
                $('#stage3_start_date').datepicker('setDate', new Date());
                stage3StartDateObj = new Date($("#stage1_start_date").datepicker("getDate"));
            } else {

                stage3StartDateObj = null;
            }
            calculate();
        });

        // default date fields
        $('#stage1_start_date').datepicker('setDate', new Date());
        var stage1StartDateObj = new Date($("#stage1_start_date").datepicker("getDate"));

        var stage2StartDateObj = null;
        if (stage1IsPaid) {
            $('#stage2_start_date').datepicker('setDate', new Date());
            stage2StartDateObj = new Date($("#stage1_start_date").datepicker("getDate"));
        }

        var stage3StartDateObj = null;
        if (stage2IsPaid) {
            $('#stage3_start_date').datepicker('setDate', new Date());
            stage3StartDateObj = new Date($("#stage1_start_date").datepicker("getDate"));
        }

        // settings
        var savedSnowBallConstant = localStorage.getItem('snowball_constant');
        if (savedSnowBallConstant) {
            $('#snowball_constant').val(savedSnowBallConstant);
        } else {
            $('#snowball_constant').val(defaultSnowBallConstant);
        }

        // stage 1
        var savedStage1RemainingBalance = localStorage.getItem('stage1_remaining_balance');

        if (savedStage1RemainingBalance) {
            $('#stage1_remaining_balance').val(savedStage1RemainingBalance);
        } else {
            $('#stage1_remaining_balance').val(defaultStage1RemainingBalance);
        }

        var savedStage1MinPaymentPrincipal1 = localStorage.getItem('stage1_min_payment_principal1');
        if (savedStage1MinPaymentPrincipal1) {
            $('#stage1_min_payment_principal1').val(savedStage1MinPaymentPrincipal1);
        } else {
            $('#stage1_min_payment_principal1').val(defaultStage1MinPaymentPrincipal1);
        }

        var savedStage1MomPrincipal = localStorage.getItem('stage1_mom_principal');
        if (savedStage1MomPrincipal) {
            $('#stage1_mom_principal').val(savedStage1MomPrincipal);
        } else {
            $('#stage1_mom_principal').val(defaultStage1MomPrincipal);
        }

        var savedStage1MePrincipal = localStorage.getItem('stage1_me_principal');
        if (savedStage1MePrincipal) {
            $('#stage1_me_principal').val(savedStage1MePrincipal);
        } else {
            $('#stage1_me_principal').val(defaultStage1MePrincipal);
        }

        // stage 2
        var savedStage2RemainingBalance = localStorage.getItem('stage2_remaining_balance');
        if (savedStage2RemainingBalance) {
            $('#stage2_remaining_balance').val(savedStage2RemainingBalance);
        } else {
            $('#stage2_remaining_balance').val(defaultStage2RemainingBalance);
        }

        var savedStage2MinPaymentPrincipal1 = localStorage.getItem('stage2_min_payment_principal1');
        if (savedStage2MinPaymentPrincipal1) {
            $('#stage2_min_payment_principal1').val(savedStage2MinPaymentPrincipal1);
        } else {
            $('#stage2_min_payment_principal1').val(defaultStage2MinPaymentPrincipal1);
        }

        var savedStage2MinPaymentPrincipal2 = localStorage.getItem('stage2_min_payment_principal2');
        if (savedStage2MinPaymentPrincipal2) {
            $('#stage2_min_payment_principal2').val(savedStage2MinPaymentPrincipal2);
        } else {
            $('#stage2_min_payment_principal2').val(defaultStage2MinPaymentPrincipal2);
        }

        var savedStage2MomPrincipal = localStorage.getItem('stage2_mom_principal');
        if (savedStage2MomPrincipal) {
            $('#stage2_mom_principal').val(savedStage2MomPrincipal);
        } else {
            $('#stage2_mom_principal').val(defaultStage2MomPrincipal);
        }

        var savedStage2MePrincipal = localStorage.getItem('stage2_me_principal');
        if (savedStage2MePrincipal) {
            $('#stage2_me_principal').val(savedStage2MePrincipal);
        } else {
            $('#stage2_me_principal').val(defaultStage2MePrincipal);
        }

        // stage 3
        var savedStage3RemainingBalance = localStorage.getItem('stage3_remaining_balance');
        if (savedStage3RemainingBalance) {
            $('#stage3_remaining_balance').val(savedStage3RemainingBalance);
        } else {
            $('#stage3_remaining_balance').val(defaultStage3RemainingBalance);
        }

        var savedStage3MinPaymentPrincipal1 = localStorage.getItem('stage3_min_payment_principal1');
        if (savedStage3MinPaymentPrincipal1) {
            $('#stage3_min_payment_principal1').val(savedStage3MinPaymentPrincipal1);
        } else {
            $('#stage3_min_payment_principal1').val(defaultStage3MinPaymentPrincipal1);
        }

        var savedStage3MomPrincipal = localStorage.getItem('stage3_mom_principal');
        if (savedStage3MomPrincipal) {
            $('#stage3_mom_principal').val(savedStage3MomPrincipal);
        } else {
            $('#stage3_mom_principal').val(defaultStage3MomPrincipal);
        }

        var savedStage3MePrincipal = localStorage.getItem('stage3_me_principal');
        if (savedStage3MePrincipal) {
            $('#stage3_me_principal').val(savedStage3MePrincipal);
        } else {
            $('#stage3_me_principal').val(defaultStage3MePrincipal);
        }
        calculate();
    })
</script>