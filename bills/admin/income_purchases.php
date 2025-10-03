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
    <title>Income Purchases</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <!-- Font Awesome for hamburger icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="/css/bills_admin.css" />
    <link rel="stylesheet" href="/css/income_purchases.css?version=1" />
</head>
<body>
<div class="container" id="app">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h2>Income Purchases</h2>

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 24px"></div>


    <div class="row">
        <div class="col-xs-6" >
            <button class="btn btn-default">Reset</button>&nbsp;
            <button class="btn btn-primary">Transfer</button>
        </div>
        <div class="col-xs-6" style="text-align: right;">
            <button class="btn btn-danger">Sync & Queue</button>
        </div>
    </div>
    <div style="clear: both; height: 8px;"></div>

    
    <div class="row">
        <div class="col-xs-12">
            <label >End Pay Period</label><br>
            <select class="form-control" style="width: 175px; display: inline-block;">
                <option value="2025-10-01">Oct 1st, 2025</option>
                <option value="2025-10-15">Oct 15th, 2025</option>
                <option value="2025-11-01">Nov 1st, 2025</option>
                <option value="2025-11-15">Nov 15th, 2025</option>
                <option value="2025-12-01">Dec 1st, 2025</option>
                <option value="2025-12-15">Dec 15th, 2025</option>
                <option value="2026-01-01">Jan 1st, 2026</option>
                <option value="2026-01-15">Jan 15th, 2026</option>
                <option value="2026-02-01">Feb 1st, 2026</option>   
            </select>&nbsp; 
            <button class="btn btn-primary">Load Pay Periods</button>&nbsp;
            <input type="checkbox" value="1"/>&nbsp; Test
        </div> 
    </div>
    <div style="clear: both; height: 16px"></div>

    <div class="row">
        <div class="col-xs-12">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th >Prd</th>
                        <th >Disp</th>
                        <th >Purchases</th>
                        <th >Left</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(item, index) in 5" :key="index">
                        <td>10/1</td>
                        <td><input type="number" class="form-control" value="400" style="width: 60px;" /></td>
                        <td>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th style="padding-bottom: 14px;">Purchase</th>
                                        <th >Amt &nbsp;<button class="btn btn-primary btn-sm add-purchase" style="display: inline-block;" @click="openAddPurchaseModal">+</button></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(item, index) in 3" :key="index">
                                        <td><a href="#">Big Maint</a></td>
                                        <td>
                                            <input type="number" class="form-control" value="300" style="width: 60px; display: inline-block;" />
                                            <button class="btn btn-danger btn-sm small_padding" style="display: inline-block;">X</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td>
                            <input type="number" class="form-control" value="200" style="width: 60px;" />
                            
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    
    <!-- <div class="row">
        <div class="col-xs-12" style="text-align: right;">
            <input type="number" class="form-control" style="width: 175px; display: inline-block;" placeholder="Remaining" />
        </div>
    </div>
    <div style="clear: both; height: 16px"></div> -->


    <!-- <div class="row">
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
                    style="width: 50%;" class="form-control" />
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

    <div style="clear: both; height: 16px"></div> -->

</div>

<!-- Add Purchase Modal -->
<div class="modal fade" id="addPurchaseModal" tabindex="-1" role="dialog" aria-labelledby="addPurchaseModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="addPurchaseModalLabel">Add Upcoming Purchase</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="purchaseTitle">Title</label>
                        <input type="text" class="form-control" id="purchaseTitle" v-model="newPurchase.title" placeholder="Enter title">
                    </div>
                    <div class="form-group">
                        <label for="purchaseDescription">Description</label>
                        <input type="text" class="form-control" id="purchaseDescription" v-model="newPurchase.description" placeholder="Enter description">
                    </div>
                    <div class="form-group">
                        <label for="purchaseCost">Cost</label>
                        <input type="number" class="form-control" id="purchaseCost" v-model="newPurchase.cost" placeholder="Enter cost" step="0.01">
                    </div>
                    <div class="form-group">
                        <label for="purchaseAmountToSave">Amount to Save</label>
                        <input type="number" class="form-control" id="purchaseAmountToSave" v-model="newPurchase.amount_to_save" placeholder="Enter amount to save" step="0.01">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" @click="addPurchase">Add Purchase</button>
            </div>
        </div>
    </div>
</div>

