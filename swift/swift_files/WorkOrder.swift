//
//  WorkOrder.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class WorkOrder {
    
    static var TABLE_NAME = "work_order";
    static var _ID = "_id";
    static var WORK_ORDER = "work_order";
    static var MEMBER_ID = "member_id";
    static var DATE_RECEIVED = "date_received";
    static var DATE_CLOSED = "date_closed";
    static var DESCRIPTION = "description";
    static var IS_CLOSED = "is_closed";
    static var NOTES = "notes";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from work_order"
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
    
    class func getDateReceived() -> String {
        return DATE_RECEIVED;
    }
    
    class func getDateClosed() -> String {
        return DATE_CLOSED;
    }
    
    class func getDESCRIPTION() -> String {
        return DESCRIPTION;
    }
    
    class func getIsClosed() -> String {
        return IS_CLOSED;
    }
    
    class func getNOTES() -> String {
        return NOTES;
    }
}
