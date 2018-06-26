<?php
    include "../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$date3ago = date("Y-m-d", strtotime("- 3 month"));

$sql = "SELECT *
        FROM vnd_bills_charges
        WHERE date >= :date3ago AND ifnull(category_id, '') = ''
        ORDER BY date DESC, description";

$resultset2 = getQuery($sql, [
    "date3ago" => $date3ago
]);

$resultset = array();
foreach ($resultset2 as $getItem2) {
    if (!isset($getItem[$getItem2['date']])) {
        $getItem[$getItem2['date']] = array();
    }
    $resultset[$getItem2['date']][] = $getItem2;
}

$sql = "SELECT * FROM vnd_bills_charge_categories ORDER BY cat_name ";
$categories = getQuery($sql);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Charges</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/css/nav.css" />

</head>
<body>
<div class="container">
    <div style="clear: both; height: 20px;" ></div>
    <h1>Categorize Charges</h1>
    <div style="clear: both; height: 20px;" ></div>

    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>

    <?php include "../templates/nav.php"; ?>
    <div style="clear: both; height: 7px"></div>
    
    <div class="row">
        <div class="col-md-5">
            <form action="proc_update_desc_cats.php" name="frmDescCat" id="frmDescCat" method="post" >
                Like String
                <div style="clear: both; height: 4px"></div>
                <input type="text" name="desc" id="desc" class="form-control"/>
                <div style="clear: both; height: 7px"></div>

                Category
                <div style="clear: both; height: 4px"></div>
                <select name="category_id" id="get_category_id" class="form-control" >
                    <?php foreach ($categories as $getCat) { ?>
                        <option value="<?php echo $getCat['id']; ?>" ><?php echo $getCat['cat_name']; ?></option>
                    <?php } ?>
                </select>
                <div style="clear: both; height: 7px"></div>

                Min range
                <div style="clear: both; height: 4px"></div>
                <input type="text" name="min_range" id="min_range" class="form-control"/>
                <div style="clear: both; height: 7px"></div>

                Max range
                <div style="clear: both; height: 4px"></div>
                <input type="text" name="max_range" id="max_range" class="form-control"/>
                <div style="clear: both; height: 7px"></div>

                <a href="javascript:void(0);" id="btnUpdateDescCat" class="btn btn-primary" onclick="$('#frmDescCat').submit();" >Save Desc Categories</a>
                <div style="clear: both; height: 22px"></div>

                <a href="javascript:void(0);" id="btnUpdateAll" class="btn btn-primary" >Update All</a>&nbsp; <a href="javascript:void(0);" id="btnTruncateCharges" class="btn btn-danger" >Truncate Charges</a>
                <div style="clear: both; height: 22px"></div>
            </form>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>Desc</th>
                    <th>Amount</th>
                    <th >Actions</th>
                </tr>
                </thead>
                <tbody>
                <?php if (count($resultset) > 0) { ?>
                    <?php foreach (array_keys($resultset) as $date) { ?>
                        <tr style="background-color: #91e6ea;">
                            <td colspan="3" style="background-color: #91e6ea;"><?php echo date("m/d", strtotime($date)); ?></td>
                        </tr>
                        <?php foreach ($resultset[$date] as $getCharge) { ?>
                            <tr>
                                <td><?php echo $getCharge['description']; ?></td>
                                <td><?php echo $getCharge['charge']; ?></td>
                                <td>
                                    <select name="category_id<?php echo $getCharge['id']; ?>" id="category_id<?php echo $getCharge['id']; ?>" data-id="<?php echo $getCharge['id']; ?>" class="form-control" >
                                        <option value="" >- Select One -</option>
                                        <?php foreach ($categories as $getCat) { ?>
                                            <option value="<?php echo $getCat['id']; ?>" ><?php echo $getCat['cat_name']; ?></option>
                                        <?php } ?>
                                    </select>
                                </td>
                            </tr>
                        <?php } ?>
                    <?php } ?>
                <?php } else { ?>
                    <tr>
                        <td colspan="2" align="center">No Charges to Show</td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/nav.js" ></script>
<script>

    $(document).ready(function() {
        $('#btnUpdateAll').click(function() {
            var data = {
                "category_id": [],
                "id": []
            };
            var query_str = "";
            $('[id^="category_id"]').each(function() {

                if ($(this).val() != "") {
                    if (query_str) {
                        query_str += "&category_id[]=" + $(this).val() + "&id[]=" + $(this).attr("data-id");
                    } else {
                        query_str += "category_id[]=" + $(this).val() + "&id[]=" + $(this).attr("data-id");
                    }
                }
            })
            if (query_str) {
                $.ajax({
                    type: "POST",
                    url: "proc_update_all.php",
                    data: query_str,
                    success: function (r) {
                        alert("Categories updated.");
                        setTimeout(function() {
                            window.location.reload();
                        }, 3500);
                    }
                });
            } else {
                alert("No Category ID's set");
            }
        })

        $('#btnTruncateCharges').click(function() {

            var retVal = confirm("Are you sure you wish to truncate all charges?");
            if (retVal) {

                $.ajax({
                    type: "POST",
                    url: "truncate_charges.php",
                    success: function (r) {
                        alert("Charges truncated.");
                        setTimeout(function() {
                            window.location.reload();
                        }, 3500);
                    }
                });
            }
        })
    })
</script>
