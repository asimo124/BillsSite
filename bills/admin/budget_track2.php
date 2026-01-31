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

    <!-- <div class="row">
        <div v-for="(yearGroup, yearIndex) in months_left_arr" :key="yearIndex">
            <h4>{{ yearGroup.year_title }}</h4>
            <div class="col-xs-4 col-sm-3 col-md-2" v-for="(month, monthIndex) in yearGroup.months" :key="monthIndex">
                <div class="cal_month" :style="{ backgroundColor: month.color }">
                    <span class="cal_month_title">{{ month.month_year }}</span>
                </div>
            </div>
            <div style="clear: both;"></div>
        </div>
    </div> -->

    <div class="row">
        <div class="col-xs-12">
            <v-chart :options="getChartOptions()" style="width: 100%; height: 400px;"></v-chart>
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
            loansOrig: [],
            allowBlankSortOrder: <?php echo $allowBlankSortOrder; ?>,
        };
    },
    methods: {
        async calcProgress() {
            try {
                const response = await axios.get(`/api/calcTrackProgress.php?disposable_per_month=${this.disposable_per_month}&allow_blank_sort_order=${this.allowBlankSortOrder}`);
                
                if (response.data) {
                    this.loans = response.data.loans;
                    this.loansOrig = response.data.loans;
                    this.chartData = response.data.items; // Store the entire response.data
                }
            } catch (error) {
                console.error("Error fetching data:", error);
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
                    type: "time"
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