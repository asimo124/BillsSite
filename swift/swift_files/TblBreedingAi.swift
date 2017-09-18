//
//  TblBreedingAi.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblBreedingAi {
    
    static var TABLE_NAME = "tbl_breeding_ai";
    static var _ID = "_id";
    static var BREEDING_AI_ID = "breeding_ai_id";
    static var COW_OWNER_ID = "cow_owner_id";
    static var OLD_OWNER_ID = "old_owner_id";
    static var BULL_REGISTRATION = "bull_registration";
    static var AI_DATE = "ai_date";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    static var COW_REGISTRATION = "cow_registration";
    static var WORK_ORDER = "work_order";
    static var CALF = "calf";
    static var NON_CALVING_REASON = "non_calving_reason";
    static var PALPATION_RESULT = "palpation_result";
    static var PALPATION_DATE = "palpation_date";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_breeding_ai"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getBreedingAiId() -> String {
        return BREEDING_AI_ID;
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
    
    class func getAiDate() -> String {
        return AI_DATE;
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
    
    class func getWorkOrder() -> String {
        return WORK_ORDER;
    }
    
    class func getCALF() -> String {
        return CALF;
    }
    
    class func getNonCalvingReason() -> String {
        return NON_CALVING_REASON;
    }
    
    class func getPalpationResult() -> String {
        return PALPATION_RESULT;
    }
    
    class func getPalpationDate() -> String {
        return PALPATION_DATE;
    }
}
