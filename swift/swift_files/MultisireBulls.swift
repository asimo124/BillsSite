//
//  MultisireBulls.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class MultisireBulls {
    
    static var TABLE_NAME = "multisire_bulls";
    static var _ID = "_id";
    static var MULTISIRE_ID = "multisire_id";
    static var REGISTRATION = "registration";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from multisire_bulls"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getMultisireId() -> String {
        return MULTISIRE_ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
}
