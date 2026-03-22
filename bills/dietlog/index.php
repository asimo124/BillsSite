<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";


if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$sql = "SELECT mt.title as macro_type, t.title as `type`, f.*
        , CONCAT(f.title, ' (', ROUND(f.default_amount, 2), ' ', u.title, ')') as title_display 
        FROM dl_food f 
        INNER JOIN dl_macro_type mt 
            ON f.macro_type_id = mt.id 
        LEFT JOIN dl_type t 
            oN f.type_id = t.id 
        INNER JOIN dl_unit_of_measure u
            ON f.unit_of_measure_id = u.id 
        WHERE 1 
        ORDER BY mt.id
        , f.title ";

$foods = getQuery($sql);

$foodsArr = [];
foreach ($foods as $getItem) {
    $macroType = $getItem['macro_type'];    

    if (!isset($foodsArr[$macroType])) {
        $foodsArr[$macroType] = [];
    }
    $foodsArr[$macroType][] = $getItem;
}

$sql = "SELECT md.title as meal_of_day
        , fl.id as log_id 
        , f.title as food
        , mt.title as macro_type 
        , fl.date_consumed 
        , f.is_soluble_fiber
        , f.is_cruciferous
        , uom.title as unit_of_measure
        , CONCAT(CAST(fl.amount AS VARCHAR(255)), ' ', uom.title) as amount
        , CONCAT(CAST(ROUND(
            CASE 
                WHEN uom.title = 'cups'        THEN fl.amount * 236.588
                WHEN uom.title = 'ounces'      THEN fl.amount * 28.3495
                WHEN uom.title = 'teaspoons'   THEN fl.amount * 4.92892
                WHEN uom.title = 'tablespoons' THEN fl.amount * 14.7868
                WHEN uom.title = 'grams'       THEN fl.amount
            END
        , 2) AS VARCHAR(255)), ' g') as amount_grams 
        , CONCAT(CAST(ROUND(fl.amount * f.percent_fiber, 2) AS VARCHAR(255)), ' ', uom.title) as fiber_amount 
        , CONCAT(CAST(ROUND(fl.amount * f.percent_fiber * f.percent_soluble_fiber, 2) AS VARCHAR(255)), ' ', uom.title) as soluble_fiber_amount
        , CONCAT(CAST(ROUND(
            CASE 
                WHEN uom.title = 'cups'        THEN fl.amount * f.percent_fiber * 236.588
                WHEN uom.title = 'ounces'      THEN fl.amount * f.percent_fiber * 28.3495
                WHEN uom.title = 'teaspoons'   THEN fl.amount * f.percent_fiber * 4.92892
                WHEN uom.title = 'tablespoons' THEN fl.amount * f.percent_fiber * 14.7868
                WHEN uom.title = 'grams'       THEN fl.amount * f.percent_fiber
            END
        , 2) AS VARCHAR(255)), ' g') as fiber_amount_grams
        , CONCAT(CAST(ROUND(
            CASE 
                WHEN uom.title = 'cups'        THEN fl.amount * f.percent_fiber * f.percent_soluble_fiber * 236.588
                WHEN uom.title = 'ounces'      THEN fl.amount * f.percent_fiber * f.percent_soluble_fiber * 28.3495
                WHEN uom.title = 'teaspoons'   THEN fl.amount * f.percent_fiber * f.percent_soluble_fiber * 4.92892
                WHEN uom.title = 'tablespoons' THEN fl.amount * f.percent_fiber * f.percent_soluble_fiber * 14.7868
                WHEN uom.title = 'grams'       THEN fl.amount * f.percent_fiber * f.percent_soluble_fiber
            END
        , 2) AS VARCHAR(255)), ' g') as soluble_fiber_amount_grams
        FROM dl_food_log fl 
        INNER JOIN dl_food f 
            ON fl.food_id = f.id 
        INNER JOIN dl_macro_type mt 
            ON f.macro_type_id = mt.id 
        INNER JOIN dl_meal_of_day md 
            ON fl.meal_of_day_id = md.id 
        INNER JOIN dl_unit_of_measure uom 
            ON f.unit_of_measure_id = uom.id 
        WHERE 1 
        ORDER BY md.id, mt.id, f.title ";

$foodsLog = getQuery($sql);


