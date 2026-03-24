<?php
    include "../inc/includes.php";

/*
 * Read-only public view. Session login is disabled; data loads via *_public GET endpoints
 * (same shape as /api/dietlog_foods.php and /api/dietlog_log.php).
 */
// if (!isset($_SESSION['user'])) {
//     header("Location: /login.php");
//     exit;
// }
?>
<!DOCTYPE html>
<html>
<head>
    <title>Alex's Dietary Log</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="/css/bills_admin.css" />
    <link rel="stylesheet" href="/css/income_purchases.css?version=1" />
</head>
<body>

<div class="container" id="app">
    <div style="clear: both; height: 20px;"></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo htmlspecialchars($_REQUEST['Message']); ?>
        </div>
    <?php } ?>

    <div class="alert alert-warning" role="alert" v-if="loadError">
        Could not load diet log data. Check the browser console or network tab.
    </div>

    <h2>Alex's Dietary Log</h2>

    <div style="clear: both; height: 12px"></div>
    <?php // include "../templates/nav.php"; ?>
    <div style="clear: both; height: 24px"></div>

    <div class="row">
        <div class="col-xs-12">
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" :class="{ active: activeTab === 'log' }">
                    <a href="#foodHistory" aria-controls="foodHistory" role="tab" @click.prevent="activeTab = 'log'">Log</a>
                </li>
                <li role="presentation" :class="{ active: activeTab === 'foods' }">
                    <a href="#foodList" aria-controls="foodList" role="tab" @click.prevent="activeTab = 'foods'">Foods</a>
                </li>
            </ul>

            <div class="tab-content" style="margin-top: 20px;">
                <div role="tabpanel" class="tab-pane" :class="{ active: activeTab === 'log' }" id="foodHistory" v-show="activeTab === 'log'">
                    <h3>Food log</h3>
                    <p class="text-muted" v-if="!loading && sortedLogDates.length === 0">No log entries loaded.</p>

                    <template v-for="dateConsumed in sortedLogDates" :key="dateConsumed">
                        <h4>{{ formatLogHeading(dateConsumed) }}</h4>
                        <div class="row">
                            <div class="col-xs-12">
                                <table class="table table-bordered" style="border: 1px solid #666666;">
                                    <thead>
                                        <tr>
                                            <th>Meal Of Day</th>
                                            <th>Food</th>
                                            <th>Macro Type</th>
                                            <th>Amount</th>
                                            <th>Amount in Grams</th>
                                            <th>Fiber Amount</th>
                                            <th>Soluble Fiber Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="log in logByDate[dateConsumed].items" :key="log.log_id">
                                            <td>{{ log.meal_of_day }}</td>
                                            <td>{{ log.food }}</td>
                                            <td>{{ log.macro_type }}</td>
                                            <td>{{ log.amount }}</td>
                                            <td>{{ log.amount_grams }}</td>
                                            <td>{{ log.fiber_amount_grams }}</td>
                                            <td>{{ log.soluble_fiber_amount_grams }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <h4>Total Fiber: {{ formatFiberTotal(logByDate[dateConsumed].total_fiber) }} grams</h4>
                        <h4>Total Soluble Fiber: {{ formatFiberTotal(logByDate[dateConsumed].total_soluble_fiber) }} grams</h4>
                        <h4>Total Percent Soluble: {{ logByDate[dateConsumed].total_percent_soluble }}</h4>
                        <div style="clear: both; height: 32px;"></div>
                    </template>
                </div>

                <div role="tabpanel" class="tab-pane" :class="{ active: activeTab === 'foods' }" id="foodList" v-show="activeTab === 'foods'">
                    <h3>Foods</h3>
                    <p class="text-muted" v-if="!loading && foods.length === 0">No foods loaded.</p>
                    <div class="row">
                        <div class="col-xs-12">
                            <table class="table table-bordered" style="border: 1px solid #666666;">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Macro Type</th>
                                        <th>Type</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="food in foods" :key="food.id">
                                        <td>{{ food.title }}</td>
                                        <td>{{ food.macro_type }}</td>
                                        <td>{{ food.type }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="/js/nav.js"></script>
<script>
const { createApp } = Vue;

const API = {
    foods: '/api/dietlog_foods_public.php',
    log: '/api/dietlog_log_public.php',
};

createApp({
    data() {
        return {
            activeTab: 'log',
            loading: false,
            loadError: false,
            foods: [],
            logByDate: {},
        };
    },
    computed: {
        sortedLogDates() {
            return Object.keys(this.logByDate).sort().reverse();
        },
    },
    mounted() {
        this.bootstrapData();
    },
    methods: {
        formatLogHeading(dateStr) {
            const d = new Date(dateStr + 'T12:00:00');
            return d.toLocaleDateString('en-US', { month: 'long', day: 'numeric', year: 'numeric' });
        },
        formatFiberTotal(n) {
            const v = parseFloat(n);
            if (Number.isNaN(v)) return '0.00';
            return v.toFixed(2);
        },
        mapLogResponse(data) {
            if (data && data.by_date) {
                this.logByDate = data.by_date;
                return;
            }
            this.logByDate = {};
        },
        async bootstrapData() {
            this.loading = true;
            this.loadError = false;
            try {
                const [foodsRes, logRes] = await Promise.all([
                    axios.get(API.foods),
                    axios.get(API.log),
                ]);
                this.foods = (foodsRes.data && foodsRes.data.foods) ? foodsRes.data.foods : [];
                this.mapLogResponse(logRes.data);
            } catch (e) {
                console.error('Diet log load failed:', e);
                this.loadError = true;
            } finally {
                this.loading = false;
            }
        },
    },
}).mount('#app');
</script>
</body>
</html>
