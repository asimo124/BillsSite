(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["main"],{

/***/ "./$$_lazy_route_resource lazy recursive":
/*!******************************************************!*\
  !*** ./$$_lazy_route_resource lazy namespace object ***!
  \******************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

function webpackEmptyAsyncContext(req) {
	// Here Promise.resolve().then() is used instead of new Promise() to prevent
	// uncaught exception popping up in devtools
	return Promise.resolve().then(function() {
		var e = new Error("Cannot find module '" + req + "'");
		e.code = 'MODULE_NOT_FOUND';
		throw e;
	});
}
webpackEmptyAsyncContext.keys = function() { return []; };
webpackEmptyAsyncContext.resolve = webpackEmptyAsyncContext;
module.exports = webpackEmptyAsyncContext;
webpackEmptyAsyncContext.id = "./$$_lazy_route_resource lazy recursive";

/***/ }),

/***/ "./node_modules/raw-loader/index.js!./src/app/app.component.html":
/*!**************************************************************!*\
  !*** ./node_modules/raw-loader!./src/app/app.component.html ***!
  \**************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<nz-layout class=\"layout\">\n  <nz-header>\n    <div class=\"logo\"\n         [style.background]=\"'url(assets/img/expense_icon2_ex.png)'\"></div>\n    <div class=\"logo-text\">Bills Manager</div>\n<!--    <ul nz-menu nzTheme=\"dark\" nzMode=\"horizontal\">-->\n<!--      <li nz-menu-item>nav 1</li>-->\n<!--    </ul>-->\n  </nz-header>\n  <nz-content>\n<!--    <nz-breadcrumb>-->\n<!--      <nz-breadcrumb-item>Home</nz-breadcrumb-item>-->\n<!--      <nz-breadcrumb-item>List</nz-breadcrumb-item>-->\n<!--      <nz-breadcrumb-item>App</nz-breadcrumb-item>-->\n<!--    </nz-breadcrumb>-->\n    <div class=\"inner-content\">\n\n      <div nz-row >\n        <div nz-col [nzMd]=\"{ span: 8 }\" [nzXs]=\"{ span: 12 }\" *ngIf=\"billResults\">\n            <nz-form-control>\n              <input\n                nz-input\n                placeholder=\"Balance\"\n                [(ngModel)]=\"curBalance\"\n                [value]=\"billResults.cur_balance\"\n              />\n            </nz-form-control>\n        </div>\n        <div nz-col [nzMd]=\"{ span: 6 }\" [nzXs]=\"{ span: 12 }\" >\n            <nz-form-control>\n              <nz-date-picker [(ngModel)]=\"currentDate\" (ngModelChange)=\"onChange($event)\" ></nz-date-picker>\n\n            </nz-form-control>\n        </div>\n        <div nz-col [nzMd]=\"{ span: 6 }\" [nzXs]=\"{ span: 8 }\" >\n          <nz-form-control>\n            <input\n              nz-input\n              placeholder=\"Extra Days\"\n              [(ngModel)]=\"numDaysPayPeriod\"\n              [value]=\"numDaysPayPeriod\"\n            />\n          </nz-form-control>\n        </div>\n        <div nz-col [nzMd]=\"{ span: 4 }\" [nzXs]=\"{ span: 6 }\" >\n          <nz-form-control>\n            <button nz-button [nzType]=\"'primary'\" (click)=\"updatePayPeriodNumDays()\">Update</button>\n          </nz-form-control>\n        </div>\n        <div nz-col [nzMd]=\"{ span: 10 }\" [nzXs]=\"{ span: 24 }\" >\n          <nz-form-control>\n            <button nz-button [nzType]=\"'default'\" (click)=\"loadToday()\">Today</button>\n            <button nz-button [nzType]=\"'default'\" (click)=\"loadPrevDate()\">Previous</button>\n            <button nz-button [nzType]=\"'default'\" (click)=\"loadNextDate()\">Next</button>\n            <button nz-button [nzType]=\"'danger'\" (click)=\"toggleExpand()\">{{ (!isExpanded) ? 'Expand' : 'Collapse' }}</button>\n            <button nz-button [nzType]=\"'primary'\" (click)=\"setDefaultsAndSearch()\">Search</button>\n          </nz-form-control>\n        </div>\n        <div nz-col [nzMd]=\"{ span: 10 }\" [nzXs]=\"{ span: 24 }\" >\n          <nz-form-control>\n\n            Daily: <input\n              nz-input\n              placeholder=\"Day\"\n              [(ngModel)]=\"disposablePerDay\"\n              [value]=\"disposablePerDay\"\n              [style.width]=\"'50px'\"\n            />&nbsp;\n            Height: <input\n            nz-input\n            placeholder=\"Day\"\n            [(ngModel)]=\"expandHeight\"\n            [value]=\"expandHeight\"\n            [style.width]=\"'50px'\" />&nbsp;\n            Days: <span style=\"font-weight: bold; color: #1890ff\">{{ finalDays }}</span>\n            Dispose Need:\n            <span style=\"font-weight: bold; color: #1890ff\">${{ getDisposableNeeded() }}</span>&nbsp;Dispose Left: <span style=\"font-weight: bold; color: #2aa80a\">${{ getDisposableLeft() }}</span>&nbsp;\n            Test Mode: <nz-switch [(ngModel)]=\"testMode\"></nz-switch>\n\n            Add Last Days: <nz-switch [(ngModel)]=\"addLastDays\" (ngModelChange)=\"updateLastDays()\"></nz-switch>\n\n          </nz-form-control>\n\n        </div>\n      </div>\n\n      <div style=\"clear: both; height: 15px;\"></div>\n\n\n\n      <app-days-of-week\n        [billsDays]=\"billsList\"\n        [isExpanded]=\"isExpanded\"\n        [expandHeight]=\"expandHeight\"\n        (shouldCallToggleEnabled)=\"updateRunningTotals()\"\n      ></app-days-of-week>\n    </div>\n  </nz-content>\n\n</nz-layout>\n"

/***/ }),

