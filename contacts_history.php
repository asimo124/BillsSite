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
    <title>Contacts History</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="/css/fs-modal.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" />

    <link rel="stylesheet" href="/css/pills_style.css" />
</head>
<body>
<header>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-ion">
        <a class="navbar-brand" href="#">Contact Replacement Tracker</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </nav>
</header>

<!-- Begin page content -->
<div class="container-fluid main_content">
    <div class="row">
        <h1 class="mt-5">Contacts Replaced</h1>
    </div>
    <div class="row">
        <div class="col-12 pt-4 pb-4 event_types_content" style="background-color: #fcba03;">
        </div>
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
                url: 'http://alexhawley-api.info/items-used/history-2',
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

                $.each(days, function (curDate, day) {

                    output += '<div class="d-flex justify-content-between align-items-baseline" ' +
                        '       style="padding-right: 5px;">' +
                        '         <div class="p-2 ">' +
                        '              <h4 style="margin-left: 10px;">' + day.new_day_text + '</h4>' +
                                        ((day.isLast) ? '<span id="currentDay" ></span>' : '') +
                        '         </div>\n' +
                        '         <div class="p-2 "><i class="fas fa-plus plus_symbol day_cards" data-date="' + curDate + '"></i></div>\n' +
                        '     </div>\n' +
                        '     <div style="clear: both; height: 0px;"></div>\n' +
                        '     <div class="row">\n' +
                        '         <div class="col-12" style="width: 94%; padding: 0 25px 15px; ">\n' +
                        '             <ul class="list-group" style="">\n';

                    var i = 1;
                    var anyUsed = false;
                    $.each(day.items_used, function (index, item) {
                        var j = String(item.event_type_id);
                        if (j == "1") {
                            j = "";
                        }
                        if (item.was_used) {
                            anyUsed = true;
                            output += '<li class="list-group-item "><a href="javascript: void(0);" ' +
                                'style="text-decoration: none;" class="ion-text' + j + ' ' +
                                'delete_item" data-date="' + curDate + '" ' +
                                'data-event-type-id="' + item.event_type_id + '">' + item.event_type + '</a></li>\n';

                        }
                    })
                    /*if (anyUsed == false) {
                        output += '<li class="list-group-item ">&nbsp;</li>\n';
                    }*/

                    output += '                        </ul>\n' +
                        '                    </div>\n' +
                        '                </div>\n' +
                        '                <div style="clear: both; height: 15px;"></div>';
                });
            });
            $('.event_types_content').html(output);
            var event_types_dropdown_str = "";
            $.each(event_types, function (index, item) {
                event_types_dropdown_str += '<option value="' + item.id + '">' + item.event_type + '</option>' + "\n";
            });
            $('#add_event_type').html(event_types_dropdown_str);
            $(document).scrollTop($("#currentDay").offset().top);
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