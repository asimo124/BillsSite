<?php
    include "../../inc/includes.php";

// if (!isset($_SESSION['user'])) {
//     header("Location: /login.php");
//     exit;
// }
?>
<!DOCTYPE html>
<html>
<head>
    <title>Charge Catgories</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/css/nav.css" />
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    
    <div class="alert-info" id="message" role="alert" style="display: none"></div>
    <div class="alert-danger" id="error_message" role="alert" style="display: none"></div>
    

    <form class="form-horizontal" id="frmEditBill" action="proc_edit.php?<?= $searchFilersQueryStr ?>" method="post" >
        <fieldset>
            <!-- Form Name -->
            <legend>Weight / Body Fat Percentage Ratio</legend>

            <?php include "../../templates/nav.php"; ?>
            <div style="clear: both; height: 7px"></div>

            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Weight Low Range</label>
                <div class="col-md-4">
                    <input id="weightLowRange" name="weightLowRange" type="text" placeholder="Weight Low Range" class="form-control input-md" value="220" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Weight High Range</label>
                <div class="col-md-4">
                    <input id="weightHighRange" name="weightHighRange" type="text" placeholder="Weight High Range" class="form-control input-md" value="240" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Body Fat Percentage Low Range</label>
                <div class="col-md-4">
                    <input id="bodyFatPercentageLowRange" name="bodyFatPercentageLowRange" type="text" placeholder="Body Fat Percentage Low Range" class="form-control input-md" value="25.5" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Body Fat Percentage High Range</label>
                <div class="col-md-4">
                    <input id="bodyFatPercentageHighRange" name="bodyFatPercentageHighRange" type="text" placeholder="Body Fat Percentage High Range" class="form-control input-md" value="27.1" />
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Weight</label>
                <div class="col-md-4">
                    <input id="weight" name="weight" type="text" placeholder="Weight" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Body Fat Percentage</label>
                <div class="col-md-4">
                    <input id="body_fat_percentage" name="body_fat_percentage" type="text" placeholder="Body Fat Percentage" class="form-control input-md" value="" />
                </div>
            </div>
        </fieldset>
        <a href="javascript:void(0);" id="calc_button" class="btn btn-primary">Calculate</a>
    </form>

</div>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script>
    $( function() {
        
        var weightLowRange = parseFloat($('#weightLowRange').val());
        var weightHighRange = parseFloat($('#weightHighRange').val());

        var bodyFatPercentageLowRange = parseFloat($('#bodyFatPercentageLowRange').val());
        var bodyFatPercentageHighRange = parseFloat($('#bodyFatPercentageHighRange').val());

        showMessage = function(message) {
            $('#message').html(message);
            $('#message').show();
            /*/
            setTimeout(function() {
                $('#message').hide();
            }, 5000);
            //*/
        };

        showErrorMessage = function(message) {
            $('#error_message').html(message);
            $('#error_message').show();
            //*/
            setTimeout(function() {
                $('#error_message').hide();
            }, 5000);
            //*/
        };

        $('#calc_button').on('click', function() {
            var weight = parseFloat($('#weight').val());
            var bodyFatPercentage = parseFloat($('#body_fat_percentage').val());

            if (isNaN(weight) || isNaN(bodyFatPercentage)) {
                showErrorMessage('Please enter valid numbers for weight and body fat percentage.');
                return;
            }

            if (weight > weightHighRange || weight < weightLowRange) {
                showErrorMessage('Weight is out of expected range (' + weightLowRange + ' - ' + weightHighRange + ').');
                return;
            }
            if (bodyFatPercentage > bodyFatPercentageHighRange || bodyFatPercentage < bodyFatPercentageLowRange) {
                showErrorMessage('Body Fat Percentage is out of expected range (' + bodyFatPercentageLowRange + ' - ' + bodyFatPercentageHighRange + ').');
                return;
            }

            weightRange = weightHighRange - weightLowRange;
            bodyFatPercentageRange = bodyFatPercentageHighRange - bodyFatPercentageLowRange;

            weightScore = ((weightHighRange - weight) / weightRange) * 10
            bodyFatPercentageScore = ((bodyFatPercentageHighRange - bodyFatPercentage) / bodyFatPercentageRange) * 10

            showMessage('Weight Score: ' + weightScore.toFixed(1) + 
                '<br/>Body Fat Percentage Score: ' + bodyFatPercentageScore.toFixed(1) + 
                '<br/>Overall Score: ' + (weightScore * bodyFatPercentageScore).toFixed(1)
            );
        }); 

    } );
</script>
<script src="/js/nav.js" ></script>
