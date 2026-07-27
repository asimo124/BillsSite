<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

?>
<!DOCTYPE html>
<html>
<head>
    <title>Loan Countdown</title>
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
<div class="container" id="app">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h2>Loan Countdown</h2>

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 24px"></div>

    <div class="row">
        <div class="col-xs-12 col-md-8 col-md-offset-2">
            <form @submit.prevent class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="disposable_per_paycheck1">Disposable per paycheck on the 1st of the month</label>
                    <div class="col-sm-8">
                        <input type="number" id="disposable_per_paycheck1" v-model.number="disposable_per_paycheck1" class="form-control" step="any" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="disposable_per_paycheck15">Disposable per paycheck on the 15th of the month</label>
                    <div class="col-sm-8">
                        <input type="number" id="disposable_per_paycheck15" v-model.number="disposable_per_paycheck15" class="form-control" step="any" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="already_spent_on_first_paycheck">Already spent on first paycheck</label>
                    <div class="col-sm-8">
                        <input type="number" id="already_spent_on_first_paycheck" v-model.number="already_spent_on_first_paycheck" class="form-control" step="0.01" min="0" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="starting_month">Starting month</label>
                    <div class="col-sm-8">
                        <select id="starting_month" v-model="starting_month" class="form-control" @blur="persistLoanForm" @change="persistLoanForm">
                            <option value="">— Select —</option>
                            <option v-for="opt in startingMonthOptions" :key="opt.value" :value="opt.value">{{ opt.label }}</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="push_to_next_paycheck">Push to next paycheck</label>
                    <div class="col-sm-8" style="padding-top: 7px;">
                        <input type="checkbox" id="push_to_next_paycheck" v-model="push_to_next_paycheck" @change="persistLoanForm" />
                    </div>
                </div>
                
                <h3 class="h4" style="margin-top: 24px; padding-bottom: 8px; border-bottom: 1px solid #ddd;">Loan #1</h3>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan1_name">Name</label>
                    <div class="col-sm-8">
                        <input type="text" id="loan1_name" v-model="loan1_name" class="form-control" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan1_remaining_balance">Remaining balance</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan1_remaining_balance" v-model.number="loan1_remaining_balance" class="form-control" step="0.01" min="0" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan1_adjust_disposable_per_paycheck1">Adjust disposable (1st paycheck)</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan1_adjust_disposable_per_paycheck1" v-model.number="loan1_adjust_disposable_per_paycheck1" class="form-control" step="any" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan1_adjust_disposable_per_paycheck15">Adjust disposable (15th paycheck)</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan1_adjust_disposable_per_paycheck15" v-model.number="loan1_adjust_disposable_per_paycheck15" class="form-control" step="any" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan1_min_to_principal">Min to principal</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan1_min_to_principal" v-model.number="loan1_min_to_principal" class="form-control" step="0.01" min="0" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan1_day_of_month">Day of month</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan1_day_of_month" v-model.number="loan1_day_of_month" class="form-control" step="1" min="1" max="31" @blur="persistLoanForm" />
                    </div>
                </div>

                <h3 class="h4" style="margin-top: 24px; padding-bottom: 8px; border-bottom: 1px solid #ddd;">Loan #2</h3>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan2_name">Name</label>
                    <div class="col-sm-8">
                        <input type="text" id="loan2_name" v-model="loan2_name" class="form-control" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan2_remaining_balance">Remaining balance</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan2_remaining_balance" v-model.number="loan2_remaining_balance" class="form-control" step="0.01" min="0" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan2_adjust_disposable_per_paycheck1">Adjust disposable (1st paycheck)</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan2_adjust_disposable_per_paycheck1" v-model.number="loan2_adjust_disposable_per_paycheck1" class="form-control" step="any" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan2_adjust_disposable_per_paycheck15">Adjust disposable (15th paycheck)</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan2_adjust_disposable_per_paycheck15" v-model.number="loan2_adjust_disposable_per_paycheck15" class="form-control" step="any" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan2_min_to_principal">Min to principal</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan2_min_to_principal" v-model.number="loan2_min_to_principal" class="form-control" step="0.01" min="0" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan2_day_of_month">Day of month</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan2_day_of_month" v-model.number="loan2_day_of_month" class="form-control" step="1" min="1" max="31" @blur="persistLoanForm" />
                    </div>
                </div>

                <h3 class="h4" style="margin-top: 24px; padding-bottom: 8px; border-bottom: 1px solid #ddd;">Loan #3</h3>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan3_name">Name</label>
                    <div class="col-sm-8">
                        <input type="text" id="loan3_name" v-model="loan3_name" class="form-control" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan3_remaining_balance">Remaining balance</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan3_remaining_balance" v-model.number="loan3_remaining_balance" class="form-control" step="0.01" min="0" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan3_adjust_disposable_per_paycheck1">Adjust disposable (1st paycheck)</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan3_adjust_disposable_per_paycheck1" v-model.number="loan3_adjust_disposable_per_paycheck1" class="form-control" step="any" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan3_adjust_disposable_per_paycheck15">Adjust disposable (15th paycheck)</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan3_adjust_disposable_per_paycheck15" v-model.number="loan3_adjust_disposable_per_paycheck15" class="form-control" step="any" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan3_min_to_principal">Min to principal</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan3_min_to_principal" v-model.number="loan3_min_to_principal" class="form-control" step="0.01" min="0" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan3_day_of_month">Day of month</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan3_day_of_month" v-model.number="loan3_day_of_month" class="form-control" step="1" min="1" max="31" @blur="persistLoanForm" />
                    </div>
                </div>

                <h3 class="h4" style="margin-top: 24px; padding-bottom: 8px; border-bottom: 1px solid #ddd;">Loan #4</h3>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan4_name">Name</label>
                    <div class="col-sm-8">
                        <input type="text" id="loan4_name" v-model="loan4_name" class="form-control" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan4_remaining_balance">Remaining balance</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan4_remaining_balance" v-model.number="loan4_remaining_balance" class="form-control" step="0.01" min="0" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan4_adjust_disposable_per_paycheck1">Adjust disposable (1st paycheck)</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan4_adjust_disposable_per_paycheck1" v-model.number="loan4_adjust_disposable_per_paycheck1" class="form-control" step="any" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan4_adjust_disposable_per_paycheck15">Adjust disposable (15th paycheck)</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan4_adjust_disposable_per_paycheck15" v-model.number="loan4_adjust_disposable_per_paycheck15" class="form-control" step="any" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan4_min_to_principal">Min to principal</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan4_min_to_principal" v-model.number="loan4_min_to_principal" class="form-control" step="0.01" min="0" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan4_day_of_month">Day of month</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan4_day_of_month" v-model.number="loan4_day_of_month" class="form-control" step="1" min="1" max="31" @blur="persistLoanForm" />
                    </div>
                </div>

                <h3 class="h4" style="margin-top: 24px; padding-bottom: 8px; border-bottom: 1px solid #ddd;">Loan #5</h3>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan5_name">Name</label>
                    <div class="col-sm-8">
                        <input type="text" id="loan5_name" v-model="loan5_name" class="form-control" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan5_remaining_balance">Remaining balance</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan5_remaining_balance" v-model.number="loan5_remaining_balance" class="form-control" step="0.01" min="0" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan5_adjust_disposable_per_paycheck1">Adjust disposable (1st paycheck)</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan5_adjust_disposable_per_paycheck1" v-model.number="loan5_adjust_disposable_per_paycheck1" class="form-control" step="any" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan5_adjust_disposable_per_paycheck15">Adjust disposable (15th paycheck)</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan5_adjust_disposable_per_paycheck15" v-model.number="loan5_adjust_disposable_per_paycheck15" class="form-control" step="any" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan5_min_to_principal">Min to principal</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan5_min_to_principal" v-model.number="loan5_min_to_principal" class="form-control" step="0.01" min="0" @blur="persistLoanForm" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" for="loan5_day_of_month">Day of month</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan5_day_of_month" v-model.number="loan5_day_of_month" class="form-control" step="1" min="1" max="31" @blur="persistLoanForm" />
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div style="clear: both; height: 4px"></div>
    <div class="row">
        <div class="col-xs-12" style="text-align: right;">
            <button type="button" class="btn btn-default" style="margin-right: 8px;" @click="clearLoanFormData">Clear Data</button>
            <button type="button" class="btn btn-primary" @click="calculateLoanCountdown">Calculate Loan Countdown</button>
        </div>
    </div>
    <div style="clear: both; height: 16px"></div>

    <div class="row">
        <div class="col-xs-12 col-md-8 col-md-offset-2">
            <div v-if="countdownValidationError" class="alert alert-danger" role="alert">{{ countdownValidationError }}</div>

            <template v-if="loan1_filled && loan1Schedule.length">
                <h2 style="margin-top: 8px;">{{ loan1_name }}</h2>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Disposable per paycheck</th>
                            <th>Running total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(row, idx) in loan1Schedule" :key="'l1-' + idx">
                            <td>{{ row.dateLabel }}</td>
                            <td>${{ formatMoney(row.disposableApplied) }}</td>
                            <td>${{ formatMoney(row.runningTotal) }}</td>
                        </tr>
                    </tbody>
                </table>
                <p v-if="loan1PayoffLeftover !== null" class="lead" style="margin-top: 12px;">
                    Money left over from paying {{ loan1_name }}: <strong>${{ formatMoney(loan1PayoffLeftover) }}</strong>
                </p>
                <p v-if="loan2BalanceAfterLoan1Spill != null" class="lead" style="margin-top: 4px;">
                    New balance for {{ (loan2_name && loan2_name.trim()) ? loan2_name : 'Loan #2' }}: <strong>${{ formatMoney(loan2BalanceAfterLoan1Spill) }}</strong>
                </p>
                <p v-if="loan3BalanceAfterLoan2Spill != null && loan3BalanceAfterLoan2Spill > 0 && !loan2Schedule.length" class="lead" style="margin-top: 4px;">
                    New balance for {{ (loan3_name && loan3_name.trim()) ? loan3_name : 'Loan #3' }} (after Loan #2 spill from Loan #1): <strong>${{ formatMoney(loan3BalanceAfterLoan2Spill) }}</strong>
                </p>
                <p v-if="loan3PayoffLeftover != null && loan3PayoffLeftover > 0 && !loan2Schedule.length && !loan3Schedule.length" class="lead" style="margin-top: 4px;">
                    Money left over after spill to {{ (loan3_name && loan3_name.trim()) ? loan3_name : 'Loan #3' }}: <strong>${{ formatMoney(loan3PayoffLeftover) }}</strong>
                </p>
                <p v-if="loan4BalanceAfterLoan3Spill != null && loan4BalanceAfterLoan3Spill > 0 && !loan2Schedule.length && !loan3Schedule.length" class="lead" style="margin-top: 4px;">
                    New balance for {{ (loan4_name && loan4_name.trim()) ? loan4_name : 'Loan #4' }} (after upstream spill): <strong>${{ formatMoney(loan4BalanceAfterLoan3Spill) }}</strong>
                </p>
                <p v-if="loan4PayoffLeftover != null && loan4PayoffLeftover > 0 && !loan2Schedule.length && !loan3Schedule.length && !loan4Schedule.length" class="lead" style="margin-top: 4px;">
                    Money left over after spill to {{ (loan4_name && loan4_name.trim()) ? loan4_name : 'Loan #4' }}: <strong>${{ formatMoney(loan4PayoffLeftover) }}</strong>
                </p>
                <p v-if="loan5BalanceAfterLoan4Spill != null && loan5BalanceAfterLoan4Spill > 0 && !loan2Schedule.length && !loan3Schedule.length && !loan4Schedule.length" class="lead" style="margin-top: 4px;">
                    New balance for {{ (loan5_name && loan5_name.trim()) ? loan5_name : 'Loan #5' }} (after upstream spill): <strong>${{ formatMoney(loan5BalanceAfterLoan4Spill) }}</strong>
                </p>
                <p v-if="loan5PayoffLeftover != null && loan5PayoffLeftover > 0 && !loan2Schedule.length && !loan3Schedule.length && !loan4Schedule.length && !loan5Schedule.length" class="lead" style="margin-top: 4px;">
                    Money left over after spill to {{ (loan5_name && loan5_name.trim()) ? loan5_name : 'Loan #5' }}: <strong>${{ formatMoney(loan5PayoffLeftover) }}</strong>
                </p>
            </template>

            <template v-if="loan2Schedule.length">
                <h2 style="margin-top: 24px;">{{ (loan2_name && loan2_name.trim()) ? loan2_name : 'Loan #2' }}</h2>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Disposable per paycheck</th>
                            <th>Running total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(row, idx) in loan2Schedule" :key="'l2-' + idx">
                            <td>{{ row.dateLabel }}</td>
                            <td>${{ formatMoney(row.disposableApplied) }}</td>
                            <td>${{ formatMoney(row.runningTotal) }}</td>
                        </tr>
                    </tbody>
                </table>
                <p v-if="loan2PayoffLeftover !== null" class="lead" style="margin-top: 12px;">
                    Money left over from paying {{ (loan2_name && loan2_name.trim()) ? loan2_name : 'Loan #2' }}: <strong>${{ formatMoney(loan2PayoffLeftover) }}</strong>
                </p>
                <p v-if="loan3BalanceAfterLoan2Spill != null && loan3BalanceAfterLoan2Spill > 0 && loan2Schedule.length" class="lead" style="margin-top: 4px;">
                    New balance for {{ (loan3_name && loan3_name.trim()) ? loan3_name : 'Loan #3' }}: <strong>${{ formatMoney(loan3BalanceAfterLoan2Spill) }}</strong>
                </p>
                <p v-if="loan3PayoffLeftover != null && loan3PayoffLeftover > 0 && loan2Schedule.length && !loan3Schedule.length" class="lead" style="margin-top: 4px;">
                    Money left over after spill to {{ (loan3_name && loan3_name.trim()) ? loan3_name : 'Loan #3' }}: <strong>${{ formatMoney(loan3PayoffLeftover) }}</strong>
                </p>
                <p v-if="loan4BalanceAfterLoan3Spill != null && loan4BalanceAfterLoan3Spill > 0 && loan2Schedule.length && !loan3Schedule.length" class="lead" style="margin-top: 4px;">
                    New balance for {{ (loan4_name && loan4_name.trim()) ? loan4_name : 'Loan #4' }} (after upstream spill): <strong>${{ formatMoney(loan4BalanceAfterLoan3Spill) }}</strong>
                </p>
                <p v-if="loan4PayoffLeftover != null && loan4PayoffLeftover > 0 && loan2Schedule.length && !loan3Schedule.length && !loan4Schedule.length" class="lead" style="margin-top: 4px;">
                    Money left over after spill to {{ (loan4_name && loan4_name.trim()) ? loan4_name : 'Loan #4' }}: <strong>${{ formatMoney(loan4PayoffLeftover) }}</strong>
                </p>
                <p v-if="loan5BalanceAfterLoan4Spill != null && loan5BalanceAfterLoan4Spill > 0 && loan2Schedule.length && !loan3Schedule.length && !loan4Schedule.length" class="lead" style="margin-top: 4px;">
                    New balance for {{ (loan5_name && loan5_name.trim()) ? loan5_name : 'Loan #5' }} (after upstream spill): <strong>${{ formatMoney(loan5BalanceAfterLoan4Spill) }}</strong>
                </p>
                <p v-if="loan5PayoffLeftover != null && loan5PayoffLeftover > 0 && loan2Schedule.length && !loan3Schedule.length && !loan4Schedule.length && !loan5Schedule.length" class="lead" style="margin-top: 4px;">
                    Money left over after spill to {{ (loan5_name && loan5_name.trim()) ? loan5_name : 'Loan #5' }}: <strong>${{ formatMoney(loan5PayoffLeftover) }}</strong>
                </p>
            </template>

            <template v-if="loan3Schedule.length">
                <h2 style="margin-top: 24px;">{{ (loan3_name && loan3_name.trim()) ? loan3_name : 'Loan #3' }}</h2>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Disposable per paycheck</th>
                            <th>Running total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(row, idx) in loan3Schedule" :key="'l3-' + idx">
                            <td>{{ row.dateLabel }}</td>
                            <td>${{ formatMoney(row.disposableApplied) }}</td>
                            <td>${{ formatMoney(row.runningTotal) }}</td>
                        </tr>
                    </tbody>
                </table>
                <p v-if="loan3PayoffLeftover !== null" class="lead" style="margin-top: 12px;">
                    Money left over from paying {{ (loan3_name && loan3_name.trim()) ? loan3_name : 'Loan #3' }}: <strong>${{ formatMoney(loan3PayoffLeftover) }}</strong>
                </p>
                <p v-if="loan4BalanceAfterLoan3Spill != null && loan4BalanceAfterLoan3Spill > 0 && loan3Schedule.length" class="lead" style="margin-top: 4px;">
                    New balance for {{ (loan4_name && loan4_name.trim()) ? loan4_name : 'Loan #4' }}: <strong>${{ formatMoney(loan4BalanceAfterLoan3Spill) }}</strong>
                </p>
                <p v-if="loan4PayoffLeftover != null && loan4PayoffLeftover > 0 && loan3Schedule.length && !loan4Schedule.length" class="lead" style="margin-top: 4px;">
                    Money left over after spill to {{ (loan4_name && loan4_name.trim()) ? loan4_name : 'Loan #4' }}: <strong>${{ formatMoney(loan4PayoffLeftover) }}</strong>
                </p>
                <p v-if="loan5BalanceAfterLoan4Spill != null && loan5BalanceAfterLoan4Spill > 0 && loan3Schedule.length && !loan4Schedule.length" class="lead" style="margin-top: 4px;">
                    New balance for {{ (loan5_name && loan5_name.trim()) ? loan5_name : 'Loan #5' }} (after upstream spill): <strong>${{ formatMoney(loan5BalanceAfterLoan4Spill) }}</strong>
                </p>
                <p v-if="loan5PayoffLeftover != null && loan5PayoffLeftover > 0 && loan3Schedule.length && !loan4Schedule.length && !loan5Schedule.length" class="lead" style="margin-top: 4px;">
                    Money left over after spill to {{ (loan5_name && loan5_name.trim()) ? loan5_name : 'Loan #5' }}: <strong>${{ formatMoney(loan5PayoffLeftover) }}</strong>
                </p>
            </template>

            <template v-if="loan4Schedule.length">
                <h2 style="margin-top: 24px;">{{ (loan4_name && loan4_name.trim()) ? loan4_name : 'Loan #4' }}</h2>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Disposable per paycheck</th>
                            <th>Running total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(row, idx) in loan4Schedule" :key="'l4-' + idx">
                            <td>{{ row.dateLabel }}</td>
                            <td>${{ formatMoney(row.disposableApplied) }}</td>
                            <td>${{ formatMoney(row.runningTotal) }}</td>
                        </tr>
                    </tbody>
                </table>
                <p v-if="loan4PayoffLeftover !== null" class="lead" style="margin-top: 12px;">
                    Money left over from paying {{ (loan4_name && loan4_name.trim()) ? loan4_name : 'Loan #4' }}: <strong>${{ formatMoney(loan4PayoffLeftover) }}</strong>
                </p>
                <p v-if="loan5BalanceAfterLoan4Spill != null && loan5BalanceAfterLoan4Spill > 0 && loan4Schedule.length" class="lead" style="margin-top: 4px;">
                    New balance for {{ (loan5_name && loan5_name.trim()) ? loan5_name : 'Loan #5' }}: <strong>${{ formatMoney(loan5BalanceAfterLoan4Spill) }}</strong>
                </p>
                <p v-if="loan5PayoffLeftover != null && loan5PayoffLeftover > 0 && loan4Schedule.length && !loan5Schedule.length" class="lead" style="margin-top: 4px;">
                    Money left over after spill to {{ (loan5_name && loan5_name.trim()) ? loan5_name : 'Loan #5' }}: <strong>${{ formatMoney(loan5PayoffLeftover) }}</strong>
                </p>
            </template>

            <template v-if="loan5Schedule.length">
                <h2 style="margin-top: 24px;">{{ (loan5_name && loan5_name.trim()) ? loan5_name : 'Loan #5' }}</h2>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Disposable per paycheck</th>
                            <th>Running total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(row, idx) in loan5Schedule" :key="'l5-' + idx">
                            <td>{{ row.dateLabel }}</td>
                            <td>${{ formatMoney(row.disposableApplied) }}</td>
                            <td>${{ formatMoney(row.runningTotal) }}</td>
                        </tr>
                    </tbody>
                </table>
                <p v-if="loan5PayoffLeftover !== null" class="lead" style="margin-top: 12px;">
                    Money left over from paying {{ (loan5_name && loan5_name.trim()) ? loan5_name : 'Loan #5' }}: <strong>${{ formatMoney(loan5PayoffLeftover) }}</strong>
                </p>
            </template>
        </div>
    </div>

</div>

<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="/js/nav.js"></script>
<script>
const { createApp } = Vue;

const LOAN_COUNTDOWN_STORAGE_KEY = 'loanCountdownForm';

function defaultLoanFormState() {
    return {
        disposable_per_paycheck1: null,
        disposable_per_paycheck15: null,
        already_spent_on_first_paycheck: null,
        starting_month: '',
        push_to_next_paycheck: false,
        loan1_name: '',
        loan1_remaining_balance: null,
        loan1_adjust_disposable_per_paycheck1: null,
        loan1_adjust_disposable_per_paycheck15: null,
        loan1_min_to_principal: null,
        loan1_day_of_month: null,
        loan2_name: '',
        loan2_remaining_balance: null,
        loan2_adjust_disposable_per_paycheck1: null,
        loan2_adjust_disposable_per_paycheck15: null,
        loan2_min_to_principal: null,
        loan2_day_of_month: null,
        loan3_name: '',
        loan3_remaining_balance: null,
        loan3_adjust_disposable_per_paycheck1: null,
        loan3_adjust_disposable_per_paycheck15: null,
        loan3_min_to_principal: null,
        loan3_day_of_month: null,
        loan4_name: '',
        loan4_remaining_balance: null,
        loan4_adjust_disposable_per_paycheck1: null,
        loan4_adjust_disposable_per_paycheck15: null,
        loan4_min_to_principal: null,
        loan4_day_of_month: null,
        loan5_name: '',
        loan5_remaining_balance: null,
        loan5_adjust_disposable_per_paycheck1: null,
        loan5_adjust_disposable_per_paycheck15: null,
        loan5_min_to_principal: null,
        loan5_day_of_month: null,
    };
}

/**
 * Apply spill dollars sequentially to loans 2–5. Mutates balances[0..3] = [loan2..loan5].
 * firstLoanIndex: first loan number to receive spill (2 after Loan #1 payoff, 3 after Loan #2, etc.).
 */
function cascadeSpillFromRoll(vm, initialRoll, balances, had, fromLoan1Payoff, firstLoanIndex) {
    const start = firstLoanIndex == null ? 2 : firstLoanIndex;
    let r = roundMoney(initialRoll);
    const payoffKeys = ['loan2PayoffLeftover', 'loan3PayoffLeftover', 'loan4PayoffLeftover', 'loan5PayoffLeftover'];
    const afterKeys = ['loan3BalanceAfterLoan2Spill', 'loan4BalanceAfterLoan3Spill', 'loan5BalanceAfterLoan4Spill'];
    for (let loanN = start; loanN <= 5; loanN++) {
        const i = loanN - 2;
        if (balances[i] > 0 && r > 0) {
            const to = roundMoney(Math.min(balances[i], r));
            balances[i] = Math.max(0, roundMoney(balances[i] - to));
            r = roundMoney(r - to);
            if (fromLoan1Payoff && loanN === 2 && had[0]) {
                vm.loan2BalanceAfterLoan1Spill = balances[0];
            }
        }
        if (balances[i] <= 0) {
            balances[i] = 0;
            if (had[i]) {
                vm[payoffKeys[i]] = r;
            }
        }
    }
    for (let i = 0; i < 3; i++) {
        if (balances[i] <= 0 && had[i + 1]) {
            vm[afterKeys[i]] = balances[i + 1];
        }
    }
}

function roundMoney(n) {
    return Math.round(Number(n) * 100) / 100;
}

function startOfLocalDay(d) {
    const x = new Date(d);
    x.setHours(0, 0, 0, 0);
    return x;
}

function addDays(d, n) {
    const x = new Date(d);
    x.setDate(x.getDate() + n);
    return startOfLocalDay(x);
}

function parseStartYm(startYm) {
    const parts = String(startYm).split('-');
    const y = parseInt(parts[0], 10);
    const m0 = parseInt(parts[1], 10) - 1;
    if (!Number.isFinite(y) || !Number.isFinite(m0)) {
        return null;
    }
    return { y, m0 };
}

/** Paycheck dates (1st and 15th) from the start of starting_month, in order, up to maxEvents. */
function listPaycheckDatesFromPlanStart(startYm, maxEvents) {
    const parsed = parseStartYm(startYm);
    if (!parsed) {
        return [];
    }
    let yy = parsed.y;
    let mm = parsed.m0;
    const out = [];
    while (out.length < maxEvents) {
        out.push(startOfLocalDay(new Date(yy, mm, 1)));
        if (out.length >= maxEvents) {
            break;
        }
        out.push(startOfLocalDay(new Date(yy, mm, 15)));
        if (out.length >= maxEvents) {
            break;
        }
        mm += 1;
        if (mm > 11) {
            mm = 0;
            yy += 1;
        }
    }
    return out;
}

function formatPaycheckDateLabel(d) {
    return d.toLocaleDateString('en-US', { month: 'long', day: 'numeric', year: 'numeric' });
}

/**
 * For each calendar day in (lastExclusive, endInclusive], subtract min to principal for every loan
 * with a positive balance when that loan's day-of-month matches (31 maps to last day of month).
 * Includes the active snowball loan on its due day, before the paycheck pool is applied.
 */
function applyMinPrincipalAccrualsInWindow(bals, loansCfg, lastExclusive, endInclusive) {
    let d = addDays(startOfLocalDay(lastExclusive), 1);
    const end = startOfLocalDay(endInclusive);
    while (d.getTime() <= end.getTime()) {
        const yy = d.getFullYear();
        const mm = d.getMonth();
        const dim = new Date(yy, mm + 1, 0).getDate();
        const dayDom = d.getDate();
        for (let loanN = 1; loanN <= 5; loanN++) {
            const bi = loanN - 1;
            if (bals[bi] <= 0) {
                continue;
            }
            const cfg = loansCfg[bi];
            const reqDom = cfg.dom;
            if (!Number.isFinite(reqDom) || reqDom < 1 || reqDom > 31) {
                continue;
            }
            const targetDom = Math.min(Math.floor(reqDom), dim);
            if (dayDom !== targetDom) {
                continue;
            }
            const minP = cfg.minP;
            if (!Number.isFinite(minP) || minP <= 0) {
                continue;
            }
            const pay = roundMoney(Math.min(bals[bi], minP));
            bals[bi] = roundMoney(Math.max(0, bals[bi] - pay));
        }
        d = addDays(d, 1);
    }
}

function monthLabelFromOffset(startYm, monthOffset) {
    const parts = String(startYm).split('-');
    const y = parseInt(parts[0], 10);
    const m = parseInt(parts[1], 10) - 1;
    if (!Number.isFinite(y) || !Number.isFinite(m)) {
        return '';
    }
    const d = new Date(y, m + monthOffset, 1);
    return d.toLocaleDateString('en-US', { month: 'long', year: 'numeric' });
}

/** Principal applied this paycheck: at least minPrincipal toward balance when pool allows, capped by balance and pool. */
function appliedPrincipalThisPaycheck(balance, pool, minPrincipal) {
    const b = roundMoney(balance);
    const p = roundMoney(pool);
    const m = Number(minPrincipal);
    if (!Number.isFinite(m) || m <= 0) {
        return roundMoney(Math.min(b, p));
    }
    return roundMoney(Math.min(p, Math.max(Math.min(b, p), Math.min(m, b))));
}

createApp({
    data() {
        return {
            ...defaultLoanFormState(),
            loan1Schedule: [],
            loan2Schedule: [],
            loan3Schedule: [],
            loan4Schedule: [],
            loan5Schedule: [],
            countdownValidationError: '',
            loan1PayoffLeftover: null,
            loan2PayoffLeftover: null,
            loan2BalanceAfterLoan1Spill: null,
            loan3PayoffLeftover: null,
            loan3BalanceAfterLoan2Spill: null,
            loan4PayoffLeftover: null,
            loan4BalanceAfterLoan3Spill: null,
            loan5PayoffLeftover: null,
            loan5BalanceAfterLoan4Spill: null,
        };
    },
    computed: {
        startingMonthOptions() {
            const out = [];
            const d = new Date();
            d.setDate(1);
            d.setHours(0, 0, 0, 0);
            for (let i = 0; i < 13; i++) {
                const y = d.getFullYear();
                const m = d.getMonth();
                const value = `${y}-${String(m + 1).padStart(2, '0')}`;
                const label = d.toLocaleDateString('en-US', { month: 'long', year: 'numeric' });
                out.push({ value, label });
                d.setMonth(d.getMonth() + 1);
            }
            return out;
        },
        loan1_filled() {
            const name = this.loan1_name != null ? String(this.loan1_name).trim() : '';
            const bal = this.loan1_remaining_balance;
            if (!name || bal === null || bal === '') {
                return false;
            }
            const n = Number(bal);
            return Number.isFinite(n) && n >= 0;
        },
        loan2_filled() {
            const name = this.loan2_name != null ? String(this.loan2_name).trim() : '';
            const bal = this.loan2_remaining_balance;
            if (!name || bal === null || bal === '') {
                return false;
            }
            const n = Number(bal);
            return Number.isFinite(n) && n >= 0;
        },
        loan3_filled() {
            const name = this.loan3_name != null ? String(this.loan3_name).trim() : '';
            const bal = this.loan3_remaining_balance;
            if (!name || bal === null || bal === '') {
                return false;
            }
            const n = Number(bal);
            return Number.isFinite(n) && n >= 0;
        },
        loan4_filled() {
            const name = this.loan4_name != null ? String(this.loan4_name).trim() : '';
            const bal = this.loan4_remaining_balance;
            if (!name || bal === null || bal === '') {
                return false;
            }
            const n = Number(bal);
            return Number.isFinite(n) && n >= 0;
        },
        loan5_filled() {
            const name = this.loan5_name != null ? String(this.loan5_name).trim() : '';
            const bal = this.loan5_remaining_balance;
            if (!name || bal === null || bal === '') {
                return false;
            }
            const n = Number(bal);
            return Number.isFinite(n) && n >= 0;
        },
    },
    mounted() {
        this.loadLoanFormFromStorage();
        this.calculateLoanCountdown();
    },
    methods: {
        persistLoanForm() {
            const payload = {
                disposable_per_paycheck1: this.disposable_per_paycheck1,
                disposable_per_paycheck15: this.disposable_per_paycheck15,
                already_spent_on_first_paycheck: this.already_spent_on_first_paycheck,
                starting_month: this.starting_month,
                push_to_next_paycheck: this.push_to_next_paycheck,
                loan1_name: this.loan1_name,
                loan1_remaining_balance: this.loan1_remaining_balance,
                loan1_adjust_disposable_per_paycheck1: this.loan1_adjust_disposable_per_paycheck1,
                loan1_adjust_disposable_per_paycheck15: this.loan1_adjust_disposable_per_paycheck15,
                loan1_min_to_principal: this.loan1_min_to_principal,
                loan1_day_of_month: this.loan1_day_of_month,
                loan2_name: this.loan2_name,
                loan2_remaining_balance: this.loan2_remaining_balance,
                loan2_adjust_disposable_per_paycheck1: this.loan2_adjust_disposable_per_paycheck1,
                loan2_adjust_disposable_per_paycheck15: this.loan2_adjust_disposable_per_paycheck15,
                loan2_min_to_principal: this.loan2_min_to_principal,
                loan2_day_of_month: this.loan2_day_of_month,
                loan3_name: this.loan3_name,
                loan3_remaining_balance: this.loan3_remaining_balance,
                loan3_adjust_disposable_per_paycheck1: this.loan3_adjust_disposable_per_paycheck1,
                loan3_adjust_disposable_per_paycheck15: this.loan3_adjust_disposable_per_paycheck15,
                loan3_min_to_principal: this.loan3_min_to_principal,
                loan3_day_of_month: this.loan3_day_of_month,
                loan4_name: this.loan4_name,
                loan4_remaining_balance: this.loan4_remaining_balance,
                loan4_adjust_disposable_per_paycheck1: this.loan4_adjust_disposable_per_paycheck1,
                loan4_adjust_disposable_per_paycheck15: this.loan4_adjust_disposable_per_paycheck15,
                loan4_min_to_principal: this.loan4_min_to_principal,
                loan4_day_of_month: this.loan4_day_of_month,
                loan5_name: this.loan5_name,
                loan5_remaining_balance: this.loan5_remaining_balance,
                loan5_adjust_disposable_per_paycheck1: this.loan5_adjust_disposable_per_paycheck1,
                loan5_adjust_disposable_per_paycheck15: this.loan5_adjust_disposable_per_paycheck15,
                loan5_min_to_principal: this.loan5_min_to_principal,
                loan5_day_of_month: this.loan5_day_of_month,
            };
            try {
                localStorage.setItem(LOAN_COUNTDOWN_STORAGE_KEY, JSON.stringify(payload));
            } catch (e) {
                console.warn('Could not save loan form to local storage', e);
            }
        },
        loadLoanFormFromStorage() {
            try {
                const raw = localStorage.getItem(LOAN_COUNTDOWN_STORAGE_KEY);
                if (!raw) {
                    return;
                }
                const saved = JSON.parse(raw);
                if (!saved || typeof saved !== 'object') {
                    return;
                }
                if (
                    saved.disposable_per_month != null &&
                    saved.disposable_per_month !== '' &&
                    (saved.disposable_per_paycheck1 == null || saved.disposable_per_paycheck1 === '') &&
                    (saved.disposable_per_paycheck15 == null || saved.disposable_per_paycheck15 === '')
                ) {
                    const v = Number(saved.disposable_per_month);
                    if (Number.isFinite(v)) {
                        saved.disposable_per_paycheck1 = v;
                        saved.disposable_per_paycheck15 = v;
                    }
                }
                for (let n = 1; n <= 5; n++) {
                    const k1 = `loan${n}_adjust_disposable_per_paycheck1`;
                    const k15 = `loan${n}_adjust_disposable_per_paycheck15`;
                    if (saved[k1] != null && saved[k1] !== '') {
                        continue;
                    }
                    const legacyP = saved[`loan${n}_adjust_disposable_per_paycheck`];
                    if (legacyP != null && legacyP !== '') {
                        const pv = Number(legacyP);
                        if (Number.isFinite(pv)) {
                            saved[k1] = pv;
                            saved[k15] = pv;
                        }
                        continue;
                    }
                    const legacyM = saved[`loan${n}_adjust_disposable_per_month`];
                    if (legacyM != null && legacyM !== '') {
                        const mv = Number(legacyM) / 2;
                        if (Number.isFinite(mv)) {
                            saved[k1] = mv;
                            saved[k15] = mv;
                        }
                    }
                }
                const defaults = defaultLoanFormState();
                const numberKeys = new Set([
                    'disposable_per_paycheck1',
                    'disposable_per_paycheck15',
                    'already_spent_on_first_paycheck',
                    'loan1_remaining_balance',
                    'loan2_remaining_balance',
                    'loan3_remaining_balance',
                    'loan4_remaining_balance',
                    'loan5_remaining_balance',
                    'loan1_adjust_disposable_per_paycheck1',
                    'loan1_adjust_disposable_per_paycheck15',
                    'loan2_adjust_disposable_per_paycheck1',
                    'loan2_adjust_disposable_per_paycheck15',
                    'loan3_adjust_disposable_per_paycheck1',
                    'loan3_adjust_disposable_per_paycheck15',
                    'loan4_adjust_disposable_per_paycheck1',
                    'loan4_adjust_disposable_per_paycheck15',
                    'loan5_adjust_disposable_per_paycheck1',
                    'loan5_adjust_disposable_per_paycheck15',
                    'loan1_min_to_principal',
                    'loan2_min_to_principal',
                    'loan3_min_to_principal',
                    'loan4_min_to_principal',
                    'loan5_min_to_principal',
                    'loan1_day_of_month',
                    'loan2_day_of_month',
                    'loan3_day_of_month',
                    'loan4_day_of_month',
                    'loan5_day_of_month',
                ]);
                Object.keys(defaults).forEach((key) => {
                    if (Object.prototype.hasOwnProperty.call(saved, key)) {
                        const v = saved[key];
                        if (numberKeys.has(key)) {
                            if (v === null || v === undefined || v === '') {
                                this[key] = null;
                            } else {
                                const n = Number(v);
                                this[key] = Number.isNaN(n) ? null : n;
                            }
                        } else if (typeof defaults[key] === 'string') {
                            this[key] = v == null ? '' : String(v);
                        } else if (typeof defaults[key] === 'boolean') {
                            this[key] = !!v;
                        } else {
                            this[key] = v;
                        }
                    }
                });
            } catch (e) {
                console.warn('Could not load loan form from local storage', e);
            }
        },
        clearLoanFormData() {
            try {
                localStorage.removeItem(LOAN_COUNTDOWN_STORAGE_KEY);
            } catch (e) {
                console.warn('Could not clear loan form storage', e);
            }
            const d = defaultLoanFormState();
            Object.keys(d).forEach((key) => {
                this[key] = d[key];
            });
            this.loan1Schedule = [];
            this.loan2Schedule = [];
            this.loan3Schedule = [];
            this.loan4Schedule = [];
            this.loan5Schedule = [];
            this.countdownValidationError = '';
            this.loan1PayoffLeftover = null;
            this.loan2PayoffLeftover = null;
            this.loan2BalanceAfterLoan1Spill = null;
            this.loan3PayoffLeftover = null;
            this.loan3BalanceAfterLoan2Spill = null;
            this.loan4PayoffLeftover = null;
            this.loan4BalanceAfterLoan3Spill = null;
            this.loan5PayoffLeftover = null;
            this.loan5BalanceAfterLoan4Spill = null;
        },
        formatMoney(value) {
            const n = Number(value);
            if (!Number.isFinite(n)) {
                return '0.00';
            }
            return n.toFixed(2);
        },
        // async addDeterminedDisposable() {
        //     try {
        //         const response = await axios.get(`/api/updatePaycheckDisposable.php?paycheck_date=${this.payDateFormatted}&amount=${this.determinedDisposable}`);
        //         if (response.data) {
        //         }
        //     } catch (error) {
        //         console.error("Error fetching data:", error);
        //     }
        // },
        calculateLoanCountdown() {
            this.countdownValidationError = '';
            this.loan1Schedule = [];
            this.loan2Schedule = [];
            this.loan3Schedule = [];
            this.loan4Schedule = [];
            this.loan5Schedule = [];
            this.loan1PayoffLeftover = null;
            this.loan2PayoffLeftover = null;
            this.loan2BalanceAfterLoan1Spill = null;
            this.loan3PayoffLeftover = null;
            this.loan3BalanceAfterLoan2Spill = null;
            this.loan4PayoffLeftover = null;
            this.loan4BalanceAfterLoan3Spill = null;
            this.loan5PayoffLeftover = null;
            this.loan5BalanceAfterLoan4Spill = null;

            const base1 = Number(this.disposable_per_paycheck1);
            const base15 = Number(this.disposable_per_paycheck15);
            if (!this.starting_month) {
                this.countdownValidationError = 'Please select a starting month.';
                return;
            }
            if (!Number.isFinite(base1) || base1 <= 0 || !Number.isFinite(base15) || base15 <= 0) {
                this.countdownValidationError =
                    'Please enter disposable for both the 1st and 15th paychecks (each must be greater than zero).';
                return;
            }
            if (!this.loan1_filled) {
                this.countdownValidationError = 'Please enter Loan #1 name and remaining balance.';
                return;
            }

            let loan1Bal = roundMoney(this.loan1_remaining_balance);
            let loan2Bal = 0;
            if (this.loan2_filled) {
                loan2Bal = roundMoney(this.loan2_remaining_balance);
            } else if (this.loan2_remaining_balance != null && this.loan2_remaining_balance !== '') {
                const b = roundMoney(this.loan2_remaining_balance);
                if (Number.isFinite(b) && b >= 0) {
                    loan2Bal = b;
                }
            }
            const hadLoan2StartingBalance = loan2Bal > 0;

            let loan3Bal = 0;
            if (this.loan3_filled) {
                loan3Bal = roundMoney(this.loan3_remaining_balance);
            } else if (this.loan3_remaining_balance != null && this.loan3_remaining_balance !== '') {
                const b3 = roundMoney(this.loan3_remaining_balance);
                if (Number.isFinite(b3) && b3 >= 0) {
                    loan3Bal = b3;
                }
            }
            const hadLoan3StartingBalance = loan3Bal > 0;

            let loan4Bal = 0;
            if (this.loan4_filled) {
                loan4Bal = roundMoney(this.loan4_remaining_balance);
            } else if (this.loan4_remaining_balance != null && this.loan4_remaining_balance !== '') {
                const b4 = roundMoney(this.loan4_remaining_balance);
                if (Number.isFinite(b4) && b4 >= 0) {
                    loan4Bal = b4;
                }
            }
            const hadLoan4StartingBalance = loan4Bal > 0;

            let loan5Bal = 0;
            if (this.loan5_filled) {
                loan5Bal = roundMoney(this.loan5_remaining_balance);
            } else if (this.loan5_remaining_balance != null && this.loan5_remaining_balance !== '') {
                const b5 = roundMoney(this.loan5_remaining_balance);
                if (Number.isFinite(b5) && b5 >= 0) {
                    loan5Bal = b5;
                }
            }
            const hadLoan5StartingBalance = loan5Bal > 0;

            const hadChain = [
                hadLoan2StartingBalance,
                hadLoan3StartingBalance,
                hadLoan4StartingBalance,
                hadLoan5StartingBalance,
            ];

            const bals = [loan1Bal, loan2Bal, loan3Bal, loan4Bal, loan5Bal];

            const loansCfg = [];
            for (let n = 1; n <= 5; n++) {
                loansCfg.push({
                    dom: Number(this[`loan${n}_day_of_month`]),
                    minP: Number(this[`loan${n}_min_to_principal`]),
                });
            }

            const todayStart = startOfLocalDay(new Date());
            const planParsed = parseStartYm(this.starting_month);
            if (!planParsed) {
                this.countdownValidationError = 'Please select a valid starting month.';
                return;
            }
            const planStart = startOfLocalDay(new Date(planParsed.y, planParsed.m0, 1));
            const filterMinMs = Math.max(planStart.getTime(), todayStart.getTime());

            const allPc = listPaycheckDatesFromPlanStart(this.starting_month, 3200);
            let pcDates = allPc.filter((dt) => startOfLocalDay(dt).getTime() >= filterMinMs);
            if (this.push_to_next_paycheck && pcDates.length > 0) {
                // Skip the next upcoming paycheck: 1st → 15th, or 15th → 1st of next month.
                pcDates = pcDates.slice(1);
            }
            if (pcDates.length === 0) {
                this.countdownValidationError =
                    'No paycheck dates on or after today for the selected starting month.';
                return;
            }

            let lastMinExclusive = addDays(todayStart, -1);

            const getAdjustAdd = (loanN, isFirst) => {
                const a1 = Number(this[`loan${loanN}_adjust_disposable_per_paycheck1`]);
                const a15 = Number(this[`loan${loanN}_adjust_disposable_per_paycheck15`]);
                const v1 = Number.isFinite(a1) ? a1 : 0;
                const v15 = Number.isFinite(a15) ? a15 : 0;
                return isFirst ? v1 : v15;
            };

            const maxPaychecks = 1200;
            let pi = 0;

            for (; pi < maxPaychecks; pi++) {
                const pcDate = pcDates[pi];
                if (!pcDate) {
                    break;
                }
                if (!bals.some((b) => b > 0)) {
                    break;
                }

                let activeN = 0;
                for (let j = 0; j < 5; j++) {
                    if (bals[j] > 0) {
                        activeN = j + 1;
                        break;
                    }
                }
                if (!activeN) {
                    break;
                }

                applyMinPrincipalAccrualsInWindow(bals, loansCfg, lastMinExclusive, pcDate);
                lastMinExclusive = startOfLocalDay(pcDate);

                const isFirst = pcDate.getDate() === 1;
                const basePool = isFirst ? base1 : base15;
                const adjAdd = getAdjustAdd(activeN, isFirst);
                let pool = roundMoney(basePool + adjAdd);
                if (pi === 0) {
                    const alreadySpent = Number(this.already_spent_on_first_paycheck);
                    if (Number.isFinite(alreadySpent) && alreadySpent > 0) {
                        pool = roundMoney(Math.max(0, pool - alreadySpent));
                    }
                }
                const dateLabel = formatPaycheckDateLabel(pcDate);

                if (activeN === 1) {
                    const applied1 = appliedPrincipalThisPaycheck(bals[0], pool, this.loan1_min_to_principal);
                    bals[0] = roundMoney(bals[0] - applied1);
                    this.loan1Schedule.push({
                        dateLabel,
                        disposableApplied: applied1,
                        runningTotal: bals[0],
                    });
                    if (bals[0] <= 0) {
                        bals[0] = 0;
                        const spillFromLoan1 = roundMoney(pool - applied1);
                        this.loan1PayoffLeftover = spillFromLoan1;
                        const balances = [bals[1], bals[2], bals[3], bals[4]];
                        cascadeSpillFromRoll(this, spillFromLoan1, balances, hadChain, true, 2);
                        bals[1] = balances[0];
                        bals[2] = balances[1];
                        bals[3] = balances[2];
                        bals[4] = balances[3];
                    }
                } else if (activeN === 2) {
                    const applied2 = appliedPrincipalThisPaycheck(bals[1], pool, this.loan2_min_to_principal);
                    bals[1] = roundMoney(bals[1] - applied2);
                    this.loan2Schedule.push({
                        dateLabel,
                        disposableApplied: applied2,
                        runningTotal: bals[1],
                    });
                    if (bals[1] <= 0) {
                        bals[1] = 0;
                        const spillFromLoan2 = roundMoney(pool - applied2);
                        this.loan2PayoffLeftover = spillFromLoan2;
                        const balances = [bals[1], bals[2], bals[3], bals[4]];
                        cascadeSpillFromRoll(this, spillFromLoan2, balances, hadChain, false, 3);
                        bals[1] = balances[0];
                        bals[2] = balances[1];
                        bals[3] = balances[2];
                        bals[4] = balances[3];
                    }
                } else if (activeN === 3) {
                    const applied3 = appliedPrincipalThisPaycheck(bals[2], pool, this.loan3_min_to_principal);
                    bals[2] = roundMoney(bals[2] - applied3);
                    this.loan3Schedule.push({
                        dateLabel,
                        disposableApplied: applied3,
                        runningTotal: bals[2],
                    });
                    if (bals[2] <= 0) {
                        bals[2] = 0;
                        const spillFromLoan3 = roundMoney(pool - applied3);
                        this.loan3PayoffLeftover = spillFromLoan3;
                        const balances = [bals[1], bals[2], bals[3], bals[4]];
                        cascadeSpillFromRoll(this, spillFromLoan3, balances, hadChain, false, 4);
                        bals[1] = balances[0];
                        bals[2] = balances[1];
                        bals[3] = balances[2];
                        bals[4] = balances[3];
                    }
                } else if (activeN === 4) {
                    const applied4 = appliedPrincipalThisPaycheck(bals[3], pool, this.loan4_min_to_principal);
                    bals[3] = roundMoney(bals[3] - applied4);
                    this.loan4Schedule.push({
                        dateLabel,
                        disposableApplied: applied4,
                        runningTotal: bals[3],
                    });
                    if (bals[3] <= 0) {
                        bals[3] = 0;
                        const spillFromLoan4 = roundMoney(pool - applied4);
                        this.loan4PayoffLeftover = spillFromLoan4;
                        const balances = [bals[1], bals[2], bals[3], bals[4]];
                        cascadeSpillFromRoll(this, spillFromLoan4, balances, hadChain, false, 5);
                        bals[1] = balances[0];
                        bals[2] = balances[1];
                        bals[3] = balances[2];
                        bals[4] = balances[3];
                    }
                } else if (activeN === 5) {
                    const applied5 = appliedPrincipalThisPaycheck(bals[4], pool, this.loan5_min_to_principal);
                    bals[4] = roundMoney(bals[4] - applied5);
                    this.loan5Schedule.push({
                        dateLabel,
                        disposableApplied: applied5,
                        runningTotal: bals[4],
                    });
                    if (bals[4] <= 0) {
                        bals[4] = 0;
                        this.loan5PayoffLeftover = roundMoney(pool - applied5);
                    }
                }
            }

            const anyLeft = bals.some((b) => b > 0);
            if (anyLeft) {
                this.countdownValidationError =
                    'Schedule stopped after 1200 paychecks (or ran out of dated paychecks); check your amounts.';
                this.loan1PayoffLeftover = null;
                this.loan2PayoffLeftover = null;
                this.loan2BalanceAfterLoan1Spill = null;
                this.loan3PayoffLeftover = null;
                this.loan3BalanceAfterLoan2Spill = null;
                this.loan4PayoffLeftover = null;
                this.loan4BalanceAfterLoan3Spill = null;
                this.loan5PayoffLeftover = null;
                this.loan5BalanceAfterLoan4Spill = null;
            }
        },
    }
}).mount('#app');
</script>
</body>
</html>
