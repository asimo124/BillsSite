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
    <title>Track Progress</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <!-- Font Awesome for hamburger icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="/css/bills_admin.css" />
    <link rel="stylesheet" href="/css/budget_track.css?version=10" />
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
                placeholder="Disposable Per Month" v-model="disposable_per_month" @change="updateDisposablePerMonth" />
        </div>
        <div class="col-xs-6">
            <button class="btn btn-default" @click="calcProgress">Calculate</button>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-6">
            
        </div>
        <div class="col-xs-6">
            
        </div>
    </div>
    <div style="clear: both; height: 16px"></div>

    <!-- <div class="row">
        <div class="col-xs-12">
            <h3>Months Left</h3>

            <label for="dell_months_left">Dell</label>
            <input type="number" id="dell_months_left" class="form-control" 
                placeholder="Dell Months Left" v-model="dell_months_left" />
            <div style="clear: both; height: 8px"></div>

            <label for="irs_months_left">IRS</label>
            <input type="number" id="irs_months_left" class="form-control" 
                placeholder="IRS Months Left" v-model="irs_months_left" />
            <div style="clear: both; height: 8px"></div>

            <label for="loft_months_left">Loft</label>
            <input type="number" id="loft_months_left" class="form-control" 
                placeholder="Loft Months Left" v-model="loft_months_left" />
            <div style="clear: both; height: 8px"></div>

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
    <div style="clear: both; height: 16px"></div> -->

    <div class="row">
        <div class="col-xs-12">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Loan/Card</th>
                        <th>Months Left</th>
                        <th>Months Left Accum</th>
                        <th>Color</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(loan, index) in loans" :key="index">
                        <td>{{ loan.title }}</td>
                        <td>{{ loan.months_left }}</td>
                        <td>{{ loan.months_left_accum }}</td>
                        <td>
                            <span :style="{ backgroundColor: loan.color, display: 'inline-block', width: '20px', height: '20px', border: '1px solid #000' }"></span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div v-for="(yearGroup, yearIndex) in months_left_arr" :key="yearIndex">
            <h4>{{ yearGroup.year_title }}</h4>
            <div class="col-xs-4 col-sm-3 col-md-2" v-for="(month, monthIndex) in yearGroup.months" :key="monthIndex">
                <div class="cal_month" :style="{ backgroundColor: month.color }">
                    <span class="cal_month_title">{{ month.month_year }}</span>
                </div>
            </div>
            <div style="clear: both;"></div>
        </div>
    </div>


</div>
</body>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="/js/nav.js" ></script>
<script>
// Vue.js App
const { createApp } = Vue;

createApp({
    data() {
        return {
            disposable_per_month: 1100,

            months_left_arr: [],
            loans: [],
            loansOrig: []
        }
    },
    methods: {
        async calcProgress() {
            try {
                const response = await axios.get(`/api/calcTrackProgress.php?disposable_per_month=${this.disposable_per_month}`);
                
                if (response.data && response.data.items) {
                    this.months_left_arr = response.data.items;
                }
                if (response.data && response.data.loans) {
                    this.loans = response.data.loans;
                }
                if (response.data && response.data.loansOrig) {
                    this.loansOrig = response.data.loansOrig;
                }
            } catch (error) {
                console.error("Error fetching data:", error);
            }
        },
        updateDisposablePerMonth() {
            localStorage.setItem('disposable_per_month', this.disposable_per_month);
        }
    },
    mounted() {
        if (localStorage.getItem('disposable_per_month') && !isNaN(localStorage.getItem('disposable_per_month'))) {
            this.disposable_per_month = parseFloat(localStorage.getItem('disposable_per_month'));
        } 
        console.log("Mounted - calculating progress");
        this.calcProgress();
    }
}).mount('#app');
</script>