/***/ "./node_modules/raw-loader/index.js!./src/app/components/days-of-week/days-of-week.component.html":
/*!***********************************************************************************************!*\
  !*** ./node_modules/raw-loader!./src/app/components/days-of-week/days-of-week.component.html ***!
  \***********************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<div\n  nz-row nzType=\"flex\"\n  nzJustify=\"space-around\"\n  [style.margin-bottom]=\"(isExpanded) ? expandHeight + 'px' : ''\"\n  *ngFor=\"let week of billsDays\">\n    <div\n      *ngFor=\"let day of week.days\"\n      nz-col\n      nzXs=\"8\"\n      nzSm=\"3\"\n      [className]=\"day.showAsDay ? 'cal-day' : 'cal-day'\"\n    >\n      <span style=\"font-weight: bold\">{{ day.Day }}</span>\n      <app-expense\n        [expenses]=\"day.desc\"\n        (didToggleEnabled)=\"callToggleEnabled($event)\"\n      ></app-expense>\n      <div style=\"clear:both; height: 4px\"></div>\n      <span [style.visibility]=\"day.showAsDay ? 'visible' : 'hidden'\">Balance - <strong>{{ day.Balance }}</strong></span>\n    </div>\n</div>\n"

/***/ }),

/***/ "./node_modules/raw-loader/index.js!./src/app/components/expense/expense.component.html":
/*!*************************************************************************************!*\
  !*** ./node_modules/raw-loader!./src/app/components/expense/expense.component.html ***!
  \*************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<ng-container *ngFor=\"let expense of expenses; let i = index\">\n  <ng-container *ngIf=\"!expense.is_heavy && expense.vnd_frequency != 'Once'\" >\n    <div class=\"cal-day-item\"  [style.background-color]=\"getColor(i)\" (click)=\"toggleEnabled(i)\"\n         [style.text-decoration]=\"(!expense.isEnabled) ? 'line-through' : ''\"\n    >\n      {{ expense.title }}\n    </div>\n  </ng-container>\n  <ng-container *ngIf=\"expense.vnd_frequency == 'Once' && !expense.is_heavy\">\n    <div class=\"cal-day-item\" style=\"background-color: yellow; border: 1px solid #2aa80a; color: #2aa80a;\"\n         (click)=\"toggleEnabled(i)\" [style.text-decoration]=\"(!expense.isEnabled) ? 'line-through' : ''\"\n    >\n      {{ expense.title }}\n    </div>\n  </ng-container>\n  <ng-container *ngIf=\"expense.is_heavy && expense.vnd_frequency != 'Once'\" >\n    <div class=\"cal-day-item\" style=\"background-color: white; border: 1px solid red; color: red;\"\n         (click)=\"toggleEnabled(i)\" [style.text-decoration]=\"(!expense.isEnabled) ? 'line-through' : ''\"\n    >\n      {{ expense.title }}\n    </div>\n  </ng-container>\n</ng-container>\n"

/***/ }),

/***/ "./src/app/app-routing.module.ts":
/*!***************************************!*\
  !*** ./src/app/app-routing.module.ts ***!
  \***************************************/
/*! exports provided: AppRoutingModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppRoutingModule", function() { return AppRoutingModule; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/fesm5/router.js");



var routes = [];
var AppRoutingModule = /** @class */ (function () {
    function AppRoutingModule() {
    }
    AppRoutingModule = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["NgModule"])({
            imports: [_angular_router__WEBPACK_IMPORTED_MODULE_2__["RouterModule"].forRoot(routes)],
            exports: [_angular_router__WEBPACK_IMPORTED_MODULE_2__["RouterModule"]]
        })
    ], AppRoutingModule);
    return AppRoutingModule;
}());



/***/ }),

