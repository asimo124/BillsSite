<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";
	//ini_set("display_errors", 1);

$user_id 			= isset($_REQUEST['user_id']) ? intval($_REQUEST['user_id']) : 0;
$current_balance 	= isset($_REQUEST['current_balance']) ? intval($_REQUEST['current_balance']) : 0;
$pay_date 			= isset($_REQUEST['pay_date']) ? trim($_REQUEST['pay_date']) : "";

$prev_date          = isset($_REQUEST['prev_date']) ? intval($_REQUEST['prev_date']) : 0;
$next_date          = isset($_REQUEST['next_date']) ? intval($_REQUEST['next_date']) : 0;

if ($pay_date == "") {
	$pay_date = date("Y-m-d");
}

if ($prev_date || $next_date) {

    $getCurYear6 = intval(date("Y", strtotime($pay_date)));
    $getCurMonth6 = intval(date("m", strtotime($pay_date)));
    $getCurDay6 = intval(date("d", strtotime($pay_date)));

    if ($prev_date) {
        if ($getCurDay6 < 16) {
            $getCurDay6 = 16;
        } else {
            $getCurDay6 = 1;
        }
        if ($getCurMonth6 > 1) {
            $getCurMonth6--;
        } else {
            $getCurMonth6 = 12;
            $getCurYear6--;
        }
        $pay_date = $getCurYear6 . "-" . $getCurMonth6 . "-" . $getCurDay6;
    } else {
        if ($getCurDay6 < 16) {
            $getCurDay6 = 16;
        } else {
            $getCurDay6 = 1;
        }
        if ($getCurMonth6 < 12) {
            $getCurMonth6++;
        } else {
            $getCurMonth6 = 1;
            $getCurYear6++;
        }
        $pay_date = $getCurYear6 . "-" . $getCurMonth6 . "-" . $getCurDay6;
    }
}

if (!$current_balance) {

    /**
     * Get Current Balance
     */
    $query = "
    SELECT * FROM vnd_user_settings 
    WHERE vnd_user_id = :vnd_user_id ";

    $data = array();
    $data['vnd_user_id'] = $user_id;

    $sth = $db_conn->prepare($query);
    $sth->execute($data);

    $current_balance = 960;
    $settings = $sth->fetchAll();
    if (count($settings) > 0) {
        $current_balance = $settings[0]['vnd_current_balance'];
    }

} else {

    $hash_key_token_cs  = isset($_REQUEST['hash_key_token_cs']) ? ($_REQUEST['hash_key_token_cs']) : "";

    $ip = $_SERVER['REMOTE_ADDR'];
    $user_agent = $_SERVER['HTTP_USER_AGENT'];
    $ipArr = explode(".", $ip);
    $userAgentArr = explode(" ", $user_agent);
    $string_to_hash = $ip[1] . SALT2 . $userAgentArr[2] . SALT1 . $ip[3] . $userAgentArr[0];
    $hash_key = md5($string_to_hash);

    if ($hash_key_token_cs == $hash_key && validateTags($current_balance)) {

        $current_balance = strip_tags($current_balance);

        $query = "
        UPDATE vnd_user_settings
        SET vnd_current_balance = :vnd_current_balance 
        WHERE vnd_user_id = :vnd_user_id ";

        $data = array();
        $data['vnd_current_balance'] = $current_balance;
        $data['vnd_user_id'] = $user_id;

        $sth = $db_conn->prepare($query);
        $sth->execute($data);
    }
}

$ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$ipArr = explode(".", $ip);
$userAgentArr = explode(" ", $user_agent);
$string_to_hash = $ip[1] . SALT2 . $userAgentArr[2] . SALT1 . $ip[3] . $userAgentArr[0];
$hash_key = md5($string_to_hash);


$end_date = "";
$start_date = date("Y-m-d", strtotime($pay_date));
$start_day = intval(date("d", strtotime($start_date)));

if ($start_day < 16) {
	$end_date = date("Y-m-15", strtotime($start_date));
} else {
	$d = new DateTime($start_date);
	$end_date = $d->format( 'Y-m-t' );
}

