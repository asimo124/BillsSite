//
//  PartnershipMembers.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class PartnershipMembers {
    
    static var TABLE_NAME = "partnership_members";
    static var _ID = "_id";
    static var PARTNERSHIP_ID = "partnership_id";
    static var MEMBER_ID = "member_id";
    static var BEGIN_DATE = "begin_date";
    static var END_DATE = "end_date";
    static var IS_PRIMARY = "is_primary";
    static var IS_ACCEPTED = "is_accepted";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from partnership_members"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getPartnershipId() -> String {
        return PARTNERSHIP_ID;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getBeginDate() -> String {
        return BEGIN_DATE;
    }
    
    class func getEndDate() -> String {
        return END_DATE;
    }
    
    class func getIsPrimary() -> String {
        return IS_PRIMARY;
    }
    
    class func getIsAccepted() -> String {
        return IS_ACCEPTED;
    }
}
