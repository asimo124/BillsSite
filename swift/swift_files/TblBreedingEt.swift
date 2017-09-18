//
//  TblBreedingEt.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblBreedingEt {
    
    static var TABLE_NAME = "tbl_breeding_et";
    static var _ID = "_id";
    static var BREEDING_ET_ID = "breeding_et_id";
    static var COW_OWNER_ID = "cow_owner_id";
    static var OLD_OWNER_ID = "old_owner_id";
    static var BULL_REGISTRATION = "bull_registration";
    static var TRANSFER_DATE = "transfer_date";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    static var COW_REGISTRATION = "cow_registration";
    static var RECIP_REGISTRATION = "recip_registration";
    static var WORK_ORDER = "work_order";
    static var CALF = "calf";
    static var NON_CALVING_REASON = "non_calving_reason";
    static var FLUSH_DATE = "flush_date";
    static var PALPATION_RESULT = "palpation_result";
    static var PALPATION_DATE = "palpation_date";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_breeding_et"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getBreedingEtId() -> String {
        return BREEDING_ET_ID;
    }
    
    class func getCowOwnerId() -> String {
        return COW_OWNER_ID;
    }
    
    class func getOldOwnerId() -> String {
        return OLD_OWNER_ID;
    }
    
    class func getBullRegistration() -> String {
        return BULL_REGISTRATION;
    }
    
    class func getTransferDate() -> String {
        return TRANSFER_DATE;
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
    
    class func getCowRegistration() -> String {
        return COW_REGISTRATION;
    }
    
    class func getRecipRegistration() -> String {
        return RECIP_REGISTRATION;
    }
    
    class func getWorkOrder() -> String {
        return WORK_ORDER;
    }
    
    class func getCALF() -> String {
        return CALF;
    }
    
    class func getNonCalvingReason() -> String {
        return NON_CALVING_REASON;
    }
    
    class func getFlushDate() -> String {
        return FLUSH_DATE;
    }
    
    class func getPalpationResult() -> String {
        return PALPATION_RESULT;
    }
    
    class func getPalpationDate() -> String {
        return PALPATION_DATE;
    }
}
