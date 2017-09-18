//
//  CertificateAi.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class CertificateAi {
    
    static var TABLE_NAME = "ai_certificates";
    static var _ID = "_id";
    static var CERTIFICATE_NUMBER = "certificate_number";
    static var STUD_NUMBER = "stud_number";
    static var SIRE_OWNER = "sire_owner";
    static var SIRE_REGISTRATION = "sire_registration";
    static var DATE_COLLECTED = "date_collected";
    static var SEMEN_ID = "semen_id";
    static var DATE_SOLD = "date_sold";
    static var DAM_OWNER = "dam_owner";
    static var DAM_REGISTRATION = "dam_registration";
    static var DATE_INSEMINATED = "date_inseminated";
    static var IS_COMPLETED = "is_completed";
    static var UNIT_QTY = "unit_qty";
    static var IS_VOID = "is_void";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getCertificateNumber() -> String {
        return CERTIFICATE_NUMBER;
    }
    
    class func getStudNumber() -> String {
        return STUD_NUMBER;
    }
    
    class func getSireOwner() -> String {
        return SIRE_OWNER;
    }
    
    class func getSireRegistration() -> String {
        return SIRE_REGISTRATION;
    }
    
    class func getDateCollected() -> String {
        return DATE_COLLECTED;
    }
    
    class func getSemenId() -> String {
        return SEMEN_ID;
    }
    
    class func getDateSold() -> String {
        return DATE_SOLD;
    }
    
    class func getDamOwner() -> String {
        return DAM_OWNER;
    }
    
    class func getDamRegistration() -> String {
        return DAM_REGISTRATION;
    }
    
    class func getDateInseminated() -> String {
        return DATE_INSEMINATED;
    }
    
    class func getIsCompleted() -> String {
        return IS_COMPLETED;
    }
    
    class func getUnitQty() -> String {
        return UNIT_QTY;
    }
    
    class func getIsVoid() -> String {
        return IS_VOID;
    }
    
    class func truncate() {
        
        let dbn = Database()
        dbn.query("DELETE FROM ai_certificates")
        
    }
}
