<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

/*
 * Diet log JSON API: /api/dietlog_*.php (see /api/dietlog_inc.php)
 * Includes create/update/delete for foods and log entries.
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
    <style>
        /* iOS: no native number spinners; explicit steppers + 16px input avoids zoom-on-focus */
        .dietlog-stepper .dietlog-step-btn {
            min-width: 44px;
            min-height: 44px;
            padding: 10px 14px;
            font-size: 22px;
            line-height: 1;
            font-weight: 600;
            touch-action: manipulation;
            -webkit-tap-highlight-color: transparent;
            user-select: none;
        }
        .dietlog-stepper .form-control {
            font-size: 16px;
            text-align: center;
            min-height: 44px;
        }
    </style>
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
                            <button type="button" class="btn btn-primary" @click="openCreateLogModal">Log Food Consumed</button>&nbsp;
                            <button type="button" class="btn btn-danger" :disabled="selectedLogIds.length === 0"
                                @click="openBulkDeleteLogConfirm">Delete selected</button>&nbsp;
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
                                            <th style="width: 44px;" title="Select all for this day">
                                                <input type="checkbox"
                                                    :checked="allLogsSelectedForDate(dateConsumed)"
                                                    @change="toggleSelectAllForDate(dateConsumed)">
                                            </th>
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
                                            <td>
                                                <input type="checkbox"
                                                    :checked="isLogSelected(log.log_id)"
                                                    @change="toggleLogSelection(log.log_id)">
                                            </td>
                                            <td>{{ log.meal_of_day }}</td>
                                            <td>{{ log.food }}</td>
                                            <td>{{ log.macro_type }}</td>
                                            <td>{{ log.amount }}</td>
                                            <td>{{ log.amount_grams }}</td>
                                            <td>{{ log.fiber_amount_grams }}</td>
                                            <td>{{ log.soluble_fiber_amount_grams }}</td>
                                            <td style="white-space: nowrap;">
                                                <button type="button" class="btn btn-sm btn-default" @click="openEditLog(log)">Edit</button>
                                                <button type="button" class="btn btn-sm btn-danger" @click="openDeleteLogConfirm(log.log_id)">X</button>
                                            </td>
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
                    <div class="row">
                        <div class="col-xs-6">
                            <button type="button" class="btn btn-primary" @click="openCreateFoodModal">Add Food</button>
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
                                        <td style="white-space: nowrap;">
                                            <button type="button" class="btn btn-sm btn-default" @click="openEditFood(food)">Edit</button>
                                            <button type="button" class="btn btn-sm btn-danger" @click="openDeleteFoodConfirm(food.id)">X</button>
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
                    <button type="button" class="close" aria-label="Close" @click="closeFoodModal"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">{{ foodModalTitle }}</h4>
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
                        <div class="input-group dietlog-stepper">
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-default dietlog-step-btn" aria-label="Decrease percent fiber"
                                    @click.prevent="stepNumeric(newFood, 'percent_fiber', -1, 0, 100, 1)">−</button>
                            </span>
                            <input type="number" inputmode="numeric" class="form-control"
                                v-model.number="newFood.percent_fiber" min="0" max="100" step="1">
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-default dietlog-step-btn" aria-label="Increase percent fiber"
                                    @click.prevent="stepNumeric(newFood, 'percent_fiber', 1, 0, 100, 1)">+</button>
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Percent Soluble Fiber</label>
                        <div class="input-group dietlog-stepper">
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-default dietlog-step-btn" aria-label="Decrease percent soluble fiber"
                                    @click.prevent="stepNumeric(newFood, 'percent_soluble_fiber', -1, 0, 100, 1)">−</button>
                            </span>
                            <input type="number" inputmode="numeric" class="form-control"
                                v-model.number="newFood.percent_soluble_fiber" min="0" max="100" step="1">
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-default dietlog-step-btn" aria-label="Increase percent soluble fiber"
                                    @click.prevent="stepNumeric(newFood, 'percent_soluble_fiber', 1, 0, 100, 1)">+</button>
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Unit Of Measure</label>
                        <select class="form-control" v-model.number="newFood.unit_of_measure_id">
                            <option v-for="u in units_of_measure" :key="u.id" :value="u.id">{{ u.title }}</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Default Amount</label>
                        <div class="input-group dietlog-stepper">
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-default dietlog-step-btn" aria-label="Decrease default amount"
                                    @click.prevent="stepNumeric(newFood, 'default_amount', -1, 0, 50, 0.5)">−</button>
                            </span>
                            <input type="number" inputmode="decimal" class="form-control"
                                v-model.number="newFood.default_amount" min="0" max="50" step="0.5">
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-default dietlog-step-btn" aria-label="Increase default amount"
                                    @click.prevent="stepNumeric(newFood, 'default_amount', 1, 0, 50, 0.5)">+</button>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="closeFoodModal">Cancel</button>
                    <button type="button" class="btn btn-primary" @click="saveFood">{{ foodModalSaveLabel }}</button>
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
                    <button type="button" class="close" aria-label="Close" @click="closeLogModal"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">{{ logModalTitle }}</h4>
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
                        <div class="input-group dietlog-stepper">
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-default dietlog-step-btn" aria-label="Decrease amount"
                                    @click.prevent="stepNumeric(newLog, 'amount', -1, 0, 100, 0.5)">−</button>
                            </span>
                            <input type="number" inputmode="decimal" class="form-control"
                                v-model.number="newLog.amount" min="0" max="100" step="0.5">
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-default dietlog-step-btn" aria-label="Increase amount"
                                    @click.prevent="stepNumeric(newLog, 'amount', 1, 0, 100, 0.5)">+</button>
                            </span>
                        </div>
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
                    <button type="button" class="btn btn-default" @click="closeLogModal">Cancel</button>
                    <button type="button" class="btn btn-primary" @click="saveLogEntry">{{ logModalSaveLabel }}</button>
                </div>
            </div>
        </div>
    </div>

    <div v-if="showConfirmModal" class="modal-backdrop fade in"></div>
    <div class="modal fade" :class="{ in: showConfirmModal }" tabindex="-1" role="dialog"
         v-show="showConfirmModal" style="display: block !important;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" aria-label="Close" @click="closeConfirmModal"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Are you sure?</h4>
                </div>
                <div class="modal-body">
                    <p>{{ confirmMessage }}</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" @click="closeConfirmModal">Cancel</button>
                    <button type="button" class="btn btn-danger" @click="executeConfirmDelete">Delete</button>
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
    foodUpdate: '/api/dietlog_food_update.php',
    entryCreate: '/api/dietlog_entry_create.php',
    entryUpdate: '/api/dietlog_entry_update.php',
    foodDelete: '/api/dietlog_food_delete.php',
    entryDelete: '/api/dietlog_entry_delete.php',
    suggestedMeal: '/api/dietlog_suggested_meal.php',
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
            editingFoodId: null,
            editingLogId: null,
            showConfirmModal: false,
            confirmDeleteType: null,
            pendingDeleteId: null,
            pendingBulkLogIds: null,
            selectedLogIds: [],
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
        confirmMessage() {
            if (this.confirmDeleteType === 'log_bulk' && this.pendingBulkLogIds) {
                const n = this.pendingBulkLogIds.length;
                return `Are you sure you want to delete ${n} selected log ${n === 1 ? 'entry' : 'entries'}? This cannot be undone.`;
            }
            if (this.confirmDeleteType === 'log') {
                return 'Are you sure you want to delete this log entry? This cannot be undone.';
            }
            if (this.confirmDeleteType === 'food') {
                return 'Are you sure you want to delete this food? This cannot be undone.';
            }
            return '';
        },
        foodModalTitle() {
            return this.editingFoodId ? 'Edit Food' : 'Create Food';
        },
        foodModalSaveLabel() {
            return this.editingFoodId ? 'Save' : 'Create';
        },
        logModalTitle() {
            return this.editingLogId ? 'Edit Log Entry' : 'Log Food Consumed';
        },
        logModalSaveLabel() {
            return this.editingLogId ? 'Save' : 'Create';
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
        stepNumeric(obj, key, direction, min, max, step) {
            let v = parseFloat(obj[key]);
            if (Number.isNaN(v)) v = min;
            v += direction * step;
            let snapped = min + Math.round((v - min) / step) * step;
            if (snapped < min) snapped = min;
            if (snapped > max) snapped = max;
            const stepDecimals = (String(step).split('.')[1] || '').length;
            obj[key] = stepDecimals > 0 ? Number(snapped.toFixed(stepDecimals)) : Math.round(snapped);
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
            if (this.editingLogId) return;
            const id = this.newLog.food_id;
            const food = this.foods.find((f) => f.id == id);
            if (food && food.default_amount != null) {
                this.newLog.amount = parseFloat(food.default_amount);
            }
        },
        resetNewFoodForm() {
            this.newFood = {
                title: '',
                macro_type_id: '',
                type_id: this.types[0] ? this.types[0].id : 1,
                is_cruciferous: 0,
                has_fiber: 0,
                percent_fiber: 0,
                percent_soluble_fiber: 0,
                unit_of_measure_id: this.units_of_measure[0] ? this.units_of_measure[0].id : '',
                default_amount: 0,
            };
        },
        openCreateFoodModal() {
            this.editingFoodId = null;
            this.resetNewFoodForm();
            this.showFoodModal = true;
        },
        openEditFood(food) {
            const pf = parseFloat(food.percent_fiber) || 0;
            const psf = parseFloat(food.percent_soluble_fiber) || 0;
            this.editingFoodId = food.id;
            this.newFood = {
                title: food.title,
                macro_type_id: food.macro_type_id,
                type_id: food.type_id,
                is_cruciferous: parseInt(food.is_cruciferous, 10) || 0,
                has_fiber: parseInt(food.has_fiber, 10) || 0,
                percent_fiber: Math.round(pf * 10000) / 100,
                percent_soluble_fiber: Math.round(psf * 10000) / 100,
                unit_of_measure_id: food.unit_of_measure_id,
                default_amount: parseFloat(food.default_amount) || 0,
            };
            this.showFoodModal = true;
        },
        closeFoodModal() {
            this.showFoodModal = false;
            this.editingFoodId = null;
            this.resetNewFoodForm();
        },
        todayYmd() {
            const today = new Date();
            return today.getFullYear() + '-' + String(today.getMonth() + 1).padStart(2, '0') + '-' + String(today.getDate()).padStart(2, '0');
        },
        async openCreateLogModal() {
            this.editingLogId = null;
            let mealId = this.meals_of_day[0] ? this.meals_of_day[0].id : '';
            try {
                const r = await axios.get(API.suggestedMeal);
                if (r.data && r.data.success && r.data.meal_of_day_id != null) {
                    const sid = Number(r.data.meal_of_day_id);
                    if (this.meals_of_day.some((m) => Number(m.id) === sid)) {
                        mealId = sid;
                    }
                }
            } catch (e) {
                console.error('suggested meal:', e);
            }
            this.newLog = {
                food_id: '',
                amount: 0,
                date_consumed: this.todayYmd(),
                meal_of_day_id: mealId,
            };
            this.showLogModal = true;
        },
        openEditLog(log) {
            let ymd = '';
            if (log.date_consumed_date) {
                ymd = String(log.date_consumed_date).slice(0, 10);
            } else if (log.date_consumed) {
                ymd = String(log.date_consumed).slice(0, 10);
            }
            this.editingLogId = log.log_id;
            this.newLog = {
                food_id: log.food_id,
                amount: parseFloat(log.amount_value) || 0,
                date_consumed: ymd,
                meal_of_day_id: log.meal_of_day_id,
            };
            this.showLogModal = true;
        },
        closeLogModal() {
            this.showLogModal = false;
            this.editingLogId = null;
            this.newLog = {
                food_id: '',
                amount: 0,
                date_consumed: this.todayYmd(),
                meal_of_day_id: this.meals_of_day[0] ? this.meals_of_day[0].id : '',
            };
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
                this.pruneSelectedLogIds();
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
                if (this.editingFoodId) {
                    body.append('food_id', this.editingFoodId);
                    await axios.post(API.foodUpdate, body);
                } else {
                    await axios.post(API.foodCreate, body);
                }
                this.closeFoodModal();
                await this.bootstrapData();
            } catch (e) {
                console.error('saveFood:', e);
            }
        },
        async saveLogEntry() {
            try {
                const body = new URLSearchParams();
                body.append('food_id', this.newLog.food_id);
                body.append('amount', this.newLog.amount);
                body.append('date_consumed', this.newLog.date_consumed);
                body.append('meal_of_day_id', this.newLog.meal_of_day_id);
                if (this.editingLogId) {
                    body.append('log_id', this.editingLogId);
                    await axios.post(API.entryUpdate, body);
                } else {
                    await axios.post(API.entryCreate, body);
                }
                this.closeLogModal();
                await this.bootstrapData();
            } catch (e) {
                console.error('saveLogEntry:', e);
            }
        },
        normalizeLogId(logId) {
            const n = Number(logId);
            return Number.isNaN(n) ? logId : n;
        },
        isLogSelected(logId) {
            const id = this.normalizeLogId(logId);
            return this.selectedLogIds.some((x) => this.normalizeLogId(x) === id);
        },
        toggleLogSelection(logId) {
            const id = this.normalizeLogId(logId);
            const i = this.selectedLogIds.findIndex((x) => this.normalizeLogId(x) === id);
            if (i === -1) {
                this.selectedLogIds.push(id);
            } else {
                this.selectedLogIds.splice(i, 1);
            }
        },
        logIdsForDate(dateConsumed) {
            const items = this.logByDate[dateConsumed]?.items || [];
            return items.map((l) => this.normalizeLogId(l.log_id));
        },
        allLogsSelectedForDate(dateConsumed) {
            const ids = this.logIdsForDate(dateConsumed);
            if (ids.length === 0) return false;
            return ids.every((id) => this.isLogSelected(id));
        },
        toggleSelectAllForDate(dateConsumed) {
            const ids = this.logIdsForDate(dateConsumed);
            if (ids.length === 0) return;
            const allOn = this.allLogsSelectedForDate(dateConsumed);
            if (allOn) {
                this.selectedLogIds = this.selectedLogIds.filter((x) => !ids.includes(this.normalizeLogId(x)));
            } else {
                const set = new Set(this.selectedLogIds.map((x) => this.normalizeLogId(x)));
                ids.forEach((id) => set.add(id));
                this.selectedLogIds = [...set];
            }
        },
        pruneSelectedLogIds() {
            const existing = new Set();
            for (const d of Object.keys(this.logByDate)) {
                for (const row of this.logByDate[d].items || []) {
                    existing.add(this.normalizeLogId(row.log_id));
                }
            }
            this.selectedLogIds = this.selectedLogIds.filter((id) => existing.has(this.normalizeLogId(id)));
        },
        openBulkDeleteLogConfirm() {
            if (this.selectedLogIds.length === 0) return;
            this.confirmDeleteType = 'log_bulk';
            this.pendingBulkLogIds = this.selectedLogIds.slice();
            this.pendingDeleteId = null;
            this.showConfirmModal = true;
        },
        openDeleteLogConfirm(logId) {
            this.confirmDeleteType = 'log';
            this.pendingDeleteId = logId;
            this.pendingBulkLogIds = null;
            this.showConfirmModal = true;
        },
        openDeleteFoodConfirm(foodId) {
            this.confirmDeleteType = 'food';
            this.pendingDeleteId = foodId;
            this.pendingBulkLogIds = null;
            this.showConfirmModal = true;
        },
        closeConfirmModal() {
            this.showConfirmModal = false;
            this.confirmDeleteType = null;
            this.pendingDeleteId = null;
            this.pendingBulkLogIds = null;
        },
        async executeConfirmDelete() {
            try {
                if (this.confirmDeleteType === 'log_bulk' && this.pendingBulkLogIds && this.pendingBulkLogIds.length) {
                    await Promise.all(this.pendingBulkLogIds.map((logId) => {
                        const body = new URLSearchParams();
                        body.append('log_id', logId);
                        return axios.post(API.entryDelete, body);
                    }));
                    this.selectedLogIds = [];
                } else if (this.confirmDeleteType === 'log' && this.pendingDeleteId != null) {
                    const body = new URLSearchParams();
                    body.append('log_id', this.pendingDeleteId);
                    await axios.post(API.entryDelete, body);
                    const id = this.normalizeLogId(this.pendingDeleteId);
                    this.selectedLogIds = this.selectedLogIds.filter((x) => this.normalizeLogId(x) !== id);
                } else if (this.confirmDeleteType === 'food' && this.pendingDeleteId != null) {
                    const body = new URLSearchParams();
                    body.append('food_id', this.pendingDeleteId);
                    await axios.post(API.foodDelete, body);
                } else {
                    return;
                }
                this.closeConfirmModal();
                await this.bootstrapData();
            } catch (e) {
                console.error('delete failed:', e);
            }
        },
    },
}).mount('#app');
</script>
</body>
</html>
