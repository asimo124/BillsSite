<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

/*
 * Dummy API endpoints (implement under /api/ or adjust base URL):
 *
 * GET  /api/dietlog_foods.php
 *      → { "foods": [ { id, title, macro_type, type, title_display, default_amount, ... } ] }
 *
 * GET  /api/dietlog_log.php
 *      → { "by_date": { "Y-m-d": { total_fiber, total_soluble_fiber, total_percent_soluble, items: [ row... ] } } }
 *      (or flat "entries" — adapt mapLogResponse() when your shape is fixed)
 *
 * GET  /api/dietlog_lookups.php
 *      → { "macros": [], "types": [], "units_of_measure": [], "meals_of_day": [] }
 *
 * POST /api/dietlog_food_create.php
 * POST /api/dietlog_entry_create.php
 * POST /api/dietlog_food_delete.php   (body: log_id or food_id as your API expects)
 * POST /api/dietlog_entry_delete.php
 */
?>
<!DOCTYPE html>
<html>
<head>
    <title>Dietary Log</title>
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
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <div class="alert alert-warning" role="alert" v-if="loadError">
        Could not load diet log data (dummy API not implemented or network error). Check the browser console.
    </div>

    <h2>Dietary Log</h2>

    <div style="clear: both; height: 12px"></div>
    <?php include "../../templates/nav.php"; ?>
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
                    <h3>Dietary Log</h3>

                    <div class="row">
                        <div class="col-xs-12">
                            <button type="button" class="btn btn-primary" @click="showLogModal = true">Log Food Consumed</button>&nbsp;
                            <a class="btn btn-info" href="proc_add_oatmeal.php" id="add_oatmeal_btn">Add Oatmeal</a>&nbsp;
                            <a class="btn btn-info" href="proc_add_oatmeal.php?blueberries=1" id="add_oatemal_blueberries_btn">Add Oatmeal w/ Blueberries</a>
                        </div>
                    </div>
                    <div style="clear: both; height: 16px;"></div>

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
                                            <th>Actions</th>
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
                                            <td>
                                                <button type="button" class="btn btn-sm btn-danger" @click="deleteLogItem(log.log_id)">X</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <h4>Total Fiber: {{ logByDate[dateConsumed].total_fiber }} grams</h4>
                        <h4>Total Soluble Fiber: {{ logByDate[dateConsumed].total_soluble_fiber }} grams</h4>
                        <h4>Total Percent Soluble: {{ logByDate[dateConsumed].total_percent_soluble }}</h4>
                        <div style="clear: both; height: 32px;"></div>
                    </template>
                </div>

                <div role="tabpanel" class="tab-pane" :class="{ active: activeTab === 'foods' }" id="foodList" v-show="activeTab === 'foods'">
                    <h3>Foods</h3>
                    <div class="row">
                        <div class="col-xs-6">
                            <button type="button" class="btn btn-primary" @click="showFoodModal = true">Add Food</button>
                        </div>
                    </div>
                    <div style="clear: both; height: 16px;"></div>

                    <div class="row">
                        <div class="col-xs-12">
                            <table class="table table-bordered" style="border: 1px solid #666666;">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Macro Type</th>
                                        <th>Type</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="food in foods" :key="food.id">
                                        <td>{{ food.title }}</td>
                                        <td>{{ food.macro_type }}</td>
                                        <td>{{ food.type }}</td>
                                        <td>
                                            <button type="button" class="btn btn-sm btn-danger" @click="deleteFood(food.id)">X</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div v-if="showFoodModal" class="modal-backdrop fade in"></div>
    <div class="modal fade" :class="{ in: showFoodModal }" tabindex="-1" role="dialog"
         v-show="showFoodModal" style="display: block !important;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" aria-label="Close" @click="showFoodModal = false"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Create Food</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Food Title</label>
                        <input type="text" class="form-control" v-model="newFood.title">
                    </div>
                    <div class="form-group">
                        <label>Macro Type</label>
                        <select class="form-control" v-model.number="newFood.macro_type_id">
                            <option value="">-- Select --</option>
                            <option v-for="m in macros" :key="m.id" :value="m.id">{{ m.title }}</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Food Type</label>
                        <select class="form-control" v-model.number="newFood.type_id">
                            <option v-for="t in types" :key="t.id" :value="t.id">{{ t.title }}</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label><input type="checkbox" v-model="newFood.is_cruciferous" :true-value="1" :false-value="0"> Is Cruciferous</label>
                    </div>
                    <div class="form-group">
                        <label><input type="checkbox" v-model="newFood.has_fiber" :true-value="1" :false-value="0"> Has Fiber</label>
                    </div>
                    <div class="form-group">
                        <label>Percent Fiber</label>
                        <input type="number" class="form-control" v-model.number="newFood.percent_fiber" min="0" max="100" step="1">
                    </div>
                    <div class="form-group">
                        <label>Percent Soluble Fiber</label>
                        <input type="number" class="form-control" v-model.number="newFood.percent_soluble_fiber" min="0" max="100" step="1">
                    </div>
                    <div class="form-group">
                        <label>Unit Of Measure</label>
                        <select class="form-control" v-model.number="newFood.unit_of_measure_id">
                            <option v-for="u in units_of_measure" :key="u.id" :value="u.id">{{ u.title }}</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Default Amount</label>
                        <input type="number" class="form-control" v-model.number="newFood.default_amount" min="0" max="50" step="0.5">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="showFoodModal = false">Cancel</button>
                    <button type="button" class="btn btn-primary" @click="saveFood">Create</button>
                </div>
            </div>
        </div>
    </div>

    <div v-if="showLogModal" class="modal-backdrop fade in"></div>
    <div class="modal fade" :class="{ in: showLogModal }" tabindex="-1" role="dialog"
         v-show="showLogModal" style="display: block !important;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" aria-label="Close" @click="showLogModal = false"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Log Food Consumed</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Food Consumed</label>
                        <select class="form-control" v-model.number="newLog.food_id" @change="applyDefaultAmountFromFood">
                            <option value="">-- Select --</option>
                            <optgroup v-for="(groupFoods, macroType) in foodsByMacro" :key="macroType" :label="macroType">
                                <option v-for="f in groupFoods" :key="f.id" :value="f.id">
                                    {{ f.title_display || f.title }}
                                </option>
                            </optgroup>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Amount</label>
                        <input type="number" class="form-control" v-model.number="newLog.amount" min="0" max="100" step="0.5">
                    </div>
                    <div class="form-group">
                        <label>Date Consumed</label>
                        <input type="date" class="form-control" v-model="newLog.date_consumed">
                    </div>
                    <div class="form-group">
                        <label>Meal of Day</label>
                        <select class="form-control" v-model.number="newLog.meal_of_day_id">
                            <option v-for="meal in meals_of_day" :key="meal.id" :value="meal.id">{{ meal.title }}</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="showLogModal = false">Cancel</button>
                    <button type="button" class="btn btn-primary" @click="saveLogEntry">Create</button>
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
    foods: '/api/dietlog_foods.php',
    log: '/api/dietlog_log.php',
    lookups: '/api/dietlog_lookups.php',
    foodCreate: '/api/dietlog_food_create.php',
    entryCreate: '/api/dietlog_entry_create.php',
    foodDelete: '/api/dietlog_food_delete.php',
    entryDelete: '/api/dietlog_entry_delete.php',
};

