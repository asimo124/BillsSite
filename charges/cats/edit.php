<?php
include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$ipArr = explode(".", $ip);
$userAgentArr = explode(" ", $user_agent);
$string_to_hash = $ip[1] . SALT2 . $userAgentArr[2] . SALT1 . $ip[3] . $userAgentArr[0];
$hash_key = md5($string_to_hash);

$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;

$sql = "SELECT * FROM vnd_bills_charge_categories WHERE id = :id ";
$Cats = getQuery($sql, [
    "id" => $id
]);
$Cat = array();
if (count($Cats) > 0) {
    $Cat = $Cats[0];
}

?>
<!DOCTYPE html>
<html>
<head>
    <title>Charge Catgories</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert <?php echo (isset($_REQUEST['error'])) ? "alert-danger" : "alert-success"; ?>" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <form class="form-horizontal" id="frmAddCat" action="proc_edit.php" method="post" >
        <fieldset>
            <!-- Form Name -->
            <legend>Edit Charge Category</legend>

            <a href="index.php" >Charge Categories</a>
            <div style="clear: both; height: 7px"></div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Category Name</label>
                <div class="col-md-4">
                    <input id="cat_name" name="cat_name" type="text" placeholder="Category Name" class="form-control input-md" value="<?php echo $Cat['cat_name']; ?>" />
                </div>
                <input type="hidden" name="id" id="id" value="<?php echo $id; ?>" />
            </div>
        </fieldset>
        <input type="hidden" name="hash_key_token_cs" id="hash_key_token_cs" value="<?php echo $hash_key; ?>" />
        <a href="javascript:void(0);" onclick="$('#frmAddCat').submit();" class="btn btn-primary">Update</a>
    </form>

</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>