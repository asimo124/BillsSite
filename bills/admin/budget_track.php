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
    <!-- Font Awesome for hamburger icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="/css/bills_admin.css" />
    <link rel="stylesheet" href="/css/budget_track.css?version=7" />
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

    <div class="row">
        <div v-for="(yearGroup, yearIndex) in months_left_arr" :key="yearIndex">
            <h4>{{ yearGroup.year_title }}</h4>
            <div class="col-xs-4 col-sm-3 col-md-2" v-for="(month, monthIndex) in yearGroup.months" :key="monthIndex">
                <div class="cal_month" :class="{'green_box': month.color === 'green', 'red_box': month.color === 'red', 'blue_box': month.color === 'blue'}">
                    <span class="cal_month_title">{{ month.month_year }}</span>
                </div>
            </div>
            <div style="clear: both;"></div>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-6">
            <h3>Min Payment Principal</h3>
            <label for="sofi_amount_principal">Sofi</label>
            <input type="number" id="sofi_amount_principal" class="form-control" 
                placeholder="Sofi Min Payment Principal" v-model="sofi_amount_principal" />
            <div style="clear: both; height: 8px"></div>
            <label for="mastercard_amount_principal">Mastercard</label>
            <input type="number" id="mastercard_amount_principal" class="form-control" 
                placeholder="Mastercard Min Payment Principal" v-model="mastercard_amount_principal" />
            <div style="clear: both; height: 8px"></div>
            <label for="credit_human_amount_principal">Credit Human</label>
            <input type="number" id="credit_human_amount_principal" class="form-control" 
                placeholder="Credit Human Min Payment Principal" v-model="credit_human_amount_principal" />
            <div style="clear: both; height: 8px"></div>
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
            sofi_amount_principal: 566, // from 512 on 9/12/2025
            mastercard_amount_principal: 125,
            credit_human_amount_principal: 200,
            sofi_total_principal_monthly: 0,
            mastercard_total_principal_monthly: 0,
            credit_human_total_principal_monthly: 0,
            sofi_months_left: 0,
            mastercard_months_left: 0,
            credit_human_months_left: 0,
            total_months_left: 0,
            months_left_arr: []
        },
        methods: {
            calcProgress: function() {
                // Calculate total balance
                this.total_balance = parseFloat(this.sofi_balance) + parseFloat(this.mastercard_balance) + parseFloat(this.credit_human_balance);

                // Calculate total min payment
                this.total_min_payment = parseFloat(this.sofi_min_payment) + parseFloat(this.mastercard_min_payment) + parseFloat(this.credit_human_min_payment);

                //this.sofi_amount_principal = parseFloat((this.sofi_min_payment * this.sofi_percentage_principal).toFixed(2));
                this.sofi_total_principal_monthly = (parseFloat(this.disposable_per_month) + parseFloat(this.sofi_amount_principal));
                this.sofi_months_left = parseFloat((this.sofi_balance / this.sofi_total_principal_monthly).toFixed(1));

                console.log('sofi_amount_principal: ' + this.sofi_amount_principal);
                console.log('sofi_total_principal_monthly: ' + this.sofi_total_principal_monthly);
                console.log('sofi_months_left: ' + this.sofi_months_left);  

                //this.mastercard_amount_principal = parseFloat((this.mastercard_min_payment * this.mastercard_percentage_principal).toFixed(2));
                this.mastercard_total_principal_monthly = (parseFloat(this.disposable_per_month) + parseFloat(this.sofi_min_payment) + parseFloat(this.mastercard_amount_principal));
                this.mastercard_months_left = parseFloat((this.mastercard_balance / this.mastercard_total_principal_monthly).toFixed(1));

                //this.credit_human_amount_principal = parseFloat((this.credit_human_min_payment * this.credit_human_percentage_principal).toFixed(2));
                this.credit_human_total_principal_monthly = (parseFloat(this.disposable_per_month) + parseFloat(this.sofi_min_payment) + parseFloat(this.mastercard_min_payment) + parseFloat(this.credit_human_amount_principal));
                this.credit_human_months_left = parseFloat((this.credit_human_balance / this.credit_human_total_principal_monthly).toFixed(1));

                this.total_months_left = (parseFloat(this.sofi_months_left) + parseFloat(this.mastercard_months_left) + parseFloat(this.credit_human_months_left)).toFixed(1);

                var total_paychecks_left = Math.round(this.total_months_left * 2);
                console.log('Total Paychecks Left: ' + total_paychecks_left);

                var date2 = new Date();
                var curDay = date2.getDate();
                if (curDay > 15) {
                    total_paychecks_left = total_paychecks_left + 1;
                }
                this.total_months_left_after = Math.round(total_paychecks_left / 2);

                // Clear the months array and populate with month names grouped by year
                this.months_left_arr = [];
                var monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
                                 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                
                var currentDate = new Date();
                var currentMonth = currentDate.getMonth(); // 0-11
                var currentYear = currentDate.getFullYear();
                
                var yearGroups = {};
                
                for (var i = 0; i < this.total_months_left_after; i++) {
                    var monthIndex = (currentMonth + 1 + i) % 12; // Start from next month
                    var yearOffset = Math.floor((currentMonth + 1 + i) / 12); // Calculate year offset
                    var displayYear = currentYear + yearOffset; // Full year
                    var displayYearShort = displayYear.toString().slice(-2); // Last 2 digits
                    var monthYearString = monthNames[monthIndex] + ' ' + displayYearShort;
                    
                    // Group by year
                    if (!yearGroups[displayYear]) {
                        yearGroups[displayYear] = {
                            year_title: displayYear,
                            months: []
                        };
                    }

                    var sofi_threshold = this.sofi_months_left;
                    var mastercard_threshold = sofi_threshold + this.mastercard_months_left;
                    var credit_human_threshold = mastercard_threshold + this.credit_human_months_left;

                    console.log('i: ' + i + ', sofi_threshold: ' + sofi_threshold + ', mastercard_threshold: ' + mastercard_threshold + ', credit_human_threshold: ' + credit_human_threshold);

                    if (i < sofi_threshold) {
                        yearGroups[displayYear].months.push({
                            month_year: monthYearString,
                            color: "red",
                        });
                    } else if (i < mastercard_threshold) {
                        yearGroups[displayYear].months.push({
                            month_year: monthYearString,
                            color: "blue",
                        });
                    } else if (i < credit_human_threshold) {
                        yearGroups[displayYear].months.push({
                            month_year: monthYearString,
                            color: "green",
                        });
                    }
                }
                
                // Convert to array
                this.months_left_arr = Object.values(yearGroups);

                console.log('Months array:', this.months_left_arr);

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
            },
            sofi_months_left: function(newVal, oldVal) {
                localStorage.setItem('sofi_months_left', newVal);
            },
            sofi_amount_principal: function(newVal, oldVal) {
                localStorage.setItem('sofi_amount_principal', newVal);
            },
            mastercard_amount_principal: function(newVal, oldVal) {
                localStorage.setItem('mastercard_amount_principal', newVal);
            },
            credit_human_amount_principal: function(newVal, oldVal) {
                localStorage.setItem('credit_human_amount_principal', newVal);
            },
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

            if (localStorage.getItem('sofi_amount_principal') && !isNaN(localStorage.getItem('sofi_amount_principal'))) {
                this.sofi_amount_principal = parseFloat(localStorage.getItem('sofi_amount_principal'));
            }
            if (localStorage.getItem('mastercard_amount_principal') && !isNaN(localStorage.getItem('mastercard_amount_principal'))) {
                this.mastercard_amount_principal = parseFloat(localStorage.getItem('mastercard_amount_principal'));
            }
            if (localStorage.getItem('credit_human_amount_principal') && !isNaN(localStorage.getItem('credit_human_amount_principal'))) {
                this.credit_human_amount_principal = parseFloat(localStorage.getItem('credit_human_amount_principal'));
            }

            this.total_balance = parseFloat(this.sofi_balance) + parseFloat(this.mastercard_balance) + parseFloat(this.credit_human_balance);

            this.total_min_payment = parseFloat(this.sofi_min_payment) + parseFloat(this.mastercard_min_payment) + parseFloat(this.credit_human_min_payment);
        
            this.calcProgress();
        }
    });
</script>