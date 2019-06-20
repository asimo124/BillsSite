<?php
include "inc/includes.php";

$ch = curl_init();
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_URL,"http://alexhawley-api.info/api/pill_history/get_history.php");
$DaysArr = json_decode(curl_exec($ch));
curl_close($ch);
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Pill History</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="/css/fs-modal.min.css" rel="stylesheet">

    <link rel="stylesheet" href="/css/pills_style.css" />
</head>
<body>
<header>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-ion">
        <a class="navbar-brand" href="#">Pill Tracker</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </nav>
</header>

<!-- Begin page content -->
<div class="container-fluid main_content">
    <div class="row">
        <h1 class="mt-5">Pills Taken</h1>
    </div>
    <div class="pills_content">

    </div>
</div>

<footer class="footer">
    <div class="container">
        <span class="text-muted"></span>
    </div>
</footer>

<!--modal-fullscreen-->
<div class="modal " id="addPillModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Choose Pill Taken</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <label for="add_pill_taken" >Which pill did you take?</label>
                <select name="add_pill_taken" class="form-control" id="add_pill_taken">
                    <option value="metformin">Metformin</option>
                    <option value="diaplex">Diaplex</option>
                    <option value="multivitamin">Multivitamin</option>
                    <option value="vitamin_d">Vitamin D</option>
                    <option value="b12">B12</option>
                    <option value="b122">B12 - 2 Pills</option>
                    <option value="b12_complex">B Complex</option>
                    <option value="b12_complex2">B Complex - 2 Pills</option>
                </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnAddPillTaken" >Add</button>
            </div>
        </div>
    </div>
</div>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="/js/fs-modal-min.js"></script>
<script>

