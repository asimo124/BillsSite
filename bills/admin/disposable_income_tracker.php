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

    <!-- Include ApexCharts and Vue-ApexCharts from a reliable source -->
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script src="https://unpkg.com/vue3-apexcharts/dist/vue3-apexcharts.umd.min.js"></script>
</head>
<body>
<div class="max-w-7xl mx-auto px-2 sm:px-4 md:px-6 lg:px-12 xl:px-16" id="app">
    <div class="py-5"></div>

    <h2 class="text-2xl font-bold mb-4">Disposable Income Tracker</h2>

    <!-- Responsive Navigation Bar -->
    <?php include "../../templates/nav4.php"; ?>

    <ul class="flex border-b">
        <li class="-mb-px mr-1">
            <a class="bg-white inline-block border-l border-t border-r rounded-t py-2 px-4 text-blue-700 font-semibold" href="#" @click="activeTab = 'tracker'">Tracker</a>
        </li>
        <li class="mr-1">
            <a class="bg-white inline-block py-2 px-4 text-blue-500 hover:text-blue-800 font-semibold" href="#" @click="activeTab = 'upload'">Upload</a>
        </li>
    </ul>

    <div v-if="activeTab === 'tracker'">
        <!-- Existing content of the page -->
        
        <div style="clear: both; height: 16px;"></div>
        <h2 class="text-2xl font-bold mb-4">Tracker</h2>

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

        <!-- Date Navigation Row -->
        <div class="grid grid-cols-3 items-center mb-4">
            <button class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded" @click="previousDate">&lt;</button>
            <span class="text-lg font-medium text-center">{{ paycheck_date_display }}</span>
            <button class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded" @click="nextDate">&gt;</button>
        </div>

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
                                <td class="px-6 py-4 text-sm text-gray-900" style="word-wrap: break-word; white-space: normal;">{{ item.name }}</td>
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

        <!-- Date Navigation Row -->
        <div class="grid grid-cols-3 items-center mb-4">
            <button class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded" @click="previousDate">&lt;</button>
            <span class="text-lg font-medium text-center">{{ paycheck_date_display }}</span>
            <button class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded" @click="nextDate">&gt;</button>
        </div>


        <div class="py-5"></div>
        <div class="bg-white shadow-md rounded-lg p-6">
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <h2 class="text-xl font-semibold text-gray-800 mb-4">Disposable Spent Over Time</h2>
                <div style="display: flex; align-items: center; gap: 8px;">
                    <input type="checkbox" id="cumulative_checkbox" v-model="cumulative" @change="loadChartData" />
                    <label for="cumulative_checkbox" class="text-gray-700">Cumulative</label>
                </div>
                <button class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded inline-flex items-center" @click="loadRoot">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 mr-2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12a7.5 7.5 0 0115 0m-15 0a7.5 7.5 0 0015 0m-15 0H3m18 0h-1.5" />
                    </svg>
                    Reload
                </button>
            </div>
            
            <div id="disposable_spent_over_time_chart" class="w-full h-96" style="width: 100%; height: 400px;"></div>
        </div>
    </div>

    <div v-if="activeTab === 'upload'">
        <!-- Blank content for the Upload tab -->
        <div style="clear: both; height: 16px;"></div>
        <h2 class="text-2xl font-bold mb-4">Upload</h2>
        
        <!-- Rocket Money Upload Form -->
        <form action="process_disposable_tracker_upload4.php" method="POST" enctype="multipart/form-data" class="mb-6" target="_blank">
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
            
        }
        delete window.vueApp;
    }

    const { createApp } = Vue;

    const app = createApp({
            data() {
                return {
                    activeTab: 'tracker', // Default tab
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
                    paycheck_date_display: '',
                    transaction_date: null,
                    category_name: null,
                    drilldownLevel: 'root',

                    // Existing data properties
                    transactions: [],
                    cumulative: 0,

                    // Chart data
                    chartOptions: {
                        chart: {
                            type: 'bar',
                        },
                        xaxis: {
                            categories: [],
                        },
                    },
                    series: [
                        {
                            name: 'Spent',
                            data: [],
                        },
                    ],
                };
            },
            mounted() {
                this.loadPage();
                
                // Force chart redraw after mounting
                this.$nextTick(() => {
                    // Create the chart using chartOptions and series from data properties
                    this.chartInstance = new ApexCharts(document.querySelector("#disposable_spent_over_time_chart"), {
                        ...this.chartOptions,
                        series: this.series,
                        chart: {
                            ...this.chartOptions.chart,
                            events: {
                                dataPointSelection: (event, chartContext, config) => {
                                    
                                    const clickedDay = this.chartOptions.xaxis.categories[config.dataPointIndex];
                                    
                                    this.drilldownIntoChart(clickedDay);
                                },
                            },
                        },
                    });

                    this.chartInstance.render().then(() => {
                        
                    }).catch((error) => {
                        console.error('Error rendering native ApexCharts chart:', error);
                    });
                });
            },
            beforeUnmount() {},
            methods: {
                loadPage() {
                    this.paycheck_date = this.getDefaultPaycheckDate();
                    this.loadData();
                    
                },
                getDefaultPaycheckDate() {
                    const today = new Date();
                    const day = today.getDate();
                    let paycheckDate;

                    if (day <= 15) {
                        const previousMonth = today.getMonth() - 1;
                        const year = previousMonth < 0 ? today.getFullYear() - 1 : today.getFullYear();
                        paycheckDate = new Date(year, previousMonth < 0 ? 11 : previousMonth, 15);
                    } else {
                        paycheckDate = new Date(today.getFullYear(), today.getMonth(), 1);
                    }

                    this.paycheck_date_display = paycheckDate.toLocaleDateString('en-US', {
                        year: 'numeric',
                        month: 'short',
                        day: 'numeric'
                    });
                    return paycheckDate.toISOString().split('T')[0];
                },
                loadData() {
                    this.loadTransactions();
                    this.loadChartData();
                },
                loadRoot() {
                    this.drilldownLevel = 'root';
                    this.transaction_date = null;
                    this.category_name = null;
                    this.loadChartData();
                },
                previousDate() {
                    const [year, month, day] = this.paycheck_date.split('-').map(Number);
                    const currentDate = new Date(year, month - 1, day); // Month is zero-based
                    let newDate;

                    
                    if (currentDate.getDate() === 15) {
                        
                        newDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1);
                        
                    } else {
                    
                        if (currentDate.getMonth() === 0) {
                            newDate = new Date(currentDate.getFullYear() - 1, 11, 15); // Go to Dec 15 of the previous year
                        } else {
                            newDate = new Date(currentDate.getFullYear(), currentDate.getMonth() - 1, 15);
                        }
                    }

                    this.paycheck_date = newDate.toISOString().split('T')[0];
                    this.paycheck_date_display = newDate.toLocaleDateString('en-US', {
                        year: 'numeric',
                        month: 'short',
                        day: 'numeric'
                    });
                    this.loadData();
                },
                nextDate() {
                    const [year, month, day] = this.paycheck_date.split('-').map(Number);
                    const currentDate = new Date(year, month - 1, day); // Month is zero-based
                    let newDate;

                    
                    if (currentDate.getDate() === 15) {
                        if (currentDate.getMonth() === 11) {
                            newDate = new Date(currentDate.getFullYear() + 1, 0, 1); // Go to Jan 1 of the next year
                        } else {
                            newDate = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 1);
                        }
                    } else {
                        newDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), 15);
                    }

                    this.paycheck_date = newDate.toISOString().split('T')[0];
                    this.paycheck_date_display = newDate.toLocaleDateString('en-US', {
                        year: 'numeric',
                        month: 'short',
                        day: 'numeric'
                    });
                    this.loadData();
                },
                async loadTransactions() {
                    try {
                        const response = await axios.get('/api/loadDisposableTransactions.php?paycheck_date=' + this.paycheck_date);
                        if (response.data && response.data.items) {
                            
                            this.transactions = response.data.items;
                        }
                    } catch (error) {}
                },
                async drilldownIntoChart(dimension) {

                    if (this.drilldownLevel == 'root') {
                            
                        const dayOfMonth = parseInt(dimension.split(', ')[1]);
                        const yearMonth = this.paycheck_date.slice(0, 7);
                        const clickedDate = `${yearMonth}-${dayOfMonth.toString().padStart(2, '0')}`;
                    
                        this.transaction_date = clickedDate;
                        
                        this.drilldownLevel = 'day';
                        this.loadChartData();

                    } else if (this.drilldownLevel == 'day') {
                        
                        this.category_name = dimension;
                        this.drilldownLevel = 'category';

                        this.loadChartData();
                    }
                },
                async loadChartData() {

                    const cumulativeParam = this.cumulative ? 1 : 0;

                    if (this.drilldownLevel == 'root') {
                        
                        const response = await axios.get('/api/loadDisposableTransactionsChartData.php?paycheck_date=' + this.paycheck_date + '&cumulative=' + cumulativeParam);
                        if (response.data) {
                            
                            this.chartOptions = response.data.chartOptions;
                            this.series = response.data.series;

                            // Update the chart with new options and series
                            if (this.chartInstance) {
                                this.chartInstance.updateOptions(this.chartOptions);
                                this.chartInstance.updateSeries(this.series);
                                this.chartInstance.updateOptions({
                                    yaxis: {
                                        min: 0,
                                        max: response.data.maxY || undefined,
                                    },
                                });
                            }
                        }

                    } else if (this.drilldownLevel == 'day') {
                        
                        try {
                            const response = await axios.get('/api/loadDisposableTransactionsChartDataDay.php?paycheck_date=' + this.paycheck_date + '&transaction_date=' + this.transaction_date + '&cumulative=' + cumulativeParam);
                            if (response.data) {
                                
                                this.chartOptions = response.data.chartOptions;
                                this.series = response.data.series;

                                // Update the chart with new options and series
                                if (this.chartInstance) {
                                    this.chartInstance.updateOptions(this.chartOptions);
                                    this.chartInstance.updateSeries(this.series);
                                }
                            }
                        } catch (error) {}

                    } else if (this.drilldownLevel == 'category') {

                        try {
                            const response = await axios.get('/api/loadDisposableTransactionsChartDataCategory.php?paycheck_date=' + this.paycheck_date + '&transaction_date=' + this.transaction_date + '&category_name=' + encodeURIComponent(this.category_name) + '&cumulative=' + cumulativeParam);
                            if (response.data) {
                                
                                this.chartOptions = response.data.chartOptions;
                                this.series = response.data.series;

                                // Update the chart with new options and series
                                if (this.chartInstance) {
                                    this.chartInstance.updateOptions(this.chartOptions);
                                    this.chartInstance.updateSeries(this.series);
                                }
                            }
                        } catch (error) {}
                    }
                },
                async updateIsCovered(id, isCovered) {
                    try {
                        const response = await axios.get('/api/updateDisposableTransactionCovered.php?id=' + id + '&is_covered=' + isCovered);
                        if (response.data && response.data.success) {
                            this.loadData();
                        }
                    } catch (error) {}
                },
                async updateAllNotCovered() {
                    try {
                        const response = await axios.get('/api/updateAllNotCovered.php?paycheck_date=' + this.paycheck_date);
                        if (response.data && response.data.success) {
                            this.loadData();
                        }
                    } catch (error) {}
                },
                reloadData() {
                    this.loadData();
                },
            },
        });

        
        window.vueApp = app.mount('#app');
        
    </script>
</div> <!-- End of Vue app -->
</body>
</html>
