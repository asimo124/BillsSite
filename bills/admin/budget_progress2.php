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
    <title>Charge Categories</title>
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

    <div class="alert alert-success" role="alert" v-if="showDisposableUpdated">
        Paycheck disposable updated successfully!
    </div>

    <h2>Budget Progress</h2>

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 24px"></div>

    <div class="row">
        <div class="col-xs-12 col-md-8 col-md-offset-2">
            <div class="row">
                <div class="col-xs-5" style="text-align: right;">
                    <input type="number" class="form-control" placeholder="Initial Balance" 
                    v-model="initBalance" @change="saveInitBalance"
                    style="width: 35%; display: inline-block;" />
                    &nbsp;<button type="button" class="btn btn-default" @click="checkBalance">+</button>
                    <button class="btn btn-default" @click="loadPage('prev')"><</button>
                </div>
                <div class="col-xs-2" style="text-align: center;"><h4>{{ titleDate }}</h4></div>
                <div class="col-xs-5" style="text-align: left;">
                    <button class="btn btn-default" @click="loadPage('next')">></button>
                    &nbsp;<button type="button" class="btn btn-default" @click="addSumItem" :data-day="40">+</button>
                    <input type="number" class="form-control" placeholder="" style="width: 35%; display: inline-block;" readonly v-model="day40" />
                </div>
            </div>
        </div>
    </div>
    <div style="clear: both; height: 16px"></div>

    <div class="row">
        <div class="col-xs-12">
            <input id="determinedDisposable" style="width: 75px; display: inline-block;" type="number" class="form-control" placeholder="Determined Disposable" v-model="determinedDisposable" />&nbsp;
            <button type="button" class="btn btn-default" @click="addDeterminedDisposable">Update Paycheck Disposable</button>
        </div>
    </div>
    <div style="clear: both; height: 16px"></div>

    <div class="row">
        <div class="col-xs-6">
            <input type="number" class="form-control" placeholder="Extra Sum" style="width: 100%" v-model="extraSum" @change="calcFinalSums" />
        </div>
        <div class="col-xs-6">
            <input type="checkbox" v-model="testMode" /> Test Mode
            &nbsp; <input type="number" v-model="disposablePerDay" style="width: 50px;"/> Disposable
            &nbsp; <input type="checkbox" v-model="remove15Days" /> 15 Days
        </div>
    </div>

    <div class="row">
        <div class="col-xs-6 totals_content">
            <h5>Totals</h5>
            <div v-for="(item, index) in sumItems" :key="index" class="sum-item-holder">
                <input type="number" 
                    v-model="sumItems[index]" 
                    @change="calcFinalSums"
                    style="width: 30%; display: inline-block;" class="form-control" />
                &nbsp;<button type="button" @click="removeSumItem(index)">X</button>
                <button style="display: none;" type="button" @click="saveSpa(index)">></button> 
                {{ dateItems[index] }}
                <div style="clear: both; height: 8px;"></div>
            </div>
        </div>
        <div class="col-xs-4 spa_totals_content" :style="{ display: 'none' }">
            <h5>Spa</h5>
            <div v-for="(item, index) in spaItems" :key="index" class="spa-item-holder">
                <input type="number" 
                    v-model="spaItems[index]" 
                    style="width: 150px;" class="form-control" />
                &nbsp;<button type="button" @click="removeSpaItem(index)"><</button>
                <div style="clear: both; height: 8px;"></div>
            </div>
        </div>
        <div class="col-xs-6 averages_content">
            <h5>Sums</h5>
            <div v-for="(avg, index) in averages" :key="index" class="avg-item-holder">
                <input type="number" 
                    :value="avg" 
                    :style="{ width: '125px', visibility: avg ? 'visible' : 'hidden' }" 
                    class="form-control" readonly />
                <div style="clear: both; height: 8px;"></div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-6">
            <input type="number" :value="sumTotal" style="width: 200px;" class="form-control" placeholder="Total" readonly />
        </div>
        <div class="col-xs-4" style="display: none;">
            <input type="number" :value="sumSpa" style="width: 200px;" class="form-control" placeholder="Spa Total" readonly />
        </div>
    </div>

    <div style="clear: both; height: 16px"></div>

