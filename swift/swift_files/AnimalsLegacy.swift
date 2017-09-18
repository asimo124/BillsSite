//
//  AnimalsLegacy.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsLegacy {
    
    static var TABLE_NAME = "animal_legacy";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var MEMBER_ID = "member_id";
    static var LEGACY_DATE = "legacy_date";
    static var REASON = "reason";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getLegacyDate() -> String {
        return LEGACY_DATE;
    }
    
    class func getREASON() -> String {
        return REASON;
    }
    
    class func truncate() {
        
        let dbn = Database()
        let query = "delete from animal_legacy"
        dbn.query(query)
    }
}
