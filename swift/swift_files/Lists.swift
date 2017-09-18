//
//  Lists.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/22/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class Lists {
    
    
    static var TABLE_NAME = "lists";
    static var _ID = "_id";
    static var UNIQUE_ID = "unique_id";
    static var LIST_NAME = "list_name";
    static var REGISTRATION = "registration";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getUniqueId() -> String {
        return UNIQUE_ID;
    }
    
    class func getListName() -> String {
        return LIST_NAME;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
}