$(document).ready(function() {

    var loadPillDates = function() {

        $.ajax({
            url: 'http://alexhawley-api.info/api/pill_history/get_history.php',
            dataType: 'json',
            type: 'GET',
            processData: false,
            success: function (data, textStatus, jQxhr) {

                var output = "";
                $.each(data, function (index, days) {

                    output += '<div class="row">';
                    if (index == 0) {
                        output += '<h2>Two Weeks Ago</h2>';
                    } else if (index == 1) {
                        output += '<h2>Past Week</h2>';
                    } else {
                        output += '<h2>Current Week</h2>';
                    }
                    output += '<div style="clear: both; width: 100%; height: 22px;" ></div>';
                    $.each(days, function (curDate, day) {

                        output += '<div class="day_cards" data-date="' + curDate + '">';
                        output += ((day.month) ? day.month + '&nbsp;' : '') + day.day_of_week + ' ' + day.day;
                        output += '<div style="clear: both; height: 25px;" ></div>';

                        if (day.metformin == 1) {
                            output += '<a href="javascript:void(0);" class="btn btn-ion delete_pill" data-date="' + curDate + '" data-pill="metformin">Metformin</a>';
                            output += '<div style="clear: both; height: 7px;" ></div>'
                        }
                        if (day.diaplex == 1) {
                            output += '<a href="javascript:void(0);" class="btn btn-ion2 delete_pill" data-date="' + curDate + '" data-pill="diaplex">Diaplex</a>';
                            output += '<div style="clear: both; height: 7px;" ></div>'
                        }
                        if (day.multivitamin == 1) {
                            output += '<a href="javascript:void(0);" class="btn btn-ion3 delete_pill" data-date="' + curDate + '" data-pill="multivitamin">Multivitamin</a>';
                            output += '<div style="clear: both; height: 7px;" ></div>'
                        }
                        if (day.vitamin_d == 1) {
                            output += '<a href="javascript:void(0);" class="btn btn-ion4 delete_pill" data-date="' + curDate + '" data-pill="vitamin_d">Vitamin D</a>';
                            output += '<div style="clear: both; height: 7px;" ></div>'
                        }
                        if (day.b12 == 1) {
                            output += '<a href="javascript:void(0);" class="btn btn-ion5 delete_pill" data-date="' + curDate + '" data-pill="b12">B12</a>';
                            output += '<div style="clear: both; height: 7px;" ></div>'
                        }
                        if (day.b122 == 1) {
                            output += '<a href="javascript:void(0);" class="btn btn-ion2 delete_pill" data-date="' + curDate + '" data-pill="b122">B12 - 2 Pills</a>';
                            output += '<div style="clear: both; height: 7px;" ></div>'
                        }
                        if (day.b12_complex == 1) {
                            output += '<a href="javascript:void(0);" class="btn btn-ion6 delete_pill" data-date="' + curDate + '" data-pill="b12_complex">B Complex</a>';
                            output += '<div style="clear: both; height: 7px;" ></div>'
                        }
                        if (day.b12_complex2 == 1) {
                            output += '<a href="javascript:void(0);" class="btn btn-ion4 delete_pill" data-date="' + curDate + '" data-pill="b12_complex2">B Complex - 2 Pills</a>';
                            output += '<div style="clear: both; height: 7px;" ></div>'
                        }
                        output += '</div>';
                    });
                    output += '</div>';
                    output += '<div style="clear: both; width: 100%; height: 22px;" ></div>';
                });
                $('.pills_content').html(output);
            },
            error: function (jqXhr, textStatus, errorThrown) {
                console.log(errorThrown);
            }
        });
    };

    loadPillDates();

    window.didClickPill = false;
    window.curDate = "";
    $(document).on('click touchstart', '.day_cards', function() {

        window.curDate = $(this).attr("data-date");
        setTimeout(function() {
            if (window.didClickPill == false) {
                $("#addPillModal").modal();
            }
        }, 650);
    })


    $('#btnAddPillTaken').click(function() {

        console.log("curDate: ", window.curDate);

        var add_pill_taken = $('#add_pill_taken').val();
        $.post("http://alexhawley-api.info/api/pill_history/add_pill_taken.php", {
            cur_date: window.curDate,
            pill_taken: add_pill_taken
        }).done(function (data) {
            $("#addPillModal").modal('hide');
            loadPillDates();
        });
    })

    $(document).on('click', '.delete_pill', function (e) {

        window.didClickPill = true;
        e.stopPropagation();
        e.preventDefault();
        var curDate2 = $(this).attr("data-date");
        var add_pill_taken = $(this).attr("data-pill");
        $.post("http://alexhawley-api.info/api/pill_history/delete_pill_taken.php", {
            cur_date: curDate2,
            pill_taken: add_pill_taken
        }).done(function (data) {
            console.log("data: ", data);
            loadPillDates();
            setTimeout(function() {
                window.didClickPill = false;
            }, 1250);
        });
    });

    var adjustModal = function($modal) {
        var top;
        if ($(window).width() <= 480) {
            if ($modal.hasClass('modal-fullscreen')) {
                if ($modal.height() >= $(window).height()) {
                    top = $(window).scrollTop();
                } else {
                    top = $(window).scrollTop() + ($(window).height() - $modal.height()) / 2;
                }
            } else if ($modal.height() >= $(window).height() - 10) {
                top = $(window).scrollTop() + 10;
            } else {
                top = $(window).scrollTop() + ($(window).height() - $modal.height()) / 2;
            }
        } else {
            top = '50%';
            if ($modal.hasClass('modal-fullscreen')) {
                $modal.stop().animate({
                    marginTop  : -($modal.outerHeight() / 2)
                    , marginLeft : -($modal.outerWidth() / 2)
                    , top        : top
                }, "fast");
                return;
            }
        }
        $modal.stop().animate({ 'top': top }, "fast");
    };

    var show = function() {
        var $modal = $(this);
        adjustModal($modal);
    };

    var checkShow = function() {
        $('.modal').each(function() {
            var $modal = $(this);
            if ($modal.css('display') !== 'block') return;
            adjustModal($modal);
        });
    };

    var modalWindowResize = function() {
        $('.modal').not('.modal-gallery').on('show', show);
        $('.modal-gallery').on('displayed', show);
        checkShow();
    };

    $(modalWindowResize);
    $(window).resize(modalWindowResize);
    $(window).scroll(checkShow);
})

</script>
</html>