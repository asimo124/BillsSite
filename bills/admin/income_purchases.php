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
        <div class="col-xs-6" >
            <input type="number" class="form-control" v-model="startingBalance" placeholder="Starting Balance" />
        </div>
        <div class="col-xs-6" style="text-align: right;">
            
        </div>
    </div>
    <div style="clear: both; height: 8px;"></div>

    
    <div class="row">
        <div class="col-xs-12">
            <label >End Pay Period</label><br>
            <select v-model="selectedPayDate" class="form-control" style="width: 175px; display: inline-block;">
                <option v-for="date in upcomingPayDates" :key="date.value" :value="date.value">{{ date.label }}</option>   
            </select>&nbsp; 
            <button class="btn btn-primary" @click="loadPayPeriods">Load Pay Periods</button>&nbsp;
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
                    <tr v-for="(item, index) in payPeriodItems" :key="index">
                        <td>{{ item.pay_period }}</td>
                        <td><input type="number" class="form-control" v-model="item.disposable_amount" readonly style="width: 60px;" /></td>
                        <td>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th style="padding-bottom: 14px;">Purchase</th>
                                        <th >Amt &nbsp;<button class="btn btn-primary btn-sm add-purchase" style="display: inline-block;" @click="openAddPurchaseModal">+</button></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(purchase, index) in item.upcoming_purchases" :key="index">
                                        <td><a href="#">{{ purchase.title }}</a></td>
                                        <td>
                                            <input type="number" class="form-control" v-model="purchase.cost" style="width: 60px; display: inline-block;" />
                                            <button class="btn btn-danger btn-sm small_padding" style="display: inline-block;">X</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td>
                            <input type="number" class="form-control" v-model="item.remaining_amount" style="width: 60px;" />

                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

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
                <button type="button" class="btn btn-primary" @click="addPurchase">Create</button>
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
            payPeriodItems: [],
            startingBalance: 3544,
            upcomingPayDates: [],
            selectedPayDate: '',
            newPurchase: {
                title: '',
                description: '',
                cost: 0,
                amount_to_save: 0
            }
        }
    },
    mounted() {

        this.loadPayPeriodItems();
        this.loadUpcomingPayDates().then(() => {
            if (this.upcomingPayDates.length > 0) {
                this.selectedPayDate = this.upcomingPayDates[0].value;
            }
        });
    },
    methods: {
        async loadUpcomingPayDates() {
            try {
                const response = await axios.get('/api/getComingPayDates.php');
                if (response.data) {
                    this.upcomingPayDates = response.data;
                }
            } catch (error) {
                console.error('Error loading upcoming pay dates:', error);
            }
        },
        async loadPayPeriods() {
            try {
                url = `/api/loadPayPeriods.php?user_id=1&current_balance=${this.startingBalance}&end_pay_period=${this.selectedPayDate}`;
                const response = await axios.get(url);
                if (response.data && response.data.items) {
                    this.payPeriodItems = response.data.items;
                }
            } catch (error) {
                console.error('Error loading pay period items:', error);
            }
        },
        async loadPayPeriodItems() {
            try {
                url = `/api/loadPayPeriodItems.php`;
                const response = await axios.get(url);
                if (response.data && response.data.items) {
                    this.payPeriodItems = response.data.items;
                }
            } catch (error) {
                console.error('Error loading pay period items:', error);
            }
        },
        addPurchase() {
            // Handle adding the purchase here
            console.log('Adding purchase:', this.newPurchase);
            
            // Close modal
            $('#addPurchaseModal').modal('hide');
            
            // Here you would typically send the data to your API
            // For now, just log it
        },
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
        
    }
}).mount('#app');
</script>
</body>
</html>
