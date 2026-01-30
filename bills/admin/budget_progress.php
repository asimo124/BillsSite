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
    <title>Charge Catgories</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <!-- Font Awesome for hamburger icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Font Awesome for hamburger icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="/css/bills_admin.css" />
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h2>Budget Progress</h2>

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 24px"></div>


    <div class="row">
        <div class="col-xs-12 col-md-8 col-md-offset-2">
            <div class="row">
                <div class="col-xs-5" style="text-align: right;">
                    <input type="number" class="form-control" placeholder="Initial Balance" id="init_balance" 
                    style="width: 35%; display: inline-block;" />
                    &nbsp;<button type="button" class="btn btn-default" id="check_balance">+</button>
                    <button id="prev_btn" class="btn btn-default"><</button>
                </div>
                <div class="col-xs-2" style="text-align: center;"><h4 id="title_date">June 15th, 2025</h4></div>
                <input type="hidden" id="date_value" value="06/15" />
                <div class="col-xs-5" style="text-align: left;">
                    <button id="next_btn" class="btn btn-default">></button>
                    &nbsp;<button type="button" class="btn btn-default add_sum_item" data-day="40">+</button>
                    <input type="number" class="form-control" placeholder="" style="width: 35%; display: inline-block;" readonly id="day40" value="" />
                </div>
            </div>
        </div>
    </div>
    <div style="clear: both; height: 16px"></div>

    <div class="row">
        <div class="col-xs-6">
            <input type="number" class="form-control" placeholder="Extra Sum" style="width: 100%" id="extra_sum" value="0" />
        </div>
        <div class="col-xs-6">
            <input type="checkbox" id="test_mode" value="1" /> Test Mode
            &nbsp; <input type="number" id="disposable_per_day" value="40" style="width: 50px;"/> Disposable
            &nbsp; <input type="checkbox" id="remove_15_days" value="1" /> 15 Days
        </div>
    </div>

    <div class="row">
        <div class="col-xs-6 totals_content">
            <h5>Totals</h5>

        </div>
        <div class="col-xs-4 spa_totals_content" style="display: none;">
            <h5>Spa</h5>
        </div>
        <div class="col-xs-6 averages_content">
            <h5>Sums</h5>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-6">
            <input type="number" value="" style="width: 200px;" class="form-control" id="sum_total" value="0" placeholder="Total" />
        </div>
        <div class="col-xs-4" style="display: none;">
            <input type="number" value="" style="width: 200px;" class="form-control" id="sum_spa" value="0" placeholder="Spa Total" />
        </div>
    </div>

    <div style="clear: both; height: 16px"></div>

