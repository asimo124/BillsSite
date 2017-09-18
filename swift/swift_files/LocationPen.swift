//
//  LocationPen.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class LocationPen {
    
    static var TABLE_NAME = "pen";
    static var _ID = "_id";
    static var PEN_ID = "pen_id";
    static var PEN_NAME = "pen_name";
    static var PEN_DESCRIPTION = "pen_description";
    static var MEMBER_ID = "member_id";
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from pen"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getPenId() -> String {
        return PEN_ID;
    }
    
    class func getPenName() -> String {
        return PEN_NAME;
    }
    
    class func getPenDescription() -> String {
        return PEN_DESCRIPTION;
    }
}
