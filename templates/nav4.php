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
                                <a href="/bills/admin/disposable_income_tracker.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Audit Expenses</a>
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
                                <a href="/bills/admin/debt_progress.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Debt Progress</a>
                                <a href="/bills/admin/food_sensitivities.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Food Sensitivities</a>
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