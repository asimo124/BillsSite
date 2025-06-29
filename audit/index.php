<?php
	include "../inc/includes.php";
	include "../inc/Bills.php";

if (!isset($_SESSION['user'])) {
	header("Location: /login.php");
	exit;
}

$hasChaseData = file_exists("spreadsheet/chase_data.csv");

if (isset($_POST['btnClearFile'])) {

    unlink("spreadsheet/chase_data.csv");
    $hasChaseData = false;
}

$timestamp = date("Y-m-d_H-i-s");
$didSaveFile = false;
$items = [];
if ($hasChaseData) {

    $flaggedData = [];
    $billData = [];
    if (isset($_POST['btnSubmitCsv'])) {

        $selExpenseItems = isset($_POST['selExpenseItem']) ? $_POST['selExpenseItem'] : [];
        $descItems = isset($_POST['desc']) ? $_POST['desc'] : [];
        $amountItems = isset($_POST['amount']) ? $_POST['amount'] : [];

        $chkFlaggedItems = isset($_POST['chkFlagged']) ? $_POST['chkFlagged'] : [];

        foreach ($selExpenseItems as $index => $vndId) {

            $desc = $descItems[$index];
            $amount = $amountItems[$index];
            $key = $desc . '~' . $amount;

            if ($vndId) {
                $billData[$key] = $vndId;
            }
            $flaggedData[$key] = $chkFlaggedItems[$index];
        }
    }

    $i = 0;
    $items = [];
    $fh = fopen("spreadsheet/chase_data.csv", 'r');
    while ($row = fgetcsv($fh)) {

        if ($i == 0) {
            $i++;
            continue;
        }

        if (trim($row[0])) {
            $eachItem = [];
            $eachItem['date'] = $row[0];
            $eachItem['desc'] = $row[1];
            $eachItem['type'] = $row[2];
            $eachItem['amount'] = $row[3];
            $eachItem['vnd_id'] = 0;
            $items[] = $eachItem;
        }
        $i++;
    }

    $sql = "SELECT vnd_id, CONCAT(vnd_bill, ' - $', amount) AS vnd_bill, vnd_frequency_value, audit_regex, audit_keyword1, audit_keyword2
            FROM vnd_bills 
            WHERE 1 
            AND vnd_frequency = 'Once Per Month' 
            ORDER BY vnd_bill";

    $stmt_sel_bills = $db_conn->prepare($sql);
    $stmt_sel_bills->execute();
    $bills = $stmt_sel_bills->fetchAll(2);

    $billsArr = [];
    $billDescArr = [];
    foreach ($bills as $getItem) {

        $vndId = $getItem['vnd_id'];
        $auditKeyword1 = trim($getItem['audit_keyword1']);

        if ($auditKeyword1) {
            $billDescArr[$auditKeyword1] = $vndId;
        }
        $billsArr[$vndId] = $getItem;
    }

    foreach ($items as $index => $getItem) {

        $desc = $getItem['desc'];
        $amount = $getItem['amount'];
        $key = $desc . "~" . $amount;

        $items[$index]['expense'] = [
            'vnd_id' => 0,
            'vnd_bill' => '',
            'amount' => 0,
            'vnd_frequency_value' => 0,
            'audit_regex' => '',
            'audit_keyword1' => '',
            'audit_keyword2' => ''
        ];

        foreach ($billDescArr as $keyword => $vndId) {

            $desc = strtolower($desc);
            $keyword = strtolower($keyword);
            if (strpos($desc, $keyword) !== false) {
                $items[$index]['expense'] = $billsArr[$vndId];
                $items[$index]['vnd_id'] = $vndId;
                break;
            } else if (isset($billData[$key])) {
                $items[$index]['expense'] = $billsArr[$billData[$key]];
                $items[$index]['vnd_id'] = $billData[$key];
                break;
            }
        }

        if (!empty($billData)) {


            $fh = fopen("spreadsheet/chase_data_output_$timestamp.csv", 'w');

            foreach ($items as $index => $getItem) {

                $desc = $getItem['desc'];
                $amount = $getItem['amount'];
                $key = $desc . "~" . $amount;

                if (isset($billData[$key])) {

                    $items[$index]['expense'] = $billsArr[$billData[$key]];
                    $items[$index]['vnd_id'] = $billData[$key];
                }

            }

            $eachItem = [];
            $eachItem[0] = 'chase_desc';
            $eachItem[1] = 'chase_amount';
            $eachItem[2] = 'chase_date';

            $eachItem[3] = "expense_desc";
            $eachItem[4] = "expense_amount";
            $eachItem[5] = "expense_date";
            $eachItem[6] = "is flagged";
            fputcsv($fh, $eachItem);

            foreach ($items as $getItem) {

                $desc = $getItem['desc'];
                $amount = $getItem['amount'];
                $key = $desc . "~" . $amount;

                $eachItem = [];
                $eachItem[0] = $getItem['desc'];
                $eachItem[1] = $getItem['amount'];
                $eachItem[2] = $getItem['date'];

                $eachItem[3] = "";
                $eachItem[4] = 0;
                $eachItem[5] = "";

                if (isset($getItem['expense']) && !empty($getItem['expense'])) {

                    $eachItem[3] = $getItem['expense']['vnd_bill'];
                    $eachItem[4] = $getItem['expense']['amount'];
                    $eachItem[5] = $getItem['expense']['vnd_frequency_value'];
                }

                $eachItem[6] = ($flaggedData[$key]) ? "Yes" : "No";

                fputcsv($fh, $eachItem);

            }
            $didSaveFile = true;
            fclose($fh);
            unlink("spreadsheet/chase_data.csv");
        }


    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<title>Document</title>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/css/nav.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

</script>
<style type="text/css">

body {
	font-size: 15px;
	font-family: Verdana;
	color: #333;
}

.wrapper {
	width: 96%;
	min-height: 16px;
	margin-top: 20px;
}

input.expense_field {

	width: 90%;
	height: 16px;
	padding: 4px;
	font-size: 15px;
	color: #666666;
}

.page_title {

	font-size: 22px;
	font-weight: bold;
}

.clear {
	clear: both;
}

a.btn {

	background-color: #333;
	color: #fff;
	padding: 7px;
	border-radius: 5px;
}

.message {

	color: #FF0000;
	font-weight: bold;
}

.text-content {
    border: 1px solid #ddd;
    width: 100%;
    border-radius: 8px;
    height: 175px;

}

</style>
</head>
<body>

<div class="container">

    <div class="wrapper" >
        <span class="page_title" >Add Future Expense</span>
        <div class="clear" style="height: 12px;"></div>

        <?php if (isset($_REQUEST['Message'])) : ?>

            <div class="message" ><?php echo $_REQUEST['Message']; ?></div>
            <div class="clear" style="height: 12px;"></div>
        <?php endif; ?>
        <div style="clear: both; height: 12px"></div>

        <?php include "../templates/nav.php"; ?>
        <div style="clear: both; height: 7px"></div>

        <h3>Audit Expenses</h3>

        <?php if (!$hasChaseData): ?>
            <p>Upload Chase Data File Here</p>
            <form action="proc_audit.php" method="POST" name="frmUpdate" id="frmUpdate" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-xs-12">
                        <input type="file" name="chaseFile" id="chaseFile">
                    </div>
                </div>
                <div style="clear: both; height: 16px;"></div>
                <div class="row">
                    <div class="col-xs-12">
                        <input type="submit" name="submit" class="btn btn-primary submitContent" value="Submit" />
                    </div>
                </div>
            </form>
        <?php else: ?>


            <?php if ($didSaveFile): ?>

                File saved here: <a href="spreadsheet/chase_data_output_<?php echo $timestamp; ?>.csv"
                                    target="_blank">chase_data_output.csv</a>
                <div style="clear: both; height: 8px;"></div>
                <a href="index.php" class="btn btn-primary">Upload Another File</a>

            <?php else: ?>

                <p>Chase Data File Uploaded</p>
                <div style="clear: both; height: 8px;"></div>
                <form action="index.php" method="POST" name="frmClearData" id="frmClearData" >
                    <div class="row">
                        <div class="col-xs-12">
                            <input type="submit" name="btnClearFile" class="btn btn-primary" value="Clear Chase Data" />&nbsp;
                            <input type="submit" name="btnSubmitCsv" class="btn btn-default" value="Save Data" />&nbsp;
                        </div>
                    </div>

                    <div style="clear: both; height: 16px;"></div>
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th></th>
                            <th>Chase Desc</th>
                            <th>Chase Amount</th>
                            <th>Chase Date</th>
                            <th>Expense</th>
                            <th>Expense Desc</th>
                            <th>Expense Amount</th>
                            <th>Expense Date</th>
                            <th colspan="2">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($items as $index => $getItem): ?>
                        <tr id="row<?php echo $index; ?>">
                            <td></td>
                            <td><?php echo $getItem['desc']; ?></td>
                            <td><?php echo $getItem['amount']; ?></td>
                            <td><?php echo $getItem['date']; ?></td>
                            <td>
                                <?php if (!trim($getItem['expense']['vnd_bill'])) : ?>
                                    <select name="selExpenseItem[<?php echo $index; ?>]">
                                        <option value=""> - Select One - </option>
                                        <?php foreach ($bills as $getBill) : ?>
                                            <option value="<?php echo $getBill['vnd_id']; ?>"><?php echo $getBill['vnd_bill']; ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                <?php endif; ?>
                            </td>
                            <td><?php echo $getItem['expense']['vnd_bill']; ?></td>
                            <td><?php echo $getItem['expense']['amount']; ?></td>
                            <td><?php echo $getItem['expense']['vnd_frequency_value']; ?></td>
                            <td>
                                <input type="button" name="deleteRow" class="btn btn-primary deleteRow" data-id="<?php echo $index; ?>"
                                       value="Delete" />
                            </td>
                            <td>
                                <input type="checkbox" name="chkFlagged[<?php echo $index; ?>]" data-id="<?php echo $index; ?>"
                                       class="chkFlagged" value="1"> Flagged

                                <input type="hidden" name="desc[<?php echo $index; ?>]" value="<?php echo $getItem['desc']; ?>" />
                                <input type="hidden" name="amount[<?php echo $index; ?>]" value="<?php echo $getItem['amount']; ?>" />
                            </td>
                        </tr>
                        <?php endforeach; ?>
                        </tbody>
                    </table>
                </form>
            <?php endif; ?>

        <?php endif;?>

    </div>
</div>

<script src="/js/nav.js" ></script>
<script type="text/javascript">

    $(document).ready(function() {

        $('.deleteRow').each(function() {

            $(this).click(function() {
                id = $(this).data('id');
                $('#row' + id).remove();
            });
        })

        $('.chkFlagged').each(function() {

            $(this).click(function() {

                id = $(this).data('id');
                if ($(this).is(':checked')) {
                    $('#row' + id).css('background-color', '#FFCCCC');
                } else {
                    $('#row' + id).css('background-color', '#FFFFFF');
                }
            });
        })

    });
</script>
</body>
</html>