/***/ "./src/app/app.component.scss":
/*!************************************!*\
  !*** ./src/app/app.component.scss ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ".layout {\n  height: 100vh;\n}\n\n.logo {\n  width: 31px;\n  height: 31px;\n  /*background: rgba(255, 255, 255, 0.2);*/\n  margin: 16px 16px 16px 0;\n  float: left;\n}\n\n.logo-text {\n  width: 125px;\n  height: 31px;\n  float: left;\n  color: white;\n  font-size: 18px;\n  font-family: \"DIN Alternate\";\n}\n\nnz-header {\n  /*position: fixed;*/\n  width: 100%;\n}\n\n[nz-menu] {\n  line-height: 64px;\n}\n\nnz-content {\n  padding: 0 0;\n  /*margin-top: 64px;*/\n  min-height: 1250px;\n}\n\nnz-breadcrumb {\n  margin: 16px 0;\n}\n\n.inner-content {\n  background: #fff;\n  padding: 15px;\n  /*min-height: 380px;*/\n  display: block;\n}\n\nnz-footer {\n  text-align: center;\n}\n\n.cal-day {\n  border-radius: 7px;\n  border: 1px solid #ddd;\n  height: 200px;\n  padding: 4px 4px;\n  font-size: 12px;\n}\n\n.cal-day-no-border {\n  border-radius: 7px;\n  border: 1px solid #fff;\n  height: 200px;\n  padding: 4px 4px;\n  font-size: 12px;\n}\n\n.cal-day-item {\n  padding: 0 3px;\n  background-color: #5adbb7;\n  color: white;\n  border-radius: 7px;\n}\n\n@media (min-width: 576px) {\n  .ant-col-sm-3 {\n    display: block;\n    box-sizing: border-box;\n    width: 14.2%;\n  }\n}\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi9Vc2Vycy9BbGV4YW5kZXJIYXdsZXkvRG9jdW1lbnRzL0FuZ3VsYXJQcm9qZWN0cy9iaWxsczIxL3NyYy9hcHAvYXBwLmNvbXBvbmVudC5zY3NzIiwic3JjL2FwcC9hcHAuY29tcG9uZW50LnNjc3MiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7RUFDRSxhQUFBO0FDQ0Y7O0FERUE7RUFDRSxXQUFBO0VBQ0EsWUFBQTtFQUNBLHdDQUFBO0VBQ0Esd0JBQUE7RUFDQSxXQUFBO0FDQ0Y7O0FER0E7RUFDRSxZQUFBO0VBQ0EsWUFBQTtFQUNBLFdBQUE7RUFDQSxZQUFBO0VBQ0EsZUFBQTtFQUNBLDRCQUFBO0FDQUY7O0FER0E7RUFDRSxtQkFBQTtFQUNBLFdBQUE7QUNBRjs7QURHQTtFQUNFLGlCQUFBO0FDQUY7O0FER0E7RUFDRSxZQUFBO0VBQ0Esb0JBQUE7RUFDQSxrQkFBQTtBQ0FGOztBREdBO0VBQ0UsY0FBQTtBQ0FGOztBREdBO0VBQ0UsZ0JBQUE7RUFDQSxhQUFBO0VBQ0EscUJBQUE7RUFDQSxjQUFBO0FDQUY7O0FER0E7RUFDRSxrQkFBQTtBQ0FGOztBREdBO0VBQ0Usa0JBQUE7RUFDQSxzQkFBQTtFQUNBLGFBQUE7RUFDQSxnQkFBQTtFQUNBLGVBQUE7QUNBRjs7QURHQTtFQUNFLGtCQUFBO0VBQ0Esc0JBQUE7RUFDQSxhQUFBO0VBQ0EsZ0JBQUE7RUFDQSxlQUFBO0FDQUY7O0FER0E7RUFDRSxjQUFBO0VBQ0EseUJBQUE7RUFDQSxZQUFBO0VBQ0Esa0JBQUE7QUNBRjs7QURHQTtFQUNFO0lBQ0UsY0FBQTtJQUNBLHNCQUFBO0lBQ0EsWUFBQTtFQ0FGO0FBQ0YiLCJmaWxlIjoic3JjL2FwcC9hcHAuY29tcG9uZW50LnNjc3MiLCJzb3VyY2VzQ29udGVudCI6WyIubGF5b3V0IHtcbiAgaGVpZ2h0OiAxMDB2aDtcbn1cblxuLmxvZ28ge1xuICB3aWR0aDogMzFweDtcbiAgaGVpZ2h0OiAzMXB4O1xuICAvKmJhY2tncm91bmQ6IHJnYmEoMjU1LCAyNTUsIDI1NSwgMC4yKTsqL1xuICBtYXJnaW46IDE2cHggMTZweCAxNnB4IDA7XG4gIGZsb2F0OiBsZWZ0O1xuXG59XG5cbi5sb2dvLXRleHQge1xuICB3aWR0aDogMTI1cHg7XG4gIGhlaWdodDogMzFweDtcbiAgZmxvYXQ6IGxlZnQ7XG4gIGNvbG9yOiB3aGl0ZTtcbiAgZm9udC1zaXplOiAxOHB4O1xuICBmb250LWZhbWlseTogJ0RJTiBBbHRlcm5hdGUnXG59XG5cbm56LWhlYWRlciB7XG4gIC8qcG9zaXRpb246IGZpeGVkOyovXG4gIHdpZHRoOiAxMDAlO1xufVxuXG5bbnotbWVudV0ge1xuICBsaW5lLWhlaWdodDogNjRweDtcbn1cblxubnotY29udGVudCB7XG4gIHBhZGRpbmc6IDAgMDtcbiAgLyptYXJnaW4tdG9wOiA2NHB4OyovXG4gIG1pbi1oZWlnaHQ6IDEyNTBweDtcbn1cblxubnotYnJlYWRjcnVtYiB7XG4gIG1hcmdpbjogMTZweCAwO1xufVxuXG4uaW5uZXItY29udGVudCB7XG4gIGJhY2tncm91bmQ6ICNmZmY7XG4gIHBhZGRpbmc6IDE1cHg7XG4gIC8qbWluLWhlaWdodDogMzgwcHg7Ki9cbiAgZGlzcGxheTogYmxvY2s7XG59XG5cbm56LWZvb3RlciB7XG4gIHRleHQtYWxpZ246IGNlbnRlcjtcbn1cblxuLmNhbC1kYXkge1xuICBib3JkZXItcmFkaXVzOiA3cHg7XG4gIGJvcmRlcjogMXB4IHNvbGlkICNkZGQ7XG4gIGhlaWdodDogMjAwcHg7XG4gIHBhZGRpbmc6IDRweCA0cHg7XG4gIGZvbnQtc2l6ZTogMTJweDtcbn1cblxuLmNhbC1kYXktbm8tYm9yZGVyIHtcbiAgYm9yZGVyLXJhZGl1czogN3B4O1xuICBib3JkZXI6IDFweCBzb2xpZCAjZmZmO1xuICBoZWlnaHQ6IDIwMHB4O1xuICBwYWRkaW5nOiA0cHggNHB4O1xuICBmb250LXNpemU6IDEycHg7XG59XG5cbi5jYWwtZGF5LWl0ZW0ge1xuICBwYWRkaW5nOiAwIDNweDtcbiAgYmFja2dyb3VuZC1jb2xvcjogIzVhZGJiNztcbiAgY29sb3I6IHdoaXRlO1xuICBib3JkZXItcmFkaXVzOiA3cHg7XG59XG5cbkBtZWRpYSAobWluLXdpZHRoOiA1NzZweCkge1xuICAuYW50LWNvbC1zbS0zIHtcbiAgICBkaXNwbGF5OiBibG9jaztcbiAgICBib3gtc2l6aW5nOiBib3JkZXItYm94O1xuICAgIHdpZHRoOiAxNC4yJTtcbiAgfVxufVxuXG5cblxuXG4iLCIubGF5b3V0IHtcbiAgaGVpZ2h0OiAxMDB2aDtcbn1cblxuLmxvZ28ge1xuICB3aWR0aDogMzFweDtcbiAgaGVpZ2h0OiAzMXB4O1xuICAvKmJhY2tncm91bmQ6IHJnYmEoMjU1LCAyNTUsIDI1NSwgMC4yKTsqL1xuICBtYXJnaW46IDE2cHggMTZweCAxNnB4IDA7XG4gIGZsb2F0OiBsZWZ0O1xufVxuXG4ubG9nby10ZXh0IHtcbiAgd2lkdGg6IDEyNXB4O1xuICBoZWlnaHQ6IDMxcHg7XG4gIGZsb2F0OiBsZWZ0O1xuICBjb2xvcjogd2hpdGU7XG4gIGZvbnQtc2l6ZTogMThweDtcbiAgZm9udC1mYW1pbHk6IFwiRElOIEFsdGVybmF0ZVwiO1xufVxuXG5uei1oZWFkZXIge1xuICAvKnBvc2l0aW9uOiBmaXhlZDsqL1xuICB3aWR0aDogMTAwJTtcbn1cblxuW256LW1lbnVdIHtcbiAgbGluZS1oZWlnaHQ6IDY0cHg7XG59XG5cbm56LWNvbnRlbnQge1xuICBwYWRkaW5nOiAwIDA7XG4gIC8qbWFyZ2luLXRvcDogNjRweDsqL1xuICBtaW4taGVpZ2h0OiAxMjUwcHg7XG59XG5cbm56LWJyZWFkY3J1bWIge1xuICBtYXJnaW46IDE2cHggMDtcbn1cblxuLmlubmVyLWNvbnRlbnQge1xuICBiYWNrZ3JvdW5kOiAjZmZmO1xuICBwYWRkaW5nOiAxNXB4O1xuICAvKm1pbi1oZWlnaHQ6IDM4MHB4OyovXG4gIGRpc3BsYXk6IGJsb2NrO1xufVxuXG5uei1mb290ZXIge1xuICB0ZXh0LWFsaWduOiBjZW50ZXI7XG59XG5cbi5jYWwtZGF5IHtcbiAgYm9yZGVyLXJhZGl1czogN3B4O1xuICBib3JkZXI6IDFweCBzb2xpZCAjZGRkO1xuICBoZWlnaHQ6IDIwMHB4O1xuICBwYWRkaW5nOiA0cHggNHB4O1xuICBmb250LXNpemU6IDEycHg7XG59XG5cbi5jYWwtZGF5LW5vLWJvcmRlciB7XG4gIGJvcmRlci1yYWRpdXM6IDdweDtcbiAgYm9yZGVyOiAxcHggc29saWQgI2ZmZjtcbiAgaGVpZ2h0OiAyMDBweDtcbiAgcGFkZGluZzogNHB4IDRweDtcbiAgZm9udC1zaXplOiAxMnB4O1xufVxuXG4uY2FsLWRheS1pdGVtIHtcbiAgcGFkZGluZzogMCAzcHg7XG4gIGJhY2tncm91bmQtY29sb3I6ICM1YWRiYjc7XG4gIGNvbG9yOiB3aGl0ZTtcbiAgYm9yZGVyLXJhZGl1czogN3B4O1xufVxuXG5AbWVkaWEgKG1pbi13aWR0aDogNTc2cHgpIHtcbiAgLmFudC1jb2wtc20tMyB7XG4gICAgZGlzcGxheTogYmxvY2s7XG4gICAgYm94LXNpemluZzogYm9yZGVyLWJveDtcbiAgICB3aWR0aDogMTQuMiU7XG4gIH1cbn0iXX0= */"

/***/ }),

