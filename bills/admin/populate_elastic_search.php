<?php
//ini_set("display_errors", 1);
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$sql = "SELECT * FROM information_schema.columns
WHERE 1
AND table_schema = DATABASE()
AND table_name LIKE 'ri_%'
ORDER BY table_name, ordinal_position;";

$results = getQuery2($sql, []);

$tableFields = [];
foreach ($results as $getItem) {

    $tableName = $getItem['TABLE_NAME'];
    if (!isset($tableFields[$tableName])) {
        $tableFields[$tableName] = [];
    }
    $tableFields[$tableName][] = $getItem;
}

/*/
echo "<Pre>";
print_r([
    "tableFields" => $tableFields
]);
//die();
//*/

$fh = fopen("../../elastic_search.sh", "w");

foreach ($tableFields as $tableName => $items)  {

    echo "tableName: " . $tableName . "\n";

    //fwrite($fh, "curl -s -XPUT https://8m58pm81v2:l2e6dvddeu@hawleycluster-2654416480.us-east-1.bonsaisearch.net:443/$tableName \n");

    $sql = "SELECT * FROM $tableName WHERE 1";
    $table_items = getQuery2($sql);

    foreach ($table_items as $getTableItem) {

        $id = $getTableItem['id'];
        $data = json_encode($getTableItem);

        fwrite($fh, "curl -H 'Content-Type: application/json' -s -XPUT https://8m58pm81v2:l2e6dvddeu@hawleycluster-2654416480.us-east-1.bonsaisearch.net:443/$tableName/doc/$id -d '" . $data . "' \n");
    }
}

fclose($fh);

echo "Script completed \n";