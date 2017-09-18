//
//  TblLogs.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblLogs {
    
    static var TABLE_NAME = "tbl_tablet_logs";
    static var _ID = "_id";
    static var LOG_ID = "log_id";
    static var PROFILE_ID = "profile_id";
    static var FLAG_NEW_CALF = "flag_new_calf";
    static var FLAG_NEW_WEAN = "flag_new_wean";
    static var FLAG_NEW_YEAR = "flag_new_year";
    static var FLAG_NEW_EID = "flag_new_eid";
    static var FLAG_NEW_VACC = "flag_new_vacc";
    static var FLAG_NEW_BANG = "flag_new_bang";
    static var FLAG_NEW_BRAND = "flag_new_brand";
    static var FLAG_NEW_WEIGHT = "flag_new_weight";
    static var FLAG_NEW_PASTURE = "flag_new_pasture";
    static var FLAG_NEW_ESCAPED = "flag_new_escaped";
    static var FLAG_NEW_PREGNANCY = "flag_new_pregnancy";
    static var FLAG_NEW_BREED_AI = "flag_new_breed_ai";
    static var FLAG_NEW_COMMENT = "flag_new_comment";
    static var FLAG_NEW_ANIMAL = "flag_new_animal";
    static var FLAG_NEW_SYNC = "flag_new_sync";
    static var FLAG_NEW_BREED_ET = "flag_new_breed_et";
    static var COMMENT = "comment";
    static var PHN = "phn";
    static var REG_NO = "reg_no";
    static var EID = "eid";
    static var PASTURE_ID = "pasture_id";
    static var WEIGHT = "weight";
    static var SEX = "sex";
    static var DOB = "dob";
    static var DAM = "dam";
    static var SIRE = "sire";
    static var DATE_WORKED = "date_worked";
    static var BANGS_ID = "bangs_id";
    static var BRAND = "brand";
    static var BRAND_LOCATION = "brand_location";
    static var PREV_PASTURE_ID = "prev_pasture_id";
    static var BREED_TYPE = "breed_type";
    static var PALPATION_RESULT = "palpation_result";
    static var ESTIMATED_BIRTHING = "estimated_birthing";
    static var WORKING_PASTURE_ID = "working_pasture_id";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_tablet_logs"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getLogId() -> String {
        return LOG_ID;
    }
    
    class func getProfileId() -> String {
        return PROFILE_ID;
    }
    
    class func getFlagNewCalf() -> String {
        return FLAG_NEW_CALF;
    }
    
    class func getFlagNewWean() -> String {
        return FLAG_NEW_WEAN;
    }
    
    class func getFlagNewYear() -> String {
        return FLAG_NEW_YEAR;
    }
    
    class func getFlagNewEid() -> String {
        return FLAG_NEW_EID;
    }
    
    class func getFlagNewVacc() -> String {
        return FLAG_NEW_VACC;
    }
    
    class func getFlagNewBang() -> String {
        return FLAG_NEW_BANG;
    }
    
    class func getFlagNewBrand() -> String {
        return FLAG_NEW_BRAND;
    }
    
    class func getFlagNewWeight() -> String {
        return FLAG_NEW_WEIGHT;
    }
    
    class func getFlagNewPasture() -> String {
        return FLAG_NEW_PASTURE;
    }
    
    class func getFlagNewEscaped() -> String {
        return FLAG_NEW_ESCAPED;
    }
    
    class func getFlagNewPregnancy() -> String {
        return FLAG_NEW_PREGNANCY;
    }
    
    class func getFlagNewBreedAi() -> String {
        return FLAG_NEW_BREED_AI;
    }
    
    class func getFlagNewComment() -> String {
        return FLAG_NEW_COMMENT;
    }
    
    class func getFlagNewAnimal() -> String {
        return FLAG_NEW_ANIMAL;
    }
    
    class func getFlagNewSync() -> String {
        return FLAG_NEW_SYNC;
    }
    
    class func getFlagNewBreedEt() -> String {
        return FLAG_NEW_BREED_ET;
    }
    
    class func getCOMMENT() -> String {
        return COMMENT;
    }
    
    class func getPHN() -> String {
        return PHN;
    }
    
    class func getRegNo() -> String {
        return REG_NO;
    }
    
    class func getEID() -> String {
        return EID;
    }
    
    class func getPastureId() -> String {
        return PASTURE_ID;
    }
    
    class func getWEIGHT() -> String {
        return WEIGHT;
    }
    
    class func getSEX() -> String {
        return SEX;
    }
    
    class func getDOB() -> String {
        return DOB;
    }
    
    class func getDAM() -> String {
        return DAM;
    }
    
    class func getSIRE() -> String {
        return SIRE;
    }
    
    class func getDateWorked() -> String {
        return DATE_WORKED;
    }
    
    class func getBangsId() -> String {
        return BANGS_ID;
    }
    
    class func getBRAND() -> String {
        return BRAND;
    }
    
    class func getBrandLocation() -> String {
        return BRAND_LOCATION;
    }
    
    class func getPrevPastureId() -> String {
        return PREV_PASTURE_ID;
    }
    
    class func getBreedType() -> String {
        return BREED_TYPE;
    }
    
    class func getPalpationResult() -> String {
        return PALPATION_RESULT;
    }
    
    class func getEstimatedBirthing() -> String {
        return ESTIMATED_BIRTHING;
    }
    
    class func getWorkingPastureId() -> String {
        return WORKING_PASTURE_ID;
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
