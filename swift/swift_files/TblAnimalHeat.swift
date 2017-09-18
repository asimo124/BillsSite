//
//  TblAnimalHeat.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalHeat {
    
    static var TABLE_NAME = "tbl_animal_heat";
    static var _ID = "_id";
    static var PK_ID = "pk_id";
    static var OWNER_ID = "owner_id";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var ANIMAL_PHN = "animal_phn";
    static var HEAT_DATE = "heat_date";
    static var AM_PM = "am_pm";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_animal_heat"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getPkId() -> String {
        return PK_ID;
    }
    
    class func getOwnerId() -> String {
        return OWNER_ID;
    }
    
    class func getAnimalRegistration() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getAnimalPhn() -> String {
        return ANIMAL_PHN;
    }
    
    class func getHeatDate() -> String {
        return HEAT_DATE;
    }
    
    class func getAmPm() -> String {
        return AM_PM;
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
