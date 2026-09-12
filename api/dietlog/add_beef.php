<?php

include '../../inc/includes.php';
include __DIR__ . '/../dietlog_inc.php';

dietlog_require_user();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    dietlog_json_exit(array('success' => false, 'error' => 'Method not allowed'), 405);
}

dietlog_add_food_with_default(60);

dietlog_json_exit(array(
    'success' => true,
    'message' => 'Beef added.',
));
