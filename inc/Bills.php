<?php
class Bills {
	
	public $numReps = 600;
	public $today = "";
	public $nextPayDay;
	public $sthInsertDate;
	public $sthCheckDate;
	public $user_id;
	
	public function __construct($numReps=50) {	
		$numReps = intval($numReps);
		$this->numReps = $numReps;
	}
	public function setPayPeriod($nextPayDay="", $today="") {	
		if ($today == "") {
			$today = date("Y-m-d H:i:s");
		}
		$end_date = "";
		$start_date = $today;
		$start_day = intval(date("d", strtotime($start_date)));
		
		if ($start_day < 15) {
			
			$nextPayDay = date("Y-m-14", strtotime($start_date));
		} else {
			
			$d = new DateTime($start_date); 
			$nextPayDay = $d->format( 'Y-m-t' );
		}
		$this->today = $today;
		$this->nextPayDay = $nextPayDay;	
	}
	public function deleteOldDates() {
		global $db_conn;
		
		$query = "
		truncate vnd_bill_dates ";
		
		$data = array();
		//$data['dateNow'] = date("Y-m-d H:i:s");
		
		$sth = $db_conn->prepare($query);
		$sth->execute($data);

		$sql = "DELETE FROM vnd_bills WHERE vnd_frequency = 'Once' AND DATE_SUB(NOW(), INTERVAL 2 DAY) > DATE(vnd_frequency_value) ";
		execQuery($sql, []);
	}
	
	public function loadBillsByUserID($user_id) {
		global $db_conn;
		
		$query = "
		SELECT * FROM vnd_bills 
		WHERE vnd_user_id = :user_id 
		ORDER BY vnd_frequency, vnd_frequency_type ";
		
		$data = array();
		$data['user_id'] = $user_id;
		
		$sth = $db_conn->prepare($query);
		$sth->execute($data);
		$resultset = $sth->fetchAll();
		$resultset = cleanRS($resultset);
		return $resultset;	
	}
	
	public function loadBillDatesByUserID($user_id) {
		global $db_conn;
		
		$query = "
		SELECT * FROM vnd_bill_dates 
		WHERE vnd_user_id = :user_id
		and vnd_date between :start_date and :end_date
		ORDER BY vnd_date, vnd_bill_desc ";
		
		$data = array();
		$data['user_id'] = $user_id;
		$data['start_date'] = $this->today;
		$data['end_date'] = $this->nextPayDay;

		$sth = $db_conn->prepare($query);
		$sth->execute($data);
		$resultset = $sth->fetchAll();
		$resultset = cleanRS($resultset);
		return $resultset;	
	}
	
