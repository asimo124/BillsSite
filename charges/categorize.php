<?php
    include "../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
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

    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/css/alertify.min.css"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/css/themes/default.min.css"/>

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

                <style type="text/css">

                    .float{
                        position:fixed;
                        bottom:40px;
                        right:40px;
                        color:#FFF;
                        box-shadow: 2px 2px 3px #999;
                    }

                </style>

                <a href="javascript:void(0);" id="btnTruncateCharges" class="btn btn-danger" >Truncate Charges</a>

                <a href="javascript:void(0);" id="btnUpdateAll" class="btn btn-primary float" >Update All</a>&nbsp;



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
                    <th>Charge</th>
                    <th>Credit</th>
                    <th >Actions</th>
                </tr>
                </thead>
                <tbody class="show_charges">

                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/alertify.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js" ></script>
<script src="/js/nav.js" ></script>
<script>

    $(document).ready(function() {
        var loadCharges = function() {
            $.ajax({
                type: "GET",
                url: "/api/load_charges.php",
                dataType: "JSON",
                success: function (data) {
                    var resultset = data.resultset;
                    var categories = data.categories;
                    var content = '';
                    if (Object.keys(resultset).length > 0) {
                        $.each(resultset, function (date, getItem) {
                            var formattedDate = new Date(date);
                            showDate = moment(formattedDate).format("MMM-DD");
                            content += '<tr style="background-color: #91e6ea;">' +
                                '<td colspan="4" style="background-color: #91e6ea;">' + showDate + '</td>' +
                                '</tr>';
                            $.each(getItem, function (index, getCharge) {
                                content += '<tr>' +
                                    '<td>' + getCharge.description + '</td>' +
                                    '<td><input type="text" name="charge" id="charge" ' +
                                    'class="form-control charge_text" ' +
                                    'value="' + getCharge.charge + '" /></td>' +
                                    '<td>' +
                                    '<input type="text" name="credit" id="credit" ' +
                                    'class="form-control charge_text" value="" /></td>' +
                                    '<td>';
                                if (getCharge.charge) {
                                    content += '<select name="category_id' + getCharge.id + '" ' +
                                        'id="category_id' + getCharge.id + '" ' +
                                        'data-id="' + getCharge.id + '" class="form-control" >' +
                                        '<option value="" >- Select One -</option>';
                                    $.each(categories, function (catIndex, getCat) {
                                        content += '<option value="' + getCat.id + '" >' +
                                            getCat.cat_name + '</option>';
                                    })
                                    content += '</select>';
                                }
                                content += '</td>' +
                                    '</tr>';
                            });
                        })
                    } else {
                        content += '<tr>' +
                            '<td colspan="4" align="center">No Charges to Show</td>' +
                            '</tr>'
                    }
                    $('.show_charges').html(content);
                }
            });
        };

        loadCharges();

        var updateChargeCategories = function() {
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
                        alertify.alert("Charges categorized.");
                        loadCharges();
                    }
                });
            } else {
                alertify.alert("No Category ID's set");
            }
        }

        $('#btnUpdateAll').click(function() {
            updateChargeCategories();
        })

        $( function () {
            $.fn.onEnter = function(func) {
                this.bind('keypress', function(e) {
                    if (e.keyCode == 13) func.apply(this, [e]);
                });
                return this;
            };
        });

        $( function () {
            $('.charge_text').each(function() {
                $(this).onEnter(function () {
                    updateChargeCategories()
                });
            });
        });

        $('#btnTruncateCharges').click(function() {

            var retVal = confirm("Are you sure you wish to truncate all charges?");
            if (retVal) {

                $.ajax({
                    type: "POST",
                    url: "truncate_charges.php",
                    success: function (r) {
                        alertify.alert("Charges truncated.");
                        loadCharges();
                    }
                });
            }
        });
    })
</script>
