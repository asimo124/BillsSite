<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="collapsed navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-9" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
            </button>
            <a href="#" class="navbar-brand">Health & Wellness</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-9">
            <ul class="nav navbar-nav">
                <li class="<?php echo $workout_active; ?>"><a href="../workouts/">Workouts</a></li>
                <li class="<?php echo $meals_active; ?>"><a href="../meals/">Meals</a></li>
                <li class="<?php echo $pills_active; ?>"><a href="../pills/">Pills</a></li>
                <li class="<?php echo $bm_active; ?>"><a href="../bms/">BM's</a></li>
            </ul>
        </div>
    </div>
</nav>