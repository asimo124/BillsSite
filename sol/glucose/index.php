<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

/*/
if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}
//*/

$sql = "SELECT * FROM glu_glucose_log ORDER BY date_taken DESC LIMIT 30 ";
$resultset = getQuery($sql);

$ip = $_SERVER['REMOTE_ADDR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$ipArr = explode(".", $ip);
$userAgentArr = explode(" ", $user_agent);
$string_to_hash = $ip[1] . SALT2 . $userAgentArr[2] . SALT1 . $ip[3] . $userAgentArr[0];
$hash_key = md5($string_to_hash);

function isMorning($date2) {
    $date3 = intval(date("H", strtotime($date2)));
    if ($date3 <= 11) {
        return true;
    } else {
        return false;
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Glucose Log</title>
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

    <h2>Glucose Level Log</h2>

    <div style="clear: both; height: 7px"></div>

    <a href="chart.php" class="btn btn-primary" >Chart</a>
    <div style="clear: both; height: 7px"></div>

    <div class="row">
        <div class="col-md-12">
            <a href="add.php" class="btn btn-primary">Add Log</a>
        </div>
    </div>
    <div style="clear: both; height: 12px"></div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>Date</th>
                    <th>Level</th>
                    <th colspan="1">Actions</th>
                </tr>
                </thead>
                <tbody>
                <?php if (count($resultset) > 0) { ?>
                    <?php foreach ($resultset as $getLog) { ?>
                        <tr style="background-color: <?php echo isMorning($getLog['date_taken']) ? "#fcc480" : "#72dbff"; ?>">
                            <td><?php echo date("m/d/Y @ g:i A", strtotime($getLog['date_taken'])); ?></td>
                            <td><?php echo $getLog['level']; ?></td>
                            <?php /*<td><a href="edit.php?id=<?php echo $getLog['vnd_id']; ?>" class="btn btn-primary">Edit</a></td>*/ ?>
                            <td><a class="btn btn-primary edit_btn" href="view.php?id=<?php echo $getLog['id']; ?>" >View</a>&nbsp; <a class="btn btn-default del_btn" data-id="<?php echo $getLog['id']; ?>" data-toggle="modal" data-target="#delBill">Delete</a></td>
                        </tr>
                    <?php } ?>
                <?php } else { ?>
                    <tr>
                        <td colspan="3" align="center">No Glucose Logs to Show</td>
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
                        <h5 class="modal-title">Delete Log</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you wish to delete this Log?</p>
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