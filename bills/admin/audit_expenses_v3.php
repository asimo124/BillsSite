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
    
    <h2 class="text-2xl font-bold mb-4">Audit Expenses V2</h2>

    <div class="mb-3"></div>

    <!-- Responsive Navigation Bar -->
    <nav class="bg-gray-800 rounded-lg shadow-lg mb-6">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between items-center h-16">
                <!-- Logo/Brand -->
                <div class="flex-shrink-0">
                    <span class="text-white text-lg font-semibold">Bills Admin</span>
                </div>
                
                <!-- Desktop Navigation Links -->
                <div class="hidden md:block">
                    <div class="ml-10 flex items-baseline space-x-4">
                        <a href="https://budget2.hawleywebdesign.com/index.html" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors">Bills</a>
                        <a href="/expenses/index.php" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors">Add Expense</a>
                        <a href="/bills/admin/index.php" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors">Bills Admin</a>
                        <a href="/bills/admin/upcoming_expenses.php" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors">Upcoming Expenses</a>
                        
                        <!-- Budget Dropdown -->
                        <div class="relative" @mouseenter="budgetDropdown = true" @mouseleave="budgetDropdown = false">
                            <button class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors flex items-center">
                                Budget
                                <svg class="ml-1 h-4 w-4" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                </svg>
                            </button>
                            <div v-show="budgetDropdown" class="absolute z-10 mt-2 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5">
                                <div class="py-1">
                                    <a href="/bills/admin/budget_progress2.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Budget Progress</a>
                                    <a href="/bills/admin/budget_track.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Track Progress</a>
                                    <a href="/bills/admin/income_purchases.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Income Purchases</a>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Admin Dropdown -->
                        <div class="relative" @mouseenter="adminDropdown = true" @mouseleave="adminDropdown = false">
                            <button class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors flex items-center">
                                Admin
                                <svg class="ml-1 h-4 w-4" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                </svg>
                            </button>
                            <div v-show="adminDropdown" class="absolute z-10 mt-2 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5">
                                <div class="py-1">
                                    <a href="/bills/admin/queue_date_job.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Queue Date Job</a>
                                    <a href="/bills/admin/audit_expenses_v2.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Audit Expenses V2</a>
                                    <a href="/bills/admin/weight_ratio.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Weight Ratio</a>
                                    <a href="/bills/admin/pending_transactions.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Pending Transactions</a>
                                    <a href="/bills/admin/debt_progress.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Debt Progress</a>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Charges Dropdown -->
                        <div class="relative" @mouseenter="chargesDropdown = true" @mouseleave="chargesDropdown = false">
                            <button class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors flex items-center">
                                Charges
                                <svg class="ml-1 h-4 w-4" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                </svg>
                            </button>
                            <div v-show="chargesDropdown" class="absolute z-10 mt-2 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5">
                                <div class="py-1">
                                    <a href="/charges/stacked_chart.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Charges Chart</a>
                                    <a href="/charges/upload.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Upload Charges</a>
                                    <a href="/charges/categorize.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Categorize Charges</a>
                                    <a href="/charges/cats/index.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Charge Categories</a>
                                    <a href="/charges/manage_desc.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Manage Desc</a>
                                </div>
                            </div>
                        </div>
                        
                        <a href="/settings/index.php" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors">Settings</a>
                        <a href="/audit/index.php" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors">Audit</a>
                        <a href="/eat/out/index.php" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors">Eating Out</a>
                        <a href="/cards/index.php" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors">Cards Info</a>
                        <a href="/logout.php" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors">Logout</a>
                    </div>
                </div>
                
                <!-- Mobile menu button -->
                <div class="md:hidden">
                    <button @click="mobileMenuOpen = !mobileMenuOpen" class="text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800 p-2 rounded-md">
                        <svg class="h-6 w-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
                            <path :class="{'hidden': mobileMenuOpen, 'inline-flex': !mobileMenuOpen }" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                            <path :class="{'hidden': !mobileMenuOpen, 'inline-flex': mobileMenuOpen }" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                        </svg>
                    </button>
                </div>
            </div>
        </div>
        
        <!-- Mobile menu -->
        <div :class="{'block': mobileMenuOpen, 'hidden': !mobileMenuOpen}" class="md:hidden">
            <div class="px-2 pt-2 pb-3 space-y-1">
                <a href="https://budget2.hawleywebdesign.com/index.html" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Bills</a>
                <a href="/expenses/index.php" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Add Expense</a>
                <a href="/bills/admin/index.php" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Bills Admin</a>
                <a href="/bills/admin/upcoming_expenses.php" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Upcoming Expenses</a>
                
                <!-- Mobile Budget Section -->
                <div class="pt-2">
                    <button @click="mobileBudgetOpen = !mobileBudgetOpen" class="text-gray-300 hover:bg-gray-700 hover:text-white w-full text-left px-3 py-2 rounded-md text-base font-medium flex items-center justify-between">
                        Budget
                        <svg class="h-4 w-4 transform transition-transform" :class="{'rotate-180': mobileBudgetOpen}" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                        </svg>
                    </button>
                    <div v-show="mobileBudgetOpen" class="pl-6 space-y-1">
                        <a href="/bills/admin/budget_progress2.php" class="text-gray-400 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm">Budget Progress</a>
                        <a href="/bills/admin/budget_track.php" class="text-gray-400 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm">Track Progress</a>
                        <a href="/bills/admin/income_purchases.php" class="text-gray-400 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm">Income Purchases</a>
                    </div>
                </div>
                
                <!-- Mobile Admin Section -->
                <div class="pt-2">
                    <button @click="mobileAdminOpen = !mobileAdminOpen" class="text-gray-300 hover:bg-gray-700 hover:text-white w-full text-left px-3 py-2 rounded-md text-base font-medium flex items-center justify-between">
                        Admin
                        <svg class="h-4 w-4 transform transition-transform" :class="{'rotate-180': mobileAdminOpen}" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                        </svg>
                    </button>
                    <div v-show="mobileAdminOpen" class="pl-6 space-y-1">
                        <a href="/bills/admin/queue_date_job.php" class="text-gray-400 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm">Queue Date Job</a>
                        <a href="/bills/admin/audit_expenses_v2.php" class="text-gray-400 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm">Audit Expenses V2</a>
                        <a href="/bills/admin/weight_ratio.php" class="text-gray-400 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm">Weight Ratio</a>
                        <a href="/bills/admin/pending_transactions.php" class="text-gray-400 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm">Pending Transactions</a>
                        <a href="/bills/admin/debt_progress.php" class="text-gray-400 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm">Debt Progress</a>
                    </div>
                </div>
                
                <!-- Mobile Charges Section -->
                <div class="pt-2">
                    <button @click="mobileChargesOpen = !mobileChargesOpen" class="text-gray-300 hover:bg-gray-700 hover:text-white w-full text-left px-3 py-2 rounded-md text-base font-medium flex items-center justify-between">
                        Charges
                        <svg class="h-4 w-4 transform transition-transform" :class="{'rotate-180': mobileChargesOpen}" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                        </svg>
                    </button>
                    <div v-show="mobileChargesOpen" class="pl-6 space-y-1">
                        <a href="/charges/stacked_chart.php" class="text-gray-400 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm">Charges Chart</a>
                        <a href="/charges/upload.php" class="text-gray-400 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm">Upload Charges</a>
                        <a href="/charges/categorize.php" class="text-gray-400 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm">Categorize Charges</a>
                        <a href="/charges/cats/index.php" class="text-gray-400 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm">Charge Categories</a>
                        <a href="/charges/manage_desc.php" class="text-gray-400 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm">Manage Desc</a>
                    </div>
                </div>
                
                <a href="/settings/index.php" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Settings</a>
                <a href="/audit/index.php" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Audit</a>
                <a href="/eat/out/index.php" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Eating Out</a>
                <a href="/cards/index.php" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Cards Info</a>
                <a href="/logout.php" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Logout</a>
            </div>
        </div>
    </nav>

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

    <?php //if (count($results) > 0) : ?>
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
            <!-- <table class="table table-bordered">
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
            </table> -->
        </div>
        <div class="col-xs-6" style="overflow-y: auto; max-height: 650px;">
            <label for="rocket_money_data">Expenses App Titles</label>
            <!-- <table class="table table-bordered">
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
            </table> -->
        </div>
    </div>
    <div style="clear: both; height: 32px;"></div>
    <?php //endif; ?>

</div>

<script>
    const { createApp } = Vue;
    
    createApp({
        data() {
            return {
                // Navigation state
                mobileMenuOpen: false,
                budgetDropdown: false,
                adminDropdown: false,
                chargesDropdown: false,
                mobileBudgetOpen: false,
                mobileAdminOpen: false,
                mobileChargesOpen: false,
                
                // Existing data properties
                titleLookups: [],
                currentRocketMoneyTitleLookup: null,
                currentExpensesAppTitleLookup: null,
                currentRocketMoneyIndex: 0,
                expensesAppData: '',
                rocketMoneyData: ''
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
