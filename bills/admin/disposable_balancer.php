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
    <title>Disposable Balancer</title>
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

    <div class="alert alert-success" role="alert" v-if="message">
        {{ message }}
    </div>
    <div class="alert alert-danger" role="alert" v-if="error_message">
        {{ error_message }}
    </div>

    <h2>Disposable Balancer</h2>

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 24px"></div>

    <div class="row">
        
        <div class="col-xs-6">
            <button class="btn btn-success" @click="addRow">Add</button>&nbsp; 
            <button class="btn btn-primary" @click="robPeter()">Rob Peter & Pay Paul</button>&nbsp; 
            <button class="btn btn-default" @click="clear()">Clear</button>
        </div>
        <div class="col-xs-6" style="text-align: right;">
            <button class="btn btn-danger" @click="saveRows()">Save Current</button>&nbsp; 
            <button class="btn btn-info" @click="reloadRows()">Reload Previous</button>
        </div>
    </div>

    <div class="row">
        
        <div class="col-xs-12">
            
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Pay Period</th>
                        <th>Disposable</th>
                        <th>Expense Amount</th>
                        <th>Transfer Type</th>
                        <th>Rob Peter</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(row, index) in expenseRows" :key="index">
                        <td>
                            <select v-model="row.payPeriod" class="form-control">
                                <option value="" >Select Pay Period</option>      
                                <option v-for="payPeriod in payPeriods" :value="payPeriod">{{ payPeriod }}</option>                        
                            </select>
                        </td>
                        <td><input type="number" v-model="row.disposable" class="form-control" /></td>
                        <td><input type="number" v-model="row.expenseAmount" class="form-control" /></td>
                        <td>
                            <select v-model="row.transferType" class="form-control">
                                <option value="">None</option>
                                <option value="Peter">Peter</option>
                                <option value="Paul">Paul</option>
                            </select>
                        </td>
                        <td><input type="number" v-model="row.robPeter" class="form-control" /></td>
                    </tr>
                </tbody>
            </table>
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
            expenseRows: [],
            payPeriods: [],
            message: "",
            error_message: ""
        }
    },
    mounted() {
        
        this.loadPage();
    },
    methods: {
        loadPage() {
            this.loadPayPeriods();
            this.addRow();
        },
        clear() {
            this.expenseRows = [];
            this.addRow();
        },
        saveRows() {
            console.log('111');
            localStorage.setItem("disposableBalancerRows", JSON.stringify(this.expenseRows));
            this.error_message = "";
            this.message = "Rows saved successfully!";
            console.log('this.message: ', this.message);
        },
        reloadRows() {
            const saved = localStorage.getItem("disposableBalancerRows");
            if (saved) {
                this.expenseRows = JSON.parse(saved);
            } else {
                this.error_message = "No saved data found!";
                this.message = "";
            }
        },
        loadPayPeriods() {
            const now = new Date();
            let month = now.getMonth();
            let year = now.getFullYear();
            let day = now.getDate() < 15 ? 1 : 15;

            for (let i = 0; i < 10; i++) {
                const mm = String(month + 1).padStart(2, '0');
                const dd = String(day).padStart(2, '0');
                this.payPeriods.push(`${mm}/${dd}/${year}`);

                if (day === 1) {
                    day = 15;
                } else {
                    day = 1;
                    month++;
                    if (month > 11) {
                        month = 0;
                        year++;
                    }
                }
        }
        },
        robPeter() {
            let totalRobbed = 0;
            this.expenseRows.forEach((row, index) => {
                if (row.transferType === "Peter") {
                    this.expenseRows[index].disposable -= row.robPeter;
                    this.expenseRows[index].expenseAmount = parseFloat(row.expenseAmount) + parseFloat(row.robPeter);
                    totalRobbed += parseFloat(row.robPeter) || 0;
                }
            });

            let paulsCount = 0;
            this.expenseRows.forEach((row, index) => {
                if (row.transferType === "Paul") {
                    paulsCount++;
                }
            });
            if (paulsCount === 0) {
                this.error_message = "No Paul rows to transfer to!";
                this.message = "";
                return;
            }

            const paulAlottment = totalRobbed / paulsCount;

            this.expenseRows.forEach((row, index) => {
                if (row.transferType === "Paul") {
                    this.expenseRows[index].disposable = parseFloat(row.disposable) + paulAlottment;
                    this.expenseRows[index].expenseAmount = parseFloat(row.expenseAmount) - paulAlottment;
                    
                }
            });
           
        },
        addRow() {
            this.expenseRows.push({
                payPeriod: "",
                disposable: 0,
                expenseAmount: 0,
                transferType: "",
                robPeter: 0
            });
        }
    }
}).mount('#app');
</script>
</body>
</html>
