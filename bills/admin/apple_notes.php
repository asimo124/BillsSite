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
<head>
    <title>Apple Notes Manager</title>
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

    <style>
        .note-body-preview {
            max-width: 420px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .note-body-full {
            max-width: 520px;
            white-space: pre-wrap;
            word-break: break-word;
        }
    </style>
</head>
<body>
<div class="max-w-7xl mx-auto px-2 sm:px-4 md:px-6 lg:px-12 xl:px-16" id="app">
    <div class="py-5"></div>

    <h2 class="text-2xl font-bold mb-4">Apple Notes Manager</h2>

    <!-- Responsive Navigation Bar -->
    <?php include "../../templates/nav4.php"; ?>

    <!-- Blank content for the Upload tab -->
    <div style="clear: both; height: 16px;"></div>
    <h2 class="text-2xl font-bold mb-4">Upload</h2>
    
    <!-- Apple Notes Upload Form -->
    <form action="proc_apple_notes.php" method="POST" enctype="multipart/form-data" class="mb-6" target="_blank">
        <div class="grid grid-cols-1 gap-4">
            <div>
                <label for="apple_notes_file" class="block text-sm font-medium text-gray-700 mb-2">Upload Apple Notes</label>
                <input type="file" id="apple_notes_file" name="apple_notes_file" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500" accept=".csv" />
                <div class="mt-4 flex items-center justify-between">
                    <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Upload File</button>
                </div>
            </div>
        </div>
    </form>

    <hr class="my-8 border-gray-300" />

    <h2 class="text-2xl font-bold mb-4">Notes</h2>

    <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-4">
        <div class="md:col-span-2">
            <label class="block text-sm font-medium text-gray-700 mb-1">Keyword</label>
            <input
                type="text"
                v-model="filters.keyword"
                @keyup.enter="applyFilters"
                placeholder="Search title or body..."
                class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
            />
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Mod start</label>
            <input
                type="date"
                v-model="filters.start_date"
                class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
            />
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Mod end</label>
            <input
                type="date"
                v-model="filters.end_date"
                class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
            />
        </div>
    </div>

    <div class="sticky top-0 z-40 flex flex-wrap items-center gap-3 mb-4 py-3 px-3 -mx-2 sm:mx-0 bg-white/95 backdrop-blur border border-gray-200 rounded-md shadow-md">
        <button
            type="button"
            @click="applyFilters"
            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
        >
            Search
        </button>
        <button
            type="button"
            @click="clearFilters"
            class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded"
        >
            Clear
        </button>
        <button
            type="button"
            @click="deleteSelected"
            :disabled="selectedIds.length === 0 || deleting"
            class="bg-red-500 hover:bg-red-700 disabled:opacity-50 disabled:cursor-not-allowed text-white font-bold py-2 px-4 rounded"
        >
            {{ deleting ? 'Deleting...' : 'Delete Selected (' + selectedIds.length + ')' }}
        </button>
        <form action="proc_export_apple_notes.php" method="POST" class="inline" target="_blank">
            <button
                type="submit"
                class="bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded"
            >
                Export to CSV
            </button>
        </form>
        <div class="ml-auto flex items-center gap-2">
            <label class="text-sm text-gray-700">Per page</label>
            <select
                v-model.number="perPage"
                @change="changePerPage"
                class="px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
            >
                <option :value="20">20</option>
                <option :value="50">50</option>
                <option :value="100">100</option>
            </select>
        </div>
    </div>

    <div v-if="error" class="mb-4 p-3 bg-red-100 text-red-700 rounded">{{ error }}</div>
    <div v-if="message" class="mb-4 p-3 bg-green-100 text-green-700 rounded">{{ message }}</div>
    <div v-if="loading" class="mb-4 text-gray-600">Loading notes...</div>

    <div class="overflow-x-auto border border-gray-200 rounded-md">
        <table class="min-w-full divide-y divide-gray-200 text-sm">
            <thead class="bg-gray-50">
                <tr>
                    <th class="px-3 py-3 text-left">
                        <input
                            type="checkbox"
                            :checked="allSelected"
                            :indeterminate.prop="someSelected"
                            @change="toggleSelectAll"
                        />
                    </th>
                    <th class="px-3 py-3 text-left font-semibold text-gray-700">Title</th>
                    <th class="px-3 py-3 text-left font-semibold text-gray-700">Folder</th>
                    <th class="px-3 py-3 text-left font-semibold text-gray-700">Modified</th>
                    <th class="px-3 py-3 text-left font-semibold text-gray-700">Body</th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-100">
                <tr v-if="!loading && notes.length === 0">
                    <td colspan="5" class="px-3 py-6 text-center text-gray-500">No notes found.</td>
                </tr>
                <tr v-for="note in notes" :key="note.id" class="hover:bg-gray-50">
                    <td class="px-3 py-3 align-top">
                        <input
                            type="checkbox"
                            :value="note.id"
                            v-model="selectedIds"
                        />
                    </td>
                    <td class="px-3 py-3 align-top font-medium text-gray-900">{{ note.name || '(Untitled)' }}</td>
                    <td class="px-3 py-3 align-top text-gray-600">{{ note.folder || '—' }}</td>
                    <td class="px-3 py-3 align-top text-gray-600 whitespace-nowrap">{{ formatDate(note.modification_date) }}</td>
                    <td class="px-3 py-3 align-top text-gray-700">
                        <div
                            :class="expandedIds.includes(note.id) ? 'note-body-full' : 'note-body-preview'"
                            :title="note.body || ''"
                        >{{ note.body || '—' }}</div>
                        <button
                            v-if="note.body && note.body.length > 80"
                            type="button"
                            class="mt-1 text-blue-600 hover:underline text-xs"
                            @click="toggleExpand(note.id)"
                        >
                            {{ expandedIds.includes(note.id) ? 'Collapse' : 'Expand' }}
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="flex flex-wrap items-center justify-between gap-3 mt-4 mb-10">
        <div class="text-sm text-gray-600">
            Showing {{ notes.length ? ((page - 1) * perPage) + 1 : 0 }}–{{ Math.min(page * perPage, total) }}
            of {{ total }}
        </div>
        <div class="flex items-center gap-2">
            <button
                type="button"
                @click="goToPage(page - 1)"
                :disabled="page <= 1 || loading"
                class="px-3 py-2 border border-gray-300 rounded disabled:opacity-50"
            >
                Previous
            </button>
            <span class="text-sm text-gray-700">Page {{ page }} of {{ totalPages }}</span>
            <button
                type="button"
                @click="goToPage(page + 1)"
                :disabled="page >= totalPages || loading"
                class="px-3 py-2 border border-gray-300 rounded disabled:opacity-50"
            >
                Next
            </button>
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
            
        }
        delete window.vueApp;
    }

    const { createApp } = Vue;

    const app = createApp({
            data() {
                return {
                    notes: [],
                    selectedIds: [],
                    expandedIds: [],
                    filters: {
                        keyword: '',
                        start_date: '',
                        end_date: ''
                    },
                    page: 1,
                    perPage: 20,
                    total: 0,
                    totalPages: 1,
                    loading: false,
                    deleting: false,
                    error: '',
                    message: ''
                };
            },
            computed: {
                allSelected() {
                    return this.notes.length > 0 && this.notes.every(n => this.selectedIds.includes(n.id));
                },
                someSelected() {
                    return this.selectedIds.length > 0 && !this.allSelected;
                }
            },
            mounted() {
                this.loadNotes();
            },
            methods: {
                async loadNotes() {
                    this.loading = true;
                    this.error = '';
                    try {
                        const params = new URLSearchParams({
                            page: String(this.page),
                            per_page: String(this.perPage)
                        });
                        if (this.filters.keyword) {
                            params.set('keyword', this.filters.keyword);
                        }
                        if (this.filters.start_date) {
                            params.set('start_date', this.filters.start_date);
                        }
                        if (this.filters.end_date) {
                            params.set('end_date', this.filters.end_date);
                        }

                        const response = await axios.get('/api/loadAppleNotes.php?' + params.toString());
                        if (response.data && response.data.error) {
                            this.error = response.data.error;
                            this.notes = [];
                            this.total = 0;
                            this.totalPages = 1;
                            return;
                        }

                        this.notes = (response.data.items || []).map(n => ({
                            ...n,
                            id: parseInt(n.id, 10)
                        }));
                        this.total = response.data.total || 0;
                        this.page = response.data.page || 1;
                        this.perPage = response.data.per_page || this.perPage;
                        this.totalPages = response.data.total_pages || 1;
                        this.selectedIds = [];
                        this.expandedIds = [];
                    } catch (error) {
                        this.error = 'Failed to load notes.';
                        console.error(error);
                    } finally {
                        this.loading = false;
                    }
                },
                applyFilters() {
                    this.page = 1;
                    this.message = '';
                    this.loadNotes();
                },
                clearFilters() {
                    this.filters.keyword = '';
                    this.filters.start_date = '';
                    this.filters.end_date = '';
                    this.page = 1;
                    this.message = '';
                    this.loadNotes();
                },
                changePerPage() {
                    this.page = 1;
                    this.loadNotes();
                },
                goToPage(p) {
                    if (p < 1 || p > this.totalPages) {
                        return;
                    }
                    this.page = p;
                    this.loadNotes();
                },
                toggleSelectAll(event) {
                    if (event.target.checked) {
                        this.selectedIds = this.notes.map(n => n.id);
                    } else {
                        this.selectedIds = [];
                    }
                },
                toggleExpand(id) {
                    if (this.expandedIds.includes(id)) {
                        this.expandedIds = this.expandedIds.filter(x => x !== id);
                    } else {
                        this.expandedIds.push(id);
                    }
                },
                formatDate(value) {
                    if (!value) {
                        return '—';
                    }
                    return String(value).replace('T', ' ').substring(0, 16);
                },
                async deleteSelected() {
                    if (this.selectedIds.length === 0) {
                        return;
                    }

                    this.deleting = true;
                    this.error = '';
                    this.message = '';
                    try {
                        const params = new URLSearchParams({
                            ids: this.selectedIds.join(',')
                        });
                        const response = await axios.get('/api/deleteAppleNotes.php?' + params.toString());
                        if (response.data && response.data.success) {
                            this.message = 'Marked ' + (response.data.deleted_count || this.selectedIds.length) + ' note(s) for deletion.';
                            await this.loadNotes();
                        } else {
                            this.error = (response.data && response.data.error) || 'Delete failed.';
                        }
                    } catch (error) {
                        this.error = 'Failed to delete notes.';
                        console.error(error);
                    } finally {
                        this.deleting = false;
                    }
                }
            }
        });

        window.vueApp = app.mount('#app');
        
    </script>
</body>
</html>
