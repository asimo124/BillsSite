<?php
class Audit {

	public function __construct() {

	}

	public static function cleanAmount($amount)
	{
		$amount = explode("negative", $amount)[0];
		$amount = trim($amount);
		$amount = str_replace("$", "", $amount);
		echo "<Pre>";

		// special type of hyphen being replaced
		$amount = str_replace("−", "-", $amount);

		$amount = str_replace(",", "", $amount);
		$amount = floatval($amount);
		$amount = $amount * -1;
		return $amount;
	}

	public static function cleanDate($date)
	{
		$date2 = date("d", strtotime($date));
		$date2 = intval($date2);
		return $date2;
	}
}
?>
