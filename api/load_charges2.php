<?php
die();

include "../inc/includes.php";

/*/
if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}
//*/

$sql = "SELECT * FROM vnd_bill_dates ORDER BY vnd_id DESC LIMIT 1000 ";

echo "<pre>";
echo "sql $sql \n";

$resultset = getQuery($sql, []);

$sql = "DELETE FROM vnd_bill_dates WHERE vnd_id = 76 ";
execQuery($sql);

print_r($resultset);

?>
