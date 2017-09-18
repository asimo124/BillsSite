//
//  Animals.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class Animals {
    
    static var TABLE_NAME = "animal";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var PRIVATE_HERD_NUMBER = "private_herd_number";
    static var EID = "eid";
    static var ANIMAL_NAME = "animal_name";
    static var INTERNATIONAL_ID = "international_id";
    static var SIRE = "sire";
    static var DAM = "dam";
    static var STATUS = "status";
    static var SEX = "sex";
    static var METAL_EAR_TAG = "metal_ear_tag";
    static var OTHER_ID = "other_id";
    static var BREEDER_ID = "breeder_id";
    static var IS_DELETED = "is_deleted";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getPrivateHerdNumber() -> String {
        return PRIVATE_HERD_NUMBER;
    }
    
    class func getEID() -> String {
        return EID;
    }
    
    class func getAnimalName() -> String {
        return ANIMAL_NAME;
    }
    
    class func getInternationalId() -> String {
        return INTERNATIONAL_ID;
    }
    
    class func getSIRE() -> String {
        return SIRE;
    }
    
    class func getDAM() -> String {
        return DAM;
    }
    
    class func getSTATUS() -> String {
        return STATUS;
    }
    
    class func getSEX() -> String {
        return SEX;
    }
    
    class func getMetalEarTag() -> String {
        return METAL_EAR_TAG;
    }
    
    class func getOtherId() -> String {
        return OTHER_ID;
    }
    
    class func getBreederId() -> String {
        return BREEDER_ID;
    }
    
    class func getIsDeleted() -> String {
        return IS_DELETED;
    }
    
    class func truncate() {
        
        let dbn = Database()
        let query = "delete from animal"
        dbn.query(query)
    }
        
}
