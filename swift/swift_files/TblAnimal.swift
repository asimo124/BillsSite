//
//  TblAnimal.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimal {
    
    static var TABLE_NAME = "tbl_animal";
    static var _ID = "_id";
    static var ANIMAL_ID = "animal_id";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var BREEDER_ID = "breeder_id";
    static var ANIMAL_RECORD_STATUS = "animal_record_status";
    static var ANIMAL_NAME = "animal_name";
    static var ANIMAL_SEX = "animal_sex";
    static var ANIMAL_SIRE = "animal_sire";
    static var ANIMAL_DAM = "animal_dam";
    static var ANIMAL_HOLD_BRAND = "animal_hold_brand";
    static var ANIMAL_HOLD_BRAND_LOCATION = "animal_hold_brand_location";
    static var ANIMAL_PRIVATE_HERD_ID = "animal_private_herd_id";
    static var ANIMAL_PRIVATE_HERD_ID_LOCATION = "animal_private_herd_id_location";
    static var ANIMAL_COLOR_SCORE = "animal_color_score";
    static var ANIMAL_SCURS_CODE = "animal_scurs_code";
    static var BREED_CODE_1 = "breed_code_1";
    static var BREED_PERCENTAGE_1 = "breed_percentage_1";
    static var BREED_CODE_2 = "breed_code_2";
    static var BREED_PERCENTAGE_2 = "breed_percentage_2";
    static var BREED_CODE_3 = "breed_code_3";
    static var BREED_PERCENTAGE_3 = "breed_percentage_3";
    static var BREED_CODE_4 = "breed_code_4";
    static var BREED_PERCENTAGE_4 = "breed_percentage_4";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    static var STATUS_CODE = "status_code";
    static var GENERATION = "generation";
    static var CERTIFICATE_FILENAME = "certificate_filename";
    static var WORK_ORDER = "work_order";
    static var FOREIGN_ASSOCIATION_REGISTRATION = "foreign_association_registration";
    static var FOREIGN_REGISTRATION_ASSOCIATION = "foreign_registration_association";
    static var STATUS_CODE_DATE = "status_code_date";
    static var INTERNATIONAL_ID = "international_id";
    static var EID = "eid";
    static var METAL_EAR_TAG = "metal_ear_tag";
    static var OTHER_ID = "other_id";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_animal"
	     dbn.query(query)
    }
    
    class func getOtherId() -> String {
        return OTHER_ID;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getAnimalId() -> String {
        return ANIMAL_ID;
    }
    
    class func getAnimalRegistration() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getBreederId() -> String {
        return BREEDER_ID;
    }
    
    class func getAnimalRecordStatus() -> String {
        return ANIMAL_RECORD_STATUS;
    }
    
    class func getAnimalName() -> String {
        return ANIMAL_NAME;
    }
    
    class func getAnimalSex() -> String {
        return ANIMAL_SEX;
    }
    
    class func getAnimalSire() -> String {
        return ANIMAL_SIRE;
    }
    
    class func getAnimalDam() -> String {
        return ANIMAL_DAM;
    }
    
    class func getAnimalHoldBrand() -> String {
        return ANIMAL_HOLD_BRAND;
    }
    
    class func getAnimalHoldBrandLocation() -> String {
        return ANIMAL_HOLD_BRAND_LOCATION;
    }
    
    class func getAnimalPrivateHerdId() -> String {
        return ANIMAL_PRIVATE_HERD_ID;
    }
    
    class func getAnimalPrivateHerdIdLocation() -> String {
        return ANIMAL_PRIVATE_HERD_ID_LOCATION;
    }
    
    class func getAnimalColorScore() -> String {
        return ANIMAL_COLOR_SCORE;
    }
    
    class func getAnimalScursCode() -> String {
        return ANIMAL_SCURS_CODE;
    }
    
    class func getBreedCode1() -> String {
        return BREED_CODE_1;
    }
    
    class func getBreedPercentage1() -> String {
        return BREED_PERCENTAGE_1;
    }
    
    class func getBreedCode2() -> String {
        return BREED_CODE_2;
    }
    
    class func getBreedPercentage2() -> String {
        return BREED_PERCENTAGE_2;
    }
    
    class func getBreedCode3() -> String {
        return BREED_CODE_3;
    }
    
    class func getBreedPercentage3() -> String {
        return BREED_PERCENTAGE_3;
    }
    
    class func getBreedCode4() -> String {
        return BREED_CODE_4;
    }
    
    class func getBreedPercentage4() -> String {
        return BREED_PERCENTAGE_4;
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
    
    class func getStatusCode() -> String {
        return STATUS_CODE;
    }
    
    class func getGENERATION() -> String {
        return GENERATION;
    }
    
    class func getCertificateFilename() -> String {
        return CERTIFICATE_FILENAME;
    }
    
    class func getWorkOrder() -> String {
        return WORK_ORDER;
    }
    
    class func getForeignAssociationRegistration() -> String {
        return FOREIGN_ASSOCIATION_REGISTRATION;
    }
    
    class func getForeignRegistrationAssociation() -> String {
        return FOREIGN_REGISTRATION_ASSOCIATION;
    }
    
    class func getStatusCodeDate() -> String {
        return STATUS_CODE_DATE;
    }
    
    class func getInternationalId() -> String {
        return INTERNATIONAL_ID;
    }
    
    class func getEID() -> String {
        return EID;
    }
    
    class func getMetalEarTag() -> String {
        return METAL_EAR_TAG;
    }
}