createApp({
    data() {
        const today = new Date();
        const ymd = today.getFullYear() + '-' + String(today.getMonth() + 1).padStart(2, '0') + '-' + String(today.getDate()).padStart(2, '0');
        return {
            activeTab: 'log',
            loading: false,
            loadError: false,
            foods: [],
            logByDate: {},
            macros: [],
            types: [],
            units_of_measure: [],
            meals_of_day: [],
            showFoodModal: false,
            showLogModal: false,
            newFood: {
                title: '',
                macro_type_id: '',
                type_id: 1,
                is_cruciferous: 0,
                has_fiber: 0,
                percent_fiber: 0,
                percent_soluble_fiber: 0,
                unit_of_measure_id: '',
                default_amount: 0,
            },
            newLog: {
                food_id: '',
                amount: 0,
                date_consumed: ymd,
                meal_of_day_id: '',
            },
        };
    },
    computed: {
        sortedLogDates() {
            return Object.keys(this.logByDate).sort().reverse();
        },
        foodsByMacro() {
            const groups = {};
            for (const f of this.foods) {
                const key = f.macro_type || 'Other';
                if (!groups[key]) groups[key] = [];
                groups[key].push(f);
            }
            return groups;
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
        mapLogResponse(data) {
            if (data && data.by_date) {
                this.logByDate = data.by_date;
                return;
            }
            if (data && Array.isArray(data.entries)) {
                this.logByDate = {};
                return;
            }
            this.logByDate = {};
        },
        applyDefaultAmountFromFood() {
            const id = this.newLog.food_id;
            const food = this.foods.find((f) => f.id == id);
            if (food && food.default_amount != null) {
                this.newLog.amount = parseFloat(food.default_amount);
            }
        },
        async bootstrapData() {
            this.loading = true;
            this.loadError = false;
            try {
                const [foodsRes, logRes, lookRes] = await Promise.all([
                    axios.get(API.foods),
                    axios.get(API.log),
                    axios.get(API.lookups),
                ]);
                this.foods = (foodsRes.data && foodsRes.data.foods) ? foodsRes.data.foods : [];
                this.mapLogResponse(logRes.data);
                if (lookRes.data) {
                    this.macros = lookRes.data.macros || [];
                    this.types = lookRes.data.types || [];
                    this.units_of_measure = lookRes.data.units_of_measure || [];
                    this.meals_of_day = lookRes.data.meals_of_day || [];
                    if (this.newFood.type_id && !this.types.some((t) => t.id == this.newFood.type_id)) {
                        this.newFood.type_id = this.types[0] ? this.types[0].id : '';
                    }
                    if (!this.newFood.unit_of_measure_id && this.units_of_measure[0]) {
                        this.newFood.unit_of_measure_id = this.units_of_measure[0].id;
                    }
                    if (!this.newLog.meal_of_day_id && this.meals_of_day[0]) {
                        this.newLog.meal_of_day_id = this.meals_of_day[0].id;
                    }
                }
            } catch (e) {
                console.error('Diet log bootstrap failed:', e);
                this.loadError = true;
            } finally {
                this.loading = false;
            }
        },
        async saveFood() {
            try {
                const body = new URLSearchParams();
                Object.keys(this.newFood).forEach((k) => {
                    body.append(k, this.newFood[k]);
                });
                await axios.post(API.foodCreate, body);
                this.showFoodModal = false;
                await this.bootstrapData();
            } catch (e) {
                console.error('saveFood (dummy endpoint):', e);
            }
        },
        async saveLogEntry() {
            try {
                const body = new URLSearchParams();
                body.append('food_id', this.newLog.food_id);
                body.append('amount', this.newLog.amount);
                body.append('date_consumed', this.newLog.date_consumed);
                body.append('meal_of_day_id', this.newLog.meal_of_day_id);
                await axios.post(API.entryCreate, body);
                this.showLogModal = false;
                await this.bootstrapData();
            } catch (e) {
                console.error('saveLogEntry (dummy endpoint):', e);
            }
        },
        async deleteLogItem(logId) {
            if (!confirm('Are you sure you want to delete this log item?')) return;
            try {
                const body = new URLSearchParams();
                body.append('log_id', logId);
                await axios.post(API.entryDelete, body);
                await this.bootstrapData();
            } catch (e) {
                console.error('deleteLogItem (dummy endpoint):', e);
            }
        },
        async deleteFood(foodId) {
            if (!confirm('Are you sure you want to delete this food item?')) return;
            try {
                const body = new URLSearchParams();
                body.append('food_id', foodId);
                await axios.post(API.foodDelete, body);
                await this.bootstrapData();
            } catch (e) {
                console.error('deleteFood (dummy endpoint):', e);
            }
        },
    },
}).mount('#app');
</script>
</body>
</html>
