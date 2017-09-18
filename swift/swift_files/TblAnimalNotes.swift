//
//  TblAnimalNotes.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalNotes {
    
    static var TABLE_NAME = "tbl_animal_notes";
    static var _ID = "_id";
    static var COMMENT_ID = "comment_id";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var COMMENT = "comment";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    static var DELETED_FLAG = "deleted_flag";
    static var FLAG_NOTIFICATION = "flag_notification";
    static var FLAG_CULLED = "flag_culled";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_animal_notes"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getCommentId() -> String {
        return COMMENT_ID;
    }
    
    class func getAnimalRegistration() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getCOMMENT() -> String {
        return COMMENT;
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
    
    class func getDeletedFlag() -> String {
        return DELETED_FLAG;
    }
    
    class func getFlagNotification() -> String {
        return FLAG_NOTIFICATION;
    }
    
    class func getFlagCulled() -> String {
        return FLAG_CULLED;
    }
}
