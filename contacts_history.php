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
    <div class="contacts_content">

    </div>
</div>

<footer class="footer">
    <div class="container">
        <span class="text-muted"></span>
    </div>
</footer>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="/js/fs-modal-min.js"></script>
<script>

$(document).ready(function() {

    var loadContactDates = function() {

        $.ajax({
            url: 'http://alexhawley-api.info/api/contacts_history/get_history.php',
            dataType: 'json',
            type: 'GET',
            processData: false,
            success: function (data, textStatus, jQxhr) {

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

                        output += '<div class="day_cards" data-date="' + curDate + '">';
                        output += ((day.month) ? day.month + '&nbsp;' : '') + day.day;
                        output += '<div style="clear: both; height: 25px;" ></div>';

                        if (day.did_replace == 1) {
                            output += '<a href="javascript:void(0);" class="btn btn-ion3 delete_contact" data-date="' + curDate + '">Replaced Contacts</a>';
                            output += '<div style="clear: both; height: 7px;" ></div>'
                        }
                        output += '</div>';
                    });
                    output += '</div>';
                    output += '<div style="clear: both; width: 100%; height: 22px;" ></div>';
                });
                $('.contacts_content').html(output);
            },
            error: function (jqXhr, textStatus, errorThrown) {
                console.log(errorThrown);
            }
        });
    };

    loadContactDates();

    window.didClickPill = false;
    window.curDate = "";
    $(document).on('click touchstart', '.day_cards', function() {

        window.curDate = $(this).attr("data-date");
        $.post("http://alexhawley-api.info/api/contacts_history/add_contact_replaced.php", {
            cur_date: window.curDate,
            contacts_replaced: 1
        }).done(function (data) {
            loadContactDates();
        });
    })


    $('#btnAddPillTaken').click(function() {

        console.log("curDate: ", window.curDate);


    })

    $(document).on('click', '.delete_contact', function (e) {

        e.stopPropagation();
        e.preventDefault();
        var curDate2 = $(this).attr("data-date");
        $.post("http://alexhawley-api.info/api/contacts_history/delete_contact_replaced.php", {
            cur_date: curDate2,
            contact_delete: 1
        }).done(function (data) {
            console.log("data: ", data);
            loadContactDates();
        });
    });
})

</script>
</html>