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
    <div class="alert alert-danger" role="alert" v-if="main_error">
        {{ main_error }}    
    </div>

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 24px"></div>


    <div class="row">
        <div class="col-xs-6" >
            <button class="btn btn-default" @click="loadPayPeriodItems">Reset</button>&nbsp;
            <button class="btn btn-primary" @click="transferItems">Transfer</button>
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
                        <td><input type="number" class="form-control input_num" v-model="item.disposable_amount" readonly style="width: 60px;" /></td>
                        <td>
                            <h4>Upcoming</h4>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th style="padding-bottom: 14px;">Purchase</th>
                                        <th >Amt &nbsp;<button class="btn btn-primary btn-sm add-purchase" style="display: inline-block;" @click="openAddPurchaseModal(item.id, index)">+</button></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(purchase, purchaseIndex) in item.upcoming_purchases" :key="purchaseIndex">
                                        <td><a href="#" data-toggle="tooltip" data-placement="top" :title="purchase.description + ' (Cost: $' + purchase.cost + ')'" @mousedown="startLongClick(purchase, index, purchaseIndex)" @mouseup="cancelLongClick" @mouseleave="cancelLongClick">{{ purchase.title }}</a></td>
                                        <td>
                                            <input type="number" class="form-control input_num"v-model="purchase.amount_to_save" style="width: 60px; display: inline-block;" />
                                            <button class="btn btn-danger btn-sm small_padding" style="display: inline-block;" @click="removePurchase(purchase.id, index, purchaseIndex)">X</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            
                            
                            <h4 v-if="item.one_time_expenses.length > 0">Expenses</h4>
                            <table class="table table-bordered" v-if="item.one_time_expenses.length > 0">
                                <thead>
                                    <tr>
                                        <th style="padding-bottom: 14px;">Expense</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(expense, expenseIndex) in item.one_time_expenses" :key="expenseIndex">
                                        <td><a href="#" data-toggle="tooltip" data-placement="top" :title="expense.vnd_bill">{{ expense.vnd_bill_short }}</a> - ${{ expense.amount }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td>
                            <input type="number" class="form-control input_num" v-model="item.remaining_amount" style="width: 60px;" />
                            <button class="btn btn-danger btn-sm" @click="removePayPeriodItem(index)">X</button>
                        </td>
                    </tr>
                </tbody>
            </table>
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
                    <div class="alert alert-danger" role="alert" v-if="add_purchase_error">
                        {{ add_purchase_error }}    
                    </div>
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
            main_error: '',
            payPeriodItems: [],
            startingBalance: 3544,
            upcomingPayDates: [],
            selectedPayDate: '',
            currentPayPeriodId: null,
            currentPayPeriodItemIndex: null,
            newPurchase: {
                title: '',
                description: '',
                cost: 0,
                amount_to_save: 0
            },
            add_purchase_error: '',
            longClickTimer: null,
            longClickData: null
        }
    },
    mounted() {

        this.loadPayPeriodItems();
        this.loadUpcomingPayDates().then(() => {
            if (this.upcomingPayDates.length > 0) {
                this.selectedPayDate = this.upcomingPayDates[0].value;
            }
        });
        
        // Check screen width and adjust input widths if needed
        
        // Initialize Bootstrap tooltips after a delay
        setTimeout(() => {
            this.initializeTooltips();
        }, 100);
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
                const url = `/api/loadPayPeriods.php?user_id=1&current_balance=${this.startingBalance}&end_pay_period=${this.selectedPayDate}`;
                const response = await axios.get(url);
                if (response.data && response.data.items) {
                    this.payPeriodItems = response.data.items;
                    this.checkScreenWidth();
                }
            } catch (error) {
                console.error('Error loading pay period items:', error);
            }
        },
        async loadPayPeriodItems() {
            try {
                const url = `/api/loadPayPeriodItems.php`;
                const response = await axios.get(url);
                if (response.data && response.data.items) {
                    this.payPeriodItems = response.data.items;
                    
                    this.checkNegativeRemainingAmountsValid();
                    this.checkScreenWidth();
                    // Initialize tooltips after data loads
                    setTimeout(() => {
                        this.initializeTooltips();
                    }, 100);
                }
            } catch (error) {
                console.error('Error loading pay period items:', error);
            }
        },
        checkNegativeRemainingAmountsValid() {
            this.main_error = '';
            for (let index = 0; index < this.payPeriodItems.length; index++) {
                if (this.payPeriodItems[index].remaining_amount < 0) {
                    this.payPeriodItems[index].remaining_amount = 0;
                }
            }
            return true;
        },
        checkScreenWidth() {
            // iPhone 15 landscape width is 852px
            console.log('test 123');
            if (window.innerWidth > 852) {
                console.log('234');
                // Set all input_num elements to 70px width
                setTimeout(() => {
                    const inputElements = document.querySelectorAll('.input_num');
                    console.log('345');
                    inputElements.forEach(input => {
                        console.log('456');
                        input.style.width = '80px';
                    });
                }, 100);
            }
        },
        transferItems() {
            // First check for negative amounts and fix them
            this.checkNegativeRemainingAmountsValid();
            
            // Transfer positive remaining amounts to next period
            for (let index = 0; index < this.payPeriodItems.length; index++) {
                if (this.payPeriodItems[index].remaining_amount > 0) {
                    const remainingAmount = this.payPeriodItems[index].remaining_amount;
                    this.payPeriodItems[index].remaining_amount = 0;
                    if (index + 1 < this.payPeriodItems.length) {
                        this.payPeriodItems[index + 1].disposable_amount += remainingAmount;
                        this.payPeriodItems[index + 1].remaining_amount += remainingAmount;
                    }
                }
            }
            return true;
        },
        async addPurchase() {
            // Handle adding the purchase here
            try {
                const response = await axios.post(`/api/addUpcomingPurchase.php?pay_period_id=${this.currentPayPeriodId}&title=${this.newPurchase.title}&description=${this.newPurchase.description}&cost=${this.newPurchase.cost}&amount_to_save=${this.newPurchase.amount_to_save}`);
                
                if (response.data && response.data.error) {
                    console.error('Error adding purchase:', response.data.error);
                    this.add_purchase_error = response.data.error;
                    return;
                }
                if (response.data && response.data.item) {
                    console.log('response: ', response.data);
                    // Successfully added purchase

                    console.log('currentPayPeriodItemIndex: ', this.currentPayPeriodItemIndex);
                    console.log('payPeriodItems before push: ', this.payPeriodItems);

                    this.payPeriodItems[this.currentPayPeriodItemIndex].upcoming_purchases.push(response.data.item);
                    this.add_purchase_error = '';
                    this.loadPayPeriodItems();
                    $('#addPurchaseModal').modal('hide');
                    
                    // Reinitialize tooltips after adding new content
                    setTimeout(() => {
                        this.initializeTooltips();
                    }, 100);
                } else {
                    console.error('Error adding purchase:', response.data.error);
                    this.add_purchase_error = response.data.error;
                }
            } catch (error) {
                console.error('Error adding purchase:', error);
            }
        },
        initializeTooltips() {
            // Destroy existing tooltips first
            $('[data-toggle="tooltip"]').tooltip('destroy');
            // Reinitialize tooltips with click trigger
            $('[data-toggle="tooltip"]').tooltip({
                trigger: 'click',
                placement: 'top'
            });
        },
        removePayPeriodItem(index) {
            this.payPeriodItems.splice(index, 1);
        },
        async removePurchase(purchaseId, payPeriodIndex, purchaseIndex) {
            // Handle removing the purchase here
            console.log('Removing purchase:', purchaseId);

            try {
                const response = await axios.post(`/api/removeUpcomingPurchase.php?purchase_id=${purchaseId}`);
                if (response.data && response.data.success) {
                    this.payPeriodItems[payPeriodIndex].upcoming_purchases.splice(purchaseIndex, 1);
                    this.loadPayPeriodItems();
                } else {
                    console.error('Error removing purchase:', response.data.error);
                }
            } catch (error) {
                console.error('Error removing purchase:', error);
            }
        },      
        openAddPurchaseModal(payPeriodId, index) {
            console.log('openAddPurchaseModal called with ID:', payPeriodId);
            
            // Store the pay period ID
            this.currentPayPeriodId = payPeriodId;
            this.currentPayPeriodItemIndex = index;
            
            // Reset form
            this.newPurchase = {
                title: '',
                description: '',
                cost: 0,
                amount_to_save: 0
            };
            this.add_purchase_error = '';
            console.log('Form reset, opening modal');
            // Open modal using jQuery (Bootstrap 3 requirement)
            $('#addPurchaseModal').modal('show');
        },
        editPurchase(purchase, payPeriodIndex, purchaseIndex) {
            console.log('Double-clicked purchase:', purchase.title);
            // You can add functionality here, such as:
            // - Opening an edit modal
            // - Making the title editable inline
            // - Showing additional purchase details
            // For now, we'll just show an alert with the purchase info
            //alert(`Purchase Details:\nTitle: ${purchase.title}\nDescription: ${purchase.description}\nCost: $${purchase.cost}\nAmount to Save: $${purchase.amount_to_save}`);
        },
        startLongClick(purchase, payPeriodIndex, purchaseIndex) {
            // Clear any existing timer
            this.cancelLongClick();
            
            // Store the data for the long click
            this.longClickData = { purchase, payPeriodIndex, purchaseIndex };
            
            // Start a timer for 800ms (0.8 seconds)
            this.longClickTimer = setTimeout(() => {
                this.handleLongClick();
            }, 800);
        },
        cancelLongClick() {
            if (this.longClickTimer) {
                clearTimeout(this.longClickTimer);
                this.longClickTimer = null;
                this.longClickData = null;
            }
        },
        handleLongClick() {
            if (this.longClickData) {
                const { purchase, payPeriodIndex, purchaseIndex } = this.longClickData;
                console.log('Long-clicked purchase:', purchase.title);
                
                // You can add functionality here, such as:
                // - Showing a context menu
                // - Opening advanced options
                // - Copying purchase details to clipboard
                // For now, we'll show a confirmation dialog for deletion
                // if (confirm(`Long click detected!\n\nDo you want to delete "${purchase.title}"?`)) {
                //     this.removePurchase(purchase.id, payPeriodIndex, purchaseIndex);
                // }
                
                this.cancelLongClick();
            }
        },
        
    }
}).mount('#app');
</script>
</body>
</html>
