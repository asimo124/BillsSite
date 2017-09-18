//
//  TblInventorySemen.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblInventorySemen {

    static var TABLE_NAME = "tbl_semen_inventory";
    static var _ID = "_id";
    static var PK_ID = "pk_id";
    static var MEMBER_ID = "member_id";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var TANK_ID = "tank_id";
    static var CANISTER_ID = "canister_id";
    static var CANE_CODE = "cane_code";
    static var CSS_CERTIFIED = "css_certified";
    static var STRAWS = "straws";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    static var FOR_SALE_PRIVATE_TREATY = "for_sale_private_treaty";
    static var PRIVATE_TREATY_DATE = "private_treaty_date";
    static var SELLER_COMMENTS = "seller_comments";
    static var SALE_PRICE = "sale_price";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_semen_inventory"
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
    
    class func getAnimalRegistration() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getTankId() -> String {
        return TANK_ID;
    }
    
    class func getCanisterId() -> String {
        return CANISTER_ID;
    }
    
    class func getCaneCode() -> String {
        return CANE_CODE;
    }
    
    class func getCssCertified() -> String {
        return CSS_CERTIFIED;
    }
    
    class func getSTRAWS() -> String {
        return STRAWS;
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
    
    class func getForSalePrivateTreaty() -> String {
        return FOR_SALE_PRIVATE_TREATY;
    }
    
    class func getPrivateTreatyDate() -> String {
        return PRIVATE_TREATY_DATE;
    }
    
    class func getSellerComments() -> String {
        return SELLER_COMMENTS;
    }
    
    class func getSalePrice() -> String {
        return SALE_PRICE;
    }
}
