<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$sql = "SELECT b.vnd_id 
        , b.vnd_bill as title 
        , b.vnd_frequency_value as day_of_month
        , b.amount
        FROM vnd_bills b
        WHERE 1 
        AND b.vnd_frequency = 'Once Per Month'
        AND b.vnd_frequency_type = 'Day of Month'
        AND IFNULL(vnd_frequency_value, '') <> ''
        ORDER BY b.vnd_frequency_value ASC ";

$results = getQuery($sql);

$expenses_app_titles = [];
$expenses_app_content_str = "";
foreach ($results as $row) {
    $expenses_app_titles[] = [
        'title' => $row['title'],
        'amount' => $row['amount'],
    ];
    $expenses_app_content_str .= $row['title'] . "\t" . $row['day_of_month'] . "\t" . $row['amount'] . "\n";
}

$titles = array_column($expenses_app_titles, 'title');
array_multisort($titles, SORT_ASC, SORT_FLAG_CASE | SORT_NATURAL, $expenses_app_titles);

$rocketMoneyResults = [];
$i = 0;
$keys = [];
$uploadedFilePath = '';
if (isset($_REQUEST['file'])) {
    $uploadedFilePath = '../../data/audit_v2/' . $_REQUEST['file'];

    $fh = fopen($uploadedFilePath, 'r');;
    while (($line = fgetcsv($fh)) !== false) {
        
        if ($i == 0) {
            $keys = $line;
            $i++;
            continue;
        }
        
        $eachItem = [];
        foreach ($line as $index => $value) {
            $eachItem[$keys[$index]] = $value;
        }

        $rocketMoneyResults[] = $eachItem;
        $i++;
    }
    fclose($fh);

    $rocket_money_titles = [];
    $rocket_money_content_str = "";
    foreach ($rocketMoneyResults as $item) {
        $line = "";
        if (isset($item['Name'])) {
            $line .= $item['Name'];
        }
        if (isset($item['Date'])) {
            $line .= "\t" . $item['Date'];
        }
        if (isset($item['Amount'])) {
            $line .= "\t" . $item['Amount'];
        }
        $rocket_money_content_str .= $line . "\n";
        $rocket_money_titles[] = [
            'title' => $item['Name'],
            'amount' => $item['Amount']
        ];
    }

    // Sort rocket_money_titles array by 'title' key
    $titles = array_column($rocket_money_titles, 'title');
    array_multisort($titles, SORT_ASC, SORT_FLAG_CASE | SORT_NATURAL, $rocket_money_titles); 
}



?>
<!DOCTYPE html>
<html>
<head>
    <title>Income Purchases</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    <!-- Font Awesome for hamburger icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="/css/bills_admin.css" />
    <link rel="stylesheet" href="/css/income_purchases.css?version=1" />
</head>
<body>
<div class="container" id="app">
    <div style="clear: both; height: 20px;" ></div>
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>
    <?php if (isset($_REQUEST['error'])) { ?>
        <div class="alert alert-danger" role="alert">
            <?php echo $_REQUEST['error']; ?>
        </div>
    <?php } ?>
    
    <h2>Audit Expenses V2</h2>

    <div style="clear: both; height: 12px"></div>

    <?php include "../../templates/nav.php"; ?>
    <div style="clear: both; height: 24px"></div>

    <div class="row">
        <div class="col-xs-12" >
            <label for="expenses_app_data">Expenses App Data</label>
            <textarea id="expenses_app_data" class="form-control" rows="15"><?= $expenses_app_content_str; ?></textarea>
        </div>
    </div>
    <div style="clear: both; height: 8px;"></div>

    <form action="process_rocket_money_upload.php" method="POST" enctype="multipart/form-data">
        <div class="row">
            <div class="col-xs-12" >
                <label for="rocket_money_data">Upload Rocket Money Data</label>
                <input type="file" id="rocket_money_file" name="rocket_money_file" class="form-control" accept=".csv" />
                <br>
                <button type="submit" class="btn btn-primary">Upload File</button>
            </div>
        </div>
    </form>
    <div style="clear: both; height: 8px;"></div>

    <?php if (count($results) > 0) : ?>
    <div class="row">
        <div class="col-xs-12" >
            <label for="rocket_money_data">Rocket Money Data</label>
            <textarea id="rocket_money_data" class="form-control" rows="15"><?= $rocket_money_content_str; ?></textarea>
        </div>
    </div>
    <div style="clear: both; height: 16px;"></div>

    <form action="process_audit_expenses_v2.php" method="POST">
        <div class="row title_lookup_content" style="display: none;">
            <div class="col-xs-12" >

            </div>
        </div>
        <div style="clear: both; height: 16px;"></div>
    </form>

    <div class="row">
        <div class="col-xs-6" >
            <label for="rocket_money_data">Rocket Money Titles</label>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Amount</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($rocket_money_titles as $index => $item) : ?>
                        <tr class="rocket_row" data-index="<?php echo $index; ?>">
                            <td><?php echo htmlspecialchars($item['title']); ?></td>
                            <td><?php echo htmlspecialchars($item['amount']); ?></td>
                            <td>
                                <button class="btn btn-sm btn-primary rocket_money_title_button" data-index="<?php echo $index; ?>">Select</button>
                                <input type="hidden" class="rocket_money_title_input" data-index="<?php echo $index; ?>" value="<?php echo htmlspecialchars($item['title']); ?>" />
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
        <div class="col-xs-6" >
            <label for="rocket_money_data">Expenses App Titles</label>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Amount</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($expenses_app_titles as $index => $item) : ?>
                        <tr class="expenses_row" data-index="<?php echo $index; ?>">
                            <td><?php echo htmlspecialchars($item['title']); ?></td>
                            <td><?php echo htmlspecialchars($item['amount']); ?></td>
                            <td>
                                <button class="btn btn-sm btn-primary expenses_app_title_button" data-index="<?php echo $index; ?>">Select</button>
                                <input type="hidden" class="expenses_app_title_input" data-index="<?php echo $index; ?>" value="<?php echo htmlspecialchars($item['title']); ?>" />
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
    <div style="clear: both; height: 8px;"></div>
    <?php endif; ?>

    <!-- Add Purchase Modal -->
    <!-- <div class="modal fade" id="addPurchaseModal" tabindex="-1" role="dialog" aria-labelledby="addPurchaseModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="addPurchaseModalLabel">Add Upcoming Purchase</h4>
                </div>
                <div class="modal-body">
                    <div class="alert alert-danger" role="alert" v-if="add_purchase_error">
                        {{ add_purchase_error }}    
                    </div>
                    <form>
                        <div class="form-group">
                            <label for="purchaseTitle">Title</label>
                            <input type="text" class="form-control" id="purchaseTitle" v-model="newPurchase.title" placeholder="Enter title">
                        </div>
                        <div class="form-group">
                            <label for="purchaseDescription">Description</label>
                            <input type="text" class="form-control" id="purchaseDescription" v-model="newPurchase.description" placeholder="Enter description">
                        </div>
                        <div class="form-group">
                            <label for="purchaseCost">Cost</label>
                            <input type="number" class="form-control" id="purchaseCost" v-model="newPurchase.cost" placeholder="Enter cost" step="0.01">
                        </div>
                        <div class="form-group">
                            <label for="purchaseAmountToSave">Amount to Save</label>
                            <input type="number" class="form-control" id="purchaseAmountToSave" v-model="newPurchase.amount_to_save" placeholder="Enter amount to save" step="0.01">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" @click="addPurchase">Create</button>
                </div>
            </div>
        </div>
    </div> -->

