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
    <title>Charge Catgories</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="/css/bills_admin.css" />
    <!-- Vue.js CDN -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
</head>
<body>
<div class="container" id="app">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h2>Budget Track</h2>

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 24px"></div>


    <h4>Disposable Per Month</h4>
    <div class="row">
        <div class="col-xs-6">
            <input type="number" id="Disposable Per Month" class="form-control" 
                placeholder="Disposable Per Month" v-model="disposable_per_month" />
        </div>
        <div class="col-xs-6">
            <button class="btn btn-default" @click="calcProgress">Calculate</button>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-6">
            <h3>Initial Balance</h3>
            <label for="sofi_balance">Sofi</label>
            <input type="number" id="sofi_balance" class="form-control" 
                placeholder="Sofi Balance" v-model="sofi_balance" />
            <div style="clear: both; height: 8px"></div>
            <label for="mastercard_balance">Mastercard</label>
            <input type="number" id="mastercard_balance" class="form-control" 
                placeholder="Mastercard Balance" v-model="mastercard_balance" />
            <div style="clear: both; height: 8px"></div>
            <label for="credit_human_balance">Credit Human</label>
            <input type="number" id="credit_human_balance" class="form-control" 
                placeholder="Credit Human Balance" v-model="credit_human_balance" />
            <div style="clear: both; height: 8px"></div>
            <label for="total_balance">Total Balance</label>
            <input type="number" id="total_balance" class="form-control" 
                placeholder="Total Balance" v-model="total_balance" />
        </div>
        <div class="col-xs-6">
            <h3>Min Payment</h3>
            <label for="sofi_min_payment">Sofi</label>
            <input type="number" id="sofi_min_payment" class="form-control" 
                placeholder="Sofi Min Payment" v-model="sofi_min_payment" />
            <div style="clear: both; height: 8px"></div>
            <label for="mastercard_min_payment">Mastercard</label>
            <input type="number" id="mastercard_min_payment" class="form-control" 
                placeholder="Mastercard Min Payment" v-model="mastercard_min_payment" />
            <div style="clear: both; height: 8px"></div>
            <label for="credit_human_min_payment">Credit Human</label>
            <input type="number" id="credit_human_min_payment" class="form-control" 
                placeholder="Credit Human Min Payment" v-model="credit_human_min_payment" />
            <div style="clear: both; height: 8px"></div>
            <label for="total_min_payment">Total Min Payment</label>
            <input type="number" id="total_min_payment" class="form-control" 
                placeholder="Total Min Payment" v-model="total_min_payment" />
        </div>
    </div>
    <div style="clear: both; height: 16px"></div>

    <div class="row">
        <div class="col-xs-12">
            <h3>Months Left</h3>
            <label for="sofi_months_left">Sofi</label>
            <input type="number" id="sofi_months_left" class="form-control" 
                placeholder="Sofi Months Left" v-model="sofi_months_left" />
            <div style="clear: both; height: 8px"></div>
            <label for="mastercard_months_left">Mastercard</label>
            <input type="number" id="mastercard_months_left" class="form-control" 
                placeholder="Mastercard Months Left" v-model="mastercard_months_left" />
            <div style="clear: both; height: 8px"></div>
            <label for="credit_human_months_left">Credit Human</label>
            <input type="number" id="credit_human_months_left" class="form-control" 
                placeholder="Credit Human Months Left" v-model="credit_human_months_left" />
            <div style="clear: both; height: 8px"></div>
            <label for="total_months_left">Total Months Left</label>
            <input type="number" id="total_months_left" class="form-control" 
                placeholder="Total Months Left" v-model="total_months_left" />
        </div>
    </div>
    <div style="clear: both; height: 16px"></div>


