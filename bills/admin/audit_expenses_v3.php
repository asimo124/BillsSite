<?php
    //ini_set("display_errors", 1);
    include "../../inc/includes.php";

if (!isset($_SESSION['user'])) {
    header("Location: /login.php");
    exit;
}

$uploadedFilePath = isset($_REQUEST['file']) ? $_REQUEST['file'] : '';
if ($uploadedFilePath) {
    $uploadedFilePath = dirname(__FILE__) . '/../../data/audit_v2/' . $uploadedFilePath;
}

$_SESSION['ae_max_chars'] = 33;

?>
<!DOCTYPE html>
<html lang="en">
    <title>Audit Expenses V3</title>
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
    
    <h2 class="text-2xl font-bold mb-4">Audit Expenses</h2>

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
                                    <a href="/bills/admin/queue_date_job.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Queue Date Job</a>
                                    <a href="/bills/admin/audit_expenses_v3.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Audit Expenses</a>
                                    
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
                                    <a href="/bills/admin/weight_ratio.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Weight Ratio</a>
                                    <a href="/bills/admin/pending_transactions.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Pending Transactions</a>
                                    <a href="/bills/admin/debt_progress.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Debt Progress</a>
                                </div>
                            </div>
                        </div>
                        
                        <a href="/settings/index.php" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors">Settings</a>
                        <a href="/audit/index.php" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium transition-colors">Audit</a>
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
                        <a href="/bills/admin/queue_date_job.php" class="text-gray-400 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm">Queue Date Job</a>
                        <a href="/bills/admin/audit_expenses_v3.php" class="text-gray-400 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm">Audit Expenses</a>
                        
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
                        <a href="/bills/admin/weight_ratio.php" class="text-gray-400 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm">Weight Ratio</a>
                        <a href="/bills/admin/last_time_i.php" class="text-gray-400 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-sm">Last Time I</a>
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

    <!-- Expenses App Data Table -->
    <div class="grid grid-cols-1 gap-6 mb-6">
        <div>
            <label for="expenses_app_data" class="block text-sm font-medium text-gray-700 mb-2">Expenses App Data</label>
            <div class="overflow-x-auto overflow-y-auto max-h-[300px] shadow-sm rounded-lg">
                <table class="min-w-full divide-y divide-gray-200 bg-white">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Title</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Amount</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200"> 
                        <tr class="expenses_row hover:bg-gray-50" data-index="<?php echo $index; ?>" v-for="(item, index) in expensesAppData">
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 relative">
                                <span 
                                    @click="togglePopover(index)"
                                    @mouseenter="showPopover(index)" 
                                    @mouseleave="hidePopover()"
                                    class="cursor-help hover:text-blue-600 transition-colors popover-trigger"
                                >
                                    {{ item.title }}
                                </span>
                                
                                <!-- Popover -->
                                <div 
                                    v-show="popoverVisible && hoveredItemIndex === index"
                                    class="absolute z-50 bg-gray-800 text-white text-sm rounded-lg py-2 px-3 max-w-xs shadow-lg -top-12 left-0 sm:-top-2 sm:left-full sm:ml-2"
                                    style="white-space: normal; word-wrap: break-word;"
                                >
                                    {{ item.long_title || 'No detailed title available' }}
                                    <!-- Arrow pointing down on mobile, left on desktop -->
                                    <div class="absolute top-full left-4 transform -translate-x-1/2 w-0 h-0 border-l-4 border-r-4 border-t-4 border-transparent border-t-gray-800 sm:hidden"></div>
                                    <div class="hidden sm:block absolute top-1/2 left-0 transform -translate-y-1/2 -translate-x-1 w-0 h-0 border-t-4 border-b-4 border-r-4 border-transparent border-r-gray-800"></div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${{ item.amount }}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ item.day_of_month }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Rocket Money Upload Form -->
    <form action="process_rocket_money_upload3.php" method="POST" enctype="multipart/form-data" class="mb-6">
        <div class="grid grid-cols-1 gap-4">
            <div>
                <label for="rocket_money_data" class="block text-sm font-medium text-gray-700 mb-2">Upload Rocket Money Data</label>
                <input type="file" id="rocket_money_file" name="rocket_money_file" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500" accept=".csv" />
                <div class="mt-4">
                    <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Upload File</button>
                </div>
            </div>
        </div>
    </form>

    <!-- Rocket Money Data Table -->
    <div class="grid grid-cols-1 gap-6 mb-6">
        <div>
            <label for="rocket_money_data" class="block text-sm font-medium text-gray-700 mb-2">Rocket Money Data</label>
            <div class="overflow-x-auto overflow-y-auto max-h-[300px] shadow-sm rounded-lg">
                <table class="min-w-full divide-y divide-gray-200 bg-white">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Title</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Amount</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200"> 
                        <tr v-if="!rocketMoneyData || rocketMoneyData.length === 0">
                            <td class="px-6 py-4 text-center text-gray-500 italic">No rocket money data available</td>
                        </tr>
                        <tr class="expenses_row hover:bg-gray-50" data-index="<?php echo $index; ?>" v-for="(item, index) in rocketMoneyData" v-else>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 relative">
                                
                                <span 
                                    @click="togglePopover(index)"
                                    @mouseenter="showPopover(index)" 
                                    @mouseleave="hidePopover()"
                                    class="cursor-help hover:text-blue-600 transition-colors popover-trigger"
                                >
                                    {{ item.Name }}
                                </span>
                                
                                <!-- Popover -->
                                <div 
                                    v-show="popoverVisible && hoveredItemIndex === index"
                                    class="absolute z-50 bg-gray-800 text-white text-sm rounded-lg py-2 px-3 max-w-xs shadow-lg -top-12 left-0 sm:-top-2 sm:left-full sm:ml-2"
                                    style="white-space: normal; word-wrap: break-word;"
                                >
                                    {{ item.LongName || 'No detailed name available' }}
                                    <!-- Arrow pointing down on mobile, left on desktop -->
                                    <div class="absolute top-full left-4 transform -translate-x-1/2 w-0 h-0 border-l-4 border-r-4 border-t-4 border-transparent border-t-gray-800 sm:hidden"></div>
                                    <div class="hidden sm:block absolute top-1/2 left-0 transform -translate-y-1/2 -translate-x-1 w-0 h-0 border-t-4 border-b-4 border-r-4 border-transparent border-r-gray-800"></div>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${{ item.Amount }}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ item.Date }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Matched Titles Table -->
    <div class="grid grid-cols-1 gap-6 mb-6">
        <div>
            <label id="matched-titles-label" for="rocket_money_data" class="block text-sm font-medium text-gray-700 mb-2">Matched Titles&nbsp;<button class="text-blue-500 hover:text-blue-700" @click="openExpenseDiscrepanciesModal">Generate</button></label>
            <div class="overflow-x-auto overflow-y-auto max-h-[300px] shadow-sm rounded-lg" v-if="matchedTitlesData && matchedTitlesData.length > 0">
                <table class="min-w-full divide-y divide-gray-200 bg-white">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Rocket Money</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Expenses App</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200"> 
                        <tr class="expenses_row hover:bg-gray-50" v-for="(item, index) in matchedTitlesData" >
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ item.rocket_money_title.substring(0, '<?php echo $_SESSION['ae_max_chars']; ?>') }}: ${{ item.rocket_money_amount }}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ item.expenses_app_title.substring(0, '<?php echo $_SESSION['ae_max_chars']; ?>') }}: ${{ item.expenses_app_amount }}
                                <button 
                                    class="bg-red-500 hover:bg-red-700 text-white font-bold w-4 h-4 rounded-full text-xs flex items-center justify-center ml-2" 
                                    @click="removeMatchedTitle(index)">
                                    X
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Title Matching Section -->
    <label for="title_lookups" class="block text-sm font-medium text-gray-700 mb-2">Title Matching <span class="text-xs text-gray-500">(tap titles to see details)</span></label>
    <div class="grid grid-cols-2 gap-1 mb-8">
       
        <!-- Rocket Money Titles -->
        <div class="overflow-y-auto max-h-96 lg:max-h-[650px] border border-gray-200 rounded-lg py-2 px-[2px]">
            <table class="min-w-full divide-y divide-gray-200 bg-white">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Title</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200"> 
                    <tr class="expenses_row transition-all duration-300" data-index="<?php echo $index; ?>" v-for="(item, index) in rocketMoneyData"
                        :class="{ 'h-4 overflow-hidden': item.Collapsed, 'hover:bg-gray-50': !item.Collapsed }">
                        <td class="px-6 text-sm text-gray-900 relative transition-all duration-300"
                            :class="item.Collapsed ? 'py-0' : 'py-4'">
                            <div class="flex items-center">
                                <span 
                                    @click="toggleRocketMatchPopover(index)" 
                                    @mouseenter="showRocketMatchPopover(index)" 
                                    @mouseleave="hideRocketMatchPopover()"
                                    class="cursor-help hover:text-blue-600 transition-colors popover-trigger"
                                    :class="{ 'text-xs opacity-30': item.Collapsed }"
                                >
                                    {{ item.Name }}: ${{item.Amount}}
                                </span>
                                <button @click="toggleRocketItemCollapse(index)"
                                        class="font-bold rounded-full text-xs flex items-center justify-center ml-2 transition-all duration-300"
                                        :class="item.Collapsed 
                                            ? 'bg-yellow-500 hover:bg-yellow-600 text-black w-3 h-3' 
                                            : 'bg-green-500 hover:bg-green-700 text-white w-4 h-4'">
                                    +
                                </button>
                            </div>
                            
                            <!-- Popover -->
                            <div 
                                v-show="rocketMatchPopoverVisible && rocketMatchHoveredIndex === index"
                                class="absolute z-50 bg-gray-800 text-white text-sm rounded-lg py-2 px-3 max-w-xs shadow-lg -top-12 left-0 sm:-top-2 sm:left-full sm:ml-2"
                                style="white-space: normal; word-wrap: break-word;"
                            >
                                {{ item.LongName || 'No detailed name available' }}
                                <!-- Arrow pointing down on mobile, left on desktop -->
                                <div class="absolute top-full left-4 transform -translate-x-1/2 w-0 h-0 border-l-4 border-r-4 border-t-4 border-transparent border-t-gray-800 sm:hidden"></div>
                                <div class="hidden sm:block absolute top-1/2 left-0 transform -translate-y-1/2 -translate-x-1 w-0 h-0 border-t-4 border-b-4 border-r-4 border-transparent border-r-gray-800"></div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Expenses App Titles -->
        <div class="overflow-y-auto max-h-96 lg:max-h-[650px] border border-gray-200 rounded-lg py-2 px-[2px]">
            <div class="overflow-x-auto shadow-sm rounded-lg">
                <table class="min-w-full divide-y divide-gray-200 bg-white">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Title</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200"> 
                        <tr v-if="!expensesAppData || expensesAppData.length === 0">
                            <td class="px-6 py-4 text-center text-gray-500 italic">No expenses app data available</td>
                        </tr>
                        <tr class="expenses_row transition-all duration-300" data-index="<?php echo $index; ?>" v-for="(item, index) in expensesAppData" v-else
                            :class="{ 'h-4 overflow-hidden': item.collapsed, 'hover:bg-gray-50': !item.collapsed }">
                            <td class="px-6 text-sm text-gray-900 relative transition-all duration-300"
                                :class="item.collapsed ? 'py-0' : 'py-4'">
                                <div class="flex items-center">
                                    <span 
                                        @click="toggleExpensesMatchPopover(index)"
                                        @mouseenter="showExpensesMatchPopover(index)" 
                                        @mouseleave="hideExpensesMatchPopover()"
                                        class="cursor-help hover:text-blue-600 transition-colors popover-trigger"
                                        :class="{ 'text-xs opacity-30': item.collapsed }"
                                    >
                                        {{ item.title }}: ${{ item.amount}}
                                    </span>
                                    <button @click="toggleExpensesItemCollapse(index)"
                                            class="font-bold rounded-full text-xs flex items-center justify-center ml-2 transition-all duration-300"
                                            :class="item.collapsed 
                                                ? 'bg-yellow-500 hover:bg-yellow-600 text-black w-3 h-3' 
                                                : 'bg-green-500 hover:bg-green-700 text-white w-4 h-4'">
                                        +
                                    </button>
                                </div>
                                
                                <!-- Popover -->
                                <div 
                                    v-show="expensesMatchPopoverVisible && expensesMatchHoveredIndex === index && !item.collapsed"
                                    class="absolute z-50 bg-gray-800 text-white text-sm rounded-lg py-2 px-3 max-w-xs shadow-lg -top-12 left-0 sm:-top-2 sm:left-full sm:ml-2"
                                    style="white-space: normal; word-wrap: break-word;"
                                >
                                    {{ item.long_title || 'No detailed title available' }}
                                    <!-- Arrow pointing down on mobile, left on desktop -->
                                    <div class="absolute top-full left-4 transform -translate-x-1/2 w-0 h-0 border-l-4 border-r-4 border-t-4 border-transparent border-t-gray-800 sm:hidden"></div>
                                    <div class="hidden sm:block absolute top-1/2 left-0 transform -translate-y-1/2 -translate-x-1 w-0 h-0 border-t-4 border-b-4 border-r-4 border-transparent border-r-gray-800"></div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Simple Test Modal -->
    <div v-show="expenseDiscrepanciesModalVisible" class="fixed inset-0 bg-black bg-opacity-50 z-50" @click="closeExpenseDiscrepanciesModal">
        <div class="fixed top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 bg-white p-6 rounded-lg shadow-lg w-full max-w-none relative" @click.stop>
            <button @click="closeExpenseDiscrepanciesModal" class="absolute top-2 right-2 text-gray-500 hover:text-gray-700">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </button>
            <h3 class="text-xl font-bold mb-4">Budget Discrepancies</h3>
            <div class="overflow-x-auto">
                <div class="overflow-y-auto max-h-[calc(100vh-200px)]">
                    <table class="min-w-full divide-y divide-gray-200 bg-white">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Rocket Money Name</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Rocket Money Amount</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Rocket Money Day</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Expenses App Name</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Expenses App Amount</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Expenses App Day</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <tr v-for="(item, index) in budgetDiscrepancies" :key="index" :class="{'bg-red-100': item.is_discrepancy}">
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ item.rocket_money_title }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${{ item.rocket_money_amount }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ item.rocket_money_date }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ item.expenses_app_title }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${{ item.expenses_app_amount }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{{ item.expenses_app_date }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <button @click="closeExpenseDiscrepanciesModal" class="mt-6 px-4 py-2 bg-gray-500 text-white rounded hover:bg-gray-600">
                Close
            </button>
        </div>
    </div>
</div>



<script>
    // Cache buster: <?php echo time() . '_' . rand(10000, 99999) . '_' . microtime(true); ?>
    // Force refresh timestamp: <?php echo date('Y-m-d H:i:s'); ?>

    console.log('Script loading with cache bust:', '<?php echo time() . "_" . rand(1000, 9999); ?>');
    console.log('Vue available:', typeof Vue);
    console.log('Vue version:', Vue ? Vue.version : 'Vue not found');
    
    // Clear any cached Vue instances
    if (window.vueApp) {
        try {
            window.vueApp.unmount();
        } catch (e) {
            console.log('No app to unmount');
        }
        delete window.vueApp;
    }

    console.log('Attempting to create Vue app...');
    const { createApp } = Vue;
    console.log('createApp function:', typeof createApp);
    
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

                    delimiter: '  ====>  ',
                    
                    // Existing data properties
                    titleLookups: [],
                    currentRocketMoneyTitleLookup: null,
                    currentExpensesAppTitleLookup: null,
                    currentRocketMoneyIndex: 0,
                    expensesAppData: null,
                    rocketMoneyData: null,
                    
                    // Popover state
                    hoveredItemIndex: null,
                    popoverVisible: false,
                    
                    // Popover state for matching tables
                    rocketMatchHoveredIndex: null,
                    rocketMatchPopoverVisible: false,
                    expensesMatchHoveredIndex: null,
                    expensesMatchPopoverVisible: false,
                    
                    // Collapsed state for matching tables
                    collapsedRocketItems: {},
                    collapsedExpensesItems: {},

                    matchedTitlesData: [],
                    rocketItem: null,
                    rocketIndex: -1,
                    expensesTitle: '',
                    
                    // Modal state
                    expenseDiscrepanciesModalVisible: false,
                    budgetDiscrepancies: [],
                    testDiscrepanciesData: [
                        { name: 'Netflix Subscription', expected: 15.99, actual: 17.99, difference: -2.00 },
                        { name: 'Grocery Store', expected: 120.00, actual: 115.50, difference: 4.50 },
                        { name: 'Electric Bill', expected: 89.45, actual: 92.30, difference: -2.85 },
                        { name: 'Gas Station', expected: 45.00, actual: 48.75, difference: -3.75 },
                        { name: 'Coffee Shop', expected: 25.00, actual: 22.40, difference: 2.60 }
                    ]
                }
            },
            mounted() {
                console.log('Vue app mounted successfully');
                console.log('Initial modal state:', this.expenseDiscrepanciesModalVisible);
                this.loadPage();
                
                // Add click outside handler for mobile popover closing
                document.addEventListener('click', this.handleClickOutside);
                
                // Scroll to Matched Titles section after page loads
                setTimeout(() => {
                    const element = document.getElementById('matched-titles-label');
                    if (element) {
                        element.scrollIntoView({ behavior: 'smooth', block: 'start' });
                    }
                }, 2000);
                
            },
            
            beforeUnmount() {
                document.removeEventListener('click', this.handleClickOutside);
            },
            methods: {
                loadPage() {
                    console.log('Loading page data...');
                    this.loadExpensesAppData();
                    this.loadRocketMoneyData();
                    this.loadTitleMatches();
                },
                async loadExpensesAppData() {
                    try {   
                        const response = await axios.get('/api/loadExpensesAppData.php');
                        if (response.data && response.data.items) {
                            console.log('Expenses App Data:', response.data);
                            this.expensesAppData = response.data.items;
                        }
                    } catch (error) {
                        console.error('Error loading expenses app data:', error);
                    }
                },
                async loadRocketMoneyData() {
                    try {   
                        const response = await axios.get('/api/loadRocketMoneyData.php');
                        if (response.data && response.data.items) {
                            console.log('Rocket Money Data:', response.data);
                            this.rocketMoneyData = response.data.items;
                        }
                    } catch (error) {
                        console.error('Error loading rocket money data:', error);
                    }
                },
                showPopover(index) {
                    // Popover methods
                    this.hoveredItemIndex = index;
                    this.popoverVisible = true;
                },
                hidePopover() {
                    this.hoveredItemIndex = null;
                    this.popoverVisible = false;
                },
                togglePopover(index) {
                    console.log('togglePopover called with index:', index);
                    if (this.popoverVisible && this.hoveredItemIndex === index) {
                        this.hidePopover();
                    } else {
                        this.showPopover(index);
                    }
                },
                showRocketMatchPopover(index) {
                    // Popover methods for matching tables
                    this.rocketMatchHoveredIndex = index;
                    this.rocketMatchPopoverVisible = true;
                },
                hideRocketMatchPopover() {
                    // Popover methods for matching tables
                    this.rocketMatchHoveredIndex = null;
                    this.rocketMatchPopoverVisible = false;
                },
                toggleRocketMatchPopover(index) {
                    if (this.rocketMatchPopoverVisible && this.rocketMatchHoveredIndex === index) {

                        this.hideRocketMatchPopover();
                    } else {
                        this.showRocketMatchPopover(index);
                    }
                },
                showExpensesMatchPopover(index) {
                    this.expensesMatchHoveredIndex = index;
                    this.expensesMatchPopoverVisible = true;
                },
                hideExpensesMatchPopover() {
                    this.expensesMatchHoveredIndex = null;
                    this.expensesMatchPopoverVisible = false;
                },
                toggleExpensesMatchPopover(index) {
                    if (this.expensesMatchPopoverVisible && this.expensesMatchHoveredIndex === index) {

                        this.hideExpensesMatchPopover();
                    } else {
                        this.showExpensesMatchPopover(index);
                    }
                },
                handleClickOutside(event) {
                    // Close all popovers if clicking outside
                    const isPopoverClick = event.target.closest('.popover-trigger') || event.target.closest('[class*="popover"]');
                    if (!isPopoverClick) {
                        this.hidePopover();
                        this.hideRocketMatchPopover();
                        this.hideExpensesMatchPopover();
                    }
                },
                toggleRocketItemCollapse(index) { 
                    // Collapse/expand methods
                    if (this.rocketMoneyData[index].Collapsed) {
                        this.rocketMoneyData[index].Collapsed = false;
                    } else {

                        this.rocketItem = this.rocketMoneyData[index];
                        this.rocketIndex = index;

                        this.rocketMoneyData[index].Collapsed = true;
                        
                    }
                },
                async updateRocketItemCollapsed() {
                    // Update collapse state in DB if needed   
                    
                    const collapsed = this.rocketItem.Collapsed ? 1 : 0;
                    console.log('this.rocketIndex:', this.rocketIndex, 'collapsed:', collapsed);

                    try {
                        const response = await axios.get('/api/updateRocketMoneyCollapsed.php', { params: { index: this.rocketIndex, collapsed: collapsed } });
                        if (response.data && response.data.success) {
                            console.log('Title match inserted successfully:', response.data);
                        } else {
                            console.error('Failed to insert title match:', response.data);
                        }
                    } catch (error) {
                        console.error('Error inserting title match:', error);
                    }
                },
                removeMatchedTitle(index) {
                    const matchedItem = this.matchedTitlesData[index];

                    console.log('matchedItem: ', matchedItem);

                    this.rocketIndex = matchedItem.rocket_money_index;
                    this.rocketItem = this.rocketMoneyData[this.rocketIndex];
                    const expensesIndex = matchedItem.expenses_app_index;

                    console.log('this.rocketIndex: ', this.rocketIndex);
                    console.log('expensesIndex: ', expensesIndex);
                    console.log('this.rocketMoneyData: ', this.rocketMoneyData);

                    this.rocketMoneyData[this.rocketIndex]['Collapsed'] = false;

                    

                    for (i = 0; i < this.rocketIndex + 1; i++) {
                        this.rocketMoneyData[i]['Collapsed'] = false;
                    }
                    this.expensesAppData[expensesIndex]['collapsed'] = false;

                    this.matchedTitlesData.splice(index, 1);

                    this.updateRocketItemCollapsed();
                    this.updateExpensesItemCollapsed(expensesIndex);
                    this.removeTitleMatchFromDB(matchedItem);
                },
                async removeTitleMatchFromDB(matchedItem) {
                    try {
                        const response = await axios.get('/api/removeTitleMatch.php', { params: matchedItem });
                        if (response.data && response.data.success) {
                            console.log('Title match removed successfully:', response.data);
                        } else {
                            console.error('Failed to remove title match:', response.data);
                        }
                    } catch (error) {
                        console.error('Error removing title match:', error);
                    }
                },
                toggleExpensesItemCollapse(index) {
                    
                    if (this.expensesAppData[index].collapsed) {
                        this.expensesAppData[index].collapsed = false;
                    } else {

                        if (!this.rocketItem) {
                            alert('Please select a Rocket Money title first.');
                            return;
                        }

                        this.expensesTitle = this.expensesAppData[index].title + ': $' + this.expensesAppData[index].amount;
                        this.matchedTitlesData.push({
                            rocket_money_index: this.rocketItem.Index,
                            rocket_money_id: this.rocketItem['id'],
                            expenses_app_id: this.expensesAppData[index]['vnd_id'],
                            rocket_money_title: this.rocketItem.Name,
                            rocket_money_amount: this.rocketItem.Amount,
                            rocket_money_date: this.rocketItem.Date,
                            rocket_money_medium_title: this.rocketItem.MediumName,
                            rocket_money_long_title: this.rocketItem.LongName,
                            expenses_app_index: this.expensesAppData[index].index,
                            expenses_app_title: this.expensesAppData[index].title,
                            expenses_app_amount: this.expensesAppData[index].amount,
                            expenses_app_date: this.expensesAppData[index].day_of_month,
                            expenses_app_medium_title: this.expensesAppData[index].medium_title,
                            expenses_app_long_title: this.expensesAppData[index].long_title
                        });

                        for (i = 0; i < this.rocketIndex; i++) {
                            this.rocketMoneyData[i].Collapsed = true;
                        }
                        
                        this.expensesAppData[index].collapsed = true;

                        
                        this.insertTitleMatch(this.matchedTitlesData[this.matchedTitlesData.length - 1]);
                    }
                    this.updateExpensesItemCollapsed(index);
                    this.updateRocketItemCollapsed();

                    this.rocketItem = null;
                    this.rocketIndex = -1;
                },
                async insertTitleMatch(matchedItem) {
                    try {
                        const response = await axios.get('/api/insertTitleMatch.php', { params: matchedItem });
                        if (response.data && response.data.success) {
                            console.log('Title match inserted successfully:', response.data);
                        } else {
                            console.error('Failed to insert title match:', response.data);
                        }
                    } catch (error) {
                        console.error('Error inserting title match:', error);
                    }
                },
                async loadTitleMatches() {
                    console.log('aaa');
                    try {
                        const response = await axios.get('/api/loadTitleMatches.php');
                        if (response.data && response.data.items) {
                            console.log('Loaded title matches:', response.data);
                            this.matchedTitlesData = response.data.items;
                        }
                    } catch (error) {
                        console.error('Error loading title matches:', error);
                    }
                },
                async loadBudgetDiscrepancies() {
                    console.log('aaa');
                    try {
                        const response = await axios.get('/api/loadBudgetDiscrepancies.php');
                        if (response.data && response.data.items) {
                            console.log('Loaded Budget Discrepancies:', response.data.items);
                            this.budgetDiscrepancies = response.data.items;
                        }
                    } catch (error) {
                        console.error('Error loading title matches:', error);
                    }
                },
                async updateExpensesItemCollapsed(index) {
                    // Update collapse state in DB if needed
                    const item = this.expensesAppData[index];

                    const collapsed = item.collapsed ? 1 : 0;

                    const response = await fetch('/api/updateExpensesAppCollapsed.php?vnd_id=' + item.vnd_id + '&collapsed=' + collapsed, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({
                            id: item.id,
                            collapsed: item.Collapsed
                        })
                    });

                    if (!response.ok) {
                        console.error('Failed to update rocket item collapse state');
                    }

                },
                
                // Modal methods
                openExpenseDiscrepanciesModal() {
                    console.log('Opening expense discrepancies modal');
                    this.expenseDiscrepanciesModalVisible = true;
                    this.loadBudgetDiscrepancies();
                },
                
                closeExpenseDiscrepanciesModal() {
                    console.log('Closing expense discrepancies modal');
                    this.expenseDiscrepanciesModalVisible = false;
                }
            }
    });
    
    console.log('Mounting Vue app...');
    window.vueApp = app.mount('#app');
    console.log('Vue app mounted successfully');
</script></div> <!-- End of Vue app -->
</body>
</html>
