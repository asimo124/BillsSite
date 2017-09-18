//
//  TblBreedingNs.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblBreedingNs {
    
    static var TABLE_NAME = "tbl_breeding_agreement";
    static var _ID = "_id";
    static var BREEDING_AGREEMENT_ID = "breeding_agreement_id";
    static var COW_OWNER_ID = "cow_owner_id";
    static var BULL_OWNER_ID = "bull_owner_id";
    static var BULL_REGISTRATION = "bull_registration";
    static var BEGIN_DATE = "begin_date";
    static var END_DATE = "end_date";
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
    static var PASTURE_ID = "pasture_id";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_breeding_agreement"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getBreedingAgreementId() -> String {
        return BREEDING_AGREEMENT_ID;
    }
    
    class func getCowOwnerId() -> String {
        return COW_OWNER_ID;
    }
    
    class func getBullOwnerId() -> String {
        return BULL_OWNER_ID;
    }
    
    class func getBullRegistration() -> String {
        return BULL_REGISTRATION;
    }
    
    class func getBeginDate() -> String {
        return BEGIN_DATE;
    }
    
    class func getEndDate() -> String {
        return END_DATE;
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
    
    class func getPastureId() -> String {
        return PASTURE_ID;
    }
}