</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js" ></script>
<script>
    // Vue.js App
    var app = new Vue({
        el: '#app',
        data: {
            disposable_per_month: 1100,
            sofi_balance: 8852,
            mastercard_balance: 12492,
            credit_human_balance: 9598,
            total_balance: 0,
            sofi_min_payment: 618,
            mastercard_min_payment: 250,
            credit_human_min_payment: 293,
            total_min_payment: 0,
            sofi_percentage_principal: 0.53,
            mastercard_percentage_principal: 0.68,
            credit_human_percentage_principal: 0.85,
            sofi_amount_principal: 0,
            mastercard_amount_principal: 0,
            credit_human_amount_principal: 0,
            sofi_total_principal_monthly: 0,
            mastercard_total_principal_monthly: 0,
            credit_human_total_principal_monthly: 0,
            sofi_months_left: 0,
            mastercard_months_left: 0,
            credit_human_months_left: 0,
            total_months_left: 0,
        },
        methods: {
            calcProgress: function() {
                // Calculate total balance
                this.total_balance = parseFloat(this.sofi_balance) + parseFloat(this.mastercard_balance) + parseFloat(this.credit_human_balance);

                console.log('111');
                
                // Calculate total min payment
                this.total_min_payment = parseFloat(this.sofi_min_payment) + parseFloat(this.mastercard_min_payment) + parseFloat(this.credit_human_min_payment);

                console.log('222');

                this.sofi_amount_principal = parseFloat((this.sofi_min_payment * this.sofi_percentage_principal).toFixed(2));
                this.sofi_total_principal_monthly = (this.disposable_per_month + this.sofi_amount_principal);
                this.sofi_months_left = (this.sofi_balance / this.sofi_total_principal_monthly).toFixed(1);

                this.mastercard_amount_principal = parseFloat((this.mastercard_min_payment * this.mastercard_percentage_principal).toFixed(2));
                this.mastercard_total_principal_monthly = (this.disposable_per_month + this.sofi_min_payment + this.mastercard_amount_principal);
                this.mastercard_months_left = (this.mastercard_balance / this.mastercard_total_principal_monthly).toFixed(1);

                this.credit_human_amount_principal = parseFloat((this.credit_human_min_payment * this.credit_human_percentage_principal).toFixed(2));
                this.credit_human_total_principal_monthly = (this.disposable_per_month + this.sofi_min_payment + this.mastercard_min_payment + this.credit_human_amount_principal);
                this.credit_human_months_left = (this.credit_human_balance / this.credit_human_total_principal_monthly).toFixed(1);

                this.total_months_left = (parseFloat(this.sofi_months_left) + parseFloat(this.mastercard_months_left) + parseFloat(this.credit_human_months_left)).toFixed(1);

                console.log('666');

                console.log({
                    "items": {
                        "disposable_per_month": this.disposable_per_month,
                        "sofi_balance": this.sofi_balance,
                        "mastercard_balance": this.mastercard_balance,
                        "credit_human_balance": this.credit_human_balance,
                        "total_balance": this.total_balance,
                        "sofi_min_payment": this.sofi_min_payment,
                        "mastercard_min_payment": this.mastercard_min_payment,
                        "credit_human_min_payment": this.credit_human_min_payment,
                        "total_min_payment": this.total_min_payment,
                        "sofi_percentage_principal": this.sofi_percentage_principal,
                        "mastercard_percentage_principal": this.mastercard_percentage_principal,
                        "credit_human_percentage_principal": this.credit_human_percentage_principal,
                        "sofi_amount_principal": this.sofi_amount_principal,
                        "mastercard_amount_principal": this.mastercard_amount_principal,
                        "credit_human_amount_principal": this.credit_human_amount_principal,
                        "sofi_total_principal_monthly": this.sofi_total_principal_monthly,
                        "mastercard_total_principal_monthly": this.mastercard_total_principal_monthly,
                        "credit_human_total_principal_monthly": this.credit_human_total_principal_monthly,
                        "sofi_months_left": this.sofi_months_left,
                        "mastercard_months_left": this.mastercard_months_left,
                        "credit_human_months_left": this.credit_human_months_left,
                        "total_months_left": this.total_months_left,
                    }
                })
            }
        },
        watch: {
            sofi_balance: function(newVal, oldVal) {
                localStorage.setItem('sofi_balance', newVal);
            },
            mastercard_balance: function(newVal, oldVal) {
                localStorage.setItem('mastercard_balance', newVal);
            },
            credit_human_balance: function(newVal, oldVal) {
                localStorage.setItem('credit_human_balance', newVal);
            },
            disposable_per_month: function(newVal, oldVal) {
                localStorage.setItem('disposable_per_month', newVal);
            }
        },
        mounted() {

            if (localStorage.getItem('sofi_balance') && !isNaN(localStorage.getItem('sofi_balance'))) {
                this.sofi_balance = parseFloat(localStorage.getItem('sofi_balance'));
            }

            if (localStorage.getItem('mastercard_balance') && !isNaN(localStorage.getItem('mastercard_balance'))) {
                this.mastercard_balance = parseFloat(localStorage.getItem('mastercard_balance'));
            }

            if (localStorage.getItem('credit_human_balance') && !isNaN(localStorage.getItem('credit_human_balance'))) {
                this.credit_human_balance = parseFloat(localStorage.getItem('credit_human_balance'));
            }

            if (localStorage.getItem('disposable_per_month') && !isNaN(localStorage.getItem('disposable_per_month'))) {
                this.disposable_per_month = parseFloat(localStorage.getItem('disposable_per_month'));
            }   

            this.total_balance = parseFloat(this.sofi_balance) + parseFloat(this.mastercard_balance) + parseFloat(this.credit_human_balance);

            this.total_min_payment = parseFloat(this.sofi_min_payment) + parseFloat(this.mastercard_min_payment) + parseFloat(this.credit_human_min_payment);
        }
    });
</script>