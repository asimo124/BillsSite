//
//  Ownership.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class Ownership {
    
    static var TABLE_NAME = "ownership";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var MEMBER_ID = "member_id";
    static var AMOUNT = "amount";
    static var DATE_OWNED = "date_owned";
    static var SUPERSEDED = "superceded";
    static var PREVIOUS_OWNER = "previous_owner";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from ownership"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getAMOUNT() -> String {
        return AMOUNT;
    }
    
    class func getDateOwned() -> String {
        return DATE_OWNED;
    }
    
    class func getSUPERSEDED() -> String {
        return SUPERSEDED;
    }
    
    class func getPreviousOwner() -> String {
        return PREVIOUS_OWNER;
    }
}
