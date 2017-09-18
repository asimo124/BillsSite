//
//  TblInventoryEmbryo.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblInventoryEmbryo {
    
    static var TABLE_NAME = "tbl_embryo_inventory";
    static var _ID = "_id";
    static var PK_ID = "pk_id";
    static var MEMBER_ID = "member_id";
    static var DAM_REGISTRATION = "dam_registration";
    static var SIRE_REGISTRATION = "sire_registration";
    static var TANK_ID = "tank_id";
    static var CANISTER_ID = "canister_id";
    static var CANE_CODE = "cane_code";
    static var EXPORTABLE = "exportable";
    static var QUANTITY = "quantity";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    static var FLUSH_DATE = "flush_date";
    static var FOR_SALE_PRIVATE_TREATY = "for_sale_private_treaty";
    static var PRIVATE_TREATY_DATE = "private_treaty_date";
    static var SELLER_COMMENTS = "seller_comments";
    static var SALE_PRICE = "sale_price";
    static var BREEDER_ID = "breeder_id";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_embryo_inventory"
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
    
    class func getDamRegistration() -> String {
        return DAM_REGISTRATION;
    }
    
    class func getSireRegistration() -> String {
        return SIRE_REGISTRATION;
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
    
    class func getEXPORTABLE() -> String {
        return EXPORTABLE;
    }
    
    class func getQUANTITY() -> String {
        return QUANTITY;
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
    
    class func getFlushDate() -> String {
        return FLUSH_DATE;
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
    
    class func getBreederId() -> String {
        return BREEDER_ID;
    }
}
