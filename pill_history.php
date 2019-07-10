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
                </select>
                <div style="clear: both; height: 12px"></div>
                <label for="qty" >Qty</label>
                <input type="number" name="qty" class="form-control" id="qty" value="1" />
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
    function loadAllPillData() {
        function loadPillDates() {
            return $.ajax({
                url: 'http://alexhawley-api.info/api/pill_history/get_history.php',
                dataType: 'json',
                type: 'GET',
                processData: false
            });
        };
        function loadPills() {
            return $.ajax({
                url: 'http://alexhawley-api.info/api/pill_history/get_pills.php',
                dataType: 'json',
                type: 'GET',
                processData: false
            });
        }
        $.when(loadPillDates(), loadPills()).done(function (data, data_pills) {
            var data = data[0];
            var data_pills = data_pills[0];
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
                    var i = 1;
                    $.each(day.pills, function (index, item) {
                        var j = String(item.pill_id);
                        if (j == "1") {
                            j = "";
                        }
                        output += '<a href="javascript:void(0);" class="btn btn-ion' + j + ' delete_pill" data-date="' + curDate + '" data-pill-id="' + item.pill_id + '" data-qty="' + item.qty + '">' + item.pill_name + ((item.qty > 1) ? (" - " + item.qty) : "") + '</a>';
                        output += '<div style="clear: both; height: 7px;" ></div>'
                    })
                    output += '</div>';
                });
                output += '</div>';
                output += '<div style="clear: both; width: 100%; height: 22px;" ></div>';
            });
            $('.pills_content').html(output);
            var pills_dropdown_str = "";
            $.each(data_pills, function (index, item) {
                pills_dropdown_str += '<option value="' + item.id + '">' + item.pill_name + '</option>' + "\n";
            });
            $('#add_pill_taken').html(pills_dropdown_str);
        });
        loadPillDates().fail(function(error) {
            console.log(error);
        });
        loadPills().fail(function(error) {
            console.log(error);
        });
    };
    loadAllPillData();

    window.didClickPill = false;
    window.curDate = "";
    $(document).on('click touchstart', '.day_cards', function() {
        window.curDate = $(this).attr("data-date");
        setTimeout(function() {
            console.log("did click pill: ", window.didClickPill);
            if (window.didClickPill == false) {
                $("#addPillModal").modal();
            }
        }, 650);
    });
    $('#btnAddPillTaken').click(function() {
        var add_pill_taken = $('#add_pill_taken').val();
        var qty = $('#qty').val();
        $.post("http://alexhawley-api.info/api/pill_history/add_pill_taken.php", {
            cur_date: window.curDate,
            pill_taken: add_pill_taken,
            qty: qty
        }).done(function (data) {
            $("#addPillModal").modal('hide');
            loadAllPillData();
        });
    })
    $(document).on('click', '.delete_pill', function (e) {
        window.didClickPill = true;
        e.stopPropagation();
        e.preventDefault();
        var curDate2 = $(this).attr("data-date");
        var add_pill_taken = $(this).attr("data-pill-id");
        var qty = $(this).attr("data-qty");
        $.post("http://alexhawley-api.info/api/pill_history/delete_pill_taken.php", {
            cur_date: curDate2,
            pill_taken: add_pill_taken,
            qty: qty
        }).done(function (data) {
            console.log("data: ", data);
            loadAllPillData();
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