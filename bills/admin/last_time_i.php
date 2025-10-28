<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Vue.js with Bootstrap App</title>
    <!-- Bootstrap 5.3 CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <!-- Bootstrap Icons (optional) -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
    />

    <!-- Custom CSS -->
    <style>
      .cal-day {
        border: 1px solid #dee2e6;
        border-radius: 0.375rem;
        transition: background-color 0.15s ease-in-out;
      }

      .cal-day:hover {
        background-color: #f8f9fa;
      }

      .cal-day-item {
        font-size: 0.68rem;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        text-align: left !important;
      }

      .logo {
        width: 50px;
        height: 50px;
        background-size: cover;
        background-position: center;
        border-radius: 0.25rem;
      }

      .month-name {
        font-size: 0.85rem;
        color: #0d6efd !important;
        font-weight: 700;
      }

      .modal.show {
        display: block !important;
      }

      .modal-backdrop.show {
        opacity: 0.5;
      }

      .grey-text {
        color: #666666;
      }

      /* Custom 84-column grid for calendar layout */
      .row-84 {
        display: flex;
        flex-wrap: wrap;
        margin-right: -15px;
        margin-left: -15px;
      }

      /* Column padding for 84-column system */
      [class*="col-84-"] {
        position: relative;
        width: 100%;
        padding-right: 15px;
        padding-left: 15px;
      }

      /* Extra small devices (portrait phones, less than 576px) */
      .col-84-1 {
        flex: 0 0 1.19047619%;
        max-width: 1.19047619%;
      }
      .col-84-2 {
        flex: 0 0 2.38095238%;
        max-width: 2.38095238%;
      }
      .col-84-3 {
        flex: 0 0 3.57142857%;
        max-width: 3.57142857%;
      }
      .col-84-4 {
        flex: 0 0 4.76190476%;
        max-width: 4.76190476%;
      }
      .col-84-6 {
        flex: 0 0 7.14285714%;
        max-width: 7.14285714%;
      }
      .col-84-7 {
        flex: 0 0 8.33333333%;
        max-width: 8.33333333%;
      }
      .col-84-12 {
        flex: 0 0 14.28571429%;
        max-width: 14.28571429%;
      }
      .col-84-14 {
        flex: 0 0 16.66666667%;
        max-width: 16.66666667%;
      }
      .col-84-21 {
        flex: 0 0 25%;
        max-width: 25%;
      }
      .col-84-28 {
        flex: 0 0 33.33333333%;
        max-width: 33.33333333%;
      }
      .col-84-42 {
        flex: 0 0 50%;
        max-width: 50%;
      }
      .col-84-84 {
        flex: 0 0 100%;
        max-width: 100%;
      }

      /* Small devices (landscape phones, 576px and up) */
      @media (min-width: 576px) {
        .col-84-sm-1 {
          flex: 0 0 1.19047619%;
          max-width: 1.19047619%;
        }
        .col-84-sm-2 {
          flex: 0 0 2.38095238%;
          max-width: 2.38095238%;
        }
        .col-84-sm-3 {
          flex: 0 0 3.57142857%;
          max-width: 3.57142857%;
        }
        .col-84-sm-4 {
          flex: 0 0 4.76190476%;
          max-width: 4.76190476%;
        }
        .col-84-sm-6 {
          flex: 0 0 7.14285714%;
          max-width: 7.14285714%;
        }
        .col-84-sm-7 {
          flex: 0 0 8.33333333%;
          max-width: 8.33333333%;
        }
        .col-84-sm-12 {
          flex: 0 0 14.28571429%;
          max-width: 14.28571429%;
        }
        .col-84-sm-14 {
          flex: 0 0 16.66666667%;
          max-width: 16.66666667%;
        }
        .col-84-sm-21 {
          flex: 0 0 25%;
          max-width: 25%;
        }
        .col-84-sm-28 {
          flex: 0 0 33.33333333%;
          max-width: 33.33333333%;
        }
        .col-84-sm-42 {
          flex: 0 0 50%;
          max-width: 50%;
        }
        .col-84-sm-84 {
          flex: 0 0 100%;
          max-width: 100%;
        }
      }

      /* Medium devices (tablets, 768px and up) */
      @media (min-width: 768px) {
        .col-84-md-1 {
          flex: 0 0 1.19047619%;
          max-width: 1.19047619%;
        }
        .col-84-md-2 {
          flex: 0 0 2.38095238%;
          max-width: 2.38095238%;
        }
        .col-84-md-3 {
          flex: 0 0 3.57142857%;
          max-width: 3.57142857%;
        }
        .col-84-md-4 {
          flex: 0 0 4.76190476%;
          max-width: 4.76190476%;
        }
        .col-84-md-6 {
          flex: 0 0 7.14285714%;
          max-width: 7.14285714%;
        }
        .col-84-md-7 {
          flex: 0 0 8.33333333%;
          max-width: 8.33333333%;
        }
        .col-84-md-12 {
          flex: 0 0 14.28571429%;
          max-width: 14.28571429%;
        }
        .col-84-md-14 {
          flex: 0 0 16.66666667%;
          max-width: 16.66666667%;
        }
        .col-84-md-21 {
          flex: 0 0 25%;
          max-width: 25%;
        }
        .col-84-md-28 {
          flex: 0 0 33.33333333%;
          max-width: 33.33333333%;
        }
        .col-84-md-42 {
          flex: 0 0 50%;
          max-width: 50%;
        }
        .col-84-md-84 {
          flex: 0 0 100%;
          max-width: 100%;
        }
      }

      /* Large devices (desktops, 992px and up) */
      @media (min-width: 992px) {
        .col-84-lg-1 {
          flex: 0 0 1.19047619%;
          max-width: 1.19047619%;
        }
        .col-84-lg-2 {
          flex: 0 0 2.38095238%;
          max-width: 2.38095238%;
        }
        .col-84-lg-3 {
          flex: 0 0 3.57142857%;
          max-width: 3.57142857%;
        }
        .col-84-lg-4 {
          flex: 0 0 4.76190476%;
          max-width: 4.76190476%;
        }
        .col-84-lg-6 {
          flex: 0 0 7.14285714%;
          max-width: 7.14285714%;
        }
        .col-84-lg-7 {
          flex: 0 0 8.33333333%;
          max-width: 8.33333333%;
        }
        .col-84-lg-12 {
          flex: 0 0 14.28571429%;
          max-width: 14.28571429%;
        }
        .col-84-lg-14 {
          flex: 0 0 16.66666667%;
          max-width: 16.66666667%;
        }
        .col-84-lg-21 {
          flex: 0 0 25%;
          max-width: 25%;
        }
        .col-84-lg-28 {
          flex: 0 0 33.33333333%;
          max-width: 33.33333333%;
        }
        .col-84-lg-42 {
          flex: 0 0 50%;
          max-width: 50%;
        }
        .col-84-lg-84 {
          flex: 0 0 100%;
          max-width: 100%;
        }
      }

      /* Extra large devices (large desktops, 1200px and up) */
      @media (min-width: 1200px) {
        .col-84-xl-1 {
          flex: 0 0 1.19047619%;
          max-width: 1.19047619%;
        }
        .col-84-xl-2 {
          flex: 0 0 2.38095238%;
          max-width: 2.38095238%;
        }
        .col-84-xl-3 {
          flex: 0 0 3.57142857%;
          max-width: 3.57142857%;
        }
        .col-84-xl-4 {
          flex: 0 0 4.76190476%;
          max-width: 4.76190476%;
        }
        .col-84-xl-6 {
          flex: 0 0 7.14285714%;
          max-width: 7.14285714%;
        }
        .col-84-xl-7 {
          flex: 0 0 8.33333333%;
          max-width: 8.33333333%;
        }
        .col-84-xl-12 {
          flex: 0 0 14.28571429%;
          max-width: 14.28571429%;
        }
        .col-84-xl-14 {
          flex: 0 0 16.66666667%;
          max-width: 16.66666667%;
        }
        .col-84-xl-21 {
          flex: 0 0 25%;
          max-width: 25%;
        }
        .col-84-xl-28 {
          flex: 0 0 33.33333333%;
          max-width: 33.33333333%;
        }
        .col-84-xl-42 {
          flex: 0 0 50%;
          max-width: 50%;
        }
        .col-84-xl-84 {
          flex: 0 0 100%;
          max-width: 100%;
        }
      }

      /* Extra extra large devices (larger desktops, 1400px and up) */
      @media (min-width: 1400px) {
        .col-84-xxl-1 {
          flex: 0 0 1.19047619%;
          max-width: 1.19047619%;
        }
        .col-84-xxl-2 {
          flex: 0 0 2.38095238%;
          max-width: 2.38095238%;
        }
        .col-84-xxl-3 {
          flex: 0 0 3.57142857%;
          max-width: 3.57142857%;
        }
        .col-84-xxl-4 {
          flex: 0 0 4.76190476%;
          max-width: 4.76190476%;
        }
        .col-84-xxl-6 {
          flex: 0 0 7.14285714%;
          max-width: 7.14285714%;
        }
        .col-84-xxl-7 {
          flex: 0 0 8.33333333%;
          max-width: 8.33333333%;
        }
        .col-84-xxl-12 {
          flex: 0 0 14.28571429%;
          max-width: 14.28571429%;
        }
        .col-84-xxl-14 {
          flex: 0 0 16.66666667%;
          max-width: 16.66666667%;
        }
        .col-84-xxl-21 {
          flex: 0 0 25%;
          max-width: 25%;
        }
        .col-84-xxl-28 {
          flex: 0 0 33.33333333%;
          max-width: 33.33333333%;
        }
        .col-84-xxl-42 {
          flex: 0 0 50%;
          max-width: 50%;
        }
        .col-84-xxl-84 {
          flex: 0 0 100%;
          max-width: 100%;
        }
      }

      /* Calendar specific styles with responsive adjustments */
      .calendar-week {
        display: flex;
        flex-wrap: wrap;
        margin-bottom: 10px;
      }

      .calendar-day {
        flex: 0 0 25%; /* Mobile first: 1 day per row (84 cols) */
        max-width: 25%;
        padding: 5px;
        box-sizing: border-box;
      }

      @media (min-width: 576px) {
        .calendar-day {
          flex: 0 0 25%; /* Small: 2 days per row (42 cols each) */
          max-width: 25%;
        }
      }

      @media (min-width: 768px) {
        .calendar-day {
          flex: 0 0 14.28571429%; /* Medium: 3 days per row (28 cols each) */
          max-width: 14.28571429%;
        }
      }

      @media (min-width: 900px) {
        .calendar-day {
          flex: 0 0 14.28571429%; /* Medium-Large: 4 days per row (21 cols each) */
          max-width: 14.28571429%;
        }
      }

      @media (min-width: 992px) {
        .calendar-day {
          flex: 0 0 14.28571429%; /* Large: 7 days per row (12 cols each) */
          max-width: 14.28571429%;
        }
      }

      .calendar-day-content {
        border: 1px solid #dee2e6;
        border-radius: 0.375rem;
        padding: 8px;
        height: 140px;
        background-color: #fff;
        transition: background-color 0.15s ease-in-out;
        cursor: pointer;
        font-size: 13px;
      }

      .calendar-day-content:hover {
        background-color: #f8f9fa;
      }

      @media (min-width: 576px) {
        .container {
          padding-left: 0 !important;
          padding-right: 0 !important;
          max-width: 720px;
        }

        #content {
          padding-left: 10px;
          padding-right: 10px;
        }

        .calendar-day {
          padding-left: 2px;
          padding-right: 2px;
        }
      }

      /* Medium devices (tablets, 768px and up) */
      @media (min-width: 768px) {
        .container {
          padding-left: 0 !important;
          padding-right: 0 !important;
          max-width: 940px;
        }

        #content {
          padding-left: 10px;
          padding-right: 10px;
        }

        .calendar-day {
          padding-left: 2px;
          padding-right: 2px;
        }
      }

      /* Large devices (desktops, 992px and up) */
      @media (min-width: 992px) {
        .container {
          padding-left: 0 !important;
          padding-right: 0 !important;
        }

        #content {
          padding-left: 10px;
          padding-right: 10px;
        }

        .calendar-day {
          padding-left: 2px;
          padding-right: 2px;
        }
      }

      /* Extra large devices (large desktops, 1200px and up) */
      @media (min-width: 1200px) {
        .container {
          padding-left: 0 !important;
          padding-right: 0 !important;
        }

        #content {
          padding-left: 10px;
          padding-right: 10px;
        }

        .calendar-day {
          padding-left: 2px;
          padding-right: 2px;
        }
      }

      /* Extra extra large devices (larger desktops, 1400px and up) */
      @media (min-width: 1400px) {
        .container {
          padding-left: 0 !important;
          padding-right: 0 !important;
        }

        #content {
          padding-left: 10px;
          padding-right: 10px;
        }

        .calendar-day {
          padding-left: 2px;
          padding-right: 2px;
        }
      }

      /* Remove container padding on small screens */
      @media (max-width: 576px) {
        .container {
          padding-left: 0 !important;
          padding-right: 0 !important;
        }

        #content {
          padding-left: 10px;
          padding-right: 10px;
        }

        .calendar-day {
          padding-left: 2px;
          padding-right: 2px;
        }
      }

      /* Fixed button bar */
      .fixed-button-bar {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 1040;
        background-color: white;
        border-bottom: 1px solid #dee2e6;
        padding: 10px 0;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      }

      /* Add padding to content to account for fixed buttons */
      .content-with-fixed-buttons {
        padding-top: 80px;
      }
    </style>
  </head>
  <body>
    <div id="app">
      <!-- Navigation -->
      <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
          <a class="navbar-brand" href="#">{{ appName }}</a>
          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav"
            aria-controls="navbarNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
              <li class="nav-item">
                <a class="nav-link active" href="#">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">About</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Contact</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>

      <!-- Fixed Action Buttons -->
      <div class="fixed-button-bar">
        <div class="container">
          <div class="row justify-content-between">
            <div class="col-auto">
              <button class="btn btn-primary" @click="backThreeMonths">
                Back
              </button>
            </div>
            <div class="col-auto">
              <button class="btn btn-danger" @click="addItemUsed('')">
                Add Item
              </button>
            </div>
            <div class="col-auto">
              <button
                v-if="!showSearch"
                class="btn btn-secondary"
                @click="toggleSearch"
              >
                Search
              </button>
              <button v-else class="btn btn-danger" @click="toggleSearch">
                Back
              </button>
            </div>
            <div class="col-auto">
              <button
                class="btn btn-outline-secondary"
                @click="loadItemsUsed(0, true)"
              >
                Today
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- Main Content -->
      <div class="container mt-4 content-with-fixed-buttons">
        <div class="row">
          <div class="col-12">
            <!-- Content div - converted from Angular template -->
            <div id="content">
              <!-- Header with logo -->
              <div class="d-flex align-items-center mb-4">
                <div
                  class="logo me-3"
                  style="
                    background: url('assets/img/remember2.png');
                    width: 50px;
                    height: 50px;
                    background-size: cover;
                  "
                ></div>
                <div class="logo-text h3 mb-0">When Did I Last?</div>
              </div>

              <!-- Inner content -->
              <div class="inner-content">

                <!-- Modal for Add Item -->
                <div
                  class="modal fade"
                  :class="{ show: isVisible, 'd-block': isVisible }"
                  tabindex="-1"
                  v-if="isVisible"
                >
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title">Add Item Used</h5>
                        <button
                          type="button"
                          class="btn-close"
                          @click="handleCancel"
                        ></button>
                      </div>
                      <div class="modal-body">
                        <div class="row">
                          <div class="col-6">
                            <select class="form-select" v-model="selectedItem">
                              <option value="">Select Item</option>
                              <option
                                v-for="item in itemsList"
                                :key="item.id"
                                :value="item.id"
                              >
                                {{ item.title }}
                              </option>
                            </select>
                          </div>
                          <div class="col-6">
                            <input
                              type="date"
                              class="form-control"
                              v-model="dateUsed"
                              @change="onDateChanged"
                            />
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button
                          type="button"
                          class="btn btn-secondary"
                          @click="handleCancel"
                        >
                          Cancel
                        </button>
                        <button
                          type="button"
                          class="btn btn-primary"
                          @click="handleOk"
                        >
                          OK
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
                <div
                  class="modal-backdrop fade"
                  :class="{ show: isVisible }"
                  v-if="isVisible"
                ></div>

                <!-- Calendar view -->
                <div v-if="!showSearch">
                  <!-- Calendar container -->
                  <div class="calendar-container">
                    <!-- Week headers -->
                    <div class="calendar-week mb-2">
                      <div class="calendar-day">
                        <div class="text-center fw-bold text-muted small">
                          SUN
                        </div>
                      </div>
                      <div class="calendar-day">
                        <div class="text-center fw-bold text-muted small">
                          MON
                        </div>
                      </div>
                      <div class="calendar-day">
                        <div class="text-center fw-bold text-muted small">
                          TUE
                        </div>
                      </div>
                      <div class="calendar-day">
                        <div class="text-center fw-bold text-muted small">
                          WED
                        </div>
                      </div>
                      <div class="calendar-day">
                        <div class="text-center fw-bold text-muted small">
                          THU
                        </div>
                      </div>
                      <div class="calendar-day">
                        <div class="text-center fw-bold text-muted small">
                          FRI
                        </div>
                      </div>
                      <div class="calendar-day">
                        <div class="text-center fw-bold text-muted small">
                          SAT
                        </div>
                      </div>
                    </div>

                    <!-- Calendar weeks -->
                    <div class="calendar-week">
                      <template
                        v-for="(week, i) in billsDays"
                        :key="i"
                      >
                      <div
                        v-for="day in week.days"
                        :key="day.Date"
                        class="calendar-day"
                      >
                        <div
                          class="calendar-day-content"
                          :data-date="formatDateForInput(day.Date)"
                          @click="dayClicked(day.Date)"
                        >
                          <div class="mb-1">
                            <span
                              v-if="day.Month"
                              class="month-name text-muted small"
                              >{{ day.Month }} -
                            </span>
                            <span class="fw-bold grey-text">{{ abbreviateDayOfWeek(day.Day) }}</span>
                          </div>
                          <div
                            v-for="expense in day.desc"
                            :key="expense.id"
                            class="mt-1"
                          >
                            <span
                              class="badge cal-day-item d-block mb-1"
                              :style="{ backgroundColor: expense.color }"
                              @click.stop="removeItemUsed(expense.id, $event)"
                              style="cursor: pointer"
                            >
                              {{ expense.item_name }}
                            </span>
                          </div>
                        </div>
                      </div>
                    </template>
                  </div>
                  <div id="top"></div>
                </div>

                <!-- Search view -->
                <div v-else>
                  <div class="mb-3">
                    <input
                      type="text"
                      class="form-control"
                      placeholder="Search"
                      v-model="keyword"
                      @input="beginSearchItemsUsed"
                    />
                  </div>

                  <div v-if="searchItemsUsedList?.length">
                    <h3 class="mb-3 mt-3">Search Results</h3>
                    <div
                      v-for="dates in searchItemsUsedList"
                      :key="dates.date"
                      class="mb-4"
                    >
                      <div class="card">
                        <div class="card-header">
                          <span class="fw-bold fs-5">{{ dates.date }}</span>
                        </div>
                        <div class="list-group list-group-flush">
                          <div
                            v-for="item in dates.children"
                            :key="item.id"
                            class="list-group-item"
                          >
                            {{ item.item_name }}
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Footer -->
      <footer class="bg-light mt-5 py-4">
        <div class="container">
          <div class="row">
            <div class="col-12 text-center">
              <p class="mb-0">
                &copy; {{ currentYear }} {{ appName }}. All rights reserved.
              </p>
            </div>
          </div>
        </div>
      </footer>
    </div>

    <!-- Bootstrap 5.3 JavaScript Bundle -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>

    <!-- Vue.js 3 CDN -->
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>

    <!-- Your Vue App -->
    <script>
      const { createApp } = Vue;

      createApp({
        data() {
          return {
            appName: "When Did I Last?",
            currentYear: new Date().getFullYear(),
            // Modal state
            isVisible: false,
            selectedItem: "",
            dateUsed: "",
            dateFormat: "YYYY-MM-DD",
            // Search state
            showSearch: false,
            keyword: "",
            // Data arrays (will be populated with actual data later)
            itemsList: [],
            billsDays: [],
            searchItemsUsedList: [],
          };
        },
        methods: {

          abbreviateDayOfWeek(day) {
            const dayArr = day.split(", ");
            day = dayArr[0].trim();
            const days = {
              "Sunday": "Sun",
              "Monday": "Mon",
              "Tuesday": "Tue",
              "Wednesday": "Wed",
              "Thursday": "Thu",
              "Friday": "Fri",
              "Saturday": "Sat",
            };
            return days[day] + " " + (dayArr[1] ? dayArr[1].trim() : "") || "";
          },

          // Convert date to YYYY-MM-DD format for HTML date input
          formatDateForInput(dateString) {
            try {
              const date = new Date(dateString);
              if (isNaN(date.getTime())) {
                return new Date().toISOString().split("T")[0];
              }
              return date.toISOString().split("T")[0];
            } catch (err) {
              console.error("Error formatting date:", err);
              return new Date().toISOString().split("T")[0];
            }
          },

          // Scroll to today's date in the calendar
          scrollToToday() {
            this.$nextTick(() => {
              const today = new Date();
              const todayString = today.toISOString().split("T")[0];
              
              // Find the calendar day element with today's date
              const calendarDays = document.querySelectorAll('.calendar-day-content');
              let todayElement = null;
              
              for (let dayElement of calendarDays) {
                // Check if this day matches today's date by looking at the click handler
                const dayDate = dayElement.getAttribute('data-date') || this.findDateForElement(dayElement);
                if (dayDate && dayDate === todayString) {
                  todayElement = dayElement;
                  break;
                }
              }
              
              if (todayElement) {
                todayElement.scrollIntoView({ 
                  behavior: 'smooth', 
                  block: 'center',
                  inline: 'nearest'
                });
                // Add a temporary highlight
                todayElement.style.boxShadow = '0 0 10px #007bff';
                setTimeout(() => {
                  todayElement.style.boxShadow = '';
                }, 2000);
              }
            });
          },

          // Helper method to find date from calendar structure
          findDateForElement(element) {
            // Try to find the date from the calendar data structure
            const today = new Date();
            const todayString = today.toISOString().split("T")[0];
            
            // Check if any of the billsDays match this element
            for (let week of this.billsDays) {
              for (let day of week.days) {
                if (this.formatDateForInput(day.Date) === todayString) {
                  return todayString;
                }
              }
            }
            return null;
          },

          // API methods
          async loadItemsUsed(daysBack = 0, scrollToToday = false) {
            try {
              const requestParams = "daysBack=" + daysBack;
              const response = await fetch(
                "https://api.hawleywebdesign.com/last-time?" + requestParams
              );

              if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
              }

              const data = await response.json();
              console.log("data: ", data);
              if (data.results) {
                this.billsDays = data.results; // Update the calendar data
              }
              console.log("Items used loaded successfully");
              
              // Scroll to today if requested
              if (scrollToToday) {
                setTimeout(() => this.scrollToToday(), 100);
              }
            } catch (err) {
              console.error("Error loading Items Used History:", err.message);
            }
          },

          async searchItemUsed(keyword) {
            try {
              const requestParams = "keyword=" + keyword;
              const response = await fetch(
                "https://api.hawleywebdesign.com/last-time/search?" +
                  requestParams
              );

              if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
              }

              const data = await response.json();
              this.searchItemsUsedList = data; // Update search results
              console.log("Search completed successfully");
            } catch (err) {
              console.error("Error loading Items Used History:", err.message);
            }
          },

          async loadItems() {
            try {
              const response = await fetch(
                "https://api.hawleywebdesign.com/last-time/items"
              );

              if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
              }

              const data = await response.json();
              this.itemsList = data; // Update items list for dropdown
              console.log("Items loaded successfully");
            } catch (err) {
              console.error("Error loading Items:", err.message);
            }
          },

          async addItemUsedToAPI(itemId, dateUsed) {
            console.log("Adding Item Used:", itemId, dateUsed);
            if (!itemId || !dateUsed) {
              console.warn("Item ID and date are required");
              return false;
            }

            try {
              const apiParams =
                "item_id=" +
                itemId +
                "&date_used=" +
                encodeURIComponent(dateUsed);
              const response = await fetch(
                "https://api.hawleywebdesign.com/last-time/add-item-used?" +
                  apiParams
              );

              if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
              }

              const data = await response.json();
              console.log("Added Item Used");
              return true;
            } catch (err) {
              console.error("Error adding Item Used:", err.message);
              return false;
            }
          },

          async removeItemUsedFromAPI(id) {
            if (!id) {
              console.warn("ID is required");
              return false;
            }

            try {
              const apiParams = "id=" + id;
              const response = await fetch(
                "https://api.hawleywebdesign.com/last-time/delete-item-used?" +
                  apiParams
              );

              if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
              }

              const data = await response.json();
              console.log("Deleted Item used");
              return true;
            } catch (err) {
              console.error("Error deleting Item Used:", err.message);
              return false;
            }
          },

          // Modal methods
          addItemUsed(item) {
            this.isVisible = true;
            this.selectedItem = "";
            this.dateUsed = new Date().toISOString().split("T")[0];
          },

          async handleOk() {
            if (this.selectedItem && this.dateUsed) {
              const success = await this.addItemUsedToAPI(
                this.selectedItem,
                this.dateUsed
              );
              if (success) {
                this.isVisible = false;
                this.selectedItem = "";
                this.dateUsed = "";
                // Reload the calendar data to show the new item
                await this.loadItemsUsed();
              }
            } else {
              console.warn("Please select an item and date");
            }
          },

          handleCancel() {
            this.isVisible = false;
            this.selectedItem = "";
            this.dateUsed = "";
          },

          onDateChanged(event) {
            console.log("Date changed:", event.target.value);
          },

          // Navigation methods
          async backThreeMonths() {
            console.log("Going back three months");
            await this.loadItemsUsed(90); // Load items from 90 days back
          },

          toggleSearch() {
            this.showSearch = !this.showSearch;
            if (!this.showSearch) {
              this.keyword = "";
              this.searchItemsUsedList = [];
            }
          },

          // Calendar methods
          dayClicked(date) {
            console.log("Day clicked:", date);
            // Open the Add Item modal and preselect the clicked date
            this.isVisible = true;
            this.selectedItem = "";
            this.dateUsed = this.formatDateForInput(date);
          },

          async removeItemUsed(id, event) {
            event.stopPropagation();
            const success = await this.removeItemUsedFromAPI(id);
            if (success) {
              // Reload the calendar data to reflect the deletion
              await this.loadItemsUsed();
            }
          },

          // Search methods
          async beginSearchItemsUsed() {
            if (this.keyword && this.keyword.length > 0) {
              await this.searchItemUsed(this.keyword);
            } else {
              this.searchItemsUsedList = [];
            }
          },
        },
        async mounted() {
          console.log("Vue app mounted successfully!");
          // Load initial data
          await this.loadItems(); // Load items for dropdown
          await this.loadItemsUsed(0, true); // Load initial calendar data and scroll to today
        },
      }).mount("#app");
    </script>
  </body>
</html>