</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js" ></script>
<script>

    $(document).ready(function() {

        var defaultBalance = 3584;

        var daysCount = 0;

        var count_days_add = 0

        var sumItems = [];

        var spaItems = []

        var dateItems = [];

        var testMode = 0;

        var nextDate = 0;

        var prevDate = 0;

        var spaAmount = 57.50

        var initBalance = localStorage.getItem('initBalance');
        if (!initBalance) {
            $('#init_balance').val(defaultBalance);
        } else {
            $('#init_balance').val(initBalance);
        }

        $('#init_balance').change(function() {
            var initBalance = parseFloat($(this).val()) || 0
            localStorage.setItem('initBalance', initBalance);
        })

        $('#next_btn').click(function() {
            loadPage('next');
        })
        $('#prev_btn').click(function() {
            loadPage('prev');
        })

        $('#check_balance').click(function() {
            loadPage('');
        })

        $('#test_mode').change(function() {
            if ($(this).is(':checked')) {
                testMode = 1;
            } else {
                testMode = 0;
            }
        });

        var calcFinalSums = function() {
            var sumAmount = 0;
            sumItems.forEach(function(item) {
                sumAmount += item;
            })

            var extraSum = parseFloat($('#extra_sum').val()) || 0;
            sumAmount += extraSum;

            $('#sum_total').val(sumAmount);
            calcAverages();
        }

        $('#extra_sum').change(function() {
            calcFinalSums();
        });

        $('.add_sum_item').click(function() {
            var day = $(this).data('day');
            var amount = parseFloat($('#day' + day).val()) || 0;
            sumItems.push(amount);

            eachDate = $('#date_value').val();
            dateItems.push(eachDate);

            index = sumItems.length - 1;
            $('.totals_content').append('<div class="sum-item-holder" data-index="' + index + '"><input type="number" ' +
                'class="sum_item" data-index="' + index + '" value="' + amount + '" ' +
                'style="width: 50%;" class="form-control" />&nbsp;<button type="text" ' +
                'class="remove_sum_item" data-index="' + index + '">X</button><button style="display: none;" type="text" ' +
                'class="save_spa" data-index="' + index + '">></button> ' + eachDate + '<div style="clear: both; height: 8px;"></div></div>');

            $('.spa_totals_content').append('<div class="spa-item-holder" data-index="' + index + '"><input type="number" ' +
                'class="spa_item" data-index="' + index + '" value="" ' +
                'style="width: 150px;" class="form-control" />&nbsp;<button type="text" ' +
                'class="remove_spa_item" data-index="' + index + '"><</button><div style="clear: both; height: 8px;"></div></div>');    

            
            calcFinalSums();
        });

        $('.totals_content').on('click', '.save_spa', function() {
            var index = $(this).data('index');
            var amount = parseFloat($(this).siblings('.sum_item').val()) || 0;
            amount -= spaAmount
            
            
            spaItems = [];
            spaTotal = 0;
            var eachAmount = 0;
            $('.spa_item').each(function(i, obj) {
                var idx = $(this).data('index');
                if (idx == index) {
                    $(this).val(spaAmount);
                    spaItems.push(spaAmount);

                    curVal = parseFloat($('.sum_item[data-index="' + index + '"]').val()) || 0;
                    curVal -= spaAmount;
                    $('.sum_item[data-index="' + index + '"]').val(curVal);
                    sumItems[index] = curVal;

                    spaTotal += spaAmount;
                } else {
                    eachVal = parseFloat($(this).val()) || 0;
                    spaItems.push(eachVal);
                    spaTotal += eachVal;
                }
            });

            
            $('#sum_spa').val(spaTotal);

            calcFinalSums()
        });






        $('.spa_totals_content').on('click', '.remove_spa_item', function() {
            
            var index = $(this).data('index');
            var amount = parseFloat($(this).siblings('.sum_item').val()) || 0;
            amount -= spaAmount
            
            
            spaItems = [];
            spaTotal = 0;
            var eachAmount = 0;
            $('.spa_item').each(function(i, obj) {
                var idx = $(this).data('index');
                if (idx == index) {
                    $(this).val(0);
                    spaItems[index] = 0;

                    curVal = $('.sum_item[data-index="' + index + '"]').val();
                    if (isNaN(curVal)) {
                        curVal = 0;
                    } else {
                        curVal = parseFloat(curVal);
                    }
                    curVal += spaAmount;
                    $('.sum_item[data-index="' + index + '"]').val(curVal);
                    sumItems[index] = curVal;

                    spaTotal += 0;
                } else {
                    eachVal = parseFloat($(this).val()) || 0;
                    spaItems.push(eachVal);
                    spaTotal += eachVal;
                }
            });

            
            $('#sum_spa').val(spaTotal);

            calcFinalSums()
        });




        $('.totals_content').on('click', '.remove_sum_item', function() {

            var index = $(this).data('index');
            sumItems.splice(index, 1);
            $(this).parent('.sum-item-holder').remove();

            var sumAmount = 0;
            sumItems.forEach(function(item) {
                sumAmount += item;
            })
            $('#sum_total').val(sumAmount);
            calcAverages();
        });

        var calcAverages = function() {
            $('.averages_content').html('<h5>Sums</h5>');

            var i = 0;

            firstVal = 0;
            secondVal = 0;
            firstSwitch = true;
            totalEach = 0;
            
            sumItems.forEach(function(item) {

                var avg2 = 0;

                if (firstSwitch) {

                    firstVal = item;

                    $('.averages_content').append('<div class="avg-item-holder" data-index="' + i + '">' +
                        '<input type="number" class="both_avg_item" data-index="' + i + '" ' +
                        'value="" style="width: 125px; visibility: hidden;" class="form-control" />' +
                        '<div style="clear: both; height: 8px;"></div></div>');

                    firstSwitch = false;
                    secondVal = 0;

                } else {

                    secondVal = item;

                    if (firstVal !== 0 && secondVal !== 0) {

                        totalEach = firstVal + secondVal;
                        avg2 = Math.round(totalEach / 2, 2);

                        $('.averages_content').append('<div class="avg-item-holder" data-index="' + i + '">' +
                        '<input type="number" class="both_avg_item" data-index="' + i + '" ' +
                        'value="' + avg2 + '" style="width: 125px;" class="form-control" />&nbsp;<button type="text" ' +
                        'class="remove_avg_item" data-index="' + i + '" style="visibility: hidden;">X</button><div style="clear: ' +
                        'both; height: 8px;"></div></div');

                    } else {

                        $('.averages_content').append('<div class="avg-item-holder" data-index="' + i + '">' +
                        '<input type="number" class="both_avg_item" data-index="' + i + '" ' +
                        'value="" style="width: 150px; visibility: hidden;" class="form-control" />&nbsp;<button type="text" ' +
                        'class="remove_avg_item" data-index="' + i + '" style="visibility: hidden">X</button>' +
                        '<div style="clear: both; height: 8px;"></div></div>');
                    }

                    firstSwitch = true;
                    firstVal = 0;
                    totalEach = 0;

                }

                i += 1;
            })
        }

        var payDate = new Date();
        var payDateStr = payDate.toLocaleDateString();

        var loadPage = function(action) {

            nextDate = 0;
            prevDate = 0;


            var date2 = parseInt(payDate.getDate());

            if (action == 'next') {
                nextDate = 1;
                prevDate = 0;
                /*/
                if (date2 == 15) {
                    payDate.setDate(1);
                    payDate.setMonth(payDate.getMonth() + 1);
                } else {
                    payDate.setDate(15);
                }
                //*/
            } else if (action == 'prev') {
                nextDate = 0
                prevDate = 1;
                /*/
                if (date2 == 15) {
                    payDate.setDate(1);
                } else {
                    payDate.setDate(15);
                    payDate.setMonth(payDate.getMonth() - 1);
                }
                //*/
            }

            //var payDateStr = payDate.toLocaleDateString();

            titleDateStr = payDate.toLocaleDateString('en-US', {
                month: 'long',
                day: 'numeric',
                year: 'numeric'
            });

            $("#title_date").text(titleDateStr);

            $('#date_value').val((payDate.getMonth() + 1) + '/' + payDate.getDate());

            getExpenseDays();
        }

        var calcDisposable = function(disposableDay) {

            disposableDay = parseFloat($('#disposable_per_day').val()) || 0;

            remove15Days = $('#remove_15_days').is(':checked') ? 1 : 0;
            if (remove15Days) {
                daysCount = 15
            }
            console.log('daysCount: ', daysCount);
            console.log('disposableDay: ', disposableDay);
            console.log('totalDisposable: ', disposableDay * daysCount);
            

            return balance - (disposableDay * daysCount);
        }

        var getExpenseDays = function() {

            var curBalance = parseFloat($('#init_balance').val()) || 0;

            $.ajax({
                url: "/api/loadBillDates2.php?user_id=1&pay_date=" + payDateStr + "&current_balance=" + curBalance +
                    "&test_mode=" + testMode + "&includeWeekends=1&next_date=" + nextDate + "&prev_date=" + prevDate,
                type: "GET",
                dataType: "json",
                success: function(response) {
                    if (response && response.results.length > 0) {

                        if (!response.pay_date) {
                            const today = new Date();
                            date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
                            payDateStr = date;
                            payDate = new Date();
                        } else {
                            date = response.pay_date.toLocaleString();
                            payDateStr = date;
                            payDate = new Date(date);
                            nextDate = 0;
                            prevDate = 0;
                        }

                        title_date = payDate.toLocaleDateString('en-US', {
                            month: 'short',
                            day: 'numeric',
                            year: 'numeric'
                        });
                        $('#title_date').text(title_date);  

                        $('#date_value').val((payDate.getMonth() + 1) + '/' + payDate.getDate());

                        var runningTotalBalance = response.curBalance ? response.curBalance : parseFloat($('#init_balance').val()) || 0;

                        let i = 0;
                        
                        daysCount = 0;
                        balance = runningTotalBalance;
                        response.results.forEach(function getWeek(week) {
                            let j = 0;

                            week.days.forEach(function getDay(day) {

                                day.desc.forEach(function getExpense(expense) {

                                    balance -= expense.amount;
                                    
                                });
                                if (day.showAsDay == 1) {
                                    daysCount += 1;
                                }
                                j++;
                            });
                            i++;
                        });
                        count_days_add = response.count_days_add;

                        daysCount += count_days_add;

                        /*/
                        days = [30, 35, 40, 45, 50];
                        days.forEach(function(day) {
                            $('#day' + day).val(calcDisposable(day));
                        });
                        //*/

                        $('#day40').val(calcDisposable(40));


                    } else {

                        balance = 0;
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching data:", error);
                }
            });
        }

        // main process
        loadPage('');

    })
</script>