/***/ "./src/app/app.component.ts":
/*!**********************************!*\
  !*** ./src/app/app.component.ts ***!
  \**********************************/
/*! exports provided: AppComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppComponent", function() { return AppComponent; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _services_bills_service__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./services/bills.service */ "./src/app/services/bills.service.ts");



var AppComponent = /** @class */ (function () {
    function AppComponent(billsService) {
        this.billsService = billsService;
        this.isExpanded = false;
        this.expandHeight = '720';
        this.prevDate = false;
        this.nextDate = false;
        this.curBalance = 0;
        this.title = 'bills2';
        this.numDaysPayPeriod = 1;
        this.remainingBalance = 950;
        this.daysLeftCount = 0;
        this.disposablePerDay = 60;
        this.finalDays = 14;
        this.testMode = false;
        this.addLastDays = true;
        this.subs = [];
    }
    AppComponent.prototype.ngOnInit = function () {
        var _this = this;
        if (localStorage.getItem('expandHeight')) {
            this.expandHeight = localStorage.expandHeight;
        }
        this.currentDate = new Date();
        var disposablePerDay = localStorage.getItem('disposablePerDay');
        if (disposablePerDay) {
            this.disposablePerDay = parseInt(disposablePerDay, 10);
        }
        // get and subscribe to Coachee Growth Benchmarks Download Data
        this.subs.push(this.billsService.billsList.subscribe(function (response) {
            if (response) {
                _this.billResults = response;
                _this.billsList = response.results;
                _this.processResults();
            }
        }));
        this.loadBills();
    };
    AppComponent.prototype.ngOnChanges = function (changes) {
        console.log('changes: ', changes);
    };
    AppComponent.prototype.onChange = function (event) {
        console.log('event: ', event.toLocaleString());
    };
    AppComponent.prototype.updateLastDays = function () {
        this.processResults();
    };
    AppComponent.prototype.processResults = function () {
        //*/
        var self = this;
        this.daysLeftCount = 0;
        this.billsList.forEach(function getWeek(week) {
            week.days.forEach(function getDay(day) {
                if (day.showAsDay) {
                    self.daysLeftCount++;
                }
            });
        });
        //*/
        this.curBalance = this.billResults.cur_balance;
        this.currentDate = null;
        this.currentDate = new Date(this.billResults.pay_date);
        this.numDaysPayPeriod = 0;
        var date2 = new Date();
        var currentDay = date2.getDate();
        var currentMonth = date2.getMonth() + 1;
        if (this.addLastDays) {
            if (currentDay > 25) {
                var firstMonth_1 = null;
                var startsFirst_1 = false;
                var i_1 = 0;
                this.billsList.forEach(function getWeek(week) {
                    week.days.forEach(function getDay(day) {
                        if (day.showAsDay) {
                            if (i_1 === 0) {
                                if (day.Day.indexOf(', 1st') > -1) {
                                    var firstDate = day.Date;
                                    firstMonth_1 = parseInt(firstDate.split('\/')[0], 10);
                                    startsFirst_1 = true;
                                }
                            }
                            i_1++;
                        }
                    });
                });
                var nextMonth = null;
                if (startsFirst_1) {
                    var numDaysAdd = 0;
                    while (true) {
                        numDaysAdd += 1;
                        date2.setDate(date2.getDate() + 1);
                        if (date2.getDate() === 1) {
                            nextMonth = date2.getMonth() + 1;
                            break;
                        }
                    }
                    if (firstMonth_1 - 1 === currentMonth) {
                        //this.numDaysPayPeriod += numDaysAdd;
                    }
                    console.log('numDaysAdd: ', numDaysAdd);
                }
            }
        }
        this.remainingBalance = this.billResults.remaining_balance;
        console.log('billsList: ', this.billsList);
    };
    AppComponent.prototype.loadPrevDate = function () {
        this.nextDate = false;
        this.prevDate = true;
        this.loadBills();
    };
    AppComponent.prototype.loadNextDate = function () {
        this.prevDate = false;
        this.nextDate = true;
        this.loadBills();
    };
    AppComponent.prototype.toggleExpand = function () {
        if (!this.isExpanded) {
            this.isExpanded = true;
            localStorage.setItem('expandHeight', this.expandHeight);
        }
        else {
            this.isExpanded = false;
        }
    };
    AppComponent.prototype.loadToday = function () {
        this.currentDate = new Date();
        this.setDefaultsAndSearch();
    };
    AppComponent.prototype.setDefaultsAndSearch = function () {
        this.prevDate = false;
        this.nextDate = false;
        if (this.disposablePerDay) {
            localStorage.setItem('disposablePerDay', String(this.disposablePerDay));
        }
        this.loadBills();
    };
    AppComponent.prototype.loadBills = function () {
        var hashCode = '';
        if (this.billResults && this.billResults.hash_key) {
            hashCode = this.billResults.hash_key;
        }
        var balance = this.curBalance ? this.curBalance : 0;
        this.billsService.loadBills(balance, this.currentDate, hashCode, this.prevDate, this.nextDate, this.testMode);
    };
    AppComponent.prototype.updateRunningTotals = function () {
        this.runningTotalBalance = this.curBalance;
        var i = 0;
        var self = this;
        var dayBalance = this.runningTotalBalance;
        this.billsList.forEach(function getWeek(week) {
            var j = 0;
            week.days.forEach(function getDay(day) {
                day.desc.forEach(function getExpense(expense) {
                    dayBalance -= expense.amount;
                });
                self.billsList[i].days[j].Balance = dayBalance;
                self.remainingBalance = dayBalance;
                j++;
            });
            i++;
        });
    };
    AppComponent.prototype.updatePayPeriodNumDays = function () {
        if (this.disposablePerDay) {
            localStorage.setItem('disposablePerDay', String(this.disposablePerDay));
        }
        this.billsService.savePayPeriodNumDays(this.numDaysPayPeriod, this.currentDate);
    };
    AppComponent.prototype.getDisposableNeeded = function () {
        this.finalDays = this.daysLeftCount + this.numDaysPayPeriod;
        return this.finalDays * this.disposablePerDay;
    };
    AppComponent.prototype.getDisposableLeft = function () {
        return (this.remainingBalance - this.getDisposableNeeded()).toFixed(2);
    };
    AppComponent.ctorParameters = function () { return [
        { type: _services_bills_service__WEBPACK_IMPORTED_MODULE_2__["BillsService"] }
    ]; };
    AppComponent = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["Component"])({
            selector: 'app-root',
            template: __webpack_require__(/*! raw-loader!./app.component.html */ "./node_modules/raw-loader/index.js!./src/app/app.component.html"),
            styles: [__webpack_require__(/*! ./app.component.scss */ "./src/app/app.component.scss")]
        })
    ], AppComponent);
    return AppComponent;
}());



