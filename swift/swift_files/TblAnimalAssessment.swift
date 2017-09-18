//
//  TblAnimalAssessment.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalAssessment {
    
    static var TABLE_NAME = "tbl_animal_assessment";
    static var _ID = "_id";
    static var ANIMAL_ASSESSMENT_ID = "animal_assessment_id";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var OWNER_ID = "owner_id";
    static var ASSESSMENT_YEAR = "assessment_year";
    static var ASSESSMENT_SEASON = "assessment_season";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    static var CALF_REGISTRATION = "calf_registration";
    static var CALF_REGISTRATION_DATE = "calf_registration_date";
    static var CALF_TRANSFER_DATE = "calf_transfer_date";
    static var INVOICE_ID = "invoice_id";
    static var WORK_ORDER = "work_order";
    static var VALIDATION_DATE = "validation_date";
    static var ANIMAL_SEX = "animal_sex";
    static var CONFIRMED_BY = "confirmed_by";
    static var CONFIRMED_ON = "confirmed_on";
    static var NON_CALVING_STATUS_CODE = "non_calving_status_code";
    static var ASSESSMENT_INVOICED_TO = "assessment_invoiced_to";
    static var CALF_WEAN_DATE = "calf_wean_date";
    static var CALF_PREWEAN_DISPOSAL_CODE = "calf_prewean_disposal_code";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_animal_assessment"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getAnimalAssessmentId() -> String {
        return ANIMAL_ASSESSMENT_ID;
    }
    
    class func getAnimalRegistration() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getOwnerId() -> String {
        return OWNER_ID;
    }
    
    class func getAssessmentYear() -> String {
        return ASSESSMENT_YEAR;
    }
    
    class func getAssessmentSeason() -> String {
        return ASSESSMENT_SEASON;
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
    
    class func getCalfRegistration() -> String {
        return CALF_REGISTRATION;
    }
    
    class func getCalfRegistrationDate() -> String {
        return CALF_REGISTRATION_DATE;
    }
    
    class func getCalfTransferDate() -> String {
        return CALF_TRANSFER_DATE;
    }
    
    class func getInvoiceId() -> String {
        return INVOICE_ID;
    }
    
    class func getWorkOrder() -> String {
        return WORK_ORDER;
    }
    
    class func getValidationDate() -> String {
        return VALIDATION_DATE;
    }
    
    class func getAnimalSex() -> String {
        return ANIMAL_SEX;
    }
    
    class func getConfirmedBy() -> String {
        return CONFIRMED_BY;
    }
    
    class func getConfirmedOn() -> String {
        return CONFIRMED_ON;
    }
    
    class func getNonCalvingStatusCode() -> String {
        return NON_CALVING_STATUS_CODE;
    }
    
    class func getAssessmentInvoicedTo() -> String {
        return ASSESSMENT_INVOICED_TO;
    }
    
    class func getCalfWeanDate() -> String {
        return CALF_WEAN_DATE;
    }
    
    class func getCalfPreweanDisposalCode() -> String {
        return CALF_PREWEAN_DISPOSAL_CODE;
    }
}