$MyBills = array();
$Bill = new Bills();
$Bill->setPayPeriod($end_date, $start_date);
$billDates = $Bill->loadBillDatesByUserID($user_id);

foreach ($billDates as $getDate) {
	$newDate = array();
	$newDate['desc'] = $getDate['vnd_bill_desc'];
	$newDate['amount'] = $getDate['vnd_amount'];
	$newDate['is_heavy'] = $getDate['is_heavy'];
	$key = strtotime(date("Y-m-d 00:00:00", strtotime($getDate['vnd_date'])));
	$MyBills[$key][] = $newDate;
}

$days_arr = array();
$full_cur_amount = $current_balance;

$pastStartWeek = false;
$timestamp = strtotime($start_date);
while ($timestamp <= strtotime($end_date)) {

	$cur_date = date("Y-m-d", $timestamp);
	$day = date("w", $timestamp);
	switch ($day) {
		case 0:
			$my_day = "Sunday";
			break;
		case 1:
			$my_day = "Monday";
			break;
		case 2:
			$my_day = "Tuesday";
			break;
		case 3:
			$my_day = "Wednesday";
			break;
		case 4:
			$my_day = "Thursday";
			break;
		case 5:
			$my_day = "Friday";
			break;
		case 6:
			$my_day = "Saturday";
			break;
    }
    $my_day .= ", " . getDaySuffix(intval(date("d", $timestamp)));

	if ($day > 0 && $pastStartWeek == false) {

	    $lastIndex = 0;
        $pastStartWeek = true;
        for ($p = 0; $p < $day; $p++) {
            $get_day = array();
            $get_day['showAsDay'] = false;
            $get_day['weekDayNum'] = $p;
            $get_day['Day'] = '';
            $get_day['Timestamp'] = 0;
            $get_day['Date'] = '';
            $get_day['desc'] = [];
            $days_arr[] = $get_day;
            $lastIndex = $p;
        }
    }

    $get_day = array();
    $get_day['showAsDay'] = true;
    $get_day['weekDayNum'] = $day;
	$get_day['Day'] = $my_day;
	$get_day['Timestamp'] = $timestamp;
	$get_day['Date'] = date("m/d/Y 00:00:00", $timestamp);
	$bills_desc = "";
	$hasBills = false;

	$billsDescArr = [];
	foreach ($MyBills[$timestamp] as $getBill) {

		$hasBills = true;
        $billsDescArr[] = [
            "title" => $getBill['desc'] . " - $" . $getBill["amount"],
            "is_heavy" => intval($getBill['is_heavy'])
        ];
		$full_cur_amount -= $getBill["amount"];
	}
	$get_day['desc'] = $billsDescArr;
	//if ($hasBills == true) {
		$get_day['Balance'] = '$' . $full_cur_amount;
	/*} else {
		$get_day['Balance'] = "";
	}*/
	$timestamp = strtotime('+1 days', $timestamp);

	$days_arr[] = $get_day;
}

$i = 0;
$daysWeeksArr = [];
foreach ($days_arr as $index => $get_day) {
    if ($i == 0) {
        $eachWeek = [];
    }
    $eachWeek[] = $get_day;
    if ($i > 5 || $index == count($days_arr) - 1) {
        $daysWeeksArr[] = [
            'title' => 'Week',
            'days' => $eachWeek
        ];
        $i = 0;
    } else {
        $i++;
    }
}

header("Content-type: text/json");

/**
 * TODO - Comment this
 */
header('Access-Control-Allow-Origin: *');



$results = [
    "results" => $daysWeeksArr,
    "hash_key" => $hash_key,
    "cur_balance" => $current_balance,
    "pay_date" => $pay_date
];
echo json_encode($results);

function getDaySuffix($num) {

    switch ($num) {
        case 1:
            return $num . "st";
            break;
        case 2:
            return $num . "nd";
            break;
        case 3:
            return $num . "rd";
            break;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
            return $num . "th";
            break;
        case 21:
            return $num . "st";
            break;
        case 22:
            return $num . "nd";
            break;
        case 23:
            return $num . "rd";
            break;
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
            return $num . "th";
            break;
        case 31:
            return $num . "st";
            break;
        default: 
            return $num . "th";
    }
}
?>
