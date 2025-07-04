<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}


$frequencyArr = [
    "Every 1 Week",
    "Every 2 Weeks",
    "Every 4 Weeks",
    "Once Per Month - Day of Month",
    "Once Per Month - Starting From",
    "Every 3 Months",
    "Once"
];

$searchFiltersRequestArr = [];
$searchFilersQueryStr = "";
$vndBill = "";
$sort1 = "bill";
$sort1_dir = "ASC";
$sort2 = "";
$sort2_dir = "";
$frequencyShow = [
    "Every 1 Week" => 0,
    "Every 2 Weeks" => 0,
    "Every 4 Weeks" => 0,
    "Once Per Month - Day of Month" => 0,
    "Once Per Month - Starting From" => 0,
    "Every 3 Months" => 0,
    "Once" => 0
];
$showAuditFields = 0;
if (isset($_REQUEST['btnSearch'])) {

    $vndBill = isset($_REQUEST['vnd_bill2']) ? $_REQUEST['vnd_bill2'] : "";
    $vndBill2 = str_replace("%", "", $vndBill);
    if ($vndBill) {
        $vndBill = '%' . $vndBill . '%';
    }
    $sort1 = isset($_REQUEST['sort1']) ? $_REQUEST['sort1'] : "bill";
    $sort1_dir = isset($_REQUEST['sort1_dir']) ? $_REQUEST['sort1_dir'] : "ASC";
    $sort2 = isset($_REQUEST['sort2']) ? $_REQUEST['sort2'] : "";
    $sort2_dir = isset($_REQUEST['sort2_dir']) ? $_REQUEST['sort2_dir'] : "";
    $frequencyShow = isset($_REQUEST['frequency']) ? $_REQUEST['frequency'] : [
        "Every 1 Week" => 1,
        "Every 2 Weeks" => 1,
        "Every 4 Weeks" => 1,
        "Once Per Month - Day of Month" => 1,
        "Once Per Month - Starting From" => 1,
        "Every 3 Months" => 1,
        "Once" => 1
    ];
    $showAuditFields = isset($_REQUEST['showAuditFields']) ? intval($_REQUEST['showAuditFields']) : 0;

    $searchFiltersRequestArr = [
        'vnd_bill2' => $vndBill,
        'sort1' => $sort1,
        'sort1_dir' => $sort1_dir,
        'sort2' => $sort2,
        'sort2_dir' => $sort2_dir,
        'frequency' => $frequencyShow,
        'btnSearch' => 1,
        'showAuditFields' => $showAuditFields
    ];
    $i = 0;
    foreach ($searchFiltersRequestArr as $key => $value) {

        if ($key != "frequency") {

            $value = (String)$value;
            if ($i == 0) {
                $searchFilersQueryStr = "$key=" . urlencode($value);
            } else {
                $searchFilersQueryStr .= "&$key=" . urlencode($value);
            }
        } else {

            foreach ($value as $getKey => $getValue) {

                $searchFilersQueryStr .= "&frequency[$getKey]=" . urlencode($getValue);
            }
        }
        $i++;
    }
}

$orderBy = "";
if ($sort1) {
    $orderBy = "ORDER BY ";
    switch ($sort1) {
        case "frequency":
            $orderBy .= "CAST(vnd_frequency_value AS unsigned) ";
            break;
        case "bill":
            $orderBy .= "vnd_bill ";
            break;
        case "amount":
            $orderBy .= "amount ";
            break;
        case "end_date":
            $orderBy .= "end_date ";
            break;
    }
    $orderBy .= $sort1_dir;
}
if ($sort2) {
    if (!$orderBy) {
        $orderBy = "ORDER BY ";
    } else {
        $orderBy .= ", ";
    }
    switch ($sort2) {
        case "frequency":
            $orderBy .= "CAST(vnd_frequency_value AS unsigned) ";
            break;
        case "bill":
            $orderBy .= "vnd_bill ";
            break;
        case "amount":
            $orderBy .= "amount ";
        case "end_date":
            $orderBy .= "end_date ";
            break;
    }
    $orderBy .= $sort2_dir;
}

$sql = "SELECT vnd_id, vnd_bill, amount, vnd_frequency, vnd_frequency_type, vnd_frequency_value, 
       vnd_frequency_value_original, is_heavy, watch_flag, end_date, audit_regex, audit_keyword1, audit_keyword2
        FROM vnd_bills 
        WHERE 1 
        AND vnd_frequency = :frequency ";
if ($vndBill) {
    $sql .= "AND vnd_bill LIKE :vnd_bill 
    ";
}
$sql .= $orderBy;

$stmt_sel_bills = $db_conn->prepare($sql);

