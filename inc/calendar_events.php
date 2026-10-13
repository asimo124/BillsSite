<?php

function calendar_events_like($value)
{
    $value = trim((string) $value);
    if ($value === '') {
        return '';
    }

    return '%' . str_replace(array('\\', '%', '_'), array('\\\\', '\\%', '\\_'), $value) . '%';
}

function calendar_events_valid_date($value)
{
    $value = trim((string) $value);
    if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', $value)) {
        return false;
    }

    $dt = DateTime::createFromFormat('Y-m-d', $value);
    return $dt && $dt->format('Y-m-d') === $value;
}