	public function generateBillDatesByUserID($user_id) {
		global $db_conn;
		
		$this->user_id = $user_id;
		
		$queryInsertDate = "INSERT INTO vnd_bill_dates 
		(vnd_bill_desc,  vnd_user_id,  vnd_amount,  vnd_date,  vnd_is_future,   is_heavy,  vnd_frequency,  
		 	 vnd_frequency_type) VALUES
		(:vnd_bill_desc, :vnd_user_id, :vnd_amount, :vnd_date, :vnd_is_future, :is_heavy, :vnd_frequency,
		 	:vnd_frequency_type) ";
		$this->sthInsertDate = $db_conn->prepare($queryInsertDate);
		
		$queryCheckDate = "
		SELECT vnd_id FROM vnd_bill_dates 
		WHERE vnd_bill_desc = :vnd_bill_desc 
		and vnd_date = :vnd_date and vnd_user_id = :user_id LIMIT 1 ";
		$this->sthCheckDate = $db_conn->prepare($queryCheckDate);


		$resultset = $this->loadBillsByUserID($user_id);
		foreach ($resultset as $getItem) {

			switch ($getItem['vnd_frequency']) {
				case "Once":

					$this->loadOnce($getItem['vnd_frequency_value'], $getItem['vnd_bill'], $getItem['amount'], $getItem['vnd_frequency_type'], $getItem['is_future'], $getItem['is_heavy'], $getItem['vnd_frequency'], $getItem['vnd_frequency_type']);
					break;
				case "Once Per Month":
					$this->loadOncePerMonth($getItem['vnd_frequency_value'], $getItem['vnd_bill'], $getItem['amount'], $getItem['vnd_frequency_type'], $getItem['is_future'], $getItem['is_heavy'], $getItem['vnd_frequency'], $getItem['vnd_frequency_type']);
					break;
				case "Every 3 Months":
					$this->loadEveryXMonths($getItem['vnd_frequency_value'], $getItem['vnd_bill'], $getItem['amount'], $getItem['vnd_frequency_type'], 3, $getItem['is_future'], $getItem['is_heavy'], $getItem['vnd_frequency'], $getItem['vnd_frequency_type']);
					break;
				case "Every 1 Month":
					$this->loadEveryXMonths($getItem['vnd_frequency_value'], $getItem['vnd_bill'], $getItem['amount'], $getItem['vnd_frequency_type'], 1, $getItem['is_future'], $getItem['is_heavy'], $getItem['vnd_frequency'], $getItem['vnd_frequency_type']);
					break;
				case "Once Per Week":
					$this->loadOncePerWeek($getItem['vnd_frequency_value'], $getItem['vnd_bill'], $getItem['amount'], $getItem['vnd_frequency_type'], $getItem['is_future'], $getItem['is_heavy'], $getItem['vnd_frequency'], $getItem['vnd_frequency_type']);
					break;
				case "Every 2 Weeks":
					$this->loadEveryXWeeks($getItem['vnd_frequency_value'], $getItem['vnd_bill'], $getItem['amount'], $getItem['vnd_frequency_type'], 2, $getItem['is_future'], $getItem['is_heavy'], $getItem['vnd_frequency'], $getItem['vnd_frequency_type']);
					break;
				case "Every 1 Week":
					$this->loadEveryXWeeks($getItem['vnd_frequency_value'], $getItem['vnd_bill'], $getItem['amount'], $getItem['vnd_frequency_type'], 1, $getItem['is_future'], $getItem['is_heavy'], $getItem['vnd_frequency'], $getItem['vnd_frequency_type']);
					break;
				case "Every 4 Weeks":
					$this->loadEveryXWeeks($getItem['vnd_frequency_value'], $getItem['vnd_bill'], $getItem['amount'], $getItem['vnd_frequency_type'], 4, $getItem['is_future'], $getItem['is_heavy'], $getItem['vnd_frequency'], $getItem['vnd_frequency_type']);
					break;
			}
		}
	}
	public function loadOncePerMonth($freq_value, $bill_desc, $amount, $freq_type="Day of Month", $is_future=0,
									 $is_heavy=0, $vnd_frequency, $vnd_frequency_type) {
		
		global $db_conn;
		
		if ($freq_type == "Day of Month") {
			$freq_value = intval($freq_value);
			$date2 = strtotime($this->today);
			$month = date("m", $date2);
			$year = date("Y", $date2);

			for ($i = 0; $i < $this->numReps; $i++) {
				if ($month < 10 && substr($month, 0, 1) != "0") {
					$month = "0" . (String)$month;
				}
				if ($freq_value < 10 && substr($freq_value, 0, 1) != "0") {
					$freq_value = "0" . (String)$freq_value;
				}

				if ($month == 02) {
					if ($freq_value > 28) {
						$freq_value = 28;
					}
				}

				if ($freq_value < 32) {
					$data = array();
					$data['vnd_bill_desc'] = $bill_desc;
					$data['user_id'] = $this->user_id;
					$data['vnd_date'] = $year . "-" . $month . "-" . $freq_value;
					$this->sthCheckDate->execute($data);
					$HasDates = $this->sthCheckDate->fetchAll();
					if (count($HasDates) == 0) {
						$data = array();
						$data['vnd_bill_desc'] = $bill_desc;
						$data['vnd_user_id'] = $this->user_id;
						$data['vnd_amount'] = $amount;
						$data['vnd_date'] = $year . "-" . $month . "-" . $freq_value;
						$data['vnd_is_future'] = $is_future;
						$data['is_heavy'] = $is_heavy;
						$data['vnd_frequency'] = $vnd_frequency;
						$data['vnd_frequency_type'] = $vnd_frequency_type;
						$this->sthInsertDate->execute($data);
					}
					$month = intval($month);
					if ($month < 12) {
						$month++;
					} else {
						$year++;
						$month = 1;
					}
				}
			}
		}
	}

