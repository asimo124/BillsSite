<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Income Purchases</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font Awesome for hamburger icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/nav.css" />
    <link rel="stylesheet" href="/css/bills_admin.css" />
    <link rel="stylesheet" href="/css/income_purchases.css?version=1" />
    
    <!-- Vue.js CDN -->
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
        <div class="col-xs-6" style="overflow-y: auto; max-height: 650px;">
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
                    <?php //foreach ($rocket_money_titles as $index => $item) : ?>
                        <tr class="rocket_row" data-index="<?php echo $index; ?>">
                            <td>{{ item.title }}</td>
                            <td>{{ item.amount }}</td>
                            <td>
                                <button class="btn btn-sm btn-primary" @click="selectRocketMoneyTitle(index, item.title)">Select</button>
                            </td>
                        </tr>
                    <?php //endforeach; ?>
                </tbody>
            </table>
        </div>
        <div class="col-xs-6" style="overflow-y: auto; max-height: 650px;">
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
                    <?php //foreach ($expenses_app_titles as $index => $item) : ?>
                        <tr class="expenses_row" data-index="<?php echo $index; ?>">
                            <td>{{ item.title }}</td>
                            <td>{{ item.amount }}</td>
                            <td>
                                <button class="btn btn-sm btn-primary" @click="selectExpensesAppTitle(index, item.title)">Select</button>
                            </td>
                        </tr>
                    <?php //endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
    <div style="clear: both; height: 32px;"></div>
    <?php endif; ?>

</div>

<script>
    const { createApp } = Vue;
    
    createApp({
        data() {
            return {
                
            }
        },
        mounted() {
            this.loadPage();
        },
        methods: {
            loadPage() {
                this.loadExpensesAppData();
            },

            async loadExpensesAppData() {
                try {   
                    const response = await axios.get('/api/loadExpensesAppData.php');
                    if (response.data) {
                        console.log('Expenses App Data:', response.data);
                        //this.test = response.data;
                    }
                } catch (error) {
                    console.error('Error loading test data:', error);
                }
            },
            
            // selectRocketMoneyTitle(index, title) {
            //     this.currentRocketMoneyTitleLookup = null;
            //     this.currentExpensesAppTitleLookup = null;
            //     this.currentRocketMoneyIndex = index;
            //     this.currentRocketMoneyTitleLookup = title;
                
            //     // Remove rocket money rows up to current index
            //     for (let i = 0; i < this.currentRocketMoneyIndex + 1; i++) {
            //         const rocketRow = document.querySelector(`.rocket_row[data-index="${i}"]`);
            //         if (rocketRow) {
            //             rocketRow.remove();
            //         }
            //     }
            // },
            
            // selectExpensesAppTitle(index, title) {
            //     this.currentExpensesAppTitleLookup = title;
                
            //     if (this.currentRocketMoneyTitleLookup != null) {
            //         this.titleLookups.push({
            //             rocket_money_title: this.currentRocketMoneyTitleLookup,
            //             expenses_app_title: this.currentExpensesAppTitleLookup
            //         });
                    
            //         // Reset current selections
            //         this.currentRocketMoneyTitleLookup = null;
            //         this.currentExpensesAppTitleLookup = null;
                    
            //         // Remove the expenses row
            //         const expensesRow = document.querySelector(`.expenses_row[data-index="${index}"]`);
            //         if (expensesRow) {
            //             expensesRow.remove();
            //         }
                    
            //         this.loadTitleLookups();
            //     } else {
            //         alert('Please select a Rocket Money title first.');
            //     }
            // },
            
            // removeTitleLookup(index) {
            //     this.titleLookups.splice(index, 1);
            //     this.loadTitleLookups();
            // },
            
            // loadTitleLookups() {
            //     let content = '';
                
            //     const titleLookupContent = document.querySelector('.title_lookup_content');
            //     if (titleLookupContent) {
            //         titleLookupContent.style.display = 'block';
            //     }
                
            //     content = '<h3>Title Lookups</h3>' + 
            //             '<table class="table table-bordered">' + 
            //                 '<tr>' + 
            //                     '<th>Rocket Money Title</th>' + 
            //                     '<th>Expenses App Title</th>' + 
            //                 '</tr>';
                            
            //     for (let i = 0; i < this.titleLookups.length; i++) {
            //         content += '<tr data-index="' + i + '" class="title_lookup_row">' + 
            //                 '<td>' + this.titleLookups[i].rocket_money_title + '</td>' + 
            //                 '<td>' +
            //                     this.titleLookups[i].expenses_app_title + 
            //                     '<input type="hidden" name="title_lookup_rocket_money_titles[]" value="' + this.titleLookups[i].rocket_money_title + '" />' +
            //                     '<input type="hidden" name="title_lookup_expenses_app_titles[]" value="' + this.titleLookups[i].expenses_app_title + '" />' +
            //                     '&nbsp; <button type="button" class="btn btn-sm btn-danger" @click="removeTitleLookup(' + i + ')">X</button>' +
            //                 '</td>' + 
            //             '</tr>';
            //     }
            //     content += '</table>' + 
            //         '<div style="clear: both; height: 4px;"></div>' + 
            //         '<input type="hidden" name="file" value="<?= htmlspecialchars($uploadedFilePath); ?>" />' +
            //         '<button type="submit" class="btn btn-primary">Submit</button>';
                
            //     const titleLookupContentCol = document.querySelector('.title_lookup_content .col-xs-12');
            //     if (titleLookupContentCol) {
            //         titleLookupContentCol.innerHTML = content;
            //     }
            // }
        }
    }).mount('#app');
</script>
</body>
</html>
