<?php
//ini_set("display_errors", 1);
include "../../inc/includes.php";

/*/
if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}
//*/

$sql = "SELECT cat.id, cat.category_name 
        FROM res_categories cat 
        INNER JOIN res_places pl 
          ON cat.id = pl.category_id
        GROUP BY cat.id 
        ORDER BY cat.category_name ";
$Categories = getQuery($sql);

$sql = "SELECT pl.* 
        FROM res_places pl 
        WHERE pl.category_id = :category_id 
        ORDER BY pl.place_name  ";
$stmt_sel_places = $db_conn->prepare($sql);

$resultset = array();
foreach ($Categories as $index => $getCat) {
    $stmt_sel_places->execute([
        "category_id" => $getCat['id']
    ]);
    $Places = $stmt_sel_places->fetchAll(PDO::FETCH_ASSOC);
    foreach ($Places as $getPlace) {
        $resultset[$getCat['category_name']][] = $getPlace;
    }
}

$ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$ipArr = explode(".", $ip);
$userAgentArr = explode(" ", $user_agent);
$string_to_hash = $ip[1] . SALT2 . $userAgentArr[2] . SALT1 . $ip[3] . $userAgentArr[0];
$hash_key = md5($string_to_hash);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Places to Eat</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <style type="text/css">

        .table-striped>tbody>tr:nth-child(odd)>td, .table-striped>tbody>tr:nth-child(odd)>th {
            background-color: inherit;
        }
    </style>
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <h2>Places to Eat</h2>

    <div style="clear: both; height: 7px"></div>

    <div class="row">
        <div class="col-md-12">
            <a href="add.php" class="btn btn-primary">Add Restaurant</a>
        </div>
    </div>
    <div style="clear: both; height: 12px"></div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th >Place</th>
                    <th colspan="1">Actions</th>
                </tr>
                </thead>
                <tbody>
                <?php if (count($resultset) > 0) { ?>
                    <?php foreach ($resultset as $catName => $places) { ?>
                        <tr style="background-color: #bce8f1; color: #000;">
                            <td colspan="2"><strong></strong><?php echo $catName; ?></strong></td>
                        </tr>
                        <?php foreach ($places as $getPlace) { ?>
                            <tr>
                                <td >
                                    &nbsp; &nbsp; <a href="<?php echo (($getPlace['google_link']) ? $getPlace['google_link'] : "#"); ?>" target="_blank" ><?php echo $getPlace['place_name']; ?></a>
                                    <?php /**/ ?>

                                </td>
                                <td>
                                    <a class="btn btn-primary edit_btn" href="edit.php?id=<?php echo $getPlace['id']; ?>" >Edit</a>&nbsp; <a class="btn btn-default del_btn" data-id="<?php echo $getPlace['id']; ?>" data-toggle="modal" data-target="#delBill">Delete</a>
                                </td>
                            </tr>
                        <?php } ?>
                    <?php } ?>
                <?php } else { ?>
                    <tr>
                        <td colspan="3" align="center">No Restaurants to Show</td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>

    <form action="delete.php" name="frmDel" id="frmDel" method="post">
        <div class="modal fade" id="delBill">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Delete Restaurant</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you wish to delete this Restaurant?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" id="save_del_btn" data-id="">Delete</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="hidden" name="id" id="del_id" value="" />
                        <input type="hidden" name="hash_key_token_cs" id="hash_key_token_cs" value="<?php echo $hash_key; ?>" />
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
        $('.del_btn').click(function() {
            $('#del_id').val($(this).attr("data-id"));
        })
    })
</script>