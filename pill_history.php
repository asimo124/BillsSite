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
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Pill History</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
<main role="main" class="container main_content">
    <h1 class="mt-5">Pills Taken</h1>

    <?php foreach ($DaysArr as $week => $days) : ?>
        <div class="row">
            <?php if ($week == 0) : ?>
                <h2>Two Weeks Ago</h2>
            <?php elseif ($week == 1): ?>
                <h2>Past Week</h2>
            <?php else : ?>
                <h2>Current Week</h2>
            <?php endif; ?>
            <div style="clear: both; width: 100%; height: 22px;" ></div>
            <?php foreach ($days as $date => $getDay) : ?>
            <div class="day_cards">
                <?php echo ($getDay->month) ? $getDay->month . " " : ""; ?><?php echo $getDay->day; ?>
                <div style="clear: both; height: 7px;" ></div>

                <?php if ($week < 2 || date("j", strtotime($date)) <= 18) : ?>
                    <?php if ($getDay->metformin || 1 == 1) : ?>
                        <a href="javascript:void(0);" class="btn btn-ion">Metformin</a>
                        <div style="clear: both; height: 7px;" ></div>
                    <?php endif; ?>
                    <?php if ($getDay->diaplex || 1 == 1) : ?>
                        <a href="javascript:void(0);" class="btn btn-ion2">Diaplex</a>
                        <div style="clear: both; height: 7px;" ></div>
                    <?php endif; ?>
                    <?php if ($getDay->multivitamin || 1 == 1) : ?>
                        <a href="javascript:void(0);" class="btn btn-ion3">Multivitamin</a>
                        <div style="clear: both; height: 7px;" ></div>
                    <?php endif; ?>
                    <?php if ($getDay->vitamin_d || 1 == 1) : ?>
                        <a href="javascript:void(0);" class="btn btn-ion4">Vitamin D</a>
                        <div style="clear: both; height: 7px;" ></div>
                    <?php endif; ?>
                    <?php if ($getDay->b12 || 1 == 1) : ?>
                        <a href="javascript:void(0);" class="btn btn-ion5">B12</a>
                        <div style="clear: both; height: 7px;" ></div>
                    <?php endif; ?>
                    <?php if ($getDay->b12_complex || 1 == 1) : ?>
                        <a href="javascript:void(0);" class="btn btn-ion6">B Complex</a>
                        <div style="clear: both; height: 7px;" ></div>
                    <?php endif; ?>
                <?php endif; ?>
            </div>
            <?php endforeach; ?>
            <div style="clear: both; width: 100%; height: 22px;" ></div>
        </div>
    <?php endforeach; ?>
</main>

<footer class="footer">
    <div class="container">
        <span class="text-muted"></span>
    </div>
</footer>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>