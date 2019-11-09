<?php
class QueryUtils
{
	public function getPaginated($query, $data, $CurrentPage=1, $NumPerPage=25) {

		global $config, $Paginator, $getdb;
		
		$limitStart = ($CurrentPage - 1) * $NumPerPage;
		$recordsCount = self::getQueryRecords($query, $data);
		$numPages = ceil($recordsCount / $NumPerPage);
		$query = str_replace("LIMIT 0,", "LIMIT $limitStart,", $query);
		
		$Paginator = new Paginator($_SERVER['PHP_SELF'] . "?PageNumber=##PAGE##");
		
		$Paginator->NumPerPage = $NumPerPage;
		$Paginator->PageNumber = $CurrentPage;
		$Paginator->RecordCount = $recordsCount;
		$Paginator->PageCount = $numPages;	

		$resultset = $getdb->get_results($query, $data);
		return $resultset;
	}

	public function getQueryRecords($query, $data) {

		global $getdb;

		if (stripos($query, "select") === false || stripos($query, "from") === false) {
			return 1;
		}
		$queryArr1 = preg_split('/[sSeElLcCtT]{6}/', $query);
		$query2 = $queryArr1[1];
		$queryArr2 = preg_split('/[fFrRoOmM]{4}/', $query2);
		$queryMiddle = $queryArr2[0];
		$query = str_replace($queryMiddle, " COUNT(*) AS count2 ", $query);
		
		$queryArr1 = preg_split('/[oOrRdDeErR]{5} [bByY]{2}/', $query);
		preg_match('/[oOrRdDeErR]{5} [bByY]{2}/', $query, $matches);
		$orderStr = $matches[0];
		$query2 = $queryArr1[1];
		$queryArr2 = preg_split('/[lLiImMtT]{5}/', $query2);
		$queryMiddle = $orderStr . $query2;
		
		$query = str_replace($queryMiddle, "", $query);

		$resultset = $getdb->get_results($query, $data);	
		if (stripos($query, "group") !== false) {		
			$recordsCount = count($resultset[0]["count2"]);
		}
		else {
			$recordsCount = intval($resultset[0]["count2"]);
		}
		return $recordsCount;
	}
	
	public static function getInsert($table_name, $fields) 
	{
		if (trim($fields) == "" || $table_name == "") {
			return "";	
		}
		
		$fieldsArr = explode(",", $fields);
		$fieldsArr = trimValArr($fieldsArr);
		
		$query = "
		INSERT INTO $table_name (";
		foreach ($fieldsArr as $index => $GetField) {
			if ($index == 0) {
				$query .= $GetField;	
			}
			else {
				$query .= ", " . $GetField;	
			}
		}
		$query .= ") VALUES (";
		foreach ($fieldsArr as $index => $GetField) {
			if ($index == 0) {
				$query .= ":" . $GetField;	
			}
			else {
				$query .= ", " . ":" . $GetField;	
			}
		}
		$query .= ") ";
		
		return $query;
	}
	
	public static function showQuery($query, $data, $doEcho=true, $usesColon=false) 
	{
		krsort($data);
		
		foreach ($data as $key => $value) {
			if ($usesColon == false) {
				echo $key . "\n";
				$query = str_replace(":" . $key, "'" . str_replace("'", "''", $value) . "'", $query);
			}
			else {
				$query = str_replace($key, "'" . str_replace("'", "''", $value) . "'", $query);
			}
		}
		if ($doEcho) {
			preformat2($query);	
			preformat2($data);
		}
		return $query;
		
	}
	
}
?>