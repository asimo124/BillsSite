//
//  MemberContact.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class MemberContact {
    
    static var TABLE_NAME = "contact";
    static var _ID = "_id";
    static var MEMBER_ID = "member_id";
    static var NICKNAME = "nickname";
    static var ADDRESS_LINE_1 = "address_line_1";
    static var ADDRESS_LINE_2 = "address_line_2";
    static var CITY = "city";
    static var STATE = "state";
    static var ZIP_CODE = "zip_code";
    static var COUNTRY = "country";
    static var EMAIL = "email";
    static var PHONE_NUMBER = "phone_number";
    static var FAX_NUMBER = "fax_number";
    static var IS_PRIMARY = "is_primary";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from contact"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getNICKNAME() -> String {
        return NICKNAME;
    }
    
    class func getAddressLine1() -> String {
        return ADDRESS_LINE_1;
    }
    
    class func getAddressLine2() -> String {
        return ADDRESS_LINE_2;
    }
    
    class func getCITY() -> String {
        return CITY;
    }
    
    class func getSTATE() -> String {
        return STATE;
    }
    
    class func getZipCode() -> String {
        return ZIP_CODE;
    }
    
    class func getCOUNTRY() -> String {
        return COUNTRY;
    }
    
    class func getEMAIL() -> String {
        return EMAIL;
    }
    
    class func getPhoneNumber() -> String {
        return PHONE_NUMBER;
    }
    
    class func getFaxNumber() -> String {
        return FAX_NUMBER;
    }
    
    class func getIsPrimary() -> String {
        return IS_PRIMARY;
    }
}
