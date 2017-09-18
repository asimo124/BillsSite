//
//  TblOwnership.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/26/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

class TblOwnership {
    
    static var TABLE_NAME = "tbl_ownership";
    static var _ID = "_id";
    static var OWNERSHIP_ID = "ownership_id";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var OWNER_ID = "owner_id";
    static var OWNERSHIP_AMOUNT = "ownership_amount";
    static var OWNERSHIP_DATE = "ownership_date";
    static var IS_PRIMARY = "is_primary";
    static var SUPERCEDED_FLAG = "superceded_flag";
    static var SUPERCEDED_DATE = "superceded_date";
    static var OLD_OWNER_ID = "old_owner_id";
    static var IS_TRANSFER = "is_transfer";
    static var IS_CALF_AT_SIDE = "is_calf_at_side";
    static var FOR_SALE_PRIVATE_TREATY = "for_sale_private_treaty";
    static var SELLER_COMMENTS = "seller_comments";
    static var SALE_PRICE = "sale_price";
    static var PRIVATE_TREATY_DATE = "private_treaty_date";
    static var WORK_ORDER = "work_order";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_ownership"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getOwnershipId() -> String {
        return OWNERSHIP_ID;
    }
    
    class func getAnimalRegistration() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getOwnerId() -> String {
        return OWNER_ID;
    }
    
    class func getOwnershipAmount() -> String {
        return OWNERSHIP_AMOUNT;
    }
    
    class func getOwnershipDate() -> String {
        return OWNERSHIP_DATE;
    }
    
    class func getIsPrimary() -> String {
        return IS_PRIMARY;
    }
    
    class func getSupercededFlag() -> String {
        return SUPERCEDED_FLAG;
    }
    
    class func getSupercededDate() -> String {
        return SUPERCEDED_DATE;
    }
    
    class func getOldOwnerId() -> String {
        return OLD_OWNER_ID;
    }
    
    class func getIsTransfer() -> String {
        return IS_TRANSFER;
    }
    
    class func getIsCalfAtSide() -> String {
        return IS_CALF_AT_SIDE;
    }
    
    class func getForSalePrivateTreaty() -> String {
        return FOR_SALE_PRIVATE_TREATY;
    }
    
    class func getSellerComments() -> String {
        return SELLER_COMMENTS;
    }
    
    class func getSalePrice() -> String {
        return SALE_PRICE;
    }
    
    class func getPrivateTreatyDate() -> String {
        return PRIVATE_TREATY_DATE;
    }
    
    class func getWorkOrder() -> String {
        return WORK_ORDER;
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
