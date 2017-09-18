//
//  Partnership.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class Partnership {
    
    static var TABLE_NAME = "partnership";
    static var _ID = "_id";
    static var PARTNERSHIP_ID = "partnership_id";
    static var REGISTRATION = "registration";
    
    class func getPartnershipId() -> String {
        return PARTNERSHIP_ID;
    }
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from partnership"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
}
