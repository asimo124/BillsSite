//
//  VwCustomers.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class VwCustomers {
    
    static var TABLE_NAME = "vw_member_customers";
    static var _ID = "_id";
    static var CUSTOMER_ID = "customer_id";
    static var ADDRESS_ID = "address_id";
    static var CUSTOMER_NAME = "customer_name";
    static var ADDRESS_LINE1 = "address_line1";
    static var ADDRESS_LINE2 = "address_line2";
    static var ADDRESS_CITY = "address_city";
    static var ADDRESS_STATE = "address_state";
    static var ADDRESS_POSTAL_CODE = "address_postal_code";
    static var ADDRESS_COUNTRY = "address_country";
    static var ADDRESS_EMAIL = "address_email";
    static var NUM_PURCH = "num_purch";
    static var DATE_PURCH = "date_purch";
    static var LONGITUDE = "longitude";
    static var LATITUDE = "latitude";
    static var PHONE1 = "phone1";
    static var PHONE2 = "phone2";
    static var PHONE3 = "phone3";
    static var MEMBER_DBA = "member_dba";
    static var HERD_CODE = "herd_code";
    static var HOLD_BRAND_LOCATION = "hold_brand_location";
    static var TATTOO_LOCATION = "tattoo_location";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from vw_member_customers"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getCustomerId() -> String {
        return CUSTOMER_ID;
    }
    
    class func getAddressId() -> String {
        return ADDRESS_ID;
    }
    
    class func getCustomerName() -> String {
        return CUSTOMER_NAME;
    }
    
    class func getAddressLine1() -> String {
        return ADDRESS_LINE1;
    }
    
    class func getAddressLine2() -> String {
        return ADDRESS_LINE2;
    }
    
    class func getAddressCity() -> String {
        return ADDRESS_CITY;
    }
    
    class func getAddressState() -> String {
        return ADDRESS_STATE;
    }
    
    class func getAddressPostalCode() -> String {
        return ADDRESS_POSTAL_CODE;
    }
    
    class func getAddressCountry() -> String {
        return ADDRESS_COUNTRY;
    }
    
    class func getAddressEmail() -> String {
        return ADDRESS_EMAIL;
    }
    
    class func getNumPurch() -> String {
        return NUM_PURCH;
    }
    
    class func getDatePurch() -> String {
        return DATE_PURCH;
    }
    
    class func getLONGITUDE() -> String {
        return LONGITUDE;
    }
    
    class func getLATITUDE() -> String {
        return LATITUDE;
    }
    
    class func getPHONE1() -> String {
        return PHONE1;
    }
    
    class func getPHONE2() -> String {
        return PHONE2;
    }
    
    class func getPHONE3() -> String {
        return PHONE3;
    }
    
    class func getMemberDba() -> String {
        return MEMBER_DBA;
    }
    
    class func getHerdCode() -> String {
        return HERD_CODE;
    }
    
    class func getHoldBrandLocation() -> String {
        return HOLD_BRAND_LOCATION;
    }
    
    class func getTattooLocation() -> String {
        return TATTOO_LOCATION;
    }
}
