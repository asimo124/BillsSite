<?php
	ini_set("display_errors", 1);
	include "../inc/includes.php";

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;

$sql = "SELECT * FROM tbl_books WHERE id = :id ";
$stmt = $db_conn->prepare($sql);

$data = array(
	"id" => $id
);

$stmt->execute($data);

/*/
$bookname = "book 3";
$desc = "book 3 description";
$category_id = 1;
$price = 12;

$query = "INSERT into tbl_books 
		 (bookname, desc, category_id, price) VALUES 
		 (?,        ?,    ?,           ?);

$data = array(
	$bookname,
	$desc,
	$category_id,
	$price
)

$stmt = $db_conn->prepare($sql);
$stmt->execute();

$id = $db_conn->lastInsertId()
//*/





$getItem = array();
$resultset = $stmt->fetchAll(PDO::FETCH_ASSOC);
if (count($resultset) > 0) {
	$getItem = $resultset[0];
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	<h1>Books</h1>

	<ul>
	<?php foreach ($resultset as $getItem) { ?>
		
		<li>
			<?php echo $getItem['bookname']; ?>
			<br>
		</li>

	<?php } ?>
	</ul>

	<h1><?php echo $getItem['bookname']; ?></h1>

	

</body>
</html>