$foodsLogArr = [];
foreach ($foodsLog as $foodLogItem) {
    $dateConsumed = $foodLogItem['date_consumed'];    

    $fiberGrams = floatval(str_replace(" g", "", $foodLogItem['fiber_amount_grams']));
    $solubleFiberGrams = floatval(str_replace(" g", "", $foodLogItem['soluble_fiber_amount_grams']));

    if (!isset($foodsLogArr[$dateConsumed])) {
        $foodsLogArr[$dateConsumed] = [
            'total_fiber' => 0,
            'total_soluble_fiber' => 0,
            'total_percent_soluble' => 0,
            'items' => []
        ];
    }
    $foodsLogArr[$dateConsumed]['total_fiber'] += $fiberGrams;
    $foodsLogArr[$dateConsumed]['total_soluble_fiber'] += $solubleFiberGrams;
    if ($foodsLogArr[$dateConsumed]['total_fiber'] == 0) {
        $foodsLogArr[$dateConsumed]['total_percent_soluble'] = 0;
    } else {
        $foodsLogArr[$dateConsumed]['total_percent_soluble'] = strval(round($foodsLogArr[$dateConsumed]['total_soluble_fiber'] 
            / $foodsLogArr[$dateConsumed]['total_fiber'], 4) * 100) . "%";
    }
    $foodsLogArr[$dateConsumed]['items'][] = $foodLogItem;
}

$sql = "SELECT * FROM dl_macro_type ";
$macros = getQuery($sql);

$sql = "SELECT * FROM dl_type ";
$types = getQuery($sql);

$sql = "SELECT * FROM dl_unit_of_measure ";
$units_of_measure = getQuery($sql);

$sql = "SELECT * FROM dl_meal_of_day ";
$meals_of_day = getQuery($sql);


?>
<!DOCTYPE html>
<html>
<head>
    <title>Dietary Log</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
     <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Font Awesome for hamburger icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="/css/bills_admin.css" />
    <link rel="stylesheet" href="/css/income_purchases.css?version=1" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
</head>
<body>


