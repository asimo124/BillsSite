//
//  LocationPasture.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class LocationPasture {
    
    static var TABLE_NAME = "pasture";
    static var _ID = "_id";
    static var PASTURE_ID = "pasture_id";
    static var PASTURE_NAME = "pasture_name";
    static var PASTURE_DESCRIPTION = "pasture_description";
    static var MEMBER_ID = "member_id";
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from pasture"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getPastureId() -> String {
        return PASTURE_ID;
    }
    
    class func getPastureName() -> String {
        return PASTURE_NAME;
    }
    
    class func getPastureDescription() -> String {
        return PASTURE_DESCRIPTION;
    }
}
