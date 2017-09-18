//
//  TblAnimalPhoto.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalPhoto {
    
    static var TABLE_NAME = "tbl_animal_photo";
    static var _ID = "_id";
    static var PK_ID = "pk_id";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var PHOTO = "photo";                   
    static var IS_PRIMARY = "is_primary";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    static var HIDE_FROM_ROTATION = "hide_from_rotation";
    static var COMMENT = "comment";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_animal_photo"
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
    
    class func getPHOTO() -> String {
        return PHOTO;
    }
    
    class func getIsPrimary() -> String {
        return IS_PRIMARY;
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
    
    class func getHideFromRotation() -> String {
        return HIDE_FROM_ROTATION;
    }
    
    class func getCOMMENT() -> String {
        return COMMENT;
    }
}
