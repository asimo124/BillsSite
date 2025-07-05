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
                <div class="col-xs-4" style="text-align: right;"><button id="prev_btn" class="btn btn-default"><</button></div>
                <div class="col-xs-4" style="text-align: center;"><h4 id="title_date">June 15th, 2025</h4></div>
                <div class="col-xs-4" style="text-align: left;"><button id="next_btn" class="btn btn-default">></button></div>
            </div>
        </div>
    </div>

    <div style="clear: both; height: 16px;"></div>
    <div class="row">
        <div class="col-xs-9">
            <label for="init_balance" class="control-label">Initial Balance:</label><br>
            <input type="text" class="form-control" placeholder="Initial Balance" id="init_balance" style="width: 200px; display: inline-block;" />
            &nbsp;<button type="button" class="btn btn-default" id="check_balance">Check</button>
        </div>
        <div class="col-xs-3">
            <input type="checkbox" id="test_mode" value="1" /> Test
        </div>
    </div>
    <div style="clear: both; height: 16px;"></div>

    <div class="row">
        <div class="col-xs-2">
            <label for="" class="control-label">$30 Day</label><br>
            <input type="text" class="form-control" placeholder="" style="width: 50%; display: inline-block;" readonly id="day30" value="" />
            &nbsp;<button type="button" class="btn btn-default add_sum_item" data-day="30">+</button>
        </div>
        <div class="col-xs-2">
            <label for="" class="control-label">$35 Day</label><br>
            <input type="text" class="form-control" placeholder="" style="width: 50%; display: inline-block;" readonly id="day35" value="" />
            &nbsp;<button type="button" class="btn btn-default add_sum_item" data-day="35">+</button>
        </div>
        <div class="col-xs-2">
            <label for="" class="control-label">$40 Day</label><br>
            <input type="text" class="form-control" placeholder="" style="width: 50%; display: inline-block;" readonly id="day40" value="" />
            &nbsp;<button type="button" class="btn btn-default add_sum_item" data-day="40">+</button>
        </div>
        <div class="col-xs-2">
            <label for="" class="control-label">$45 Day</label><br>
            <input type="text" class="form-control" placeholder="" style="width: 50%; display: inline-block;" readonly id="day45" value="" />
            &nbsp;<button type="button" class="btn btn-default add_sum_item" data-day="45">+</button>
        </div>
        <div class="col-xs-2">
            <label for="" class="control-label">$50 Day</label><br>
            <input type="text" class="form-control" placeholder="" style="width: 50%; display: inline-block;" readonly id="day50" value="" />
            &nbsp;<button type="button" class="btn btn-default add_sum_item" data-day="50">+</button>
        </div>
    </div>

    <div style="clear: both; height: 16px"></div>

    <style type="text/css">

    </style>

    <div class="row">
        <div class="col-xs-4 totals_content">
            <h5>Totals</h5>

        </div>
        <div class="col-xs-4 averages_content">
            <h5>Sums</h5>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12">
            <input type="text" value="" style="width: 200px;" class="form-control" id="sum_total" value="1000" placeholder="Total" />
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

        var defaultBalance = 3445;

        var daysCount = 0;

        var sumItems = [];

        var testMode = 0;

        var initBalance = localStorage.getItem('initBalance');
        if (!initBalance) {
            $('#init_balance').val(defaultBalance);
        } else {
            $('#init_balance').val(initBalance);
        }

        $('#init_balance').change(function() {
            var initBalance = $(this).val();
            localStorage.setItem('initBalance', initBalance);
            console.log('Initial Balance set to: ', initBalance);
        })

        $('#next_btn').click(function() {
            loadPage('next');
        })
        $('#prev_btn').click(function() {
            console.log('prev');
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

        $('.add_sum_item').click(function() {
            var day = $(this).data('day');
            var amount = parseFloat($('#day' + day).val());
            sumItems.push(amount);
            index = sumItems.length - 1;
            $('.totals_content').append('<div class="sum-item-holder" data-index="' + index + '"><input type="text" ' +
                'class="sum_item" data-index="' + index + '" value="' + amount + '" ' +
                'style="width: 150px;" class="form-control" />&nbsp;<button type="text" ' +
                'class="remove_sum_item" data-index="' + index + '">X</button><div style="clear: both; height: 8px;"></div></div>');

            var sumAmount = 0;
            sumItems.forEach(function(item) {
                sumAmount += item;
            })
            $('#sum_total').val(sumAmount);
            calcAverages();
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
            var t = 1;
            totalEach = 0;
            sumItems.forEach(function(item) {

                var avg2 = 0;
                totalEach += item;
                if (t > 1) {
                    avg2 = Math.round(totalEach / 2, 2);
                }

                if (t == 1) {

                    $('.averages_content').append('<div class="avg-item-holder" data-index="' + i + '">' +
                        '<input type="text" class="both_avg_item" data-index="' + t + '" ' +
                        'value="" style="width: 150px; visibility: hidden;" class="form-control" />&nbsp;<button type="text" ' +
                        'class="remove_avg_item" data-index="' + t + '" style="visibility: hidden">X</button>' +
                        '<div style="clear: both; height: 8px;"></div></div>');
                } else {
                    $('.averages_content').append('<div class="avg-item-holder" data-index="' + i + '">' +
                        '<input type="text" class="both_avg_item" data-index="' + t + '" ' +
                        'value="' + avg2 + '" style="width: 150px;" class="form-control" />&nbsp;<button type="text" ' +
                        'class="remove_avg_item" data-index="' + t + '" style="visibility: hidden;">X</button><div style="clear: ' +
                        'both; height: 8px;"></div></div');
                }

                if (t == 1) {
                    t += 1;
                } else {
                    totalEach = 0;
                    t = 1;
                }
                i += 1;
            })
        }

        var payDate = new Date();

        var loadPage = function(action) {

            var date2 = parseInt(payDate.getDate());
            if (date2 >= 15) {
                payDate.setDate(15);
            } else {
                payDate.setDate(1);
            }
            var date2 = parseInt(payDate.getDate());

            if (action == 'next') {
                if (date2 == 15) {
                    payDate.setDate(1);
                    payDate.setMonth(payDate.getMonth() + 1);
                } else {
                    payDate.setDate(15);
                }
            } else if (action == 'prev') {
                console.log('date2: ', date2);
                if (date2 == 15) {
                    payDate.setDate(1);
                } else {
                    payDate.setDate(15);
                    payDate.setMonth(payDate.getMonth() - 1);
                }
            }

            var payDateStr = payDate.toLocaleDateString();

            titleDateStr = payDate.toLocaleDateString('en-US', {
                month: 'long',
                day: 'numeric',
                year: 'numeric'
            });

            $("#title_date").text(titleDateStr);

            getExpenseDays(payDateStr);
        }

        var calcDisposable = function(disposableDay) {
            return balance - (disposableDay * daysCount);
        }

        var getExpenseDays = function(payDateStr) {

            var curBalance = $('#init_balance').val();

            $.ajax({
                url: "/api/loadBillDates2.php?user_id=1&pay_date=" + payDateStr + "&current_balance=" + curBalance + "&test_mode=" + testMode,
                type: "GET",
                dataType: "json",
                success: function(response) {
                    console.log("Data received:", response);
                    if (response && response.results.length > 0) {

                        daysCount = 0;
                        response.results.forEach(function(item) {

                            item.days.forEach(function (day) {
                                balance = day.Balance
                                if (day.Timestamp != 0) {
                                    daysCount += 1;
                                }
                            })
                        });

                        console.log("daysCount: ", daysCount);

                        days = [30, 35, 40, 45, 50];
                        days.forEach(function(day) {
                            $('#day' + day).val(calcDisposable(day));
                        });

                        console.log("Balance: ", balance);

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