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
    <title>Run Date Job</title>
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

    <h2>Run Date Job</h2>

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 24px"></div>

    <div class="row">
        <div class="col-xs-4" >
            <button class="btn btn-primary" @click="queueDateJob">Run Dates Job</button>
        </div>
        <div class="col-xs-4 col-xs-offset-4" style="display: flex; text-align: right; justify-content: flex-end;">
            <div v-if="isRunning" style="background-color: #28a745; color: white; padding: 6px 12px; border-radius: 20px; font-size: 14px; display: flex; align-items: center; gap: 6px;">
                <i class="fa fa-circle" style="font-size: 8px;"></i>
                Running
            </div>
            <div v-else style="background-color: #dc3545; color: white; padding: 6px 12px; border-radius: 20px; font-size: 14px; display: flex; align-items: center; gap: 6px;">
                <i class="fa fa-circle" style="font-size: 8px;"></i>
                Stopped
            </div>
        </div>
    </div>
    <div style="clear: both; height: 16px"></div>

    <div class="row">
        <div class="col-xs-6 col-xs-offset-6" style="display: flex; align-items: center; justify-content: flex-end; gap: 8px;">
            <span><span>180</span>s</span>
            <input type="number" class="form-control" v-model="secondsWait" style="width: 50%;" placeholder="Seconds to wait" />
        </div>
    </div>
    <div style="clear: both; height: 16px"></div>

    <div class="row">
        <div class="col-xs-12" >
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Job ID</th>
                        <th>Created Date</th>
                        <th>Updated At</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Example row, replace with dynamic data -->
                    <tr>
                        <td>1</td>
                        <td>Completed</td>
                        <td>2024-06-01 10:00:00</td>
                        <td>2024-06-01 10:05:00</td>
                        <td>completed</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Completed</td>
                        <td>2024-06-01 10:00:00</td>
                        <td>2024-06-01 10:05:00</td>
                        <td>completed</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div style="clear: both; height: 16px">

</div>

<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="/js/nav.js"></script>
<script>
const { createApp } = Vue;

createApp({
    data() {
        return {
            isRunning: true,
            secondsWait: 180,
        }
    },
    mounted() {
        
    },
    methods: {
        async queueDateJob() {
           try {
                const response = await axios.get(`/api/queue_date_job.php`);
                
                if (response.data && response.data.return_status && response.data.return_status == "success") {
                    console.log("Date job queued successfully.");
                }
            } catch (error) {
                console.error("Error", error);
            }
        },
        async load() {
            const curBalance = parseFloat(this.initBalance) || 0;
            const payDateStr = this.payDate.toLocaleDateString();
            
            try {
                const response = await axios.get(`/api/loadBillDates2.php?user_id=1&pay_date=${payDateStr}&current_balance=${curBalance}&test_mode=${this.testMode ? 1 : 0}&includeWeekends=1&next_date=${this.nextDate}&prev_date=${this.prevDate}`);
                
                if (response.data && response.data.results.length > 0) {
                    
                }
            } catch (error) {
                console.error("Error", error);
            }
        }
    }
}).mount('#app');
</script>
</body>
</html>