	public function loadEveryXMonths($freq_value, $bill_desc, $amount, $freq_type="Day of Month", $numMonths=1,
									 $is_future=0, $is_heavy=0, $vnd_frequency,
									 $vnd_frequency_type) {

		global $db_conn;

		if ($freq_type == "Starting From") {
			$date2 = strtotime($this->today);
			$numDays = $numMonths * 30;
			$startDate = date('Y-m-d', strtotime($freq_value));
			$each_date = $startDate;
			for ($i = 0; $i < $this->numReps; $i++) {
				$use_date = date('Y-m-d', strtotime($each_date . " +" . $numDays . " days"));
				$data = array();
				$data['vnd_bill_desc'] = $bill_desc;
				$data['user_id'] = $this->user_id;
				$data['vnd_date'] = $use_date;
				$this->sthCheckDate->execute($data);
				$HasDates = $this->sthCheckDate->fetchAll();

				if (count($HasDates) == 0) {
					$data = array();
					$data['vnd_bill_desc'] = $bill_desc;
					$data['vnd_user_id'] = $this->user_id;
					$data['vnd_amount'] = $amount;
					$data['vnd_date'] = $use_date;
					$data['vnd_is_future'] = $is_future;
					$data['is_heavy'] = $is_heavy;
					$data['vnd_frequency'] = $vnd_frequency;
					$data['vnd_frequency_type'] = $vnd_frequency_type;
					$this->sthInsertDate->execute($data);
				}
				$each_date = $use_date;
			}
		}
	}

	public function loadOnce($freq_value, $bill_desc, $amount, $freq_type, $is_future=0, $is_heavy=0, $vnd_frequency,
							 $vnd_frequency_type) {
		global $db_conn;

		$data = array();
		$data['vnd_bill_desc'] = $bill_desc;
		$data['user_id'] = $this->user_id;
		$data['vnd_date'] = $freq_value;
		$this->sthCheckDate->execute($data);
		$HasDates = $this->sthCheckDate->fetchAll();
		if (count($HasDates) == 0) {
			$data = array();
			$data['vnd_bill_desc'] = $bill_desc;
			$data['vnd_user_id'] = $this->user_id;
			$data['vnd_amount'] = $amount;
			$data['vnd_date'] = $freq_value;
			$data['vnd_is_future'] = $is_future;
			$data['is_heavy'] = $is_heavy;
			$data['vnd_frequency'] = $vnd_frequency;
			$data['vnd_frequency_type'] = $vnd_frequency_type;
			$this->sthInsertDate->execute($data);
		}
	}