$sql = "SELECT vnd_id, vnd_bill, amount, vnd_frequency, vnd_frequency_type, vnd_frequency_value,
       vnd_frequency_value_original, is_heavy, watch_flag, end_date, audit_regex, audit_keyword1, audit_keyword2
        FROM vnd_bills 
        WHERE 1 
        AND vnd_frequency = :frequency
        AND vnd_frequency_type = :frequency_type ";
if ($vndBill) {
    $sql .= "AND vnd_bill LIKE :vnd_bill 
    ";
}
$sql .= $orderBy;
$stmt_sel_bills_type = $db_conn->prepare($sql);

$resulset = [];
foreach ($frequencyArr as $getFrequency) {

    if ($frequencyShow[$getFrequency] || !isset($_POST['btnSearch'])) {

        if (strpos($getFrequency, " - ") === false) {

            $sql = "SELECT vnd_id, vnd_bill, amount, vnd_frequency, vnd_frequency_type, vnd_frequency_value, 
       vnd_frequency_value_original, is_heavy, watch_flag, end_date, audit_regex, audit_keyword1, audit_keyword2
            FROM vnd_bills 
            WHERE 1 
            AND vnd_frequency = :frequency ";
            if ($vndBill) {
                $sql .= "AND vnd_bill LIKE :vnd_bill 
                ";
            }
            $sql .= $orderBy;
            $dataParams = [
                "frequency" => $getFrequency
            ];
            if ($vndBill) {
                $dataParams["vnd_bill"] = $vndBill;
            }

            /*/
            printArray([
                    "sql" => $sql,
                    "dataParams" => $dataParams
            ]);
            //*/

            $stmt_sel_bills->execute($dataParams);
            $items = $stmt_sel_bills->fetchAll(2);

        } else {

            $frequencyArr = explode(" - ", $getFrequency);

            $sql = "SELECT vnd_id, vnd_bill, amount, vnd_frequency, vnd_frequency_type, vnd_frequency_value_original, 
       vnd_frequency_value, is_heavy, watch_flag, end_date, audit_regex, audit_keyword1, audit_keyword2
                    FROM vnd_bills 
                    WHERE 1 
                    AND vnd_frequency = :frequency
                    AND vnd_frequency_type = :frequency_type ";
            if ($vndBill) {
                $sql .= "AND vnd_bill LIKE :vnd_bill 
                ";
            }
            $sql .= $orderBy;
            $dataParams = [
                "frequency" => $frequencyArr[0],
                "frequency_type" => $frequencyArr[1]
            ];
            if ($vndBill) {
                $dataParams["vnd_bill"] = $vndBill;
            }

            /*/
            printArray([
                "sql" => $sql,
                "dataParams" => $dataParams
            ]);
            //*/

            $stmt_sel_bills_type->execute($dataParams);
            $items = $stmt_sel_bills_type->fetchAll(2);
        }
        if (count($items) > 0) {
            $resultset[$getFrequency] = $items;
        }
    }
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

    <h2>Bills</h2>

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 7px"></div>

    <div class="row">
        <div class="col-md-12">
            <a href="add.php?<?= $searchFilersQueryStr ?>" class="btn btn-primary">Create Bill</a>
        </div>
    </div>
    <div style="clear: both; height: 12px"></div>


    <div style="clear: both; height: 15px;"></div>
    <form action="index.php" method="POST" >
        <div class="row">
            <div class="col-md-3 col-xs-6">
                <input type="text" class="form-control" name="vnd_bill2" value="<?php echo $vndBill2; ?>" placeholder="Bill Name" />
            </div>
            <div class="col-md-2 col-xs-6">
                <select name="sort1" class="form-control" width="100%">
                    <option value="" > - Select Sort 1 - </option>
                    <option value="bill" <?php echo ($sort1 == "bill") ? "SELECTED" : ""; ?>>Bill Name</option>
                    <option value="frequency" <?php echo ($sort1 == "frequency") ? "SELECTED" : ""; ?>>Frequency</option>
                    <option value="amount" <?php echo ($sort1 == "amount") ? "SELECTED" : ""; ?>>Amount</option>
                    <option value="end_date" <?php echo ($sort1 == "end_date") ? "SELECTED" : ""; ?>>End Date</option>
                </select>
            </div>
            <div class="col-md-2 col-xs-6">
                <select name="sort1_dir" class="form-control" width="100%">
                    <option value="ASC" >ASC</option>
                    <option value="DESC" <?php echo ($sort1_dir == "DESC") ? "SELECTED" : ""; ?>>DESC</option>
                </select>
            </div>
            <div class="col-md-2 col-xs-6">
                <select name="sort2" class="form-control" width="100%">
                    <option value="" > - Select Sort 2 - </option>
                    <option value="bill" <?php echo ($sort2 == "bill") ? "SELECTED" : ""; ?>>Bill Name</option>
                    <option value="frequency" <?php echo ($sort2 == "frequency") ? "SELECTED" : ""; ?>>Frequency</option>
                    <option value="amount" <?php echo ($sort2 == "amount") ? "SELECTED" : ""; ?>>Amount</option>
                    <option value="end_date" <?php echo ($sort2 == "end_date") ? "SELECTED" : ""; ?>>End Date</option>
                </select>
            </div>
            <div class="col-md-2 col-xs-6">
                <select name="sort2_dir" class="form-control" width="100%">
                    <option value="ASC" >ASC</option>
                    <option value="DESC" <?php echo ($sort2_dir == "DESC") ? "SELECTED" : ""; ?>>DESC</option>
                </select>
            </div>

        </div>

        <div style="clear: both; height: 15px;"></div>
        <div class="row">
            <div class="col-md-2 col-xs-6">
                <input class="form-check-input" type="checkbox" value="1" name="showAuditFields"
                       id="showAuditFields" <?php echo ($showAuditFields) ? "CHECKED" : ""; ?>>
                <label class="form-check-label" for="checkDefault" >
                Show Audit Fields
                </label>
            </div>
        </div>
        <div style="clear: both; height: 15px;"></div>
        <div class="row">
            <div class="col-md-2 filter-cols">
                <input
                        type="checkbox"
                        name="checkAll"
                        id="checkAll"
                        CHECKED
                        value="1"
                />&nbsp;Check All
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 filter-cols">
                <input
                        type="checkbox"
                        name="frequency[Once Per Month - Day of Month]"
                        value="1"
                    <?php echo ($frequencyShow['Once Per Month - Day of Month'] || !isset($_POST['btnSearch'])) ? "CHECKED" : ""; ?>
                />&nbsp;Once Per Month - Day of Month
            </div>
            <div class="col-md-2 filter-cols">
                <input
                        type="checkbox"
                        name="frequency[Once]"
                        value="1"
                    <?php echo ($frequencyShow['Once'] || !isset($_POST['btnSearch'])) ? "CHECKED" : ""; ?>
                />&nbsp;Once
            </div>
            <div class="col-md-2 filter-cols">
                <input
                    type="checkbox"
                    name="frequency[Every 1 Week]"
                    value="1"
                    <?php echo ($frequencyShow['Every 1 Week'] || !isset($_POST['btnSearch'])) ? "CHECKED" : ""; ?>
                />&nbsp;Every 1 Week
            </div>
            <div class="col-md-2 filter-cols">
                <input
                    type="checkbox"
                    name="frequency[Every 2 Weeks]"
                    value="1"
                    <?php echo ($frequencyShow['Every 2 Weeks'] || !isset($_POST['btnSearch'])) ? "CHECKED" : ""; ?>
                />&nbsp;Every 2 Weeks
            </div>
            <div class="col-md-2 filter-cols">
                <input
                    type="checkbox"
                    name="frequency[Every 4 Weeks]"
                    value="1"
                    <?php echo ($frequencyShow['Every 4 Weeks'] || !isset($_POST['btnSearch'])) ? "CHECKED" : ""; ?>
                />&nbsp;Every 4 Weeks
            </div>
            <div class="col-md-2 filter-cols">
                <input
                    type="checkbox"
                    name="frequency[Once Per Month - Starting From]"
                    value="1"
                    <?php echo ($frequencyShow['Once Per Month - Starting From'] || !isset($_POST['btnSearch'])) ? "CHECKED" : ""; ?>
                />&nbsp;Once Per Month - Starting From
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 filter-cols">
                <input
                        type="checkbox"
                        name="frequency[Every 3 Months]"
                        value="1"
                    <?php echo ($frequencyShow['Every 3 Months'] || !isset($_POST['btnSearch'])) ? "CHECKED" : ""; ?>
                />&nbsp;Every 3 Months
            </div>
        </div>
        <button type="submit" class="btn btn-primary" name="btnSearch">Search</button>
        <div style="clear: both; height: 7px;"></div>
    </form>

    <div style="clear: both; height: 16px;"></div>
    <form action="proc_audit.php?<?= $searchFilersQueryStr ?>" method="POST" >
        <div class="row">
            <div class="col-md-12">
                <button type="submit" class="btn btn-primary">Update Audit Fields</button>
            </div>
        </div>
        <div style="clear: both; height: 8px;"></div>
        <div class="row">
            <div class="col-md-12">
                <?php foreach ($resultset as $frequency => $bills) : ?>
                    <h3><?php echo $frequency; ?></h3>
                    <table class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Bill</th>
                        <?php if (!$showAuditFields) : ?>
                            <th>Amount</th>
                            <th>Frequency</th>
                            <th colspan="2">Frequency Info</th>
                            <th>End Date</th>
                        <?php else: ?>
                             <th>Audit Regex</th>
                             <th>Audit Keyword1</th>
                             <th>Audit Keyword2</th>
                        <?php endif; ?>
                        <th colspan="4">Actions</th>
                    </tr>
                    </thead>
                    <tbody>

                    <?php foreach ($bills as $getBill) { ?>
                        <tr>
                            <td><?php echo $getBill['vnd_id']; ?></td>
                            <td>
                                <span style="font-weight: bold; <?php echo (($getBill['watch_flag']) ? "color: orange;" : (($getBill['is_heavy']) ? "color: red; " : "")); ?>"><?php echo $getBill['vnd_bill']; ?></span>
                            </td>
                            <?php if (!$showAuditFields): ?>
                                <td><?php echo formatCurrency($getBill['amount']); ?></td>
                                <td><?php echo $getBill['vnd_frequency']; ?></td>
                                <?php if ($getBill['vnd_frequency_type'] != "Day of Month") : ?>
                                    <td colspan="2"><?php echo $getBill['vnd_frequency_type']; ?>&nbsp(<?php echo $getBill['vnd_frequency_value']; ?>)</td>
                                <?php else : ?>
                                    <td><?php echo $getBill['vnd_frequency_value_original']; ?></td>
                                    <td><?php echo $getBill['vnd_frequency_value']; ?></td>
                                <?php endif; ?>
                                <td><?php echo ($getBill['end_date'] != "0000-00-00" ? $getBill['end_date'] : ""); ?></td>
                            <?php else: ?>
                                <td>
                                    <input type="text" class="form-control" name="audit_regex[<?php echo $getBill['vnd_id']; ?>]"
                                           value="<?php echo $getBill['audit_regex']; ?>" placeholder="Regex" />
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="audit_keyword1[<?php echo $getBill['vnd_id']; ?>]"
                                           value="<?php echo $getBill['audit_keyword1']; ?>" placeholder="Keyword1" />
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="audit_keyword2[<?php echo $getBill['vnd_id']; ?>]"
                                           value="<?php echo $getBill['audit_keyword2']; ?>" placeholder="Keyword2" />
                                </td>
                            <?php endif; ?>
                            <td><a href="edit.php?id=<?php echo $getBill['vnd_id']; ?>&<?= $searchFilersQueryStr ?>" class="btn btn-primary">Edit</a></td>
                            <td>
                                <?php if (!$getBill['is_heavy']) : ?>
                                    <a href="mark_heavy.php?id=<?php echo $getBill['vnd_id']; ?>&action=mark&<?= $searchFilersQueryStr ?>" class="btn btn-primary">Mark Heavy</a>
                                <?php else : ?>
                                    <a href="mark_heavy.php?id=<?php echo $getBill['vnd_id']; ?>&action=unmark&<?= $searchFilersQueryStr ?>" class="btn btn-primary">Un-Mark Heavy</a>
                                <?php endif; ?>
                            </td>
                            <td>
                                <?php if (!$getBill['watch_flag']) : ?>
                                    <a href="mark_watch_flag.php?id=<?php echo $getBill['vnd_id']; ?>&action=mark&<?= $searchFilersQueryStr ?>" class="btn btn-primary">Mark Watched</a>
                                <?php else : ?>
                                    <a href="mark_watch_flag.php?id=<?php echo $getBill['vnd_id']; ?>&action=unmark&<?= $searchFilersQueryStr ?>" class="btn btn-primary">Un-Mark Watched</a>
                                <?php endif; ?>
                            </td>
                            <td><a class="btn btn-primary del_btn" data-id="<?php echo $getBill['vnd_id']; ?>" data-toggle="modal" data-target="#delBill">Delete</a></td>
                        </tr>
                    <?php } ?>

                    </tbody>
                </table>
                <?php endforeach; ?>
            </div>
        </div>
    </form>

    <form action="delete.php?<?= $searchFilersQueryStr ?>" name="frmDel" id="frmDel" method="post">
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
        $('.del_btn').click(function() {
            $('#del_id').val($(this).attr("data-id"));
        })

        $('#checkAll').click(function() {
            if ($(this).prop('checked')) {
                $('[name^="frequency"]').prop('checked', true);
            } else {
                $('[name^="frequency"]').prop('checked', false);
            }
        })
    })
</script>