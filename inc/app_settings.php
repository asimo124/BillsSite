<?php
/**
 * App settings stored in live DB only (asimo124_bills / MYSQL_DATABASE via $db_conn1).
 * Used for MyBudget test_mode so auth always stays on the live database.
 */

function app_settings_ensure_table() {
    global $db_conn1;
    $sql = "CREATE TABLE IF NOT EXISTS app_settings (
        setting_key VARCHAR(64) NOT NULL PRIMARY KEY,
        setting_value VARCHAR(255) NOT NULL DEFAULT '',
        updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";
    $db_conn1->exec($sql);

    $stmt = $db_conn1->prepare(
        "INSERT IGNORE INTO app_settings (setting_key, setting_value) VALUES ('test_mode', '0')"
    );
    $stmt->execute();
}

/** Always reads from live DB ($db_conn1). */
function app_setting_get($key, $default = '') {
    global $db_conn1;
    app_settings_ensure_table();
    $stmt = $db_conn1->prepare(
        'SELECT setting_value FROM app_settings WHERE setting_key = :k LIMIT 1'
    );
    $stmt->execute(array('k' => $key));
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$row) {
        return $default;
    }
    return $row['setting_value'];
}

/** Always writes to live DB ($db_conn1). */
function app_setting_set($key, $value) {
    global $db_conn1;
    app_settings_ensure_table();
    $stmt = $db_conn1->prepare(
        'INSERT INTO app_settings (setting_key, setting_value)
         VALUES (:k, :v)
         ON DUPLICATE KEY UPDATE setting_value = VALUES(setting_value)'
    );
    $stmt->execute(array(
        'k' => $key,
        'v' => (string) $value,
    ));
}

function app_test_mode_enabled() {
    return intval(app_setting_get('test_mode', '0')) === 1;
}

/**
 * Point global $db_conn at live or test bills DB based on app_settings.test_mode.
 * Call only from Bills Admin CRUD after auth — never from auth endpoints.
 */
function apply_app_test_mode_db() {
    global $db_conn, $db_conn1, $db_conn3;
    if (app_test_mode_enabled()) {
        $db_conn = $db_conn3;
    } else {
        $db_conn = $db_conn1;
    }
}
