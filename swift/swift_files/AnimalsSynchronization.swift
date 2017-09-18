//
//  AnimalsSynchronization.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsSynchronization {
    
    static var TABLE_NAME = "animal_synchronization";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var SYNC_DATE = "sync_date";
    static var COMMENT = "comment";
    static var IS_DELETED = "is_deleted";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from animal_synchronization"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getSyncDate() -> String {
        return SYNC_DATE;
    }
    
    class func getCOMMENT() -> String {
        return COMMENT;
    }
    
    class func getIsDeleted() -> String {
        return IS_DELETED;
    }
}
