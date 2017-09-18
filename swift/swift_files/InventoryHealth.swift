//
//  InventoryHealth.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class InventoryHealth {
    
    static var TABLE_NAME = "health_manager";
    static var _ID = "_id";
    static var HEALTH_ID = "health_id"
    static var MEMBER_ID = "member_id";
    static var PRODUCT_NAME = "product_name";
    static var WITHDRAWAL_PERIOD = "withdrawal_period";
    static var LOT_NUMBER = "lot_number";
    static var SERIAL_NUMBER = "serial_number";
    static var EXPIRATION_DATE = "expiration_date";
    static var DOSAGE = "dosage";
    static var METHOD = "method";
    static var LOCATION = "location";
    static var ADMINISTERED_BY = "administered_by";
    static var LESS_THAN_TEN_MONTHS = "less_than_ten_months";
    static var GREATER_THAN_TEN_MONTHS = "greater_than_ten_months";
    static var LESS_THAN_TWELVE_MONTHS = "less_than_twelve_months";
    static var FEMALE_ONLY = "female_only";
    static var MALE_ONLY = "male_only";
    static var IS_BANGS = "is_bangs";
    static var NO_REQUIREMENT = "no_requirement";
    static var IS_ACTIVE = "is_active";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from health_manager"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getHealthId() -> String {
        
        return HEALTH_ID;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getProductName() -> String {
        return PRODUCT_NAME;
    }
    
    class func getWithdrawalPeriod() -> String {
        return WITHDRAWAL_PERIOD;
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
    
    class func getLessThanTenMonths() -> String {
        return LESS_THAN_TEN_MONTHS;
    }
    
    class func getGreaterThanTenMonths() -> String {
        return GREATER_THAN_TEN_MONTHS;
    }
    
    class func getLessThanTwelveMonths() -> String {
        return LESS_THAN_TWELVE_MONTHS;
    }
    
    class func getFemaleOnly() -> String {
        return FEMALE_ONLY;
    }
    
    class func getMaleOnly() -> String {
        return MALE_ONLY;
    }
    
    class func getIsBangs() -> String {
        return IS_BANGS;
    }
    
    class func getNoRequirement() -> String {
        return NO_REQUIREMENT;
    }
    
    class func getIsActive() -> String {
        return IS_ACTIVE;
    }
}
