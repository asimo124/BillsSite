//
//  TblAnimalHealth.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalHealth {

    static var TABLE_NAME = "tbl_animal_health";
    static var _ID = "_id";
    static var ANIMAL_HEALTH_ID = "animal_health_id";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var DATE_ADMINISTERED = "date_administered";
    static var PRODUCT_NAME = "product_name";
    static var SERIAL_NUMBER = "serial_number";
    static var DOSAGE = "dosage";
    static var APPLICATION_LOCATION = "application_location";
    static var WITHDRAWAL_PERIOD = "withdrawal_period";
    static var ADMINISTERED_BY = "administered_by";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    static var LOT_NUMBER = "lot_number";
    static var APPLICATION_METHOD = "application_method";
    static var EXPIRATION_DATE = "expiration_date";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_animal_health"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getAnimalHealthId() -> String {
        return ANIMAL_HEALTH_ID;
    }
    
    class func getAnimalRegistration() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getDateAdministered() -> String {
        return DATE_ADMINISTERED;
    }
    
    class func getProductName() -> String {
        return PRODUCT_NAME;
    }
    
    class func getSerialNumber() -> String {
        return SERIAL_NUMBER;
    }
    
    class func getDOSAGE() -> String {
        return DOSAGE;
    }
    
    class func getApplicationLocation() -> String {
        return APPLICATION_LOCATION;
    }
    
    class func getWithdrawalPeriod() -> String {
        return WITHDRAWAL_PERIOD;
    }
    
    class func getAdministeredBy() -> String {
        return ADMINISTERED_BY;
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
    
    class func getLotNumber() -> String {
        return LOT_NUMBER;
    }
    
    class func getApplicationMethod() -> String {
        return APPLICATION_METHOD;
    }
    
    class func getExpirationDate() -> String {
        return EXPIRATION_DATE;
    }
}
