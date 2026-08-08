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

    <div class="grid grid-cols-1 md:grid-cols-6 gap-4 mb-4">
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Title keyword</label>
            <div class="relative">
                <input
                    type="text"
                    v-model="filters.keyword_title"
                    @keyup.enter="applyFilters"
                    placeholder="Search title..."
                    class="w-full px-3 py-2 pr-9 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
                />
                <button
                    v-if="filters.keyword_title"
                    type="button"
                    @click="clearKeyword('keyword_title')"
                    class="absolute inset-y-0 right-0 px-3 text-gray-400 hover:text-gray-700"
                    aria-label="Clear title keyword"
                >&times;</button>
            </div>
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Body keyword</label>
            <div class="relative">
                <input
                    type="text"
                    v-model="filters.keyword_body"
                    @keyup.enter="applyFilters"
                    placeholder="Search body..."
                    class="w-full px-3 py-2 pr-9 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
                />
                <button
                    v-if="filters.keyword_body"
                    type="button"
                    @click="clearKeyword('keyword_body')"
                    class="absolute inset-y-0 right-0 px-3 text-gray-400 hover:text-gray-700"
                    aria-label="Clear body keyword"
                >&times;</button>
            </div>
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
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Sort by</label>
            <select
                v-model="filters.sort_by"
                @change="applyFilters"
                class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
            >
                <option value="modification_date">Modification date</option>
                <option value="creation_date">Creation date</option>
                <option value="name">Title</option>
                <option value="folder">Folder</option>
            </select>
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Sort direction</label>
            <select
                v-model="filters.sort_dir"
                @change="applyFilters"
                class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"
            >
                <option value="DESC">DESC</option>
                <option value="ASC">ASC</option>
            </select>
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
        <div class="flex flex-wrap items-center gap-1">
            <button
                type="button"
                @click="goToPage(page - 1)"
                :disabled="page <= 1 || loading"
                class="px-3 py-2 border border-gray-300 rounded disabled:opacity-50"
            >
                Previous
            </button>
            <template v-for="(item, idx) in pageNumbers" :key="'p-' + idx">
                <span v-if="item === '...'" class="px-2 text-gray-500">…</span>
                <button
                    v-else
                    type="button"
                    @click="goToPage(item)"
                    :disabled="loading"
                    :class="item === page
                        ? 'px-3 py-2 border border-blue-500 bg-blue-500 text-white rounded'
                        : 'px-3 py-2 border border-gray-300 rounded hover:bg-gray-100'"
                >
                    {{ item }}
                </button>
            </template>
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
    const FILTER_STORAGE_KEY = 'apple_notes_filters';

    function getDefaultFilters() {
        return {
            keyword_title: '',
            keyword_body: '',
            start_date: '',
            end_date: '',
            sort_by: 'modification_date',
            sort_dir: 'DESC'
        };
    }

    function loadStoredFilters() {
        try {
            const raw = localStorage.getItem(FILTER_STORAGE_KEY);
            if (!raw) {
                return null;
            }
            const parsed = JSON.parse(raw);
            if (!parsed || typeof parsed !== 'object') {
                return null;
            }
            return parsed;
        } catch (e) {
            return null;
        }
    }

    const app = createApp({
            data() {
                const stored = loadStoredFilters();
                const defaults = getDefaultFilters();
                return {
                    notes: [],
                    selectedIds: [],
                    expandedIds: [],
                    filters: {
                        keyword_title: stored && typeof stored.keyword_title === 'string'
                            ? stored.keyword_title
                            : (stored && typeof stored.keyword === 'string' ? stored.keyword : defaults.keyword_title),
                        keyword_body: stored && typeof stored.keyword_body === 'string'
                            ? stored.keyword_body
                            : defaults.keyword_body,
                        start_date: stored && typeof stored.start_date === 'string' ? stored.start_date : defaults.start_date,
                        end_date: stored && typeof stored.end_date === 'string' ? stored.end_date : defaults.end_date,
                        sort_by: stored && ['modification_date', 'creation_date', 'name', 'folder'].includes(stored.sort_by)
                            ? stored.sort_by
                            : defaults.sort_by,
                        sort_dir: stored && (stored.sort_dir === 'ASC' || stored.sort_dir === 'DESC')
                            ? stored.sort_dir
                            : defaults.sort_dir
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
                },
                pageNumbers() {
                    const total = this.totalPages;
                    const current = this.page;
                    if (total <= 1) {
                        return [1];
                    }
                    if (total <= 9) {
                        return Array.from({ length: total }, (_, i) => i + 1);
                    }

                    const pages = new Set([1, total, current, current - 1, current + 1, current - 2, current + 2]);
                    const sorted = [...pages].filter(p => p >= 1 && p <= total).sort((a, b) => a - b);
                    const result = [];
                    for (let i = 0; i < sorted.length; i++) {
                        if (i > 0 && sorted[i] - sorted[i - 1] > 1) {
                            result.push('...');
                        }
                        result.push(sorted[i]);
                    }
                    return result;
                }
            },
            watch: {
                filters: {
                    deep: true,
                    handler(value) {
                        this.persistFilters(value);
                    }
                }
            },
            mounted() {
                this.loadNotes();
            },
            methods: {
                persistFilters(filters) {
                    try {
                        localStorage.setItem(FILTER_STORAGE_KEY, JSON.stringify(filters || this.filters));
                    } catch (e) {
                        // ignore quota / private mode errors
                    }
                },
                async loadNotes() {
                    this.loading = true;
                    this.error = '';
                    try {
                        const params = new URLSearchParams({
                            page: String(this.page),
                            per_page: String(this.perPage),
                            sort_by: this.filters.sort_by,
                            sort_dir: this.filters.sort_dir
                        });
                        if (this.filters.keyword_title) {
                            params.set('keyword_title', this.filters.keyword_title);
                        }
                        if (this.filters.keyword_body) {
                            params.set('keyword_body', this.filters.keyword_body);
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
                    this.persistFilters();
                    this.loadNotes();
                },
                clearKeyword(field) {
                    if (field !== 'keyword_title' && field !== 'keyword_body') {
                        return;
                    }
                    this.filters[field] = '';
                    this.applyFilters();
                },
                clearFilters() {
                    this.filters = getDefaultFilters();
                    this.page = 1;
                    this.message = '';
                    this.persistFilters();
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
                    const match = String(value).match(/^(\d{4})-(\d{2})-(\d{2})/);
                    if (!match) {
                        return String(value);
                    }
                    return match[2] + '/' + match[3] + '/' + match[1];
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