/***/ }),

/***/ "./src/app/app.module.ts":
/*!*******************************!*\
  !*** ./src/app/app.module.ts ***!
  \*******************************/
/*! exports provided: AppModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppModule", function() { return AppModule; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");
/* harmony import */ var _angular_platform_browser__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/platform-browser */ "./node_modules/@angular/platform-browser/fesm5/platform-browser.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _app_routing_module__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./app-routing.module */ "./src/app/app-routing.module.ts");
/* harmony import */ var _app_component__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./app.component */ "./src/app/app.component.ts");
/* harmony import */ var _angular_service_worker__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! @angular/service-worker */ "./node_modules/@angular/service-worker/fesm5/service-worker.js");
/* harmony import */ var _environments_environment__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ../environments/environment */ "./src/environments/environment.ts");
/* harmony import */ var ng_zorro_antd__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! ng-zorro-antd */ "./node_modules/ng-zorro-antd/fesm5/ng-zorro-antd.js");
/* harmony import */ var _angular_forms__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! @angular/forms */ "./node_modules/@angular/forms/fesm5/forms.js");
/* harmony import */ var _angular_common_http__WEBPACK_IMPORTED_MODULE_9__ = __webpack_require__(/*! @angular/common/http */ "./node_modules/@angular/common/fesm5/http.js");
/* harmony import */ var _angular_platform_browser_animations__WEBPACK_IMPORTED_MODULE_10__ = __webpack_require__(/*! @angular/platform-browser/animations */ "./node_modules/@angular/platform-browser/fesm5/animations.js");
/* harmony import */ var _angular_common__WEBPACK_IMPORTED_MODULE_11__ = __webpack_require__(/*! @angular/common */ "./node_modules/@angular/common/fesm5/common.js");
/* harmony import */ var _angular_common_locales_en__WEBPACK_IMPORTED_MODULE_12__ = __webpack_require__(/*! @angular/common/locales/en */ "./node_modules/@angular/common/locales/en.js");
/* harmony import */ var _angular_common_locales_en__WEBPACK_IMPORTED_MODULE_12___default = /*#__PURE__*/__webpack_require__.n(_angular_common_locales_en__WEBPACK_IMPORTED_MODULE_12__);
/* harmony import */ var _services_bills_service__WEBPACK_IMPORTED_MODULE_13__ = __webpack_require__(/*! ./services/bills.service */ "./src/app/services/bills.service.ts");
/* harmony import */ var _components_days_of_week_days_of_week_component__WEBPACK_IMPORTED_MODULE_14__ = __webpack_require__(/*! ./components/days-of-week/days-of-week.component */ "./src/app/components/days-of-week/days-of-week.component.ts");
/* harmony import */ var _components_expense_expense_component__WEBPACK_IMPORTED_MODULE_15__ = __webpack_require__(/*! ./components/expense/expense.component */ "./src/app/components/expense/expense.component.ts");
















