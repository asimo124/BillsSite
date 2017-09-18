//
//  TblVaccinations.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblVaccinations {
    
    static var TABLE_NAME = "tbl_vaccinations";
    static var _ID = "_id";
    static var PK_ID = "pk_id";
    static var MEMBER_ID = "member_id";
    static var WITHDRAWAL_PERIOD = "withdrawal_period";
    static var DATE = "date";
    static var PRODUCT_NAME = "product_name";
    static var LOT_NUMBER = "lot_number";
    static var SERIAL_NUMBER = "serial_number";
    static var EXPIRATION_DATE = "expiration_date";
    static var DOSAGE = "dosage";
    static var METHOD = "method";
    static var LOCATION = "location";
    static var ADMINISTERED_BY = "administered_by";
    static var LESS_TEN_MONTH = "less_ten_month";
    static var GREATER_TEN_MONTH = "greater_ten_month";
    static var FEMALE_ONLY = "female_only";
    static var MALE_ONLY = "male_only";
    static var LESS_TWELVE_MONTH = "less_twelve_month";
    static var BANGS_VACCS = "bangs_vaccs";
    static var NO_REQUIREMENTS = "no_requirements";
    static var ACTIVE_FLAG = "active_flag";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_vaccinations"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getPkId() -> String {
        return PK_ID;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getWithdrawalPeriod() -> String {
        return WITHDRAWAL_PERIOD;
    }
    
    class func getDATE() -> String {
        return DATE;
    }
    
    class func getProductName() -> String {
        return PRODUCT_NAME;
    }
    
    class func getLotNumber() -> String {
        return LOT_NUMBER;
    }
    
    class func getSerialNumber() -> String {
        return SERIAL_NUMBER;
    }
    
    class func getExpirationDate() -> String {
        return EXPIRATION_DATE;
    }
    
    class func getDOSAGE() -> String {
        return DOSAGE;
    }
    
    class func getMETHOD() -> String {
        return METHOD;
    }
    
    class func getLOCATION() -> String {
        return LOCATION;
    }
    
    class func getAdministeredBy() -> String {
        return ADMINISTERED_BY;
    }
    
    class func getLessTenMonth() -> String {
        return LESS_TEN_MONTH;
    }
    
    class func getGreaterTenMonth() -> String {
        return GREATER_TEN_MONTH;
    }
    
    class func getFemaleOnly() -> String {
        return FEMALE_ONLY;
    }
    
    class func getMaleOnly() -> String {
        return MALE_ONLY;
    }
    
    class func getLessTwelveMonth() -> String {
        return LESS_TWELVE_MONTH;
    }
    
    class func getBangsVaccs() -> String {
        return BANGS_VACCS;
    }
    
    class func getNoRequirements() -> String {
        return NO_REQUIREMENTS;
    }
    
    class func getActiveFlag() -> String {
        return ACTIVE_FLAG;
    }
    
    class func getCreateUser() -> String {
        return CREATE_USER;
    }
    
    class func getCreateStamp() -> String {
        return CREATE_STAMP;
    }
    
    class func getUpdateUser() -> String {
        return UPDATE_USER;
    }
    
    class func getUpdateStamp() -> String {
        return UPDATE_STAMP;
    }
}
