//
//  InventoryEmbryo.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class InventoryEmbryo {
    static var TABLE_NAME = "embryo_inventory";
    static var _ID = "_id";
    static var EMBRYO_ID = "embryo_id";
    static var MEMBER_ID = "member_id";
    static var REGISTRATION = "registration";
    static var TANK = "tank";
    static var CANISTER = "canister";
    static var CANE = "cane";
    static var STRAW_QTY = "straw_qty";
    static var FLUSH_DATE = "flush_date";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from embryo_inventory"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getEmbryoId() -> String {
        return EMBRYO_ID;
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
    
    class func getFlushDate() -> String {
        return FLUSH_DATE;
    }
}
