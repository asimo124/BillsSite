//
//  AnimalsPenLocation.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsPenLocation {

    static var TABLE_NAME = "pen_location";
    static var _ID = "_id";
    static var PEN_ID = "pen_id";
    static var MEMBER_ID = "member_id";
    static var REGISTRATION = "registration";
    static var MOVE_IN = "move_in";
    static var MOVE_OUT = "move_out";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getPenId() -> String {
        return PEN_ID;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getMoveIn() -> String {
        return MOVE_IN;
    }
    
    class func getMoveOut() -> String {
        return MOVE_OUT;
    }
    
    class func truncate() {
        
        let dbn = Database()
        let query = "delete from pen_location"
        dbn.query(query)
    }
}
