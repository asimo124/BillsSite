//
//  TblAnimalDataBirth.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalDataBirth {
    
    static var TABLE_NAME = "tbl_animal_data_birth";
    static var _ID = "_id";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var CONTEMPORARY_GROUP = "contemporary_group";
    static var MANAGEMENT_GROUP = "management_group";
    static var ANIMAL_SERVICE_TYPE = "animal_service_type";
    static var BIRTH_DATE = "birth_date";
    static var BIRTH_WEIGHT = "birth_weight";
    static var ANIMAL_SEX = "animal_sex";
    static var TWIN_CODE = "twin_code";
    static var CALVING_EASE = "calving_ease";
    static var UDDER_SCORE_SUSPENSION = "udder_score_suspension";
    static var UDDER_SCORE_TEAT_SIZE = "udder_score_teat_size";
    static var NATURAL_BREEDING_AGREEMENT = "natural_breeding_agreement";
    static var BREEDING_AGREEMENT_LOCATION = "breeding_agreement_location";
    static var ET_FLUSH_DATE = "et_flush_date";
    static var ET_TRANSFER_DATE = "et_transfer_date";
    static var RECIPIENT_DAM_REGISTRATION = "recipient_dam_registration";
    static var RECIPIENT_DAM_ANIMAL_TATTOO = "recipient_dam_animal_tattoo";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    static var VERSION = "version";
    static var BIRTH_WEIGHT_ADJ = "birth_weight_adj";
    static var SUB_CONTEMPORARY_GROUP = "sub_contemporary_group";
    static var HERD_ID = "herd_id";
    static var INSPECTOR_NAME = "inspector_name";
    static var INSPECTOR_ID = "inspector_id";
    static var BW_RATIO = "bw_ratio";
    static var PREMISE_ID = "premise_id";
    static var PASTURE_ID = "pasture_id";
    static var WORK_ORDER = "work_order";
    static var PRE_CONTEMPORARY_GROUP = "pre_contemporary_group";
    static var CALVING_SEASON = "calving_season";
    static var COMMIT_LOCK_ID = "commit_lock_id";
    static var AGE_OF_DAM = "age_of_dam";
    static var INVENTORY_SEASON = "inventory_season";
    static var EID = "eid";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_animal_data_birth"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getAnimalRegistration() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getContemporaryGroup() -> String {
        return CONTEMPORARY_GROUP;
    }
    
    class func getManagementGroup() -> String {
        return MANAGEMENT_GROUP;
    }
    
    class func getAnimalServiceType() -> String {
        return ANIMAL_SERVICE_TYPE;
    }
    
    class func getBirthDate() -> String {
        return BIRTH_DATE;
    }
    
    class func getBirthWeight() -> String {
        return BIRTH_WEIGHT;
    }
    
    class func getAnimalSex() -> String {
        return ANIMAL_SEX;
    }
    
    class func getTwinCode() -> String {
        return TWIN_CODE;
    }
    
    class func getCalvingEase() -> String {
        return CALVING_EASE;
    }
    
    class func getUdderScoreSuspension() -> String {
        return UDDER_SCORE_SUSPENSION;
    }
    
    class func getUdderScoreTeatSize() -> String {
        return UDDER_SCORE_TEAT_SIZE;
    }
    
    class func getNaturalBreedingAgreement() -> String {
        return NATURAL_BREEDING_AGREEMENT;
    }
    
    class func getBreedingAgreementLocation() -> String {
        return BREEDING_AGREEMENT_LOCATION;
    }
    
    class func getEtFlushDate() -> String {
        return ET_FLUSH_DATE;
    }
    
    class func getEtTransferDate() -> String {
        return ET_TRANSFER_DATE;
    }
    
    class func getRecipientDamRegistration() -> String {
        return RECIPIENT_DAM_REGISTRATION;
    }
    
    class func getRecipientDamAnimalTattoo() -> String {
        return RECIPIENT_DAM_ANIMAL_TATTOO;
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
    
    class func getVERSION() -> String {
        return VERSION;
    }
    
    class func getBirthWeightAdj() -> String {
        return BIRTH_WEIGHT_ADJ;
    }
    
    class func getSubContemporaryGroup() -> String {
        return SUB_CONTEMPORARY_GROUP;
    }
    
    class func getHerdId() -> String {
        return HERD_ID;
    }
    
    class func getInspectorName() -> String {
        return INSPECTOR_NAME;
    }
    
    class func getInspectorId() -> String {
        return INSPECTOR_ID;
    }
    
    class func getBwRatio() -> String {
        return BW_RATIO;
    }
    
    class func getPremiseId() -> String {
        return PREMISE_ID;
    }
    
    class func getPastureId() -> String {
        return PASTURE_ID;
    }
    
    class func getWorkOrder() -> String {
        return WORK_ORDER;
    }
    
    class func getPreContemporaryGroup() -> String {
        return PRE_CONTEMPORARY_GROUP;
    }
    
    class func getCalvingSeason() -> String {
        return CALVING_SEASON;
    }
    
    class func getCommitLockId() -> String {
        return COMMIT_LOCK_ID;
    }
    
    class func getAgeOfDam() -> String {
        return AGE_OF_DAM;
    }
    
    class func getInventorySeason() -> String {
        return INVENTORY_SEASON;
    }
    
    class func getEID() -> String {
        return EID;
    }
}
