<?php
include "../../inc/includes.php";

/*/
if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}
//*/

$Categories = getQuery("SELECT * FROM res_categories ORDER BY category_name");

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
    <title>Add Restaurant</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" href="/css/bootstrap-timepicker.min.css" />
</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert <?php echo (isset($_REQUEST['error'])) ? "alert-danger" : "alert-success"; ?>" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <form class="form-horizontal" id="frmAddBill" action="proc_add.php" method="post" >
        <fieldset>
            <!-- Form Name -->
            <legend>Add Restaurant</legend>

            <div style="clear: both; height: 7px"></div>

            <a href="index.php" >Back</a>
            <div style="clear: both; height: 7px;" ></div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Restaurant Name</label>
                <div class="col-md-4">
                    <input id="place_name" name="place_name" type="text" placeholder="Restaurant Name" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Category</label>
                <div class="col-md-4">
                    <select name="category_id" id="category_id" class="form-control input-md">
                        <option value="" > - Select One - </option>
                        <?php foreach ($Categories as $getCat) { ?>
                            <option value="<?php echo $getCat['id']; ?>"><?php echo $getCat['category_name']; ?></option>
                        <?php } ?>
                        <option value="-1" >Other</option>
                    </select>
                </div>
            </div>
            <div class="form-group other_cat" style="display: none;">
                <label class="col-md-4 control-label" for="textinput">Other Category</label>
                <div class="col-md-4">
                    <input id="other_category" name="other_category" type="text" placeholder="Other Category" class="form-control input-md" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Google Link</label>
                <div class="col-md-4">
                    <input id="google_link" name="google_link" type="text" placeholder="Google Link" class="form-control input-small" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Close and Easy</label>
                <div class="col-md-4">
                    <input id="close_easy" name="close_easy" type="checkbox" value="1"/>&nbsp;Is Close and Easy
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Sol Likes It</label>
                <div class="col-md-4">
                    <input id="sol_likes" name="sol_likes" type="checkbox" value="1"/>&nbsp;Sol Likes It
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Alex Likes It</label>
                <div class="col-md-4">
                    <input id="alex_likes" name="alex_likes" type="checkbox" value="1"/>&nbsp;Alex Likes It
                </div>
            </div>
        </fieldset>
        <a href="javascript:void(0);" onclick="$('#frmAddBill').submit();" class="btn btn-primary">Add Place</a>
        <input type="hidden" name="hash_key_token_cs" id="hash_key_token_cs" value="<?php echo $hash_key; ?>" />
    </form>

</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/js/bootstrap-timepicker.min.js" ></script>
<script src="/js/nav.js" ></script>
<script>

    $(document).ready(function() {

        //$('#date_taken').datepicker({});
        //$('#time_taken').timepicker();

        $('#category_id').change(function() {
            if ($(this).val() == "-1") {
                $('.other_cat').show();
            } else {
                $('.other_cat').hide();
            }
        })
    })

</script>