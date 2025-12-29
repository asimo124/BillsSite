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
    <title>Food Sensitivities</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <!-- Font Awesome for hamburger icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="/css/bills_admin.css" />
    <link rel="stylesheet" href="/css/income_purchases.css?version=1" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
</head>
<body>
<div class="container" id="app">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h2>Food Sensitivities</h2>
    <div class="alert alert-danger" role="alert" v-if="main_error">
        {{ main_error }}    
    </div>
    <div class="alert alert-success" role="alert" v-if="main_msg">
        {{ main_msg }}    
    </div>
    <div class="alert alert-info" role="alert" v-if="temp_msg">
        {{ temp_msg }}    
    </div>

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 24px"></div>

    <div class="row">
        <div class="col-xs-12">
            <!-- Sub-navigation tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active">
                    <a href="#foodList" aria-controls="foodList" role="tab" data-toggle="tab">Food List</a>
                </li>
                <li role="presentation">
                    <a href="#foodHistory" aria-controls="foodHistory" role="tab" data-toggle="tab" id="foodHistoryTab">Food History</a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content" style="margin-top: 20px;">
                <div role="tabpanel" class="tab-pane active" id="foodList">
                    <h3>Food List</h3>

                    <div class="row">
                        <div class="col-xs-6">
                            <input type="text" class="form-control" placeholder="Search by Title" v-model="food_search_title" @input="loadFoodSensitivities()" />
                        </div>
                    </div>
                    <div style="clear: both; height: 16px;"></div>


                    <div class="row">
                        <div class="col-xs-12">
                            <table class="table table-bordered" style="border: 1px solid #666666;">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Is Inflammation</th>
                                        <th>Percentage Towards Inflammation</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(food, index) in foods" :key="food.id">
                                        <td>{{ food.title }}</td>
                                        <td>{{ food.is_inflammation ? 'Yes' : 'No' }}</td>
                                        <td>{{ food.percentage_towards_inflammation }}%</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="foodHistory">
                    <h3>Food History</h3>

                    <div class="row">
                        <div class="col-xs-6">
                            <button class="btn btn-primary" @click="openFoodLogItemModal()">Add Food Consumption</button>
                        </div>
                    </div>
                    <div style="clear: both; height: 16px;"></div>

                    <div class="row">
                        <div class="col-xs-12">
                            <table class="table table-bordered" style="border: 1px solid #666666;">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Last Eaten Date</th>
                                        <th>Is Inflammation</th>
                                        <th>Percentage Towards Inflammation</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(food, index) in food_log" :key="food.id">
                                        <td>{{ food.title }}</td>
                                        <td>{{ food.consumed_date }}</td>
                                        <td>{{ food.is_inflammation ? 'Yes' : 'No' }}</td>
                                        <td>{{ food.percentage_towards_inflammation }}%</td>
                                        <td>
                                            <button class="btn btn-sm btn-danger" @click="removeFoodLogItem(food.id)">Delete</button>
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

    <!-- Add Purchase Modal -->
    <div class="modal fade" id="FoodLogItemModal" tabindex="-1" role="dialog" aria-labelledby="FoodLogItemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="FoodLogItemModalLabel">Test</h4>
                </div>
                <div class="modal-body">
                    <div class="alert alert-danger" role="alert" v-if="add_purchase_error">
                        {{ add_purchase_error }}    
                    </div>
                    <form>
                        <div class="form-group">
                            <label for="foodItem">Title</label>
                            
                            <select class="form-control" id="foodItem" v-model="foodItem.food_id">
                                <option value="0">-- Select Food --</option>
                                <option v-for="(food, index) in foods_sorted_by_title" :key="food.id" :value="food.id">
                                    {{ food.title }}
                                </option>
                                <option value="-1">Red Meat</option>
                                <option value="-2">Dairy</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="dateConsumed">Date Consumed</label>
                            <input type="text" class="form-control" id="dateConsumed" v-model="foodItem.date_consumed">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" @click="addFoodLogItem">Create</button>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="/js/nav.js"></script>
<script>
const { createApp } = Vue;

createApp({
    data() {
        return {
            foods: [],
            foods_sorted_by_title: [],
            food_log: [],
            main_error: '',
            main_msg: '',
            temp_msg: '',
            add_purchase_error: '',
            food_search_title: '',
            food_log_search_title: '',
            foodItem: {
                food_id: 0,
                date_consumed: new Date().toLocaleDateString('en-US') // Default to today's date in mm/dd/yyyy format
            },
        }
    },
    mounted() {
        this.loadFoodSensitivities();
        this.loadFoodLog();

        //this.clickFoodHistoryTab();

        // Initialize Bootstrap date picker
        $('#dateConsumed').datepicker({
            format: 'mm/dd/yyyy', // Change format to mm/dd/yyyy
            autoclose: true
        }).on('changeDate', (e) => {
            // Use arrow function to ensure 'this' refers to the Vue instance
            this.foodItem.date_consumed = e.format('mm/dd/yyyy');
        });
    },
    methods: {
        clickFoodHistoryTab() {
            const foodHistoryTab = document.getElementById('foodHistoryTab');
            if (foodHistoryTab) {
                foodHistoryTab.click();
            } else {
                console.error('Element with ID "foodHistoryTab" not found.');
            }
        },
        async loadFoodSensitivities() {
            try {
                const response = await axios.get('/api/loadFoodSensitivities.php?title=' + encodeURIComponent(this.food_search_title));
                if (response.data && response.data.items) {
                    this.foods = response.data.items;
                    this.foods_sorted_by_title = [...this.foods].sort((a, b) => a.title.localeCompare(b.title));
                    //console.log(this.foods);
                }
            } catch (error) {
                console.error('Error loading upcoming pay dates:', error);  
            }
        },
        async loadFoodLog() {
            try {
                const response = await axios.get('/api/loadFoodLog.php?title=' + encodeURIComponent(this.food_log_search_title));
                if (response.data && response.data.items) {
                    this.food_log = response.data.items;
                    console.log(this.food_log);
                }
            } catch (error) {
                console.error('Error loading upcoming pay dates:', error);  
            }
        },
        async addFoodLogItem() {
            // Handle adding the purchase here
            try {
                const response = await axios.post(`/api/addFoodLogItem.php?food_id=` + encodeURIComponent(this.foodItem.food_id) + `&consumed_date=` + encodeURIComponent(this.foodItem.date_consumed));
                
                /*/
                if (response.data && response.data.error) {
                    
                    return;
                }
                //*/
                if (response.data && response.data.item) {
                    this.loadFoodLog();
                    $('#FoodLogItemModal').modal('hide');
                }
            } catch (error) {
                console.error('Error adding purchase:', error);
            }
        }, 
        async removeFoodLogItem(foodId) {
            try {
                const response = await axios.post(`/api/removeFoodLogItem.php?food_id=` + encodeURIComponent(foodId));
                
                /*/
                if (response.data && response.data.error) {
                    
                    return;
                }
                //*/
                if (response.data && response.data.success) {
                    this.loadFoodLog();
                }
            } catch (error) {
                console.error('Error adding purchase:', error);
            }
        },
        openFoodLogItemModal(payPeriodId, index) {
            /*this.newPurchase = {
                title: '',
            };*/
            // Open modal using jQuery (Bootstrap 3 requirement)
            $('#FoodLogItemModal').modal('show');
        }, 
    }
}).mount('#app');
</script>
</body>
</html>
