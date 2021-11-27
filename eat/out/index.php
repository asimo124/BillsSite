<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$title = "";
$tag = 0;
$sort = "";
if (isset($_POST['btnSearch'])) {

    $title = isset($_POST['title']) ? trim($_POST['title']) : "";
    $tag = isset($_POST['tag']) ? trim($_POST['tag']) : 0;
    $sort = isset($_POST['sort']) ? trim($_POST['sort']) : "";

    if ($title) {
        $titleValue = $title;
        $title = '%' . $titleValue . '%';
    }
}

$orderBy = "r.title";
switch ($sort)
{
    case "title":
        $orderBy = "r.title";
        break;
    case "tag":
        $orderBy = "t.title";
        break;
}

$getWhereSql = "";
if ($title) {
    $getWhereSql .= "AND (r.title LIKE :title OR t.title LIKE :title)
    ";
}
if ($tag) {
    $getWhereSql .= "AND t.id = :tag 
    ";
}



$sql = "SELECT r.*, GROUP_CONCAT(t.title SEPARATOR '|') as tags
        FROM ote_restaurant r 
        LEFT JOIN ote_tag_relationship tr 
            ON r.id = tr.ref_table_id AND tr.ref_table = 'restaurant' 
        LEFT JOIN ote_tag t 
            ON tr.tag_id = t.id
        WHERE 1 
        $getWhereSql
        GROUP BY r.id 
        ORDER BY $orderBy ";

$dataParams = [];
if ($title) {
    $dataParams['title'] = $title;
}
if ($tag) {
    $dataParams['tag'] = $tag;
}

/*/
printArray([
    "sql" => $sql,
    "dataParams" => $dataParams
]);
die();
//*/


$restaurants = getQuery2($sql, $dataParams);
foreach ($restaurants as $index => $getRestaurant) {
    $restaurants[$index]['tags'] = explode("|", $getRestaurant['tags']);
}

//*/
$orderBy = "d.title";
switch ($sort)
{
    case "title":
        $orderBy = "d.title";
        break;
    case "tag":
        $orderBy = "t.title";
        break;
}

$getWhereSql = "";
if ($title) {
    $getWhereSql .= "AND (d.title LIKE :title OR t.title LIKE :title OR r.title LIKE :title) 
    ";
}
if ($tag) {
    $getWhereSql .= "AND t.id = :tag 
    ";
}

$sql = "SELECT d.title as dish, r.title as restaurant, GROUP_CONCAT(t.title SEPARATOR '|') as tags
        FROM ote_dish d
        LEFT JOIN ote_restaurant r 
            ON d.restaurant_id = r.id 
        LEFT JOIN ote_tag_relationship tr 
            ON d.id = tr.ref_table_id AND tr.ref_table = 'dish'
        LEFT JOIN ote_tag t 
            ON tr.tag_id = t.id
        WHERE 1
        $getWhereSql
        GROUP BY d.id 
        ORDER BY $orderBy ";

$dataParams = [];
if ($title) {
    $dataParams['title'] = $title;
}
if ($tag) {
    $dataParams['tag'] = $tag;
}

/*/
printArray([
    "sql" => $sql,
    "dataParams" => $dataParams
]);
die();
//*/

$dishes = getQuery2($sql, $dataParams);
foreach ($dishes as $index => $getDish) {
    $dishes[$index]['tags'] = explode("|", $getDish['tags']);
}


$sql = "SELECT * 
        FROM ote_tag 
        ORDER BY title ";
$tags = getQuery2($sql);
//*/

?>
<!DOCTYPE html>
<html>
<head>
    <title>Charge Catgories</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="/css/bills_admin.css" />
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h2>Eating Out</h2>

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav3.php"; ?>
    <div style="clear: both; height: 7px"></div>

    <div style="clear: both; height: 15px;"></div>
    <form action="index.php" method="POST" >
        <div class="row">
            <div class="col-md-3 col-xs-6">
                <input type="text" class="form-control" name="title" id="title" value="<?= $titleValue ?>" placeholder="Keyword Search" />
            </div>
            <div class="col-md-2 col-xs-6">
                <select name="tag" id="tag" class="form-control" width="100%">
                    <option value="" > - Select Tag - </option>
                    <?php foreach ($tags as $getTag): ?>
                        <option value="<?= $getTag['id'] ?>" <?= ($getTag['id'] == $tag) ? "SELECTED" : "" ?>><?= $getTag['title'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-2 col-xs-6">
                <select name="sort" id="sort" class="form-control" width="100%">
                    <option value="" > - Select Sort 1 - </option>
                    <option value="title" <?php echo ($sort == "title") ? "SELECTED" : ""; ?>>Title</option>
                    <option value="tag" <?php echo ($sort == "tag") ? "SELECTED" : ""; ?>>Tag</option>
                </select>
            </div>
            <div class="col-md-2 col-xs-6">
                <button type="submit" class="btn btn-primary" name="btnSearch">Search</button>&nbsp;
                <button type="button" class="btn btn-default" name="btnClear" id="btnClear">Clear</button>
            </div>
        </div>

        <div style="clear: both; height: 7px;"></div>
    </form>

    <div class="row">
        <div class="col-md-6">
            <h3>Restaurants</h3>
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>Restaurant</th>
                    <th>Tags</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($restaurants as $getRestaurant) : ?>
                    <tr>
                        <td><?php echo $getRestaurant['title']; ?></td>
                        <td>
                            <?php foreach ($getRestaurant['tags'] as $getTag) : ?>
                                <span class="badge badge-info"><?= $getTag ?></span>
                            <?php endforeach; ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
        <div class="col-md-6">
            <h3>Dishes</h3>
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>Dish</th>
                    <th>Restaurant</th>
                    <th>Tags</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($dishes as $getDish) : ?>
                    <tr>
                        <td><?php echo $getDish['dish']; ?></td>
                        <td><?php echo $getDish['restaurant']; ?></td>
                        <td>
                            <?php foreach ($getDish['tags'] as $getTag) : ?>
                                <span class="badge badge-info"><?= $getTag ?></span>
                            <?php endforeach; ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

    <form action="delete.php" name="frmDel" id="frmDel" method="post">
        <div class="modal fade" id="delBill">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Delete Bill</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you wish to delete this Bill?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" id="save_del_btn" data-id="">Delete</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="hidden" name="id" id="del_id" value="" />
                    </div>
                </div>
            </div>
        </div>
</div>

</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js" ></script>
<script>

    $(document).ready(function() {
        $('#btnClear').click(function() {
            console.log('did click btnClear');
            $('#title').val('').change();
            //$("#title").get(0).selectedIndex = 0;
            $('#tag').val('').change();
            $('#sort').val('').change();
        })
    })
</script>