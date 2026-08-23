<?php
include "../inc/includes.php";
include "../inc/api_auth.php";

api_handle_preflight();
require_api_auth_or_session();

$sql = "SELECT
        fh.id,
        CASE
            WHEN f.id IS NOT NULL THEN f.title
            ELSE fg.title
        END AS title,
        DATE_FORMAT(fh.consumed_date, '%m/%d/%Y') AS consumed_date,
        CASE
            WHEN f.id IS NOT NULL THEN f.is_inflammation
            ELSE 0
        END AS is_inflammation,
        CASE
            WHEN f.id IS NOT NULL THEN ROUND(f.percentage_towards_inflammation, 2)
            ELSE 30
        END AS percentage_towards_inflammation
        FROM fs_food_history fh
        LEFT JOIN fs_food f
            ON fh.ref_table = 'fs_food'
            AND fh.ref_table_id = f.id
        LEFT JOIN fs_food_general fg
            ON fh.ref_table = 'fs_food_general'
            AND fh.ref_table_id = fg.id
        WHERE 1
        AND (f.id IS NOT NULL OR fg.id IS NOT NULL)
        ORDER BY fh.consumed_date DESC";

$results = getQuery($sql);
if (!$results) {
    $results = array();
}

foreach ($results as $i => $row) {
    $results[$i]['id'] = intval($row['id']);
    $results[$i]['is_inflammation'] = intval($row['is_inflammation']);
}

api_json_response(array(
    'items' => $results,
));