</div>

<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="/js/nav.js"></script>
<script>
const { createApp } = Vue;

createApp({
    data() {
        return {
            defaultBalance: 3544,
            daysCount: 0,
            countDaysAdd: 0,
            sumItems: [],
            spaItems: [],
            dateItems: [],
            testMode: false,
            nextDate: 0,
            prevDate: 0,
            spaAmount: 57.50,
            initBalance: 0,
            extraSum: 0,
            disposablePerDay: 25,
            remove15Days: false,
            payDate: new Date(),
            payDateFormatted: '',
            determinedDisposable: 200,
            titleDate: '',
            dateValue: '',
            day40: '',
            balance: 0,
            sumTotal: 0,
            sumSpa: 0,
            averages: [],
            showDisposableUpdated: false,
        }
    },
    mounted() {
        this.initializeBalance();
        this.loadPage('');
    },
    methods: {
        loadPage(action) {
            this.nextDate = 0;
            this.prevDate = 0;
            
            const date2 = parseInt(this.payDate.getDate());

            if (action === 'next') {
                this.nextDate = 1;
                this.prevDate = 0;
            } else if (action === 'prev') {
                this.nextDate = 0;
                this.prevDate = 1;
            }
            
            this.titleDate = this.payDate.toLocaleDateString('en-US', {
                month: 'long',
                day: 'numeric',
                year: 'numeric'
            });
            
            this.dateValue = (this.payDate.getMonth() + 1) + '/' + this.payDate.getDate();
            
            this.getExpenseDays();
        },
        updatePayDateFormatted() {

            const date2 = parseInt(this.payDate.getDate());

            const payDateFormatted = new Date(this.payDate.getFullYear(), this.payDate.getMonth(), date2);
            if (date2 < 15) {
                payDateFormatted.setDate(1);
            } else {
                payDateFormatted.setDate(15);
            }
            this.payDateFormatted = payDateFormatted.toISOString().split('T')[0];
            console.log("Pay Date Formatted:", this.payDateFormatted);
        },
        initializeBalance() {
            const savedBalance = localStorage.getItem('initBalance');
            if (!savedBalance) {
                this.initBalance = this.defaultBalance;
            } else {
                this.initBalance = parseFloat(savedBalance);
            }
        },
        saveInitBalance() {
            localStorage.setItem('initBalance', this.initBalance);
        },
        checkBalance() {
            this.loadPage('');
        },
        addSumItem() {
            const amount = parseFloat(this.day40) || 0;
            this.sumItems.push(amount);
            
            const eachDate = this.dateValue;
            this.dateItems.push(eachDate);
            
            // Initialize spa item for this index
            this.spaItems.push(0);
            
            this.calcFinalSums();
        },
        removeSumItem(index) {
            this.sumItems.splice(index, 1);
            this.dateItems.splice(index, 1);
            this.spaItems.splice(index, 1);
            this.calcFinalSums();
        },
        saveSpa(index) {
            this.spaItems[index] = this.spaAmount;
            this.sumItems[index] -= this.spaAmount;
            this.calcFinalSums();
        },
        removeSpaItem(index) {
            this.sumItems[index] += this.spaAmount;
            this.spaItems[index] = 0;
            this.calcFinalSums();
        },
        calcFinalSums() {
            let sumAmount = 0;
            this.sumItems.forEach(item => {
                sumAmount += parseFloat(item) || 0;
            });
            
            const extraSum = parseFloat(this.extraSum) || 0;
            sumAmount += extraSum;
            
            this.sumTotal = sumAmount;
            
            // Calculate spa total
            let spaTotal = 0;
            this.spaItems.forEach(item => {
                spaTotal += parseFloat(item) || 0;
            });
            this.sumSpa = spaTotal;
            
            this.calcAverages();
        },
        calcAverages() {
            this.averages = [];
            
            for (let i = 0; i < this.sumItems.length; i += 2) {
                if (i + 1 < this.sumItems.length) {
                    const firstVal = parseFloat(this.sumItems[i]) || 0;
                    const secondVal = parseFloat(this.sumItems[i + 1]) || 0;
                    
                    if (firstVal !== 0 && secondVal !== 0) {
                        const avg = Math.round((firstVal + secondVal) / 2 * 100) / 100;
                        this.averages.push(null); // First item is hidden
                        this.averages.push(avg);
                    } else {
                        this.averages.push(null);
                        this.averages.push(null);
                    }
                } else {
                    this.averages.push(null);
                }
            }
        },
        calcDisposable(disposableDay) {

            remove15Days = this.remove15Days;
            if (remove15Days) {
                daysCount = 15
            } else {
                daysCount = this.daysCount;
            }

            const disposablePerDay = parseFloat(this.disposablePerDay);
            let subtractAmount = 0;
            
            
            
            return this.balance - (disposablePerDay * this.daysCount) - subtractAmount;
        },
        async addDeterminedDisposable() {

            try {
                const response = await axios.get(`/api/updatePaycheckDisposable.php?paycheck_date=${this.payDateFormatted}&amount=${this.determinedDisposable}`);
                
                if (response.data && response.data.success) {
                    this.showDisposableUpdated = true;

                    setTimeout(() => {
                        this.showDisposableUpdated = false;
                    }, 8000);
                }
            } catch (error) {
                console.error("Error fetching data:", error);
            }
        },
        async getExpenseDays() {
            const curBalance = parseFloat(this.initBalance) || 0;
            const payDateStr = this.payDate.toLocaleDateString();

            try {
                const response = await axios.get(`/api/loadBillDates2.php?user_id=1&pay_date=${payDateStr}&current_balance=${curBalance}&test_mode=${this.testMode ? 1 : 0}&includeWeekends=1&next_date=${this.nextDate}&prev_date=${this.prevDate}`);
                
                if (response.data && response.data.results.length > 0) {
                    if (!response.data.pay_date) {
                        const today = new Date();
                        const date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
                        this.payDate = new Date();
                    } else {
                        const date = response.data.pay_date;
                        this.payDate = new Date(date);
                        this.nextDate = 0;
                        this.prevDate = 0;
                    }

                    this.updatePayDateFormatted();
                    
                    this.titleDate = this.payDate.toLocaleDateString('en-US', {
                        month: 'short',
                        day: 'numeric',
                        year: 'numeric'
                    });
                    
                    this.dateValue = (this.payDate.getMonth() + 1) + '/' + this.payDate.getDate();
                    
                    const runningTotalBalance = response.data.curBalance ? response.data.curBalance : parseFloat(this.initBalance) || 0;
                    
                    this.daysCount = 0;
                    this.balance = runningTotalBalance;
                    
                    response.data.results.forEach(week => {
                        week.days.forEach(day => {
                            day.desc.forEach(expense => {
                                this.balance -= expense.amount;
                            });
                            if (day.showAsDay == 1) {
                                this.daysCount += 1;
                            }
                        });
                    });

                    if (this.remove15Days) {
                        this.daysCount = 15;
                    }
                    
                    //this.countDaysAdd = response.data.count_days_add;
                    //this.daysCount += this.countDaysAdd;
                    
                    this.day40 = this.calcDisposable(this.disposablePerDay);
                } else {
                    this.balance = 0;
                }
            } catch (error) {
                console.error("Error fetching data:", error);
            }
        }
    }
}).mount('#app');
</script>
</body>
</html>
