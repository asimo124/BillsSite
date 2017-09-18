//
//  TblAnimalPenLocation.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalPenLocation {
    
    static var TABLE_NAME = "tbl_animal_pen_location";
    static var _ID = "_id";
    static var PK_ID = "pk_id";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var MEMBER_ID = "member_id";
    static var PEN_ID = "pen_id";
    static var MOVE_IN_DATE = "move_in_date";
    static var MOVE_OUT_DATE = "move_out_date";
    static var EXPIRED = "expired";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_animal_pen_location"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getPkId() -> String {
        return PK_ID;
    }
    
    class func getAnimalRegistration() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getPenId() -> String {
        return PEN_ID;
    }
    
    class func getMoveInDate() -> String {
        return MOVE_IN_DATE;
    }
    
    class func getMoveOutDate() -> String {
        return MOVE_OUT_DATE;
    }
    
    class func getEXPIRED() -> String {
        return EXPIRED;
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
