<?php

exit;

$fh = fopen("swift_data_files/models_new_layout2.txt", 'r');

$tables = array();
$models = array();
$models_data = array();
$responseArr = array();
while ($row = fgets($fh)) {

	$tableName = "";
	$cols = explode("\t", $row);
	$modelClass = $cols[0];
	$modelDataClass = str_replace("\n", "", $cols[1]);

	$file_name = "swift_files/" . $modelClass . ".swift";
	try {
		$fh1 = fopen($file_name, 'r');

		$model_content = fread($fh1, filesize($file_name));
		$modelContentArr = explode("\n", $model_content);
		$fields = array();
		$firstFieldLabels = array();
		foreach ($modelContentArr as $line) {

			if (strpos($line, "static var") !== false) {

				if (strpos($line, "TABLE_NAME") !== false) {

					$tableNameArr = explode('"', $line);
					$tableName = $tableNameArr[1];

				} else {

					$fieldsArr = explode('"', $line);
					$fields[] = $fieldsArr[1];
					$firstFieldLabelsArr = explode(" ", $line);
					$firstFieldLabelsArr2 = array();
					foreach ($firstFieldLabelsArr as $index => $val) {
						if (trim($val) != "") {
							$firstFieldLabelsArr2[] = $val;
						}
					}
					$firstFieldLabels[] = $firstFieldLabelsArr2[2];
				}
			}
		}
		
		$fieldLabels = array();
		$methods = array();
		foreach ($modelContentArr as $line) {

			if (strpos($line, "return") !== false) {

				$fieldLabelArr = explode('return ', $line);
				$fieldLabels[] = str_replace(";", "", $fieldLabelArr[1]);

			} else if (strpos($line, "class func") !== false) {

				$methodsArr = explode(" ", $line);
				$methodsArr2 = array();
				foreach ($methodsArr as $index => $val) {
					if (trim($val) != "") {
						$methodsArr2[] = $val;
					}
				}
				if ($methodsArr2[2] != "truncate()") {
					$methods[] = $methodsArr2[2];
				}
			}
		}

		$responseArr0[$modelDataClass] = array();
		$responseArr3[$modelClass] = array();
		$responseArr2[$tableName] = array();
		$responseArr[$tableName] = array();
		$repsonseFields = array();
		$responseFields2 = array();
		foreach ($fields as $index => $get_field) {

			$get_method = "";
			foreach ($fieldLabels as $index2 => $get_label) {
				if ($firstFieldLabels[$index] == $get_label) {
					$get_method = $methods[$index2];
				}
			}
			$responseFields[$get_field] = $get_method;
			$responseFields2[$get_method] = $get_field;
		} 
		$responseArr0[$modelDataClass] = $responseFields2;
		$responseArr3[$modelClass] = $responseFields2;
		$responseArr2[$tableName] = $responseFields2;
		$responseArr[$tableName] = $responseFields;
		$tables[] = $tableName;
		$models[] = $modelClass;
		$models_data[] = $modelDataClass;

	} catch (Exception $e) {


	}

	fclose($fh1);
}

fclose($fh);

$i = 0;
$responseArr4 = array();
$responseArr5 = array();
$responseArr6 = array();
foreach ($responseArr3 as $modelClass => $getItem) {

	$newItem = array();
	foreach ($getItem as $method => $field) {

		$method2 = str_replace("()", "", $method);

		$file_name = "swift_data_files/new_fields_layout2.txt";
		$fh3 = fopen($file_name, 'r');

		$file_content = fread($fh3, filesize($file_name));
		fclose($fh3);

		$fields_content = explode("\n", $file_content);
		foreach ($fields_content as $line) {

			if (strpos($line, $modelClass . "." . $method2) !== false) {

				$cols = $keywords = preg_split("/[\s]+/", $line);
				$type = $cols[1];

				switch ($type) {
					case "BIGINT":
					case "BOOLEAN":
					case "INTEGER":
						$use_type = "Int";
					break;
					case "DATE":
					case "DATETIME":
						$use_type = "Date";
					break;
					case "DOUBLE":
						$use_type = "Double";
					break;
					case "TEXT":
					case "VARCHAR":
						$use_type = "String";
					break;
				}

			}

		}
		$newItem[$field]['method'] = $method;
		$newItem[$field]['type'] = $use_type;

	}
	$getTableName = $tables[$i];
	$getModelDataClass = $models_data[$i];
	$responseArr6[$getModelDataClass] = $newItem;
	$responseArr4[$getTableName] = $newItem;
	$responseArr5[$modelClass] = $newItem;
	$i++;
}



/*$table_file_name = "swift_data_files/" . "new_table_fields.json";
$fh4 = fopen($table_file_name, 'w');
fwrite($fh4, json_encode($responseArr4));
fclose($fh4);

$table_file_name = "swift_data_files/" . "new_model_fields.json";
$fh5 = fopen($table_file_name, 'w');
fwrite($fh5, json_encode($responseArr5));
fclose($fh5);*/

$table_file_name = "swift_data_files/" . "new_modeldata_fields.json";
$fh6 = fopen($table_file_name, 'w');
fwrite($fh6, json_encode($responseArr6));
fclose($fh6);
?>