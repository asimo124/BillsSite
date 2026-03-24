<?php

include "../inc/includes.php";
include __DIR__ . "/dietlog_inc.php";

dietlog_require_user();

$macros = getQuery("SELECT * FROM dl_macro_type ");
$types = getQuery("SELECT * FROM dl_type ");
$units_of_measure = getQuery("SELECT * FROM dl_unit_of_measure ");
$meals_of_day = getQuery("SELECT * FROM dl_meal_of_day ");

dietlog_json_exit([
    'success' => true,
    'macros' => $macros,
    'types' => $types,
    'units_of_measure' => $units_of_measure,
    'meals_of_day' => $meals_of_day,
]);