	public function loadOncePerWeek($freq_value, $bill_desc, $amount, $freq_type="Day of Week", $is_future=0,
									$is_heavy=0, $vnd_frequency,
									$vnd_frequency_type) {
		global $db_conn;
		if ($freq_type == "Day of Week") {
			$date2 = strtotime($this->today);
			$currentDay = date("w");
			$weekday_diff = $freq_value - $currentDay;
			if ($weekday_diff > 0) {  
				$startDate = date('d', strtotime($this->today . " +" . $weekday_diff . " days"));
			}
			else {
				$startDate = date('d', strtotime($this->today . " -" . $weekday_diff . " days"));
			}
			
			$year = date("Y", $date2);
			$month = date("m", $date2);
			$each_date = $year . "-" . $month . "-" . $startDate;
			for ($i = 0; $i < $this->numReps; $i++) {
				
				$use_date = date('Y-m-d', strtotime($each_date . " +" . "7 days"));
				$data = array();
				$data['vnd_bill_desc'] = $bill_desc;
				$data['user_id'] = $this->user_id;
				$data['vnd_date'] = $use_date;
				$this->sthCheckDate->execute($data);
				$HasDates = $this->sthCheckDate->fetchAll();

				if (count($HasDates) == 0) {
					$data = array();
					$data['vnd_bill_desc'] = $bill_desc;
					$data['vnd_user_id'] = $this->user_id;
					$data['vnd_amount'] = $amount;
					$data['vnd_date'] = $use_date;
					$data['vnd_is_future'] = $is_future;
					$data['is_heavy'] = $is_heavy;
					$data['vnd_frequency'] = $vnd_frequency;
					$data['vnd_frequency_type'] = $vnd_frequency_type;
					$this->sthInsertDate->execute($data);
				}
				$each_date = $use_date;
			}
		}
	}
	public function loadEveryXWeeks($freq_value, $bill_desc, $amount, $freq_type="Starting From", $numWeeks=2,
									$is_future=0, $is_heavy=0, $vnd_frequency,
									$vnd_frequency_type) {
	
		global $db_conn;
		
		if ($freq_type == "Starting From") {	
			$date2 = strtotime($this->today);
			$numDays = $numWeeks * 7;
			$startDate = date('Y-m-d', strtotime($freq_value));
			$each_date = $startDate;
			for ($i = 0; $i < $this->numReps; $i++) {
				$use_date = date('Y-m-d', strtotime($each_date . " +" . $numDays . " days"));
				$data = array();
				$data['vnd_bill_desc'] = $bill_desc;
				$data['user_id'] = $this->user_id;
				$data['vnd_date'] = $use_date;
				$this->sthCheckDate->execute($data);
				$HasDates = $this->sthCheckDate->fetchAll();

				if (count($HasDates) == 0) {
					$data = array();
					$data['vnd_bill_desc'] = $bill_desc;
					$data['vnd_user_id'] = $this->user_id;
					$data['vnd_amount'] = $amount;
					$data['vnd_date'] = $use_date;
					$data['vnd_is_future'] = $is_future;
					$data['is_heavy'] = $is_heavy;
					$data['vnd_frequency'] = $vnd_frequency;
					$data['vnd_frequency_type'] = $vnd_frequency_type;
					$this->sthInsertDate->execute($data);
				}
				$each_date = $use_date;
			}
		}
	}

	public function sendFutureCharges()
	{
		global $db_conn;

		$date_from = date("Y-m-d");
		$cur_day = intval(date("m"));
		if ($cur_day < 15) {
			$date_to = date("Y-m-t");
		} else {
			$date_to = date('Y-m-15 23:59:59', strtotime('next month'));
		}

		$email_content = "Hello, you have the following Appointments coming up in this paycheck, or the following: <br><br>";

		$sql = "SELECT bd.vnd_bill_desc, bd.vnd_date, bd.vnd_amount
				FROM vnd_bill_dates bd
				WHERE vnd_is_future = 1
				and vnd_date BETWEEN :date_from and :date_to ";

		$stmt = $db_conn->prepare($sql);

		$data = array(
			"date_from" => $date_from,
			"date_to" =>  $date_to
		);
		$stmt->execute($data);
		$resultset = $stmt->fetchAll(PDO::FETCH_ASSOC);
		if (count($resultset) > 0) {
			foreach ($resultset as $getItem) {

				$email_content .= "- " . $getItem['vnd_bill_desc'] . ", on " . date("m/d/Y", strtotime($getItem['vnd_date'])) . ", for the amount: $" . round($getItem['vnd_amount'], 2) . "<br>";
			}

			$headers = 'From: asimo124@yahoo.com' . "\r\n" .
				'X-Mailer: PHP/' . phpversion();
			$headers .= 'MIME-Version: 1.0' . "\r\n";
			$headers .= 'Content-type: text/html; charset=iso-8859-1';
			mail("ahawley@claimatic.com", "Appointments this Week", $email_content, $headers);
		}
	}

}
?>