<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
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
            disposablePerDay: 40,
            remove15Days: false,
            payDate: new Date(),
            titleDate: '',
            dateValue: '',
            day40: '',
            balance: 0,
            sumTotal: 0,
            sumSpa: 0,
            averages: [],
            newPurchase: {
                title: '',
                description: '',
                cost: '',
                amount_to_save: ''
            }
        }
    },
    mounted() {
        
        this.loadPage('');
    },
    methods: {
        // initializeBalance() {
        //     const savedBalance = localStorage.getItem('initBalance');
        //     if (!savedBalance) {
        //         this.initBalance = this.defaultBalance;
        //     } else {
        //         this.initBalance = parseFloat(savedBalance);
        //     }
        // },
        // saveInitBalance() {
        //     localStorage.setItem('initBalance', this.initBalance);
        // },
        // checkBalance() {
        //     this.loadPage('');
        // },
        // addSumItem() {
        //     const amount = parseFloat(this.day40) || 0;
        //     this.sumItems.push(amount);
            
        //     const eachDate = this.dateValue;
        //     this.dateItems.push(eachDate);
            
        //     // Initialize spa item for this index
        //     this.spaItems.push(0);
            
        //     this.calcFinalSums();
        // },
        // removeSumItem(index) {
        //     this.sumItems.splice(index, 1);
        //     this.dateItems.splice(index, 1);
        //     this.spaItems.splice(index, 1);
        //     this.calcFinalSums();
        // },
        // saveSpa(index) {
        //     this.spaItems[index] = this.spaAmount;
        //     this.sumItems[index] -= this.spaAmount;
        //     this.calcFinalSums();
        // },
        // removeSpaItem(index) {
        //     this.sumItems[index] += this.spaAmount;
        //     this.spaItems[index] = 0;
        //     this.calcFinalSums();
        // },
        // calcFinalSums() {
        //     let sumAmount = 0;
        //     this.sumItems.forEach(item => {
        //         sumAmount += parseFloat(item) || 0;
        //     });
            
        //     const extraSum = parseFloat(this.extraSum) || 0;
        //     sumAmount += extraSum;
            
        //     this.sumTotal = sumAmount;
            
        //     // Calculate spa total
        //     let spaTotal = 0;
        //     this.spaItems.forEach(item => {
        //         spaTotal += parseFloat(item) || 0;
        //     });
        //     this.sumSpa = spaTotal;
            
        //     this.calcAverages();
        // },
        // calcAverages() {
        //     this.averages = [];
            
        //     for (let i = 0; i < this.sumItems.length; i += 2) {
        //         if (i + 1 < this.sumItems.length) {
        //             const firstVal = parseFloat(this.sumItems[i]) || 0;
        //             const secondVal = parseFloat(this.sumItems[i + 1]) || 0;
                    
        //             if (firstVal !== 0 && secondVal !== 0) {
        //                 const avg = Math.round((firstVal + secondVal) / 2 * 100) / 100;
        //                 this.averages.push(null); // First item is hidden
        //                 this.averages.push(avg);
        //             } else {
        //                 this.averages.push(null);
        //                 this.averages.push(null);
        //             }
        //         } else {
        //             this.averages.push(null);
        //         }
        //     }
        // },
        openAddPurchaseModal() {
            // Reset form
            this.newPurchase = {
                title: '',
                description: '',
                cost: '',
                amount_to_save: ''
            };
            // Open modal using jQuery (Bootstrap 3 requirement)
            $('#addPurchaseModal').modal('show');
        },
        addPurchase() {
            // Handle adding the purchase here
            console.log('Adding purchase:', this.newPurchase);
            
            // Close modal
            $('#addPurchaseModal').modal('hide');
            
            // Here you would typically send the data to your API
            // For now, just log it
        },
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
        calcDisposable(disposableDay) {
            /*/
            const disposablePerDay = parseFloat(this.disposablePerDay);
            let subtractAmount = 0;
            
            // if (this.remove15Days) {
            //     subtractAmount = 600;
            // }
            
            return this.balance - (disposablePerDay * this.daysCount) - subtractAmount;
            /*/


            //disposableDay = parseFloat($('#disposable_per_day').val()) || 0;

            //remove15Days = $('#remove_15_days').is(':checked') ? 1 : 0;

            const disposablePerDay = parseFloat(this.disposablePerDay);


            remove15Days = false;

            if (remove15Days) {
                daysCount = 15
            }
            
            return this.balance - (disposablePerDay * this.daysCount);
            //*/
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
                    
                    this.countDaysAdd = response.data.count_days_add;
                    this.daysCount += this.countDaysAdd;
                    
                    this.day40 = this.calcDisposable(40);
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
