<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$allowBlankSortOrder = isset($_REQUEST['allow_blank_sort_order']) ? intval($_REQUEST['allow_blank_sort_order']) : 0;

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
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue-echarts/dist/vue-echarts.min.js"></script>
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
    
    <div class="alert alert-danger" role="alert" v-if="main_error">
        {{ main_error }}    
    </div>
    <div class="alert alert-success" role="alert" v-if="main_msg">
        {{ main_msg }}    
    </div>
    <div class="alert alert-info" role="alert" v-if="temp_msg">
        {{ temp_msg }}    
    </div>
    

    <div class="row">
        <div class="col-xs-12" style="text-align: right;">
            <button class="btn btn-primary" @click="queueDateJob(0)">Run Dates Job</button>&nbsp;
            <button class="btn btn-danger" @click="queueDateJob(1)">Run Dates Job Test</button>&nbsp;
        </div>
    </div>
    <div style="clear: both; height: 16px"></div>

    <div class="row">
        <div class="col-xs-6">
            <input type="number" id="Disposable Per Month" class="form-control" 
                placeholder="Disposable Per Month" v-model="disposable_per_month" @change="updateDisposablePerMonth" />
        </div>
        <div class="col-xs-6">
            <button class="btn btn-default" @click="calcProgress">Calculate</button>
        </div>
    </div>
    
    <div style="clear: both; height: 16px"></div>

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
        <div class="col-xs-12">
            <v-chart :options="getChartOptions()" style="width: 100%; height: 400px;"></v-chart>
        </div>
    </div>
    <div style="clear: both; height: 16px"></div>

    <div class="row">
        <div class="col-xs-12">
            <h4>Bill End Dates</h4>
            <div style="clear: both; height: 16px"></div>
            <button class="btn btn-primary" @click="commitNewEndDates">Commit New End Dates</button>
            <div style="clear: both; height: 8px"></div>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Bill</th>
                        <th>Current End Date</th>
                        <th>New End Date</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(billEndDate, index) in billEndDates" :key="index">
                        <td>{{ billEndDate.bill_title }}</td>
                        <td>{{ billEndDate.current_end_date }}</td>
                        <td>{{ billEndDate.new_end_date }}</td> 
                    </tr>
                </tbody>
            </table>
        </div>
    </div>


</div>
</body>
<script>
Vue.component('v-chart', VueECharts);

