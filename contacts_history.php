<?php
include "inc/includes.php";

$ch = curl_init();
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_URL,"http://alexhawley-api.info/api/contacts_history/get_history.php");
$DaysArr = json_decode(curl_exec($ch));
curl_close($ch);
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Items Used History</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="/css/fs-modal.min.css" rel="stylesheet">

    <link rel="stylesheet" href="/css/pills_style.css" />
</head>
<body>
<header>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-ion">
        <a class="navbar-brand" href="#">Items Used Tracker</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </nav>
</header>

<!-- Begin page content -->
<div class="container-fluid main_content">
    <div class="row">
        <h1 class="mt-5">Items Used Tracker</h1>
    </div>
    <div class="event_types_content">

    </div>
</div>

<footer class="footer">
    <div class="container">
        <span class="text-muted"></span>
    </div>
</footer>

<div class="modal " id="addEventTypeModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Choose Item</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <label for="add_event_taken" >Which item did you use?</label>
                <select name="add_event_type" class="form-control" id="add_event_type">
                </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnAddEventType" >Add</button>
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

    function loadAllItemData() {
        function loadContactDates() {
            return $.ajax({
                url: 'http://alexhawley-api.info/items-used/history',
                dataType: 'json',
                type: 'GET',
                processData: false
            });
        };
        function loadEventTypes() {
            return $.ajax({
                url: 'http://alexhawley-api.info/event-types/show',
                dataType: 'json',
                type: 'GET',
                processData: false
            });
        }
        $.when(loadContactDates(), loadEventTypes()).done(function (data, event_types) {

            var weekNames = data[0].week_names;
            var data = data[0].days;
            var event_types = event_types[0];

            console.log("event_types: ", event_types);

            var output = "";
            $.each(data, function (index, days) {

                output += '<div class="row">';
                if (index == 0) {
                    output += '<h2>Five Weeks Ago</h2>';
                } else if (index == 1) {
                    output += '<h2>Four Weeks Ago</h2>';
                } else if (index == 2) {
                    output += '<h2>Three Weeks Ago</h2>';
                } else if (index == 3) {
                    output += '<h2>Last Week</h2>';
                } else {
                    output += '<h2>Current Week</h2>';
                }
                output += '<div style="clear: both; width: 100%; height: 22px;" ></div>';

                $.each(days, function (curDate, day) {
                    output += '<div class="col-4 col-sm-3 col-md day_cards mt-1" data-date="' + curDate + '">';
                    output += day.day_text;
                    output += '<div style="clear: both; height: 25px;" ></div>';
                    var i = 1;
                    $.each(day.items_used, function (index, item) {
                        var j = String(item.event_type_id);
                        if (j == "1") {
                            j = "";
                        }
                        if (item.was_used == 1) {
                            output += '<a href="javascript:void(0);" class="btn btn-ion' + j + ' delete_item" data-date="' + curDate + '" data-event-type-id="' + item.event_type_id + '" >' + item.event_type + '</a>';
                            output += '<div style="clear: both; height: 7px;" ></div>'
                        }
                    })
                    output += '</div>';
                });
                output += '</div>';
                output += '<div style="clear: both; width: 100%; height: 22px;" ></div>';
            });
            $('.event_types_content').html(output);
            var event_types_dropdown_str = "";
            $.each(event_types, function (index, item) {
                event_types_dropdown_str += '<option value="' + item.id + '">' + item.event_type + '</option>' + "\n";
            });
            $('#add_event_type').html(event_types_dropdown_str);
        });
        loadContactDates().fail(function(error) {
            console.log(error);
        });
        loadEventTypes().fail(function(error) {
            console.log(error);
        });
    };
    loadAllItemData();

    window.didClickPill = false;
    window.curDate = "";
    $(document).on('click touchstart', '.day_cards', function() {
        window.curDate = $(this).attr("data-date");
        setTimeout(function() {
            if (window.didClickPill == false) {
                $("#addEventTypeModal").modal();
            }
        }, 650);
    })

    $('#btnAddEventType').click(function() {
        var add_event_type = $('#add_event_type').val();
        $.post("http://alexhawley-api.info/items-used/add", {
            cur_date: window.curDate,
            event_type: add_event_type
        }).done(function (data) {
            $("#addEventTypeModal").modal('hide');
            loadAllItemData();
        });
    })

    $(document).on('click', '.delete_item', function (e) {

        window.didClickPill = true;
        e.stopPropagation();
        e.preventDefault();
        var curDate2 = $(this).attr("data-date");
        var event_type_id = $(this).attr("data-event-type-id");
        $.post("http://alexhawley-api.info/items-used/delete", {
            cur_date: curDate2,
            event_type: event_type_id
        }).done(function (data) {
            console.log("data: ", data);
            loadAllItemData();
            setTimeout(function() {
                window.didClickPill = false;
            }, 1250);
        });
    });
})

</script>
</html>