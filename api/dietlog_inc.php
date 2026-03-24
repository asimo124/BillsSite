<?php
/**
 * Shared helpers for dietlog_*.php API endpoints.
 */

function dietlog_json_exit($data, $httpCode = 200)
{
    http_response_code($httpCode);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($data, JSON_UNESCAPED_UNICODE);
    exit;
}

function dietlog_require_user()
{
    if (!isset($_SESSION['user'])) {
        dietlog_json_exit(['success' => false, 'error' => 'Unauthorized'], 401);
    }
}

function dietlog_sql_foods()
{
    return "SELECT mt.title as macro_type, t.title as `type`, f.*
        , CONCAT(f.title, ' (', ROUND(f.default_amount, 2), ' ', u.title, ')') as title_display
        FROM dl_food f
        INNER JOIN dl_macro_type mt
            ON f.macro_type_id = mt.id
        LEFT JOIN dl_type t
            ON f.type_id = t.id
        INNER JOIN dl_unit_of_measure u
            ON f.unit_of_measure_id = u.id
        WHERE 1
        ORDER BY mt.id
        , f.title ";
}

function dietlog_sql_log_entries()
{
    return "SELECT md.title as meal_of_day
        , fl.id as log_id
        , f.title as food
        , mt.title as macro_type
        , fl.date_consumed
        , f.is_soluble_fiber
        , f.is_cruciferous
        , uom.title as unit_of_measure
        , CONCAT(CAST(fl.amount AS CHAR), ' ', uom.title) as amount
        , CONCAT(CAST(ROUND(
            CASE
                WHEN uom.title = 'cups'        THEN fl.amount * 236.588
                WHEN uom.title = 'ounces'      THEN fl.amount * 28.3495
                WHEN uom.title = 'teaspoons'   THEN fl.amount * 4.92892
                WHEN uom.title = 'tablespoons' THEN fl.amount * 14.7868
                WHEN uom.title = 'grams'       THEN fl.amount
            END
        , 2) AS CHAR), ' g') as amount_grams
        , CONCAT(CAST(ROUND(fl.amount * f.percent_fiber, 2) AS CHAR), ' ', uom.title) as fiber_amount
        , CONCAT(CAST(ROUND(fl.amount * f.percent_fiber * f.percent_soluble_fiber, 2) AS CHAR), ' ', uom.title) as soluble_fiber_amount
        , CONCAT(CAST(ROUND(
            CASE
                WHEN uom.title = 'cups'        THEN fl.amount * f.percent_fiber * 236.588
                WHEN uom.title = 'ounces'      THEN fl.amount * f.percent_fiber * 28.3495
                WHEN uom.title = 'teaspoons'   THEN fl.amount * f.percent_fiber * 4.92892
                WHEN uom.title = 'tablespoons' THEN fl.amount * f.percent_fiber * 14.7868
                WHEN uom.title = 'grams'       THEN fl.amount * f.percent_fiber
            END
        , 2) AS CHAR), ' g') as fiber_amount_grams
        , CONCAT(CAST(ROUND(
            CASE
                WHEN uom.title = 'cups'        THEN fl.amount * f.percent_fiber * f.percent_soluble_fiber * 236.588
                WHEN uom.title = 'ounces'      THEN fl.amount * f.percent_fiber * f.percent_soluble_fiber * 28.3495
                WHEN uom.title = 'teaspoons'   THEN fl.amount * f.percent_fiber * f.percent_soluble_fiber * 4.92892
                WHEN uom.title = 'tablespoons' THEN fl.amount * f.percent_fiber * f.percent_soluble_fiber * 14.7868
                WHEN uom.title = 'grams'       THEN fl.amount * f.percent_fiber * f.percent_soluble_fiber
            END
        , 2) AS CHAR), ' g') as soluble_fiber_amount_grams
        , fl.food_id AS food_id
        , fl.amount AS amount_value
        , fl.meal_of_day_id AS meal_of_day_id
        , DATE(fl.date_consumed) AS date_consumed_date
        FROM dl_food_log fl
        INNER JOIN dl_food f
            ON fl.food_id = f.id
        INNER JOIN dl_macro_type mt
            ON f.macro_type_id = mt.id
        INNER JOIN dl_meal_of_day md
            ON fl.meal_of_day_id = md.id
        INNER JOIN dl_unit_of_measure uom
            ON f.unit_of_measure_id = uom.id
        WHERE 1
        ORDER BY DATE_FORMAT(fl.date_consumed, '%Y-%m-%d') DESC, md.id, mt.id, f.title ";
}

