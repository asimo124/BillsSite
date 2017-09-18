//
//  TblMemberTransfers.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblMemberTransfers {
    
    static var TABLE_NAME = "tbl_member_transfers";
    static var _ID = "_id";
    static var PK_ID = "pk_id";
    static var MEMBER_ID = "member_id";
    static var WORK_ORDER = "work_order";
    static var CUSTOMER_ID = "customer_id";
    static var TRANSFER_DATE = "transfer_date";
    static var TRANSFER_VALUE = "transfer_value";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_member_transfers"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getPkId() -> String {
        return PK_ID;
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
    
    class func getTransferValue() -> String {
        return TRANSFER_VALUE;
    }
    
    class func getAnimalRegistration() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getCreateUser() -> String {
        return CREATE_USER;
    }
    
    class func getCreateStamp() -> String {
        return CREATE_STAMP;
    }
    
    class func getUpdateUser() -> String {
        return UPDATE_USER;
    }
    
    class func getUpdateStamp() -> String {
        return UPDATE_STAMP;
    }
}
