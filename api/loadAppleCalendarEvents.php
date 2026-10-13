<?php
include "../inc/includes.php";
include "../inc/api_auth.php";
include "../inc/calendar_events.php";

api_handle_preflight();
require_api_auth_or_session();

$paramsIn = array_merge($_REQUEST, api_read_json_body());

$keywordTitle = isset($paramsIn['keyword_title']) ? trim($paramsIn['keyword_title']) : '';
$keywordBody = isset($paramsIn['keyword_body']) ? trim($paramsIn['keyword_body']) : '';
$keywordLocation = isset($paramsIn['keyword_location']) ? trim($paramsIn['keyword_location']) : '';
$calendarName = isset($paramsIn['calendar_name']) ? trim($paramsIn['calendar_name']) : '';
$startDate = isset($paramsIn['start_date']) ? trim($paramsIn['start_date']) : '';
$endDate = isset($paramsIn['end_date']) ? trim($paramsIn['end_date']) : '';
$showCancelled = isset($paramsIn['show_cancelled']) && (
    $paramsIn['show_cancelled'] === '1'
    || $paramsIn['show_cancelled'] === 1
    || $paramsIn['show_cancelled'] === true
    || $paramsIn['show_cancelled'] === 'true'
);
$page = isset($paramsIn['page']) ? max(1, intval($paramsIn['page'])) : 1;
$perPage = isset($paramsIn['per_page']) ? intval($paramsIn['per_page']) : 20;
$sortBy = isset($paramsIn['sort_by']) ? trim($paramsIn['sort_by']) : 'start_utc';
$sortDir = isset($paramsIn['sort_dir']) ? strtoupper(trim($paramsIn['sort_dir'])) : 'ASC';

if (!in_array($perPage, array(20, 50, 100), true)) {
    $perPage = 20;
}

$allowedSortBy = array(
    'start_utc' => 'start_utc',
    'end_utc' => 'end_utc',
    'summary' => 'summary',
    'calendar_name' => 'calendar_name',
    'location' => 'location',
    'status' => 'status',
    'last_modified_utc' => 'last_modified_utc',
);

if (!isset($allowedSortBy[$sortBy])) {
    $sortBy = 'start_utc';
} else {
    $sortBy = $allowedSortBy[$sortBy];
}

if ($sortDir !== 'ASC' && $sortDir !== 'DESC') {
    $sortDir = 'ASC';
}

if ($startDate !== '' && !calendar_events_valid_date($startDate)) {
    $startDate = '';
}
if ($endDate !== '' && !calendar_events_valid_date($endDate)) {
    $endDate = '';
}

if ($startDate !== '' && $endDate !== '' && strtotime($startDate) > strtotime($endDate)) {
    api_json_response(array('error' => 'start_date must be before end_date'), 400);
}

$sqlWhere = '';
$params = array();

$titleLike = calendar_events_like($keywordTitle);
if ($titleLike !== '') {
    $sqlWhere .= ' AND summary LIKE :keyword_title ';
    $params['keyword_title'] = $titleLike;
}

$bodyLike = calendar_events_like($keywordBody);
if ($bodyLike !== '') {
    $sqlWhere .= ' AND description LIKE :keyword_body ';
    $params['keyword_body'] = $bodyLike;
}

$locationLike = calendar_events_like($keywordLocation);
if ($locationLike !== '') {
    $sqlWhere .= ' AND location LIKE :keyword_location ';
    $params['keyword_location'] = $locationLike;
}

if ($calendarName !== '') {
    $sqlWhere .= ' AND calendar_name = :calendar_name ';
    $params['calendar_name'] = $calendarName;
}

if ($startDate !== '') {
    $sqlWhere .= ' AND start_utc >= :start_date ';
    $params['start_date'] = $startDate . ' 00:00:00';
}

if ($endDate !== '') {
    $endExclusive = date('Y-m-d', strtotime($endDate . ' +1 day'));
    $sqlWhere .= ' AND start_utc < :end_date ';
    $params['end_date'] = $endExclusive . ' 00:00:00';
}

if (!$showCancelled) {
    $sqlWhere .= " AND (status IS NULL OR UPPER(status) <> 'CANCELLED') ";
}

$countRows = getQuery1("SELECT COUNT(*) AS total FROM calendar_events WHERE TRUE $sqlWhere", $params);
$total = isset($countRows[0]['total']) ? intval($countRows[0]['total']) : 0;
$totalPages = $total > 0 ? (int) ceil($total / $perPage) : 1;

if ($page > $totalPages) {
    $page = $totalPages;
}

$offset = ($page - 1) * $perPage;

$sql = "SELECT id, event_key, calendar_id, calendar_name, uid, summary, description, location, status,
               start_utc, end_utc, all_day, is_recurring, rrule, last_modified_utc, sync_run, updated_at
        FROM calendar_events
        WHERE TRUE
        $sqlWhere
        ORDER BY $sortBy $sortDir, id DESC
        LIMIT $perPage OFFSET $offset";

$results = getQuery1($sql, $params);
if (!$results) {
    $results = array();
}

foreach ($results as $i => $row) {
    $results[$i]['id'] = intval($row['id']);
    $results[$i]['all_day'] = isset($row['all_day']) ? intval($row['all_day']) : 0;
    $results[$i]['is_recurring'] = isset($row['is_recurring']) ? intval($row['is_recurring']) : 0;
    $results[$i]['sync_run'] = isset($row['sync_run']) ? intval($row['sync_run']) : 0;
}

$calendarRows = getQuery1(
    "SELECT DISTINCT calendar_name
     FROM calendar_events
     WHERE calendar_name IS NOT NULL AND calendar_name <> ''
     ORDER BY calendar_name ASC"
);
$calendars = array();
if ($calendarRows) {
    foreach ($calendarRows as $row) {
        $calendars[] = $row['calendar_name'];
    }
}

api_json_response(array(
    'items' => $results,
    'calendars' => $calendars,
    'total' => $total,
    'page' => $page,
    'per_page' => $perPage,
    'total_pages' => $totalPages,
));
