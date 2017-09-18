//
//  TblMember.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblMember {
    
    static var TABLE_NAME = "tbl_member";
    static var _ID = "_id";
    static var MEMBER_ID = "member_id";
    static var MEMBER_NAME = "member_name";
    static var MEMBER_DBA = "member_dba";
    static var MEMBER_TYPE = "member_type";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    static var ACTIVE_FLAG = "active_flag";
    static var WEBSITE = "website";
    static var MEMBERSHIP_BEGIN_DATE = "membership_begin_date";
    static var MEMBERSHIP_END_DATE = "membership_end_date";
    static var PUB_SUBSCRIPTION_START_DATE = "pub_subscription_start_date";
    static var PUB_SUBSCRIPTION_END_DATE = "pub_subscription_end_date";
    static var PARENT_MEMBER_ID = "parent_member_id";
    static var NEWSPAPER_NAME = "newspaper_name";
    static var NEWSPAPER_EMAIL = "newspaper_email";
    static var NEWSPAPER_PHONE = "newspaper_phone";
    static var ACCOUNT_LOCKED = "account_locked";
    static var LOCKING_USER = "locking_user";
    static var LEGACY_ASSOCIATION = "legacy_association";
    static var LEGACY_ASSOCIATION_ID = "legacy_association_id";
    static var GENERAL_CORRESPONDANCE_ADDRESS = "general_correspondance_address";
    static var REGISTRY_CORRESPONDANCE_ADDRESS = "registry_correspondance_address";
    static var ACCOUNTING_CORRESPONDANCE_ADDRESS = "accounting_correspondance_address";
    static var HOLD_BRAND = "hold_brand";
    static var HOLD_BRAND_LOCATION = "hold_brand_location";
    static var PHN_LOCATION = "phn_location";
    static var DATE_LAST_ACTIVITY = "date_last_activity";
    static var DATE_LAST_CHANGE = "date_last_change";
    static var DATE_LAST_REGISTRATION = "date_last_registration";
    static var DATE_LAST_TRANSFER = "date_last_transfer";
    static var DATE_LAST_PURCHASE = "date_last_purchase";
    static var DATE_LAST_PERFORMANCE = "date_last_performance";
    static var MAS90_CUSTOMER_NO = "mas90_customer_no";
    static var M_OPT_OUT = "m_opt_out";
    static var M_OPT_OUT_DATE = "m_opt_out_date";
    static var M_OPTED_OUT_BY = "m_opted_out_by";
    static var C_OPT_IN = "c_opt_in";
    static var C_OPT_IN_DATE = "c_opt_in_date";
    static var C_OPTED_IN_BY = "c_opted_in_by";
    static var E_OPT_OUT = "e_opt_out";
    static var E_OPT_OUT_DATE = "e_opt_out_date";
    static var E_OPTED_OUT_BY = "e_opted_out_by";
    static var CASH_ONLY = "cash_only";
    static var JUNIOR_BIRTHDATE = "junior_birthdate";
    static var HERD_CODE = "herd_code";
    static var HERD_CODE_LOCATION = "herd_code_location";
    static var VERIFICATION_CODE = "verification_code";
    static var PREMISE_ID = "premise_id";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func truncate() {
        
        let dbo = DatabaseOld()
        dbo.query("DELETE FROM tbl_member")
        
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getMemberName() -> String {
        return MEMBER_NAME;
    }
    
    class func getMemberDba() -> String {
        return MEMBER_DBA;
    }
    
    class func getMemberType() -> String {
        return MEMBER_TYPE;
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
    
    class func getActiveFlag() -> String {
        return ACTIVE_FLAG;
    }
    
    class func getWEBSITE() -> String {
        return WEBSITE;
    }
    
    class func getMembershipBeginDate() -> String {
        return MEMBERSHIP_BEGIN_DATE;
    }
    
    class func getMembershipEndDate() -> String {
        return MEMBERSHIP_END_DATE;
    }
    
    class func getPubSubscriptionStartDate() -> String {
        return PUB_SUBSCRIPTION_START_DATE;
    }
    
    class func getPubSubscriptionEndDate() -> String {
        return PUB_SUBSCRIPTION_END_DATE;
    }
    
    class func getParentMemberId() -> String {
        return PARENT_MEMBER_ID;
    }
    
    class func getNewspaperName() -> String {
        return NEWSPAPER_NAME;
    }
    
    class func getNewspaperEmail() -> String {
        return NEWSPAPER_EMAIL;
    }
    
    class func getNewspaperPhone() -> String {
        return NEWSPAPER_PHONE;
    }
    
    class func getAccountLocked() -> String {
        return ACCOUNT_LOCKED;
    }
    
    class func getLockingUser() -> String {
        return LOCKING_USER;
    }
    
    class func getLegacyAssociation() -> String {
        return LEGACY_ASSOCIATION;
    }
    
    class func getLegacyAssociationId() -> String {
        return LEGACY_ASSOCIATION_ID;
    }
    
    class func getGeneralCorrespondanceAddress() -> String {
        return GENERAL_CORRESPONDANCE_ADDRESS;
    }
    
    class func getRegistryCorrespondanceAddress() -> String {
        return REGISTRY_CORRESPONDANCE_ADDRESS;
    }
    
    class func getAccountingCorrespondanceAddress() -> String {
        return ACCOUNTING_CORRESPONDANCE_ADDRESS;
    }
    
    class func getHoldBrand() -> String {
        return HOLD_BRAND;
    }
    
    class func getHoldBrandLocation() -> String {
        return HOLD_BRAND_LOCATION;
    }
    
    class func getPhnLocation() -> String {
        return PHN_LOCATION;
    }
    
    class func getDateLastActivity() -> String {
        return DATE_LAST_ACTIVITY;
    }
    
    class func getDateLastChange() -> String {
        return DATE_LAST_CHANGE;
    }
    
    class func getDateLastRegistration() -> String {
        return DATE_LAST_REGISTRATION;
    }
    
    class func getDateLastTransfer() -> String {
        return DATE_LAST_TRANSFER;
    }
    
    class func getDateLastPurchase() -> String {
        return DATE_LAST_PURCHASE;
    }
    
    class func getDateLastPerformance() -> String {
        return DATE_LAST_PERFORMANCE;
    }
    
    class func getMas90CustomerNo() -> String {
        return MAS90_CUSTOMER_NO;
    }
    
    class func getmOptOut() -> String {
        return M_OPT_OUT;
    }
    
    class func getmOptOutDate() -> String {
        return M_OPT_OUT_DATE;
    }
    
    class func getmOptedOutBy() -> String {
        return M_OPTED_OUT_BY;
    }
    
    class func getcOptIn() -> String {
        return C_OPT_IN;
    }
    
    class func getcOptInDate() -> String {
        return C_OPT_IN_DATE;
    }
    
    class func getcOptedInBy() -> String {
        return C_OPTED_IN_BY;
    }
    
    class func geteOptOut() -> String {
        return E_OPT_OUT;
    }
    
    class func geteOptOutDate() -> String {
        return E_OPT_OUT_DATE;
    }
    
    class func geteOptedOutBy() -> String {
        return E_OPTED_OUT_BY;
    }
    
    class func getCashOnly() -> String {
        return CASH_ONLY;
    }
    
    class func getJuniorBirthdate() -> String {
        return JUNIOR_BIRTHDATE;
    }
    
    class func getHerdCode() -> String {
        return HERD_CODE;
    }
    
    class func getHerdCodeLocation() -> String {
        return HERD_CODE_LOCATION;
    }
    
    class func getVerificationCode() -> String {
        return VERIFICATION_CODE;
    }
    
    class func getPremiseId() -> String {
        return PREMISE_ID;
    }
}
