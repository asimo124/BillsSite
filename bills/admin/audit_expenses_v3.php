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

?>
<!DOCTYPE html>
<                                <!-- Popover -->
                                <div 
                                    v-show="rocketMatchPopoverVisible && rocketMatchHoveredIndex === index"
                                    class="absolute z-50 bg-gray-800 text-white text-sm rounded-lg py-2 px-3 max-w-xs shadow-lg -top-12 left-0 sm:-top-2 sm:left-full sm:ml-2"
                                    style="white-space: normal; word-wrap: break-word;"
                                >
                                    {{ item.LongName || 'No detailed name available' }}
                                    <!-- Arrow pointing down on mobile, left on desktop -->
                                    <div class="absolute top-full left-4 transform -translate-x-1/2 w-0 h-0 border-l-4 border-r-4 border-t-4 border-transparent border-t-gray-800 sm:hidden"></div>
                                    <div class="hidden sm:block absolute top-1/2 left-0 transform -translate-y-1/2 -translate-x-1 w-0 h-0 border-t-4 border-b-4 border-r-4 border-transparent border-r-gray-800"></div>
                                </div>d>
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

    <?php //if (count($results) > 0) : ?>
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

    <form action="process_audit_expenses_v2.php" method="POST" class="mb-8">
        <div class="title_lookup_content hidden">
            <div class="grid grid-cols-1 gap-4">
                <!-- Content will be populated by Vue.js -->
            </div>
        </div>
    </form>

    <label for="title_lookups" class="block text-sm font-medium text-gray-700 mb-2">Title Matching <span class="text-xs text-gray-500">(tap titles to see details)</span></label>
    <div class="grid grid-cols-2 gap-1 mb-8">
       
        <div class="overflow-y-auto max-h-96 lg:max-h-[650px] border border-gray-200 rounded-lg py-2 px-[2px]">
            <table class="min-w-full divide-y divide-gray-200 bg-white">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Title</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200"> 
                    <tr class="expenses_row transition-all duration-300" data-index="<?php echo $index; ?>" v-for="(item, index) in rocketMoneyData"
                        :class="{ 'h-4 overflow-hidden': collapsedRocketItems[index], 'hover:bg-gray-50': !collapsedRocketItems[index] }">
                        <td class="px-6 text-sm text-gray-900 relative transition-all duration-300"
                            :class="collapsedRocketItems[index] ? 'py-0' : 'py-4'">
                            <div class="flex items-center">
                                <span 
                                    @click="toggleRocketMatchPopover(index)" 
                                    @mouseenter="showRocketMatchPopover(index)" 
                                    @mouseleave="hideRocketMatchPopover()"
                                    class="cursor-help hover:text-blue-600 transition-colors popover-trigger"
                                    :class="{ 'text-xs opacity-30': collapsedRocketItems[index] }"
                                >
                                    {{ item.Name }}
                                </span>
                                <button @click="toggleRocketItemCollapse(index)"
                                        class="font-bold rounded-full text-xs flex items-center justify-center ml-2 transition-all duration-300"
                                        :class="collapsedRocketItems[index] 
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
                            :class="{ 'h-4 overflow-hidden': collapsedExpensesItems[index], 'hover:bg-gray-50': !collapsedExpensesItems[index] }">
                            <td class="px-6 text-sm text-gray-900 relative transition-all duration-300"
                                :class="collapsedExpensesItems[index] ? 'py-0' : 'py-4'">
                                <div class="flex items-center">
                                    <span 
                                        @click="toggleExpensesMatchPopover(index)"
                                        @mouseenter="showExpensesMatchPopover(index)" 
                                        @mouseleave="hideExpensesMatchPopover()"
                                        class="cursor-help hover:text-blue-600 transition-colors popover-trigger"
                                        :class="{ 'text-xs opacity-30': collapsedExpensesItems[index] }"
                                    >
                                        {{ item.title }}
                                    </span>
                                    <button @click="toggleExpensesItemCollapse(index)"
                                            class="font-bold rounded-full text-xs flex items-center justify-center ml-2 transition-all duration-300"
                                            :class="collapsedExpensesItems[index] 
                                                ? 'bg-yellow-500 hover:bg-yellow-600 text-black w-3 h-3' 
                                                : 'bg-green-500 hover:bg-green-700 text-white w-4 h-4'">
                                        +
                                    </button>
                                </div>
                                
                                <!-- Popover -->
                                <div 
                                    v-show="expensesMatchPopoverVisible && expensesMatchHoveredIndex === index && !collapsedExpensesItems[index]"
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
                mobileChargesOpen: false,
                mobileAdminOpen: false,
                fileExists: <?= $uploadedFilePath ? 'true' : 'false'; ?>,
                
                
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
                collapsedExpensesItems: {}
            }
        },
        mounted() {
            console.log('Vue app mounted successfully');
            this.loadPage();
            
            // Add click outside handler for mobile popover closing
            document.addEventListener('click', this.handleClickOutside);
        },
        
        beforeUnmount() {
            document.removeEventListener('click', this.handleClickOutside);
        },
        methods: {
            loadPage() {
                console.log('Loading page data...');
                this.loadExpensesAppData();
                if (this.fileExists) {
                    console.log('File exists, loading rocket money data...');
                    this.loadRocketMoneyData();
                } else {
                    console.log('No file exists, skipping rocket money data load');
                }
            },

            async loadExpensesAppData() {
                try {   
                    const response = await axios.get('/api/loadExpensesAppData.php');
                    if (response.data && response.data.items) {
                        console.log('Expenses App Data:', response.data);
                        this.expensesAppData = response.data.items;
                    } else {
                        console.log('No expenses app data received, using test data');
                        // Add test data if no real data
                        this.expensesAppData = [
                            { title: 'Test Expense 1', long_title: 'This is a longer test expense title with more details', amount: '25.99', day_of_month: '15' },
                            { title: 'Test Expense 2', long_title: 'Another longer test expense title with detailed information', amount: '45.50', day_of_month: '20' }
                        ];
                    }
                } catch (error) {
                    console.error('Error loading expenses app data:', error);
                    // Add fallback test data
                    this.expensesAppData = [
                        { title: 'Test Expense 1', long_title: 'This is a longer test expense title with more details', amount: '25.99', day_of_month: '15' },
                        { title: 'Test Expense 2', long_title: 'Another longer test expense title with detailed information', amount: '45.50', day_of_month: '20' }
                    ];
                }
            },
            async loadRocketMoneyData() {
                try {   
                    const response = await axios.get('/api/loadRocketMoneyData.php');
                    if (response.data && response.data.items) {
                        console.log('Rocket Money Data:', response.data);
                        this.rocketMoneyData = response.data.items;
                    } else {
                        console.log('No rocket money data received, using test data');
                        // Add test data if no real data
                        this.rocketMoneyData = [
                            { Name: 'Test Rocket 1', LongName: 'This is a longer test rocket money title with more details', Amount: '35.99', Date: '18' },
                            { Name: 'Test Rocket 2', LongName: 'Another longer test rocket money title with detailed information', Amount: '55.25', Date: '25' }
                        ];
                    }
                } catch (error) {
                    console.error('Error loading rocket money data:', error);
                    // Add fallback test data
                    this.rocketMoneyData = [
                        { Name: 'Test Rocket 1', LongName: 'This is a longer test rocket money title with more details', Amount: '35.99', Date: '18' },
                        { Name: 'Test Rocket 2', LongName: 'Another longer test rocket money title with detailed information', Amount: '55.25', Date: '25' }
                    ];
                }
            },
            
            // Popover methods
            showPopover(index) {
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
            
            // Popover methods for matching tables
            showRocketMatchPopover(index) {
                console.log('showRocketMatchPopover called with index:', index);
                this.rocketMatchHoveredIndex = index;
                this.rocketMatchPopoverVisible = true;
            },
            
            hideRocketMatchPopover() {
                console.log('hideRocketMatchPopover called');
                this.rocketMatchHoveredIndex = null;
                this.rocketMatchPopoverVisible = false;
            },
            
            toggleRocketMatchPopover(index) {
                console.log('toggleRocketMatchPopover called with index:', index);
                if (this.rocketMatchPopoverVisible && this.rocketMatchHoveredIndex === index) {
                    this.hideRocketMatchPopover();
                } else {
                    this.showRocketMatchPopover(index);
                }
            },
            
            showExpensesMatchPopover(index) {
                console.log('showExpensesMatchPopover called with index:', index);
                this.expensesMatchHoveredIndex = index;
                this.expensesMatchPopoverVisible = true;
            },
            
            hideExpensesMatchPopover() {
                console.log('hideExpensesMatchPopover called');
                this.expensesMatchHoveredIndex = null;
                this.expensesMatchPopoverVisible = false;
            },
            
            toggleExpensesMatchPopover(index) {
                console.log('toggleExpensesMatchPopover called with index:', index);
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
            
            // Collapse/expand methods
            toggleRocketItemCollapse(index) {
                console.log('toggleRocketItemCollapse called with index:', index);
                if (this.collapsedRocketItems[index]) {
                    delete this.collapsedRocketItems[index];
                } else {
                    this.collapsedRocketItems[index] = true;
                }
            },
            
            toggleExpensesItemCollapse(index) {
                console.log('toggleExpensesItemCollapse called with index:', index);
                if (this.collapsedExpensesItems[index]) {
                    delete this.collapsedExpensesItems[index];
                } else {
                    this.collapsedExpensesItems[index] = true;
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
                
            //     content = '<h3 class="text-lg font-bold mb-4">Title Lookups</h3>' + 
            //             '<div class="overflow-x-auto shadow-sm rounded-lg">' +
            //             '<table class="min-w-full divide-y divide-gray-200 bg-white">' + 
            //                 '<thead class="bg-gray-50">' +
            //                 '<tr>' + 
            //                     '<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Rocket Money Title</th>' + 
            //                     '<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Expenses App Title</th>' + 
            //                 '</tr>' +
            //                 '</thead>' +
            //                 '<tbody class="bg-white divide-y divide-gray-200">';
                            
            //     for (let i = 0; i < this.titleLookups.length; i++) {
            //         content += '<tr data-index="' + i + '" class="title_lookup_row hover:bg-gray-50">' + 
            //                 '<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">' + this.titleLookups[i].rocket_money_title + '</td>' + 
            //                 '<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">' +
            //                     this.titleLookups[i].expenses_app_title + 
            //                     '<input type="hidden" name="title_lookup_rocket_money_titles[]" value="' + this.titleLookups[i].rocket_money_title + '" />' +
            //                     '<input type="hidden" name="title_lookup_expenses_app_titles[]" value="' + this.titleLookups[i].expenses_app_title + '" />' +
            //                     '&nbsp; <button type="button" class="bg-red-500 hover:bg-red-700 text-white font-bold py-1 px-2 rounded text-xs" @click="removeTitleLookup(' + i + ')">X</button>' +
            //                 '</td>' + 
            //             '</tr>';
            //     }
            //     content += '</tbody></table></div>' + 
            //         '<div class="mt-4"></div>' + 
            //         '<input type="hidden" name="file" value="<?= htmlspecialchars($uploadedFilePath); ?>" />' +
            //         '<button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Submit</button>';
                
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
