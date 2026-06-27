<?php
/**
 * confirm.php — CPAP reminder confirmation page.
 *
 * Place this file somewhere under your PHP web root, e.g.:
 *   /var/www/html/cpap/confirm.php
 *
 * Then set SITE_CONFIRM_URL in cpap_config.py to match.
 *
 * IMPORTANT: set the four constants below to match cpap_config.py.
 */

define('SECRET_KEY', '090e99cbeb5176d3e06eb99b9e12882bd26d1d3381db3ecba8d38fb42f18b7ae'); // must match cpap_config.py

define('DB_HOST', 'localhost');
define('DB_NAME', 'asimo124_bills');
define('DB_USER', 'root');
define('DB_PASS', 'gortex!22');

// ---------------------------------------------------------------------------

function make_token(int $task_id, string $date): string {
    return hash_hmac('sha256', "{$task_id}:{$date}", SECRET_KEY);
}

function verify_token(int $task_id, string $date, string $token): bool {
    return hash_equals(make_token($task_id, $date), $token);
}

// ---------------------------------------------------------------------------
// Validate input
// ---------------------------------------------------------------------------

$task_id = isset($_GET['task_id']) ? (int) $_GET['task_id'] : 0;
$date    = $_GET['date']  ?? '';
$token   = $_GET['token'] ?? '';

// Basic date format check (YYYY-MM-DD)
$valid_date = (bool) preg_match('/^\d{4}-\d{2}-\d{2}$/', $date);

if (!$task_id || !$valid_date || !$token) {
    http_response_code(400);
    die('Invalid request.');
}

if (!verify_token($task_id, $date, $token)) {
    http_response_code(403);
    die('Invalid or expired confirmation link.');
}

// ---------------------------------------------------------------------------
// Database
// ---------------------------------------------------------------------------

try {
    $dsn = 'mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=utf8mb4';
    $db  = new PDO($dsn, DB_USER, DB_PASS, [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES   => false,
    ]);
} catch (PDOException $e) {
    http_response_code(500);
    die('Database connection failed.');
}

// Fetch the task
$stmt = $db->prepare('SELECT id, task_name FROM cpap_reminders WHERE id = ?');
$stmt->execute([$task_id]);
$task = $stmt->fetch();

if (!$task) {
    http_response_code(404);
    die('Task not found.');
}

// Record confirmation (INSERT IGNORE is idempotent — safe to click twice)
$already_done = false;
try {
    $db->beginTransaction();

    $stmt = $db->prepare(
        'INSERT IGNORE INTO cpap_confirmations (task_id, confirmed_date) VALUES (?, ?)'
    );
    $stmt->execute([$task_id, $date]);
    $inserted = $stmt->rowCount();

    if ($inserted > 0) {
        // Also update last_confirmed on the task row so Python knows the schedule
        $stmt2 = $db->prepare(
            'UPDATE cpap_reminders SET last_confirmed = ? WHERE id = ?'
        );
        $stmt2->execute([$date, $task_id]);
    } else {
        $already_done = true;
    }

    $db->commit();
} catch (PDOException $e) {
    $db->rollBack();
    http_response_code(500);
    die('Could not save confirmation.');
}

$task_name = htmlspecialchars($task['task_name'], ENT_QUOTES, 'UTF-8');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CPAP Reminder</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
            background: #f0f4f8;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 20px;
        }
        .card {
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 4px 24px rgba(0,0,0,.10);
            padding: 40px 32px;
            max-width: 420px;
            width: 100%;
            text-align: center;
        }
        .icon { font-size: 64px; line-height: 1; margin-bottom: 20px; }
        h1 { font-size: 1.4rem; color: #1a1a2e; margin-bottom: 10px; }
        p  { color: #555; font-size: 0.95rem; line-height: 1.5; }
        .task-name { color: #2563eb; font-weight: 600; }
        .date { color: #888; font-size: 0.85rem; margin-top: 16px; }
    </style>
</head>
<body>
<div class="card">
<?php if ($already_done): ?>
    <div class="icon">✅</div>
    <h1>Already confirmed</h1>
    <p><span class="task-name"><?= $task_name ?></span> was already marked done for today.</p>
<?php else: ?>
    <div class="icon">🎉</div>
    <h1>Done!</h1>
    <p><span class="task-name"><?= $task_name ?></span> has been marked complete for today.</p>
    <p style="margin-top:12px">No more reminders for this task today.</p>
<?php endif; ?>
    <p class="date"><?= htmlspecialchars($date, ENT_QUOTES, 'UTF-8') ?></p>
</div>
</body>
</html>