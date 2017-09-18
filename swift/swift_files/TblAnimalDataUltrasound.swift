//
//  TblAnimalDataUltrasound.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalDataUltrasound {
    
    static var TABLE_NAME = "tbl_animal_data_ultrasound";
    static var _ID = "_id";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var RIBEYE_AREA = "ribeye_area";
    static var BACKFAT_THICKNESS = "backfat_thickness";
    static var INTRAMUSCULAR_FAT = "intramuscular_fat";
    static var RUMP_FAT = "rump_fat";
    static var MANAGEMENT_GROUP = "management_group";
    static var TECHNICIAN = "technician";
    static var HARDWARE = "hardware";
    static var SOFTWARE = "software";
    static var MEASUREMENT_DATE = "measurement_date";
    static var ULTRASOUND_WEIGHT = "ultrasound_weight";
    static var CONTEMPORARY_GROUP = "contemporary_group";
    static var RIBEYE_AREA_ADJ = "ribeye_area_adj";
    static var BACKFAT_THICKNESS_ADJ = "backfat_thickness_adj";
    static var INTRAMUSCULAR_FAT_ADJ = "intramuscular_fat_adj";
    static var ANIMAL_SEX = "animal_sex";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    static var SUB_CONTEMPORARY_GROUP = "sub_contemporary_group";
    static var HERD_ID = "herd_id";
    static var PREMISE_ID = "premise_id";
    static var PASTURE_ID = "pasture_id";
    static var WORK_ORDER = "work_order";
    static var SCROTAL_CIRCUMFERENCE = "scrotal_circumference";
    static var SCROTAL_CIRCUMFERENCE_ADJ = "scrotal_circumference_adj";
    static var PRE_CONTEMPORARY_GROUP = "pre_contemporary_group";
    static var COMMIT_LOCK_ID = "commit_lock_id";
    static var SEASON = "season";
    static var REA_RATIO = "rea_ratio";
    static var IMF_RATIO = "imf_ratio";
    static var FAT_RATIO = "fat_ratio";
    static var HIP_HEIGHT = "hip_height";
    static var FRAME_SCORE = "frame_score";
    // NOTE -- Gelbvieh has several other columns in this table that are not being
    //			transferred over.  Until I need them to be transferred, then I'm not including
    //			them here in the database.
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_animal_data_ultrasound"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getAnimalRegistration() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getRibeyeArea() -> String {
        return RIBEYE_AREA;
    }
    
    class func getBackfatThickness() -> String {
        return BACKFAT_THICKNESS;
    }
    
    class func getIntramuscularFat() -> String {
        return INTRAMUSCULAR_FAT;
    }
    
    class func getRumpFat() -> String {
        return RUMP_FAT;
    }
    
    class func getManagementGroup() -> String {
        return MANAGEMENT_GROUP;
    }
    
    class func getTECHNICIAN() -> String {
        return TECHNICIAN;
    }
    
    class func getHARDWARE() -> String {
        return HARDWARE;
    }
    
    class func getSOFTWARE() -> String {
        return SOFTWARE;
    }
    
    class func getMeasurementDate() -> String {
        return MEASUREMENT_DATE;
    }
    
    class func getUltrasoundWeight() -> String {
        return ULTRASOUND_WEIGHT;
    }
    
    class func getContemporaryGroup() -> String {
        return CONTEMPORARY_GROUP;
    }
    
    class func getRibeyeAreaAdj() -> String {
        return RIBEYE_AREA_ADJ;
    }
    
    class func getBackfatThicknessAdj() -> String {
        return BACKFAT_THICKNESS_ADJ;
    }
    
    class func getIntramuscularFatAdj() -> String {
        return INTRAMUSCULAR_FAT_ADJ;
    }
    
    class func getAnimalSex() -> String {
        return ANIMAL_SEX;
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
    
    class func getSubContemporaryGroup() -> String {
        return SUB_CONTEMPORARY_GROUP;
    }
    
    class func getHerdId() -> String {
        return HERD_ID;
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
    
    class func getScrotalCircumference() -> String {
        return SCROTAL_CIRCUMFERENCE;
    }
    
    class func getScrotalCircumferenceAdj() -> String {
        return SCROTAL_CIRCUMFERENCE_ADJ;
    }
    
    class func getPreContemporaryGroup() -> String {
        return PRE_CONTEMPORARY_GROUP;
    }
    
    class func getCommitLockId() -> String {
        return COMMIT_LOCK_ID;
    }
    
    class func getSEASON() -> String {
        return SEASON;
    }
    
    class func getReaRatio() -> String {
        return REA_RATIO;
    }
    
    class func getImfRatio() -> String {
        return IMF_RATIO;
    }
    
    class func getFatRatio() -> String {
        return FAT_RATIO;
    }
    
    class func getHipHeight() -> String {
        return HIP_HEIGHT;
    }
    
    class func getFrameScore() -> String {
        return FRAME_SCORE;
    }
}
