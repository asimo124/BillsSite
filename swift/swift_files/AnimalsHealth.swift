//
//  AnimalsHealth.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsHealth {
    
    static var TABLE_NAME = "animal_health";
    static var _ID = "_id";
    static var HEALTH_ID = "health_id";
    static var REGISTRATION = "registration";
    static var DATE_ADMINISTERED = "date_administered";
    static var PRODUCT_NAME = "product_name";
    static var SERIAL_NUMBER = "serial_number";
    static var DOSAGE = "dosage";
    static var LOCATION = "location";
    static var WITHDRAWAL_PERIOD = "withdrawal_period";
    static var ADMINISTERED_BY = "administered_by";
    static var LOT_NUMBER = "lot_number";
    static var METHOD = "method";
    static var EXPIRATION_DATE = "expiration_date";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getHealthId() -> String {
        return HEALTH_ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
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
    
    class func getLOCATION() -> String {
        return LOCATION;
    }
    
    class func getWithdrawalPeriod() -> String {
        return WITHDRAWAL_PERIOD;
    }
    
    class func getAdministeredBy() -> String {
        return ADMINISTERED_BY;
    }
    
    class func getLotNumber() -> String {
        return LOT_NUMBER;
    }
    
    class func getMETHOD() -> String {
        return METHOD;
    }
    
    class func getExpirationDate() -> String {
        return EXPIRATION_DATE;
    }
    
    class func truncate() {
        
        let dbn = Database()
        let query = "delete from animal_health"
        dbn.query(query)
    }
}
