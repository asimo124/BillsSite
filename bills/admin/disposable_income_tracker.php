<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}



?>
<!DOCTYPE html>
<html lang="en">
    <title>Disposable Tracker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <meta name="cache-bust" content="<?php echo time() . '_' . rand(1000, 9999); ?>">
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font Awesome for hamburger icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/nav.css?v=<?php echo time(); ?>" />
    <link rel="stylesheet" href="/css/bills_admin.css?v=<?php echo time(); ?>" />
    <link rel="stylesheet" href="/css/income_purchases.css?version=<?php echo time(); ?>" />
    
    <!-- Vue.js CDN -->
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="max-w-7xl mx-auto px-2 sm:px-4 md:px-6 lg:px-12 xl:px-16" id="app">
    <div class="py-5"></div>
    
    <?php if (isset($_REQUEST['Message'])) { ?>
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4" role="alert">
            <?php echo $_REQUEST['Message']; ?>
        </div>
    <?php } ?>
    <?php if (isset($_REQUEST['error'])) { ?>
        <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4" role="alert">
            <?php echo $_REQUEST['error']; ?>
        </div>
    <?php } ?>
    
    <h2 class="text-2xl font-bold mb-4">Disposable Income Tracker</h2>

    <div class="mb-3"></div>

    <!-- Responsive Navigation Bar -->
    <?php include "../../templates/nav4.php"; ?>


    <!-- Rocket Money Upload Form -->
    <form action="process_disposable_tracker_upload3.php" method="POST" enctype="multipart/form-data" class="mb-6">
        <div class="grid grid-cols-1 gap-4">
            <div>
                <label for="rocket_money_data" class="block text-sm font-medium text-gray-700 mb-2">Upload Rocket Money Data</label>
                <input type="file" id="rocket_money_file" name="rocket_money_file" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500" accept=".csv" />
                <div class="mt-4 flex items-center justify-between">
                    <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Upload File</button>
                    <button type="button" class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded ml-2" @click="updateAllNotCovered">Mark All Not Covered</button>
                </div>
            </div>
        </div>
    </form>

    <!-- Transactions Table -->
    <div class="grid grid-cols-1 gap-6 mb-6">
        <div>
            <label for="rocket_money_data" class="block text-sm font-medium text-gray-700 mb-2">Rocket Money Data</label>
            <div class="overflow-y-auto" style="max-height: 450px;">
                <table class="min-w-full divide-y divide-gray-200 bg-white" width="100%">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-2 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" style="word-wrap: break-word; white-space: normal;">Name</th>
                            <th class="px-2 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" style="width: 80px;">Amount</th>
                            <th class="px-2 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" style="width: 60px;"> </th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200"> 
                        <tr v-if="!transactions || transactions.length === 0">
                            <td class="px-6 py-4 text-center text-gray-500 italic" colspan="3">No rocket money data available</td>
                        </tr>
                        <tr class="expenses_row hover:bg-gray-50" data-index="<?php echo $index; ?>" v-for="(item, index) in transactions" v-else>
                            <td class="px-6 py-4 text-sm text-gray-900" style="word-wrap: break-word; white-space: normal;">${{ item.name }}</td>
                            <td class="px-6 py-4 text-sm text-gray-900" style="width: 80px;">${{ item.amount }}</td>
                            <td class="px-6 py-4 text-sm text-gray-900" style="width: 60px;">
                                <button class="bg-red-500 hover:bg-red-700 text-white font-bold py-1 px-3 rounded" title="Delete" @click="updateIsCovered(item.id, 1)">X</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    // Cache buster: <?php echo time() . '_' . rand(10000, 99999) . '_' . microtime(true); ?>
    // Force refresh timestamp: <?php echo date('Y-m-d H:i:s'); ?>

    // Clear any cached Vue instances
    if (window.vueApp) {
        try {
            window.vueApp.unmount();
        } catch (e) {
            console.log('No app to unmount');
        }
        delete window.vueApp;
    }

    const { createApp } = Vue;
    
    const app = createApp({
            data() {
                return {
                    // Navigation state
                    mobileMenuOpen: false,
                    budgetDropdown: false,
                    adminDropdown: false,
                    chargesDropdown: false,
                    mobileBudgetOpen: false,
                    mobileChargesOpen: false,
                    mobileAdminOpen: false,

                    // paycheck date
                    paycheck_date: null,

                    // Existing data properties
                    transactions: []
                }
            },
            mounted() {

                this.loadPage();
                
            },
            
            beforeUnmount() {
                
            },
            methods: {
                loadPage() {
                    
                    this.paycheck_date = this.getDefaultPaycheckDate();
                    this.loadTransactions();

                    console.log('paycheck_date:', this.paycheck_date);

                },
                getDefaultPaycheckDate() {
                    const today = new Date();
                    const day = today.getDate();
                    let paycheckDate;

                    if (day <= 15) {
                        // Previous paycheck is the last day of the previous month
                        const previousMonth = today.getMonth() - 1;
                        const year = previousMonth < 0 ? today.getFullYear() - 1 : today.getFullYear();
                        paycheckDate = new Date(year, previousMonth < 0 ? 11 : previousMonth, 15);
                    } else {
                        // Previous paycheck is the 15th of the current month
                        paycheckDate = new Date(today.getFullYear(), today.getMonth(), 1);
                    }

                    return paycheckDate.toISOString().split('T')[0]; // Format as YYYY-MM-DD
                },
                async loadTransactions() {
                    try {   
                        const response = await axios.get('/api/loadDisposableTransactions.php?paycheck_date=' + this.paycheck_date);
                        if (response.data && response.data.items) {
                            
                           console.log('response.data.items:', response.data.items);
                           this.transactions = response.data.items;
                        }
                    } catch (error) {
                        
                    }
                },
                async updateIsCovered(id, isCovered) {
                    
                    try {   
                        const response = await axios.get('/api/updateDisposableTransactionCovered.php?id=' + id + '&is_covered=' + isCovered);
                        if (response.data && response.data.success) {
                            
                           this.loadTransactions();
                        }
                    } catch (error) {
                        
                    }
                },
                async updateAllNotCovered() {
                    
                    try {   
                        const response = await axios.get('/api/updateAllNotCovered.php');
                        if (response.data && response.data.success) {
                            
                           this.loadTransactions();
                        }
                    } catch (error) {
                        
                    }
                }   
            }
    });
    
    console.log('Mounting Vue app...');
    window.vueApp = app.mount('#app');
    console.log('Vue app mounted successfully');
</script></div> <!-- End of Vue app -->
</body>
</html>
