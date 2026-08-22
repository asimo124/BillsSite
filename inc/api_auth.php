<?php
/**
 * Shared CORS + Bearer token auth for MyBudget SPA API calls.
 * Existing PHP session login for bills/admin is unchanged.
 */

function api_allowed_origins() {
    return array(
        'http://localhost:5173',
        'http://127.0.0.1:5173',
        'http://localhost:4173',
        'http://127.0.0.1:4173',
        'https://mybudget.hawleywebdesign.com',
        // Add production MyBudget origin(s) here when deployed
    );
}

function api_send_cors_headers() {
    $origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '';
    $allowed = api_allowed_origins();

    if ($origin && in_array($origin, $allowed, true)) {
        header('Access-Control-Allow-Origin: ' . $origin);
        header('Access-Control-Allow-Credentials: true');
        header('Vary: Origin');
    } elseif (!$origin) {
        // Same-origin or non-browser clients
        header('Access-Control-Allow-Origin: *');
    }

    header('Access-Control-Allow-Headers: Authorization, Content-Type, Accept');
    header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
}

function api_handle_preflight() {
    api_send_cors_headers();
    if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
        http_response_code(204);
        exit;
    }
}

function api_json_response($data, $status = 200) {
    api_send_cors_headers();
    http_response_code($status);
    header('Content-Type: application/json');
    echo json_encode($data);
    exit;
}

function api_get_bearer_token() {
    $header = '';
    if (isset($_SERVER['HTTP_AUTHORIZATION'])) {
        $header = $_SERVER['HTTP_AUTHORIZATION'];
    } elseif (isset($_SERVER['REDIRECT_HTTP_AUTHORIZATION'])) {
        $header = $_SERVER['REDIRECT_HTTP_AUTHORIZATION'];
    } elseif (function_exists('apache_request_headers')) {
        $headers = apache_request_headers();
        if (isset($headers['Authorization'])) {
            $header = $headers['Authorization'];
        } elseif (isset($headers['authorization'])) {
            $header = $headers['authorization'];
        }
    }

    if (preg_match('/Bearer\s+(\S+)/i', $header, $matches)) {
        return $matches[1];
    }
    return '';
}

/**
 * Validate Bearer token against hth_user_sessions.
 * Sets $GLOBALS['api_user'] on success.
 * @return array user row
 */
function require_api_auth() {
    $token = api_get_bearer_token();
    if ($token === '') {
        api_json_response(array('message' => 'Unauthorized'), 401);
    }

    $sql = "SELECT s.session_key, s.user_id, s.last_until,
                   u.id, u.username, u.fname, u.lname, u.email
            FROM hth_user_sessions s
            INNER JOIN hth_users u ON u.id = s.user_id
            WHERE s.session_key = :session_key
              AND s.last_until > NOW()
            LIMIT 1";

    $rows = getQuery($sql, array('session_key' => $token));
    if (!$rows || count($rows) === 0) {
        api_json_response(array('message' => 'Unauthorized'), 401);
    }

    $row = $rows[0];
    $user = array(
        'id' => intval($row['id']),
        'username' => $row['username'],
        'fname' => $row['fname'],
        'lname' => $row['lname'],
        'email' => $row['email'],
    );

    $GLOBALS['api_user'] = $user;
    return $user;
}

/** Accept Bearer token or legacy PHP session (for existing admin pages). */
function require_api_auth_or_session() {
    if (isset($_SESSION['user']['user_id'])) {
        $userId = intval($_SESSION['user']['user_id']);
        $rows = getQuery(
            "SELECT id, username, fname, lname, email FROM hth_users WHERE id = :id LIMIT 1",
            array('id' => $userId)
        );
        if ($rows && count($rows) > 0) {
            $row = $rows[0];
            $user = array(
                'id' => intval($row['id']),
                'username' => $row['username'],
                'fname' => $row['fname'],
                'lname' => $row['lname'],
                'email' => $row['email'],
            );
            $GLOBALS['api_user'] = $user;
            return $user;
        }
    }
    return require_api_auth();
}

function api_read_json_body() {
    $raw = file_get_contents('php://input');
    if (!$raw) {
        return array();
    }
    $data = json_decode($raw, true);
    return is_array($data) ? $data : array();
}
