<?php
class Bills {
	
	public $numReps = 50;
	public $today;
	public $nexdtPayDay;
	public $sthInsertDate;
	public $sthCheckDate;
	public $user_id;
	
	public function __construct($numReps=50) {	
		$numReps = intval($numReps);
		$this->numReps = $numReps;
	}
	public function loadPayPeriod($nextPayDay, $today="") {	
		if ($today == "") {
			$today = date("Y-m-d H:i:s");
		}
		$this->today = $today;
		$this->nextPayDay = $nextPayDay;	
	}
	public function deleteOldDates() {
		global $db_conn;
		
		$query = "
		DELETE FROM vnd_bill_dates WHERE vnd_date < :dateNow ";
		
		$data = array();
		$data['dateNow'] = date("Y-m-d H:i:s");
		
		$sth = $db_conn->prepare($query);
		$sth->execute($data);
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
		return $resultset;	
	}
	public function generateBillDatesByUserID($user_id) {
		global $db_conn;
		
		$this->user_id = $user_id;
		
		$queryInsertDate = "INSERT INTO vnd_bill_dates 
		(vnd_bill_desc, vnd_user_id, vnd_amount, vnd_date) VALUES 
		(:vnd_bill_desc, :vnd_user_id, :vnd_amount, :vnd_date) ";
		$this->sthInsertDate = $db_conn->prepare($queryInsertDate);
		
		$queryCheckDate = "
		SELECT vnd_id FROM vnd_bill_dates 
		WHERE vnd_bill_desc = :vnd_bill_desc 
		and vnd_date = :vnd_date and vnd_user_id = :user_id LIMIT 1 ";
		$this->sthCheckDate = $db_conn->prepare($queryCheckDate);
		
		$resultset = $this->loadBillsByUserID($user_id);
		foreach ($resultset as $getItem) {
			
			switch ($getItem['vnd_frequency']) {
				case "Once Per Month":
					$this->loadOncePerMonth($getItem['vnd_frequency_value'], $getItem['vnd_bill'], $getItem['amount'], $getItem['vnd_frequency_type']);
					break;
				case "Once Per Week":
					$this->loadOncePerWeek($getItem['vnd_frequency_value'], $getItem['vnd_bill'], $getItem['amount'], $getItem['vnd_frequency_type']);
					break;
				case "Every 2 Weeks":
					$this->loadEveryXWeeks($getItem['vnd_frequency_value'], $getItem['vnd_bill'], $getItem['amount'], $getItem['vnd_frequency_type'], 2);
					break;
				case "Every 4 Weeks":
					$this->loadEveryXWeeks($getItem['vnd_frequency_value'], $getItem['vnd_bill'], $getItem['amount'], $getItem['vnd_frequency_type'], 4);
					break;
			}
		}
	}
	public function loadOncePerMonth($freq_value, $bill_desc, $amount, $freq_type="Day of Month") {
		
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
					$this->sthInsertDate->execute($data);
				}
				$month = intval($month);
				if ($month < 12) {
					$month++;
				}
				else {
					$year++;
					$month = 1;
				}
			}
		}
	}
	public function loadOncePerWeek($freq_value, $bill_desc, $amount, $freq_type="Day of Week") {
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
			$each_date = $year . "-" . $month . "-" . $startDate;
			for ($i = 0; $i < $this->numReps; $i++) {
				$year = date("Y", $date2);
				$month = date("m", $date2);
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
					$this->sthInsertDate->execute($data);
				}
				$each_date = $use_date;
			}
		}
	}
	public function loadEveryXWeeks($freq_value, $bill_desc, $amount, $freq_type="Starting From", $numWeeks=2) {
	
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
					$this->sthInsertDate->execute($data);
				}
				$each_date = $use_date;
			}
		}
	}
}
?>