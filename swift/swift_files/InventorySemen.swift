//
//  InventorySemen.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class InventorySemen {
    
    static var TABLE_NAME = "semen_inventory";
    static var _ID = "_id";
    static var SEMEN_ID = "semen_id"
    static var MEMBER_ID = "member_id";
    static var REGISTRATION = "registration";
    static var TANK = "tank";
    static var CANISTER = "canister";
    static var CANE = "cane";
    static var STRAW_QTY = "straw_qty";
    static var DATE_COLLECTED = "date_collected";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from semen_inventory"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getSemenId() -> String {
        return SEMEN_ID;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getTANK() -> String {
        return TANK;
    }
    
    class func getCANISTER() -> String {
        return CANISTER;
    }
    
    class func getCANE() -> String {
        return CANE;
    }
    
    class func getStrawQty() -> String {
        return STRAW_QTY;
    }
    
    class func getDateCollected() -> String {
        return DATE_COLLECTED;
    }
}