</div>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script>
    $( function() {
       
        var title_lookups = [];
        var current_rocket_money_title_lookup = null;
        var current_expenses_app_title_lookup = null;

        var current_rocket_money_index = 0;

        $('.rocket_money_title_button').on('click', function() {

            current_rocket_money_title_lookup = null;
            current_expenses_app_title_lookup = null;

            var index = $(this).data('index');

            current_rocket_money_index = index;

            var title = $('.rocket_money_title_input[data-index="' + index + '"]').val();
            
            current_rocket_money_title_lookup = title;
        }); 

        $('.expenses_app_title_button').on('click', function() {

            var index = $(this).data('index');
            var title = $('.expenses_app_title_input[data-index="' + index + '"]').val();
            
            current_expenses_app_title_lookup = title;

            if (current_rocket_money_title_lookup != null) {
                title_lookups.push({
                    rocket_money_title: current_rocket_money_title_lookup,
                    expenses_app_title: current_expenses_app_title_lookup
                });

                // Reset current selections
                current_rocket_money_title_lookup = null;
                current_expenses_app_title_lookup = null;

                for (i = 0; i < current_rocket_money_index + 1; i++) {
                    console.log('i at 2: ', i);
                    var rocketRowIndex = $('.rocket_row').eq(i).data('index');
                    $('.rocket_row').each(function() {
                        var currentIndex = $(this).data('index');
                        if (i == currentIndex) {
                            $(this).remove();
                        }
                    })
                }

                $('.expenses_row').each(function() {
                    var currentIndex = $(this).data('index');
                    if (index == currentIndex) {
                        $(this).remove();
                    }
                })
                
                loadTitleLookups();

            } else {
                alert('Please select a Rocket Money title first.');
            }
        });

        var loadTitleLookups = function() {
            var content = '';
            
            $('.title_lookup_content').show();

            content = '<h3>Title Lookups</h3>' + 
                    '<table class="table table-bordered">' + 
                        '<tr>' + 
                            '<th>Rocket Money Title</th>' + 
                            '<th>Expenses App Title</th>' + 
                        '</tr>';
            for (var i = 0; i < title_lookups.length; i++) {
                content += '<tr>' + 
                        '<td>' + title_lookups[i].rocket_money_title + '</td>' + 
                        '<td>' +
                            title_lookups[i].expenses_app_title + 
                            '<input type="hidden" name="title_lookup_rocket_money_titles[]" value="' + title_lookups[i].rocket_money_title + '" />' +
                            '<input type="hidden" name="title_lookup_expenses_app_titles[]" value="' + title_lookups[i].expenses_app_title + '" />' +
                        '</td>' + 
                    '</tr>';
            }
            content += '</table>' + 
                '<div style="clear: both; height: 4px;"></div>' + 
                '<input type="hidden" name="file" value="<?= htmlspecialchars($uploadedFilePath); ?>" />' +
                '<button type="submit" class="btn btn-primary">Submit</button>';

            $('.title_lookup_content .col-xs-12').html(content);
        };

    } );
</script>
</body>
</html>
