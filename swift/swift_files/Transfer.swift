//
//  Transfer.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class Transfer {
    
    static var TABLE_NAME = "transfer";
    static var _ID = "_id";
    static var MEMBER_ID = "member_id";
    static var WORK_ORDER = "work_order";
    static var CUSTOMER_ID = "customer_id";
    static var TRANSFER_DATE = "transfer_date";
    static var VALUE = "value";
    static var REGISTRATION = "registration";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from transfer"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getWorkOrder() -> String {
        return WORK_ORDER;
    }
    
    class func getCustomerId() -> String {
        return CUSTOMER_ID;
    }
    
    class func getTransferDate() -> String {
        return TRANSFER_DATE;
    }
    
    class func getVALUE() -> String {
        return VALUE;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
}
