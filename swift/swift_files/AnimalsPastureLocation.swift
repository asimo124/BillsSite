//
//  AnimalsPastureLocation.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsPastureLocation {
    
    static var TABLE_NAME = "animal_location";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var PASTURE_ID = "pasture_id";
    static var MOVE_IN = "move_in";
    static var MOVE_OUT = "move_out";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getPastureId() -> String {
        return PASTURE_ID;
    }
    
    class func getMoveIn() -> String {
        return MOVE_IN;
    }
    
    class func getMoveOut() -> String {
        return MOVE_OUT;
    }
    
    class func truncate() {
        
        let dbn = Database()
        let query = "delete from animal_location"
        dbn.query(query)
    }
}
