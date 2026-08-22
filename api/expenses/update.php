<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    api_json_response(array('message' => 'Method not allowed'), 405);
}

$body = api_read_json_body();
$items = isset($body['items']) && is_array($body['items']) ? $body['items'] : array();

if (count($items) === 0) {
    api_json_response(array('message' => 'No expenses to update'), 400);
}

$queryUpdate = "
UPDATE vnd_bills
SET vnd_frequency_value = :vnd_frequency_value,
    amount = :amount,
    watch_flag = :watch_flag
WHERE vnd_id = :vnd_id
  AND is_future = 1";

$sthUpdate = $db_conn->prepare($queryUpdate);

foreach ($items as $item) {
    $vnd_id = isset($item['vnd_id']) ? intval($item['vnd_id']) : 0;
    if ($vnd_id <= 0) {
        continue;
    }

    $freq_val = isset($item['vnd_frequency_value']) ? trim($item['vnd_frequency_value']) : '';
    if (!validateTags($freq_val)) {
        api_json_response(array('message' => 'You have entered invalid content. Please re-enter'), 400);
    }
    $freq_val = strip_tags($freq_val);

    $sthUpdate->execute(array(
        'vnd_frequency_value' => $freq_val,
        'amount' => isset($item['amount']) ? floatval($item['amount']) : 0,
        'watch_flag' => !empty($item['watch_flag']) ? 1 : 0,
        'vnd_id' => $vnd_id,
    ));
}

api_json_response(array(
    'message' => 'You have updated your Future Expenses.',
));