<!-- id="app" -->
<div class="container" >


    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h2>Dietary Log</h2>
    <!-- <div class="alert alert-danger" role="alert" ></div>
    <div class="alert alert-success" role="alert" ></div>
    <div class="alert alert-info" role="alert" ></div> -->

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 24px"></div>

    <div class="row">
        <div class="col-xs-12">
            <!-- Sub-navigation tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active">
                    <a href="#foodHistory" aria-controls="foodHistory" role="tab" data-toggle="tab">Log</a>
                </li>
                <li role="presentation" >
                    <a href="#foodList" aria-controls="foodList" role="tab" data-toggle="tab" id="foodHistoryTab">Foods</a>
                </li>
                
                
            </ul>

            <!-- Tab panes -->
            <div class="tab-content" style="margin-top: 20px;">

                <div role="tabpanel" class="tab-pane active" id="foodHistory">
                    
                    <h3>Dietary Log</h3>

                    <div class="row">
                        <div class="col-xs-6">
                            <button class="btn btn-primary" id="log_food_consumed_btn">Log Food Consumed</button>
                        </div>
                    </div>
                    <div style="clear: both; height: 16px;"></div>

                    
                    <?php foreach ($foodsLogArr as $dateConsumed => $logItem): ?>
                    <h4>
                        <?php echo date("F j, Y", strtotime($dateConsumed)); ?>
                        <?//= $dateConsumed; ?>
                    </h4>

                    <div class="row">
                        <div class="col-xs-12">
                            <table class="table table-bordered" style="border: 1px solid #666666;">
                                <thead>
                                    <tr>
                                        <th>Meal Of Day</th>
                                        <th>Food </th>
                                        <th>Macro Type</th>
                                        <th>Amount</th>
                                        <th>Amount in Grams</th>
                                        <th>Fiber Amount</th>
                                        <th>Soluble Fiber Amount</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($logItem['items'] as $log): ?>
                                    <tr>
                                        <td><?php echo $log['meal_of_day']; ?></td>
                                        <td><?php echo $log['food']; ?></td>
                                        <td><?php echo $log['macro_type']; ?></td>
                                        <td><?php echo $log['amount']; ?></td>
                                        <td><?php echo $log['amount_grams']; ?></td>
                                        <td><?php echo $log['fiber_amount_grams']; ?></td>
                                        <td><?php echo $log['soluble_fiber_amount_grams']; ?></td>
                                        <td><button class="btn btn-sm btn-danger del_log_item" 
                                            data-id="<?= $log['log_id']; ?>">X</button>
                                        </td>
                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div style="clear: both; height: 8px;"></div>

                    <h4>Total Fiber: <?php echo $logItem['total_fiber']; ?> grams</h4>
                    <h4>Total Soluble Fiber: <?php echo $logItem['total_soluble_fiber']; ?> grams</h4>
                    <h4>Total Percent Soluble: <?php echo $logItem['total_percent_soluble']; ?></h4>

                    <div style="clear: both; height: 24px;"></div>
                    <?php endforeach; ?>
                </div>

                <div role="tabpanel" class="tab-pane" id="foodList">

                    <h3>Foods</h3>

                    <div class="row">
                        <div class="col-xs-6">
                            <button class="btn btn-primary" id="create_food_log_btn">Add Food</button>
                        </div>
                    </div>
                    <div style="clear: both; height: 16px;"></div>

                    <div class="row">
                        <div class="col-xs-12">
                            <table class="table table-bordered" style="border: 1px solid #666666;">
                                <thead>
                                    <tr>
                                        <th>Title </th>
                                        <th>Macro Type</th>
                                        <th>Type</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($foods as $food): ?>
                                        <tr>
                                            <td><?php echo $food['title']; ?></td>
                                            <td><?php echo $food['macro_type']; ?></td>
                                            <td><?php echo $food['type']; ?></td>
                                            <td ><button class="btn btn-sm btn-danger delete_food_item" data-id="<?= $food['id']; ?>">X</button></td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


                
                <!-- <div role="tabpanel" class="tab-pane" id="tabGeneral">
                    <h3>Other</h3>
                    <div class="row">
                        <div class="col-xs-6">
                            <button class="btn btn-primary">Create</button>
                        </div>
                    </div>
                </div> -->
            </div>
        </div>
    </div>

    <!-- Create Item Modal -->
    <div class="modal fade" id="FoodLogItemModal" tabindex="-1" role="dialog" aria-labelledby="FoodLogItemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="FoodLogItemModalLabel">Create Food</h4>
                </div>
                <div class="modal-body">
                    <!-- <div class="alert alert-danger" role="alert" ></div> -->
                    <form action="proc_add_food.php" method="POST" id="foodLogItemForm">
                        <div class="form-group">
                            <label for="dateConsumed">Food Title</label>
                            <input type="text" class="form-control" id="title" name="title" value="">
                        </div>
                        <div class="form-group">
                            <label for="macroType">Macro Type</label>
                            <select class="form-control" name="macro_type_id" id="macroType" >
                                <option value="">-- Select --</option>
                                <?php foreach ($macros as $macro): ?>
                                    <option value="<?php echo $macro['id']; ?>"><?php echo $macro['title']; ?></option> 
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="foodType">Food Type</label>
                            <select class="form-control" name="type_id" id="foodType" >
                                <?php foreach ($types as $type): ?>
                                    <option value="<?php echo $type['id']; ?>" <?=($type['id'] == 1) ? "SELECTED" : ""; ?>><?php echo $type['title']; ?></option> 
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="checkbox" name="is_cruciferous" id="isCruciferous" value="1">&nbsp;
                            <label for="isCruciferous">Is Cruciferous</label>
                        </div>
                        <div class="form-group">
                            <input type="checkbox" name="has_fiber" id="hasFiber" value="1">&nbsp;
                            <label for="hasFiber">Has Fiber</label>
                        </div>
                        <div class="form-group">
                            <label for="percentFiber">Percent Fiber</label>
                            <input type="number" class="form-control" name="percent_fiber" id="percentFiber" value="0" min="0" max="100" step="1">
                        </div>
                         <div class="form-group">
                            <label for="percentSolubleFiber">Percent Soluble Fiber</label>
                            <input type="number" class="form-control" name="percent_soluble_fiber" id="percentSolubleFiber" value="0" min="0" max="100" step="1">
                        </div>
                        <div class="form-group">
                            <label for="unitOfMeasure">Unit Of Measure</label>
                            <select class="form-control" name="unit_of_measure_id" id="unitOfMeasure" >
                                <?php foreach ($units_of_measure as $unit): ?>
                                    <option value="<?php echo $unit['id']; ?>" ><?php echo $unit['title']; ?></option> 
                                <?php endforeach; ?>
                            </select>
                        </div>
                         <div class="form-group">
                            <label for="percentFiber">Default Amount</label>
                            <input type="number" class="form-control" name="default_amount" id="defaultAmount" value="0" min="0" max="50" step="0.5">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" id="save_new_food_log_btn">Create</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Create Item Modal -->
    <div class="modal fade" id="FoodHistoryItemModal" tabindex="-1" role="dialog" aria-labelledby="FoodHistoryItemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="FoodHistoryItemModalLabel">Log Food Consumed</h4>
                </div>
                <div class="modal-body">
                    <!-- <div class="alert alert-danger" role="alert" ></div> -->
                    <form action="proc_add_food_log_item.php" method="POST" id="foodHistoryItemForm">
                        <div class="form-group">
                            <label for="foodId">Food Consumed</label>
                            <select class="form-control" name="food_id" id="foodId" >
                                <option value="">-- Select --</option>
                                <?php foreach ($foodsArr as $macroType => $foods): ?>
                                    <optgroup label="<?php echo $macroType; ?>">
                                        <?php foreach ($foods as $food): ?>
                                            <option value="<?php echo $food['id']; ?>"><?php echo $food['title_display']; ?></option>
                                        <?php endforeach; ?>
                                    </optgroup>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="percentFiber">Amount</label>
                            <input type="number" class="form-control" name="amount" id="amount" value="0" min="0" max="100" step="0.5">
                        </div>
                        <div class="form-group">
                            <label for="dateConsumed">Date Consumed</label>
                            <input type="text" class="form-control" id="date_consumed" name="date_consumed" value="">
                        </div>
                        <div class="form-group">
                            <label for="foodType">Meal of Day</label>
                            <select class="form-control" name="meal_of_day_id" id="mealOfDayId" >
                                <?php foreach ($meals_of_day as $meal): ?>
                                    <option value="<?php echo $meal['id']; ?>" ><?php echo $meal['title']; ?></option> 
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" id="save_food_history_item_btn">Create</button>
                </div>
            </div>
        </div>
    </div>

    <form action="proc_delete_food_log_item.php" method="POST" id="deleteFoodLogItemForm">
        <input type="hidden" name="log_id" id="delete_log_id" value="">
    </form>

     <form action="proc_delete_food.php" method="POST" id="deleteFoodForm">
        <input type="hidden" name="food_id" id="delete_food_id" value="">
    </form>