/**
 * @param array<int, array<string, mixed>> $foodsLog
 * @return array<string, array{total_fiber: float, total_soluble_fiber: float, total_percent_soluble: string, items: array}>
 */
function dietlog_aggregate_log_rows($foodsLog)
{
    $foodsLogArr = [];
    foreach ($foodsLog as $foodLogItem) {
        $dateConsumed = date('Y-m-d', strtotime($foodLogItem['date_consumed']));

        $fiberGrams = floatval(str_replace(' g', '', (string) $foodLogItem['fiber_amount_grams']));
        $solubleFiberGrams = floatval(str_replace(' g', '', (string) $foodLogItem['soluble_fiber_amount_grams']));

        if (!isset($foodsLogArr[$dateConsumed])) {
            $foodsLogArr[$dateConsumed] = [
                'total_fiber' => 0.0,
                'total_soluble_fiber' => 0.0,
                'total_percent_soluble' => '0%',
                'items' => [],
            ];
        }
        $foodsLogArr[$dateConsumed]['total_fiber'] += $fiberGrams;
        $foodsLogArr[$dateConsumed]['total_soluble_fiber'] += $solubleFiberGrams;
        $foodsLogArr[$dateConsumed]['items'][] = $foodLogItem;
    }
    foreach ($foodsLogArr as $dateConsumed => &$block) {
        $block['total_fiber'] = round($block['total_fiber'], 2);
        $block['total_soluble_fiber'] = round($block['total_soluble_fiber'], 2);
        if ($block['total_fiber'] == 0) {
            $block['total_percent_soluble'] = '0%';
        } else {
            $block['total_percent_soluble'] = strval(round(
                $block['total_soluble_fiber'] / $block['total_fiber'],
                4
            ) * 100) . '%';
        }
    }
    unset($block);

    return $foodsLogArr;
}

/** Minutes since midnight in America/Chicago (0–1439). */
function dietlog_chicago_minutes_from_midnight()
{
    $tz = new DateTimeZone('America/Chicago');
    $now = new DateTime('now', $tz);
    return ((int) $now->format('G')) * 60 + (int) $now->format('i');
}

/**
 * Logical meal slot from Chicago wall clock.
 * Boundaries: breakfast ≤ 9:30; lunch (9:30, 2:30]; dinner #1 (2:30, 6:00]; dinner #2 (6:00, 7:45]; snack after 7:45.
 */
function dietlog_chicago_meal_slot()
{
    $m = dietlog_chicago_minutes_from_midnight();
    $t930 = 9 * 60 + 30;
    $t230 = 14 * 60 + 30;
    $t600 = 18 * 60;
    $t745 = 19 * 60 + 45;

    if ($m <= $t930) {
        return 'breakfast';
    }
    if ($m <= $t230) {
        return 'lunch';
    }
    if ($m <= $t600) {
        return 'dinner_1';
    }
    if ($m <= $t745) {
        return 'dinner_2';
    }
    return 'snack';
}

/**
 * Map slot to dl_meal_of_day row id using title matching (case/spacing tolerant).
 *
 * @param array<int, array<string, mixed>> $meals
 * @return int|null
 */
function dietlog_resolve_meal_id_for_slot(array $meals, $slot)
{
    $norm = function ($title) {
        return strtolower(trim(preg_replace('/\s+/', ' ', (string) $title)));
    };

    foreach ($meals as $meal) {
        $t = $norm(isset($meal['title']) ? $meal['title'] : '');
        $match = false;
        switch ($slot) {
            case 'breakfast':
                $match = $t === 'breakfast' || strpos($t, 'breakfast') !== false;
                break;
            case 'lunch':
                $match = (strpos($t, 'lunch') !== false && strpos($t, 'dinner') === false);
                break;
            case 'dinner_1':
                $match = (bool) preg_match('/dinner\s*#\s*1\b/', $t)
                    || (bool) preg_match('/dinner\s+1\b/', $t)
                    || $t === 'dinner1'
                    || $t === 'dinner #1';
                break;
            case 'dinner_2':
                $match = (bool) preg_match('/dinner\s*#\s*2\b/', $t)
                    || (bool) preg_match('/dinner\s+2\b/', $t)
                    || $t === 'dinner2'
                    || $t === 'dinner #2';
                break;
            case 'snack':
                $match = strpos($t, 'snack') !== false;
                break;
        }
        if ($match) {
            return (int) $meal['id'];
        }
    }
    return null;
}