Object(_angular_common__WEBPACK_IMPORTED_MODULE_11__["registerLocaleData"])(_angular_common_locales_en__WEBPACK_IMPORTED_MODULE_12___default.a);
var AppModule = /** @class */ (function () {
    function AppModule() {
    }
    AppModule = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_2__["NgModule"])({
            declarations: [
                _app_component__WEBPACK_IMPORTED_MODULE_4__["AppComponent"],
                _components_days_of_week_days_of_week_component__WEBPACK_IMPORTED_MODULE_14__["DaysOfWeekComponent"],
                _components_expense_expense_component__WEBPACK_IMPORTED_MODULE_15__["ExpenseComponent"]
            ],
            imports: [
                _angular_platform_browser__WEBPACK_IMPORTED_MODULE_1__["BrowserModule"],
                _app_routing_module__WEBPACK_IMPORTED_MODULE_3__["AppRoutingModule"],
                _angular_service_worker__WEBPACK_IMPORTED_MODULE_5__["ServiceWorkerModule"].register('ngsw-worker.js', { enabled: _environments_environment__WEBPACK_IMPORTED_MODULE_6__["environment"].production }),
                ng_zorro_antd__WEBPACK_IMPORTED_MODULE_7__["NgZorroAntdModule"],
                _angular_forms__WEBPACK_IMPORTED_MODULE_8__["FormsModule"],
                _angular_common_http__WEBPACK_IMPORTED_MODULE_9__["HttpClientModule"],
                _angular_platform_browser_animations__WEBPACK_IMPORTED_MODULE_10__["BrowserAnimationsModule"]
            ],
            providers: [{ provide: ng_zorro_antd__WEBPACK_IMPORTED_MODULE_7__["NZ_I18N"], useValue: ng_zorro_antd__WEBPACK_IMPORTED_MODULE_7__["en_US"] }, _services_bills_service__WEBPACK_IMPORTED_MODULE_13__["BillsService"]],
            bootstrap: [_app_component__WEBPACK_IMPORTED_MODULE_4__["AppComponent"]]
        })
    ], AppModule);
    return AppModule;
}());



/***/ }),

/***/ "./src/app/components/days-of-week/days-of-week.component.scss":
/*!*********************************************************************!*\
  !*** ./src/app/components/days-of-week/days-of-week.component.scss ***!
  \*********************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ".cal-day {\n  border-radius: 7px;\n  border: 1px solid #ddd;\n  height: 275px;\n  padding: 4px 4px;\n  font-size: 12px;\n  -webkit-box-flex: 1;\n          flex: 1 1 0;\n}\n\n.cal-day-no-border {\n  border-radius: 7px;\n  border: 1px solid #fff;\n  height: 275px;\n  padding: 4px 4px;\n  font-size: 12px;\n}\n\n.cal-day-item {\n  padding: 0 3px;\n  background-color: #5adbb7;\n  color: white;\n  border-radius: 7px;\n}\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi9Vc2Vycy9BbGV4YW5kZXJIYXdsZXkvRG9jdW1lbnRzL0FuZ3VsYXJQcm9qZWN0cy9iaWxsczIxL3NyYy9hcHAvY29tcG9uZW50cy9kYXlzLW9mLXdlZWsvZGF5cy1vZi13ZWVrLmNvbXBvbmVudC5zY3NzIiwic3JjL2FwcC9jb21wb25lbnRzL2RheXMtb2Ytd2Vlay9kYXlzLW9mLXdlZWsuY29tcG9uZW50LnNjc3MiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7RUFDRSxrQkFBQTtFQUNBLHNCQUFBO0VBQ0EsYUFBQTtFQUNBLGdCQUFBO0VBQ0EsZUFBQTtFQUNBLG1CQUFBO1VBQUEsV0FBQTtBQ0NGOztBREVBO0VBQ0Usa0JBQUE7RUFDQSxzQkFBQTtFQUNBLGFBQUE7RUFDQSxnQkFBQTtFQUNBLGVBQUE7QUNDRjs7QURFQTtFQUNFLGNBQUE7RUFDQSx5QkFBQTtFQUNBLFlBQUE7RUFDQSxrQkFBQTtBQ0NGIiwiZmlsZSI6InNyYy9hcHAvY29tcG9uZW50cy9kYXlzLW9mLXdlZWsvZGF5cy1vZi13ZWVrLmNvbXBvbmVudC5zY3NzIiwic291cmNlc0NvbnRlbnQiOlsiLmNhbC1kYXkge1xuICBib3JkZXItcmFkaXVzOiA3cHg7XG4gIGJvcmRlcjogMXB4IHNvbGlkICNkZGQ7XG4gIGhlaWdodDogMjc1cHg7XG4gIHBhZGRpbmc6IDRweCA0cHg7XG4gIGZvbnQtc2l6ZTogMTJweDtcbiAgZmxleDogMSAxIDA7XG59XG5cbi5jYWwtZGF5LW5vLWJvcmRlciB7XG4gIGJvcmRlci1yYWRpdXM6IDdweDtcbiAgYm9yZGVyOiAxcHggc29saWQgI2ZmZjtcbiAgaGVpZ2h0OiAyNzVweDtcbiAgcGFkZGluZzogNHB4IDRweDtcbiAgZm9udC1zaXplOiAxMnB4O1xufVxuXG4uY2FsLWRheS1pdGVtIHtcbiAgcGFkZGluZzogMCAzcHg7XG4gIGJhY2tncm91bmQtY29sb3I6ICM1YWRiYjc7XG4gIGNvbG9yOiB3aGl0ZTtcbiAgYm9yZGVyLXJhZGl1czogN3B4O1xufVxuIiwiLmNhbC1kYXkge1xuICBib3JkZXItcmFkaXVzOiA3cHg7XG4gIGJvcmRlcjogMXB4IHNvbGlkICNkZGQ7XG4gIGhlaWdodDogMjc1cHg7XG4gIHBhZGRpbmc6IDRweCA0cHg7XG4gIGZvbnQtc2l6ZTogMTJweDtcbiAgZmxleDogMSAxIDA7XG59XG5cbi5jYWwtZGF5LW5vLWJvcmRlciB7XG4gIGJvcmRlci1yYWRpdXM6IDdweDtcbiAgYm9yZGVyOiAxcHggc29saWQgI2ZmZjtcbiAgaGVpZ2h0OiAyNzVweDtcbiAgcGFkZGluZzogNHB4IDRweDtcbiAgZm9udC1zaXplOiAxMnB4O1xufVxuXG4uY2FsLWRheS1pdGVtIHtcbiAgcGFkZGluZzogMCAzcHg7XG4gIGJhY2tncm91bmQtY29sb3I6ICM1YWRiYjc7XG4gIGNvbG9yOiB3aGl0ZTtcbiAgYm9yZGVyLXJhZGl1czogN3B4O1xufSJdfQ== */"

