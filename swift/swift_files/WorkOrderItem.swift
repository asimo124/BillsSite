//
//  WorkOrderItem.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class WorkOrderItem {
    
    static var TABLE_NAME = "work_order_item";
    static var _ID = "_id";
    static var WORK_ORDER = "work_order";
    static var MEMBER_ID = "member_id";
    static var DATE_ENTERED = "date_entered";
    static var ENTERED_BY = "entered_by";
    static var QUANTITY = "quantity";
    static var FEE = "fee";
    static var DESCRIPTION = "description";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from work_order_item"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getWorkOrder() -> String {
        return WORK_ORDER;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getDateEntered() -> String {
        return DATE_ENTERED;
    }
    
    class func getEnteredBy() -> String {
        return ENTERED_BY;
    }
    
    class func getQUANTITY() -> String {
        return QUANTITY;
    }
    
    class func getFEE() -> String {
        return FEE;
    }
    
    class func getDESCRIPTION() -> String {
        return DESCRIPTION;
    }
}
