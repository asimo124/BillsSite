//
//  Member.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class Member {
    
    static var TABLE_NAME = "member";
    static var _ID = "_id";
    static var MEMBER_ID = "member_id";
    static var MEMBER_PASSWORD = "member_password";
    static var MEMBER_NAME = "member_name";
    static var MEMBERSHIP_TYPE = "membership_type";
    static var RANCH_NAME = "ranch_name";
    static var PREMISE_ID = "premise_id";
    static var WEBSITE = "website";
    static var MEMBER_SINCE = "member_since";
    static var MEMBERSHIP_BEGIN = "membership_begin";
    static var MEMBERSHIP_END = "membership_end";
    static var SUBSCRIPTION_END_DATE = "subscription_end_date";
    static var BIRTH_DATE = "birth_date";
    static var ACTIVE_FLAG = "active_flag";
    static var MOBILE_APP_ACTIVE_FLAG = "mobile_app_active_flag";
    static var IS_STAFF = "is_staff";
    static var IS_ADMIN = "is_admin";
    static var LEGACY_PASSWORD = "legacy_password";
    static var HERD_CODE = "herd_code";
    static var IS_REGISTERED = "is_registered";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func truncate() {
        
        let dbn = Database()
        dbn.query("DELETE FROM Member")
    }


    class func getId() -> String {
        return _ID;
    }

    class func getMemberId() -> String {
        return MEMBER_ID;
    }

    class func getMemberPassword() -> String {
        return MEMBER_PASSWORD;
    }

    class func getMemberName() -> String {
        return MEMBER_NAME;
    }
    
    class func getMembershipType() -> String {
        return MEMBERSHIP_TYPE;
    }
    
    class func getRanchName() -> String {
        return RANCH_NAME;
    }
    
    class func getPremiseId() -> String {
        return PREMISE_ID;
    }
    
    class func getWEBSITE() -> String {
        return WEBSITE;
    }
    
    class func getMemberSince() -> String {
        return MEMBER_SINCE;
    }
    
    class func getMembershipBegin() -> String {
        return MEMBERSHIP_BEGIN;
    }
    
    class func getMembershipEnd() -> String {
        return MEMBERSHIP_END;
    }
    
    class func getSubscriptionEndDate() -> String {
        return SUBSCRIPTION_END_DATE;
    }
    
    class func getBirthDate() -> String {
        return BIRTH_DATE;
    }
    
    class func getActiveFlag() -> String {
        return ACTIVE_FLAG;
    }
    
    class func getMobileAppActiveFlag() -> String {
        return MOBILE_APP_ACTIVE_FLAG;
    }
    
    class func getIsStaff() -> String {
        return IS_STAFF;
    }
    
    class func getIsAdmin() -> String {
        return IS_ADMIN;
    }
    
    class func getLegacyPassword() -> String {
        return LEGACY_PASSWORD;
    }
    
    class func getHerdCode() -> String {
        return HERD_CODE;
    }
    class func getIsRegistered() -> String {
        return IS_REGISTERED;
    }
}