/***/ }),

/***/ "./src/app/components/days-of-week/days-of-week.component.ts":
/*!*******************************************************************!*\
  !*** ./src/app/components/days-of-week/days-of-week.component.ts ***!
  \*******************************************************************/
/*! exports provided: DaysOfWeekComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "DaysOfWeekComponent", function() { return DaysOfWeekComponent; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");


var DaysOfWeekComponent = /** @class */ (function () {
    function DaysOfWeekComponent() {
        this.isExpanded = false;
        this.expandHeight = '720';
        this.shouldCallToggleEnabled = new _angular_core__WEBPACK_IMPORTED_MODULE_1__["EventEmitter"]();
    }
    DaysOfWeekComponent.prototype.ngOnInit = function () {
    };
    DaysOfWeekComponent.prototype.callToggleEnabled = function (retVal) {
        this.shouldCallToggleEnabled.emit(1);
    };
    tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["Input"])()
    ], DaysOfWeekComponent.prototype, "billsDays", void 0);
    tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["Input"])()
    ], DaysOfWeekComponent.prototype, "isExpanded", void 0);
    tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["Input"])()
    ], DaysOfWeekComponent.prototype, "expandHeight", void 0);
    tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["Output"])()
    ], DaysOfWeekComponent.prototype, "shouldCallToggleEnabled", void 0);
    DaysOfWeekComponent = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["Component"])({
            selector: 'app-days-of-week',
            template: __webpack_require__(/*! raw-loader!./days-of-week.component.html */ "./node_modules/raw-loader/index.js!./src/app/components/days-of-week/days-of-week.component.html"),
            styles: [__webpack_require__(/*! ./days-of-week.component.scss */ "./src/app/components/days-of-week/days-of-week.component.scss")]
        })
    ], DaysOfWeekComponent);
    return DaysOfWeekComponent;
}());



/***/ }),

/***/ "./src/app/components/expense/expense.component.scss":
/*!***********************************************************!*\
  !*** ./src/app/components/expense/expense.component.scss ***!
  \***********************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ".cal-day {\n  border-radius: 7px;\n  border: 1px solid #ddd;\n  height: 200px;\n  padding: 4px 4px;\n  font-size: 12px;\n}\n\n.cal-day-item {\n  padding: 0 3px;\n  color: white;\n  border-radius: 7px;\n  margin-bottom: 4px;\n}\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi9Vc2Vycy9BbGV4YW5kZXJIYXdsZXkvRG9jdW1lbnRzL0FuZ3VsYXJQcm9qZWN0cy9iaWxsczIxL3NyYy9hcHAvY29tcG9uZW50cy9leHBlbnNlL2V4cGVuc2UuY29tcG9uZW50LnNjc3MiLCJzcmMvYXBwL2NvbXBvbmVudHMvZXhwZW5zZS9leHBlbnNlLmNvbXBvbmVudC5zY3NzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0VBQ0Usa0JBQUE7RUFDQSxzQkFBQTtFQUNBLGFBQUE7RUFDQSxnQkFBQTtFQUNBLGVBQUE7QUNDRjs7QURFQTtFQUNFLGNBQUE7RUFDQSxZQUFBO0VBQ0Esa0JBQUE7RUFDQSxrQkFBQTtBQ0NGIiwiZmlsZSI6InNyYy9hcHAvY29tcG9uZW50cy9leHBlbnNlL2V4cGVuc2UuY29tcG9uZW50LnNjc3MiLCJzb3VyY2VzQ29udGVudCI6WyIuY2FsLWRheSB7XG4gIGJvcmRlci1yYWRpdXM6IDdweDtcbiAgYm9yZGVyOiAxcHggc29saWQgI2RkZDtcbiAgaGVpZ2h0OiAyMDBweDtcbiAgcGFkZGluZzogNHB4IDRweDtcbiAgZm9udC1zaXplOiAxMnB4O1xufVxuXG4uY2FsLWRheS1pdGVtIHtcbiAgcGFkZGluZzogMCAzcHg7XG4gIGNvbG9yOiB3aGl0ZTtcbiAgYm9yZGVyLXJhZGl1czogN3B4O1xuICBtYXJnaW4tYm90dG9tOiA0cHg7XG59XG4iLCIuY2FsLWRheSB7XG4gIGJvcmRlci1yYWRpdXM6IDdweDtcbiAgYm9yZGVyOiAxcHggc29saWQgI2RkZDtcbiAgaGVpZ2h0OiAyMDBweDtcbiAgcGFkZGluZzogNHB4IDRweDtcbiAgZm9udC1zaXplOiAxMnB4O1xufVxuXG4uY2FsLWRheS1pdGVtIHtcbiAgcGFkZGluZzogMCAzcHg7XG4gIGNvbG9yOiB3aGl0ZTtcbiAgYm9yZGVyLXJhZGl1czogN3B4O1xuICBtYXJnaW4tYm90dG9tOiA0cHg7XG59Il19 */"

/***/ }),

/***/ "./src/app/components/expense/expense.component.ts":
/*!*********************************************************!*\
  !*** ./src/app/components/expense/expense.component.ts ***!
  \*********************************************************/
