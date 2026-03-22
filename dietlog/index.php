<?php
    include "../inc/includes.php";

/*/    
if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}
//*/

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

    <h2>Alex's Dietary Log</h2>
    <!-- <div class="alert alert-danger" role="alert" ></div>
    <div class="alert alert-success" role="alert" ></div>
    <div class="alert alert-info" role="alert" ></div> -->

    <div style="clear: both; height: 12px"></div>

    <?php //include "../templates/nav.php"; ?>
    <div style="clear: both; height: 24px"></div>

    <div class="row">
        <div class="col-xs-12">
                

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
    </div>

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