</div>

<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="/js/nav.js"></script>
<script>

$(document).ready(function() {

    //*/
    $('#create_food_log_btn').click(function() {
        $('#FoodLogItemModal').modal('show');
    });
    //*/

    $('#log_food_consumed_btn').click(function() {
        $('#FoodHistoryItemModal').modal('show');
    })

    //$('#create_food_log_btn').click();

    $('#save_new_food_log_btn').click(function() {
        $('#foodLogItemForm').submit();
    });

    $('#date_consumed').datepicker({
        format: 'yyyy-mm-dd',
        todayHighlight: true,
        autoclose: true
    }).datepicker('setDate', new Date());

     $('#save_food_history_item_btn').click(function() {

        $('#foodHistoryItemForm').submit();
    });

    $('#foodId').change(function() {
        const selectedOption = $(this).find('option:selected');
        const defaultAmountMatch = selectedOption.text().match(/\((\d+(\.\d+)?)\s/);
        if (defaultAmountMatch) {
            $('#amount').val(defaultAmountMatch[1]);
        }
    });

    $('.del_log_item').click(function() {
        var logId = $(this).data('id');
        if (confirm('Are you sure you want to delete this log item?')) {

            console.log('Deleting log item with ID:', logId);
            $('#delete_log_id').val(logId);
            $('#deleteFoodLogItemForm').submit();
        }
    })

    $('.delete_food_item').click(function() {
        var id = $(this).data('id');
        if (confirm('Are you sure you want to delete this food item?')) {
            console.log('Deleting food item with ID: ', id);
            $('#delete_food_id').val(id);
            $('#deleteFoodForm').submit();
        }
    })

    
})


// const { createApp } = Vue;

// createApp({
//     data() {
//         return {
//         }
//     },
//     mounted() {  
//     },
//     methods: {
//         async addFoodGeneralItem() {
//             try {
//                 const response = await axios.post(`/api/addFoodLogGeneralItem.php?title=` + encodeURIComponent(this.foodGeneralCreate.title));
//                 if (response.data && response.data.item) {
//                     this.loadFoodGeneral();
//                     $('#FoodGeneralItemModal').modal('hide');
//                 }
//             } catch (error) {
//                 console.error('Error adding purchase:', error);
//             }
//         },
//         openFoodLogItemModal(payPeriodId, index) {
//             $('#FoodLogItemModal').modal('show');
//         }, 
//     }
// }).mount('#app');
</script>
</body>
</html>