/*! exports provided: ExpenseComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ExpenseComponent", function() { return ExpenseComponent; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");


var ExpenseComponent = /** @class */ (function () {
    function ExpenseComponent() {
        this.didToggleEnabled = new _angular_core__WEBPACK_IMPORTED_MODULE_1__["EventEmitter"]();
        this.colors = [
            '#18cc99',
            '#ff0266',
            '#ffc412',
            '#7d52e3',
            '#ff9e22',
            '#0336ff',
            '#ee0290'
        ];
    }
    ExpenseComponent.prototype.ngOnInit = function () {
    };
    ExpenseComponent.prototype.getColor = function (index) {
        if (index < 7) {
            return this.colors[index];
        }
        else {
            var newIndex = index % 7;
            return this.colors[newIndex];
        }
    };
    ExpenseComponent.prototype.toggleEnabled = function (index) {
        this.expenses[index].isEnabled = !(this.expenses[index].isEnabled);
        if (!this.expenses[index].isEnabled) {
            this.expenses[index].amount = 0;
        }
        else {
            this.expenses[index].amount = this.expenses[index].savedAmount;
        }
        this.didToggleEnabled.emit(1);
    };
    tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["Output"])()
    ], ExpenseComponent.prototype, "didToggleEnabled", void 0);
    tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["Input"])()
    ], ExpenseComponent.prototype, "expenses", void 0);
    ExpenseComponent = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["Component"])({
            selector: 'app-expense',
            template: __webpack_require__(/*! raw-loader!./expense.component.html */ "./node_modules/raw-loader/index.js!./src/app/components/expense/expense.component.html"),
            styles: [__webpack_require__(/*! ./expense.component.scss */ "./src/app/components/expense/expense.component.scss")]
        })
    ], ExpenseComponent);
    return ExpenseComponent;
}());



/***/ }),

/***/ "./src/app/services/bills.service.ts":
/*!*******************************************!*\
  !*** ./src/app/services/bills.service.ts ***!
  \*******************************************/
/*! exports provided: BillsService */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "BillsService", function() { return BillsService; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_common_http__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/common/http */ "./node_modules/@angular/common/fesm5/http.js");
/* harmony import */ var rxjs__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! rxjs */ "./node_modules/rxjs/_esm5/index.js");
// items.service.ts




var BillsService = /** @class */ (function () {
    function BillsService(http) {
        this.http = http;
        this.billsSource = new rxjs__WEBPACK_IMPORTED_MODULE_3__["BehaviorSubject"](this.billResults);
        this.billsList = this.billsSource.asObservable();
    }
    BillsService.prototype.loadBills = function (curBalance, payDate, hashCode, prevDate, nextDate, testMode) {
        var _this = this;
        if (testMode === void 0) { testMode = false; }
        var date = null;
        if (!payDate) {
            var today = new Date();
            date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
        }
        else {
            date = payDate.toLocaleString();
        }
        console.log('date: ', date);
        var requestParams = 'user_id=1&pay_date=' + date + '&';
        if (curBalance) {
            requestParams += 'current_balance=' + curBalance + '&';
        }
        if (hashCode) {
            requestParams += 'hash_key_token_cs=' + hashCode + '&';
        }
        if (prevDate) {
            requestParams += 'prev_date=1' + '&';
        }
        else if (nextDate) {
            requestParams += 'next_date=1' + '&';
        }
        if (testMode) {
            requestParams += 'test_mode=1' + '&';
        }
        this.http.get('https://budget.hawleywebdesign.com/api/loadBillDates2.php?' + requestParams).subscribe(function (response) {
            _this.billsSource.next(response);
        }, function (err) {
            console.log('error', 'Error loading Growth By Standards : ' + err.error.message);
        });
    };
    BillsService.prototype.savePayPeriodNumDays = function (numDays, payDate) {
        var date = null;
        if (!payDate) {
            var today = new Date();
            date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
        }
        else {
            date = payDate.toLocaleString();
        }
        if (!numDays) {
            numDays = 1;
        }
        var requestParams = 'pay_date=' + date + '&num_days=' + numDays;
        this.http.get('https://budget.hawleywebdesign.com/api/save_pay_period_num_days.php?' + requestParams).subscribe(function (response) {
        }, function (err) {
            console.log('error', 'Error loading Growth By Standards : ' + err.error.message);
        });
    };
    BillsService.ctorParameters = function () { return [
        { type: _angular_common_http__WEBPACK_IMPORTED_MODULE_2__["HttpClient"] }
    ]; };
    BillsService = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["Injectable"])()
    ], BillsService);
    return BillsService;
}());



/***/ }),

/***/ "./src/environments/environment.ts":
/*!*****************************************!*\
  !*** ./src/environments/environment.ts ***!
  \*****************************************/
/*! exports provided: environment */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "environment", function() { return environment; });
// This file can be replaced during build by using the `fileReplacements` array.
// `ng build --prod` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.
var environment = {
    production: false
};
/*
 * For easier debugging in development mode, you can import the following file
 * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
 *
 * This import should be commented out in production mode because it will have a negative impact
 * on performance if an error is thrown.
 */
// import 'zone.js/dist/zone-error';  // Included with Angular CLI.


/***/ }),

/***/ "./src/main.ts":
/*!*********************!*\
  !*** ./src/main.ts ***!
  \*********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_platform_browser_dynamic__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/platform-browser-dynamic */ "./node_modules/@angular/platform-browser-dynamic/fesm5/platform-browser-dynamic.js");
/* harmony import */ var _app_app_module__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./app/app.module */ "./src/app/app.module.ts");
/* harmony import */ var _environments_environment__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./environments/environment */ "./src/environments/environment.ts");




if (_environments_environment__WEBPACK_IMPORTED_MODULE_3__["environment"].production) {
    Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["enableProdMode"])();
}
Object(_angular_platform_browser_dynamic__WEBPACK_IMPORTED_MODULE_1__["platformBrowserDynamic"])().bootstrapModule(_app_app_module__WEBPACK_IMPORTED_MODULE_2__["AppModule"])
    .catch(function (err) { return console.error(err); });


/***/ }),

/***/ 0:
/*!***************************!*\
  !*** multi ./src/main.ts ***!
  \***************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__(/*! /Users/AlexanderHawley/Documents/AngularProjects/bills21/src/main.ts */"./src/main.ts");


/***/ })

},[[0,"runtime","vendor"]]]);
//# sourceMappingURL=main-es5.js.map