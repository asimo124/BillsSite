<?php
include "../../inc/includes.php";
include "../../inc/api_auth.php";
include "../../inc/app_settings.php";

api_handle_preflight();
require_api_auth_or_session();
apply_app_test_mode_db();

$body = api_read_json_body();
$params = array_merge($_REQUEST, $body);

$frequencyArr = array(
    "Every 1 Week",
    "Every 2 Weeks",
    "Every 4 Weeks",
    "Once Per Month - Day of Month",
    "Once Per Month - Starting From",
    "Every 3 Months",
    "Once",
);

$vndBill = isset($params['vnd_bill2']) ? trim($params['vnd_bill2']) : '';
$vndBillLike = $vndBill !== '' ? '%' . str_replace('%', '', $vndBill) . '%' : '';
$sort1 = isset($params['sort1']) ? $params['sort1'] : 'bill';
$sort1_dir = (isset($params['sort1_dir']) && strtoupper($params['sort1_dir']) === 'DESC') ? 'DESC' : 'ASC';
$sort2 = isset($params['sort2']) ? $params['sort2'] : '';
$sort2_dir = (isset($params['sort2_dir']) && strtoupper($params['sort2_dir']) === 'DESC') ? 'DESC' : 'ASC';
$showAuditFields = isset($params['showAuditFields']) ? intval($params['showAuditFields']) : 0;
$multiplierGreaterThan1 = isset($params['multiplierGreaterThan1']) ? intval($params['multiplierGreaterThan1']) : 0;

$allFrequencies = array(
    "Every 1 Week" => 1,
    "Every 2 Weeks" => 1,
    "Every 4 Weeks" => 1,
    "Once Per Month - Day of Month" => 1,
    "Once Per Month - Starting From" => 1,
    "Every 3 Months" => 1,
    "Once" => 1,
);

$frequencyShow = $allFrequencies;
if (isset($params['frequency']) && is_array($params['frequency'])) {
    $frequencyShow = array();
    foreach ($allFrequencies as $freq => $_) {
        $frequencyShow[$freq] = !empty($params['frequency'][$freq]) ? 1 : 0;
    }
}

function bills_admin_order_by($sort1, $sort1_dir, $sort2, $sort2_dir) {
    $orderBy = '';
    $map = array(
        'frequency' => 'CAST(vnd_frequency_value AS unsigned)',
        'bill' => 'vnd_bill',
        'amount' => 'amount',
        'end_date' => 'end_date',
        'start_date' => 'start_date',
    );

    if ($sort1 && isset($map[$sort1])) {
        $orderBy = 'ORDER BY ' . $map[$sort1] . ' ' . $sort1_dir;
    }
    if ($sort2 && isset($map[$sort2])) {
        if ($orderBy === '') {
            $orderBy = 'ORDER BY ';
        } else {
            $orderBy .= ', ';
        }
        $orderBy .= $map[$sort2] . ' ' . $sort2_dir;
    }
    return $orderBy;
}

$orderBy = bills_admin_order_by($sort1, $sort1_dir, $sort2, $sort2_dir);
$resultset = array();

foreach ($frequencyArr as $getFrequency) {
    if (empty($frequencyShow[$getFrequency])) {
        continue;
    }

    if (strpos($getFrequency, ' - ') === false) {
        $sql = "SELECT vnd_id, vnd_bill, amount, vnd_frequency, vnd_frequency_type, vnd_frequency_value,
                       vnd_frequency_value_original, is_heavy, watch_flag, end_date, audit_regex,
                       audit_keyword1, audit_keyword2, start_date, can_be_multiplied_by
                FROM vnd_bills
                WHERE vnd_frequency = :frequency ";
        $dataParams = array('frequency' => $getFrequency);
        if ($vndBillLike !== '') {
            $sql .= "AND vnd_bill LIKE :vnd_bill ";
            $dataParams['vnd_bill'] = $vndBillLike;
        }
        if ($multiplierGreaterThan1) {
            $sql .= "AND can_be_multiplied_by > 1 ";
        }
        $sql .= $orderBy;
        $items = getQuery($sql, $dataParams);
    } else {
        $parts = explode(' - ', $getFrequency);
        $sql = "SELECT vnd_id, vnd_bill, amount, vnd_frequency, vnd_frequency_type, vnd_frequency_value,
                       vnd_frequency_value_original, is_heavy, watch_flag, end_date, audit_regex,
                       audit_keyword1, audit_keyword2, start_date, can_be_multiplied_by
                FROM vnd_bills
                WHERE vnd_frequency = :frequency
                  AND vnd_frequency_type = :frequency_type ";
        $dataParams = array(
            'frequency' => $parts[0],
            'frequency_type' => $parts[1],
        );
        if ($vndBillLike !== '') {
            $sql .= "AND vnd_bill LIKE :vnd_bill ";
            $dataParams['vnd_bill'] = $vndBillLike;
        }
        if ($multiplierGreaterThan1) {
            $sql .= "AND can_be_multiplied_by > 1 ";
        }
        $sql .= $orderBy;
        $items = getQuery($sql, $dataParams);
    }

    if ($items && count($items) > 0) {
        foreach ($items as &$item) {
            $item['vnd_id'] = intval($item['vnd_id']);
            $item['amount'] = floatval($item['amount']);
            $item['is_heavy'] = intval($item['is_heavy']);
            $item['watch_flag'] = intval($item['watch_flag']);
            $item['can_be_multiplied_by'] = intval($item['can_be_multiplied_by']);
            $item['amount_formatted'] = formatCurrency($item['amount']);
            $item['start_date_display'] = ($item['start_date'] !== '0000-00-00') ? $item['start_date'] : '';
            $item['end_date_display'] = ($item['end_date'] !== '0000-00-00') ? $item['end_date'] : '';
        }
        unset($item);
        $resultset[$getFrequency] = $items;
    }
}

api_json_response(array(
    'groups' => $resultset,
    'filters' => array(
        'vnd_bill2' => $vndBill,
        'sort1' => $sort1,
        'sort1_dir' => $sort1_dir,
        'sort2' => $sort2,
        'sort2_dir' => $sort2_dir,
        'frequency' => $frequencyShow,
        'showAuditFields' => $showAuditFields,
        'multiplierGreaterThan1' => $multiplierGreaterThan1,
    ),
));
