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
                    <label class="col-sm-4 control-label" for="disposable_per_month">Disposable per month</label>
                    <div class="col-sm-8">
                        <input type="number" id="disposable_per_month" v-model.number="disposable_per_month" class="form-control" step="any" @blur="persistLoanForm" />
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
                    <label class="col-sm-4 control-label" for="loan1_adjust_disposable_per_month">Adjust disposable per month</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan1_adjust_disposable_per_month" v-model.number="loan1_adjust_disposable_per_month" class="form-control" step="any" @blur="persistLoanForm" />
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
                    <label class="col-sm-4 control-label" for="adjust_disposable_per_month">Adjust disposable per month</label>
                    <div class="col-sm-8">
                        <input type="number" id="loan2_adjust_disposable_per_month" v-model.number="loan2_adjust_disposable_per_month" class="form-control" step="any" @blur="persistLoanForm" />
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
                            <th>Disposable per month</th>
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
            </template>

            <template v-if="loan2Schedule.length">
                <h2 style="margin-top: 24px;">{{ (loan2_name && loan2_name.trim()) ? loan2_name : 'Loan #2' }}</h2>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Disposable per month</th>
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
        disposable_per_month: null,
        starting_month: '',
        loan1_name: '',
        loan1_remaining_balance: null,
        loan1_adjust_disposable_per_month: null,
        loan2_name: '',
        loan2_remaining_balance: null,
        loan2_adjust_disposable_per_month: null,
    };
}

function roundMoney(n) {
    return Math.round(Number(n) * 100) / 100;
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

createApp({
    data() {
        return {
            ...defaultLoanFormState(),
            loan1Schedule: [],
            loan2Schedule: [],
            countdownValidationError: '',
            loan1PayoffLeftover: null,
            loan2PayoffLeftover: null,
            loan2BalanceAfterLoan1Spill: null,
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
    },
    mounted() {
        this.loadLoanFormFromStorage();
        this.calculateLoanCountdown();
    },
    methods: {
        persistLoanForm() {
            const payload = {
                disposable_per_month: this.disposable_per_month,
                starting_month: this.starting_month,
                loan1_name: this.loan1_name,
                loan1_remaining_balance: this.loan1_remaining_balance,
                loan1_adjust_disposable_per_month: this.loan1_adjust_disposable_per_month,
                loan2_name: this.loan2_name,
                loan2_remaining_balance: this.loan2_remaining_balance,
                loan2_adjust_disposable_per_month: this.loan2_adjust_disposable_per_month,
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
                const defaults = defaultLoanFormState();
                const numberKeys = new Set([
                    'disposable_per_month',
                    'loan1_remaining_balance',
                    'loan2_remaining_balance',
                    'loan1_adjust_disposable_per_month',
                    'loan2_adjust_disposable_per_month',
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
            this.countdownValidationError = '';
            this.loan1PayoffLeftover = null;
            this.loan2PayoffLeftover = null;
            this.loan2BalanceAfterLoan1Spill = null;
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
            this.loan1PayoffLeftover = null;
            this.loan2PayoffLeftover = null;
            this.loan2BalanceAfterLoan1Spill = null;

            const base = Number(this.disposable_per_month);
            if (!this.starting_month) {
                this.countdownValidationError = 'Please select a starting month.';
                return;
            }
            if (!Number.isFinite(base) || base <= 0) {
                this.countdownValidationError = 'Please enter disposable per month (must be greater than zero).';
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

            const adj1 = Number(this.loan1_adjust_disposable_per_month);
            const adj2 = Number(this.loan2_adjust_disposable_per_month);
            const add1 = Number.isFinite(adj1) ? adj1 : 0;
            const add2 = Number.isFinite(adj2) ? adj2 : 0;

            const maxMonths = 600;
            let monthOffset = 0;

            while ((loan1Bal > 0 || loan2Bal > 0) && monthOffset < maxMonths) {
                const dateLabel = monthLabelFromOffset(this.starting_month, monthOffset);

                // Loan 2 only starts the month after loan 1 is fully paid (never same month as loan 1's last payment).
                if (loan1Bal > 0) {
                    const pool1 = roundMoney(base + add1);
                    const applied1 = roundMoney(Math.min(loan1Bal, pool1));
                    loan1Bal = roundMoney(loan1Bal - applied1);
                    this.loan1Schedule.push({
                        dateLabel,
                        disposableApplied: applied1,
                        runningTotal: loan1Bal,
                    });
                    if (loan1Bal <= 0) {
                        loan1Bal = 0;
                        const spillFromLoan1 = roundMoney(pool1 - applied1);
                        this.loan1PayoffLeftover = spillFromLoan1;
                        let roll = spillFromLoan1;
                        if (loan2Bal > 0 && roll > 0) {
                            const toLoan2 = roundMoney(Math.min(loan2Bal, roll));
                            loan2Bal = Math.max(0, roundMoney(loan2Bal - toLoan2));
                            roll = roundMoney(roll - toLoan2);
                            if (loan2Bal <= 0) {
                                loan2Bal = 0;
                                this.loan2PayoffLeftover = roll;
                            }
                        }
                        if (hadLoan2StartingBalance) {
                            this.loan2BalanceAfterLoan1Spill = loan2Bal;
                        }
                    }
                } else if (loan2Bal > 0) {
                    const pool2 = roundMoney(base + add2);
                    const applied2 = roundMoney(Math.min(loan2Bal, pool2));
                    loan2Bal = roundMoney(loan2Bal - applied2);
                    this.loan2Schedule.push({
                        dateLabel,
                        disposableApplied: applied2,
                        runningTotal: loan2Bal,
                    });
                    if (loan2Bal <= 0) {
                        this.loan2PayoffLeftover = roundMoney(pool2 - applied2);
                    }
                }

                if (loan1Bal <= 0 && loan2Bal <= 0) {
                    break;
                }

                monthOffset += 1;
            }

            if (monthOffset >= maxMonths && (loan1Bal > 0 || loan2Bal > 0)) {
                this.countdownValidationError = 'Schedule stopped after 600 months; check your amounts.';
                this.loan1PayoffLeftover = null;
                this.loan2PayoffLeftover = null;
                this.loan2BalanceAfterLoan1Spill = null;
            }
        },
    }
}).mount('#app');
</script>
</body>
</html>