new Vue({
    el: '#app',
    data() {
        return {
            disposable_per_month: 1100,
            chartData: null, // Store the response.data.items here
            loans: [],
            billEndDates: [],
            loansOrig: [],
            allowBlankSortOrder: <?php echo $allowBlankSortOrder; ?>,
            isRunning: true,
            secondsWait: 180,
            main_msg: '',
            main_error: '',
            temp_msg: '',
            did_queue: false,
            times_run: 0
        };
    },
    methods: {
        async calcProgress() {
            try {
                const response = await axios.get(`/api/calcTrackProgress.php?disposable_per_month=${this.disposable_per_month}&allow_blank_sort_order=${this.allowBlankSortOrder}`);
                
                if (response.data) {
                    this.loans = response.data.loans;
                    this.loansOrig = response.data.loans;
                    this.billEndDates = response.data.bill_end_dates;
                    this.chartData = response.data.items; // Store the entire response.data
                }
            } catch (error) {
                console.error("Error fetching data:", error);
            }
        },
        async commitNewEndDates() {
            try {
                const response = await axios.post(`/api/commitNewEndDates.php`, {});
                if (response.data.success) {
                    this.calcProgress();
                } else {
                    alert(response.data.error);
                }
            } catch (error) {
                console.error("Error committing new end dates:", error);
            }
        },
        async checkJobsDone() {
            if (!this.did_queue) {
                return;
            }
            try {
                const response = await axios.get('/api/check_date_job_done.php');
                if (response.data && response.data.return_status && response.data.return_status == "done") {
                    this.isRunning = false;
                    this.temp_msg = '';
                    this.main_msg = 'All jobs completed.';
                    this.main_error = '';
                    this.did_queue = false;
                    this.loadPayPeriodItems();
                } else {
                    // Still running, check again after a delay
                    setTimeout(() => {
                        this.checkJobsDone();
                    }, 5000); // Check every 5 seconds
                }
            } catch (error) {

                if (this.times_run > 12) { // Stop after 1 minute of retries
                    this.main_error = 'Error checking job status. Please try again later.';
                    this.temp_msg = '';
                    this.did_queue = false;
                    return;
                }

                this.times_run += 1;
                // Retry after a delay
                setTimeout(() => {
                    this.checkJobsDone();
                }, 5000);
            }
        },
        async queueDateJob(testMode) {
            this.main_msg = '';
            this.main_error = '';
            this.temp_msg = 'Queueing job...';
            this.did_queue = true;
            this.times_run = 0;
            try {
                const response = await axios.get(`/api/queue_date_job.php?test_mode=${testMode}`);
                
                if (response.data && response.data.return_status && response.data.return_status == "success") {
                    
                    console.log("Date job queued successfully.");
                    this.checkJobsDone();
                } else {

                    console.error('Error queueing job:', response.data.error);
                    this.main_error = response.data.error || 'Error queueing job.';
                }
            } catch (error) {
                console.error("Error", error);
            }
        },
        updateDisposablePerMonth() {
            localStorage.setItem('disposable_per_month', this.disposable_per_month);
        },
        getChartOptions() {
            if (!this.chartData) {
                return {}; // Return an empty object if no data is available
            }

            const option = {
                tooltip: {
                    formatter: params => {
                    const start = new Date(params.value[0]).toLocaleDateString();
                    const end = new Date(params.value[1]).toLocaleDateString();
                    return `${params.name}<br>${start} → ${end}`;
                    }
                },

                grid: {
                    left: 150,
                    right: 50,
                    top: 20,
                    bottom: 40
                },

                xAxis: {
                    type: "time",
                    splitNumber: 12,
                    minInterval: 1000 * 60 * 60 * 24 * 28,

                    axisLabel: {
                        formatter: value => {
                        const d = new Date(value);

                        const shortMonthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                        const shortMonthName = shortMonthNames[d.getMonth()];

                        //const mm = String(d.getMonth() + 1).padStart(2, "0");
                        const mm = shortMonthName;
                        const yy = String(d.getFullYear()).slice(-2);
                        return `${mm} ${yy}`;
                        }
                    },

                    axisTick: {
                        alignWithLabel: true
                    }
                },



                yAxis: {
                    type: "category",
                    data: this.chartData.categories
                },

                series: [
                    {
                    type: "custom",
                    name: "Loan Durations",
                    renderItem: function (params, api) {
                        const categoryIndex = api.value(2); // we will add this
                        const start = api.coord([api.value(0), categoryIndex]);
                        const end = api.coord([api.value(1), categoryIndex]);

                        const height = 20;

                        return {
                        type: "rect",
                        shape: {
                            x: start[0],
                            y: start[1] - height / 2,
                            width: end[0] - start[0],
                            height: height
                        },
                        style: api.style()
                        };
                    },
                    encode: {
                        x: [0, 1],
                        y: 2
                    },
                    data: this.chartData.series[0].data.map((item, index) => ({
                        value: [...item.value, index],
                        itemStyle: item.itemStyle,
                        name: item.name
                    }))
                    }
                ]
            };



            return option;
        },
    },
    mounted() {
        if (localStorage.getItem('disposable_per_month') && !isNaN(localStorage.getItem('disposable_per_month'))) {
            this.disposable_per_month = parseFloat(localStorage.getItem('disposable_per_month'));
        } 
        console.log("Mounted - calculating progress");
        this.calcProgress();
    }
});
</script>