//
//  TblAnimalDataYear.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalDataYear {
    
    static var TABLE_NAME = "tbl_animal_data_year";
    static var _ID = "_id";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var YEAR_DATE = "year_date";
    static var YEAR_WEIGHT = "year_weight";
    static var CONTEMPORARY_GROUP = "contemporary_group";
    static var MANAGEMENT_GROUP = "management_group";
    static var FEED_CODE = "feed_code";
    static var ANIMAL_SEX = "animal_sex";
    static var YEAR_WEIGHT_ADJ = "year_weight_adj";
    static var HERD_ID = "herd_id";
    static var SUB_CONTEMPORARY_GROUP = "sub_contemporary_group";
    static var STAGE_CODE = "stage_code";
    static var HIP_HEIGHT_OLD = "hip_height_old";
    static var CONFORMATION_SCORE = "conformation_score";
    static var SHEATH_SCORE = "sheath_score";
    static var NAVEL_SCORE = "navel_score";
    static var YW_RATIO = "yw_ratio";
    static var PREMISE_ID = "premise_id";
    static var PASTURE_ID = "pasture_id";
    static var YEARLING_AGE_RANGE = "yearling_age_range";
    static var SCROTAL_CIRCUMFERENCE = "scrotal_circumference";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    static var TEMPER_SCORE = "temper_score";
    static var AVG_DAILY_GAIN = "avg_daily_gain";
    static var FRAME_SCORE = "frame_score";
    static var WORK_ORDER = "work_order";
    static var SCROTAL_CIRCUMFERENCE_ADJ = "scrotal_circumference_adj";
    static var PRE_CONTEMPORARY_GROUP = "pre_contemporary_group";
    static var HIP_HEIGHT = "hip_height";
    static var COMMIT_LOCK_ID = "commit_lock_id";
    static var SEASON = "season";
    static var POST_WEANING_GAIN = "post_weaning_gain";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_animal_data_year"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getAnimalRegistration() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getYearDate() -> String {
        return YEAR_DATE;
    }
    
    class func getYearWeight() -> String {
        return YEAR_WEIGHT;
    }
    
    class func getContemporaryGroup() -> String {
        return CONTEMPORARY_GROUP;
    }
    
    class func getManagementGroup() -> String {
        return MANAGEMENT_GROUP;
    }
    
    class func getFeedCode() -> String {
        return FEED_CODE;
    }
    
    class func getAnimalSex() -> String {
        return ANIMAL_SEX;
    }
    
    class func getYearWeightAdj() -> String {
        return YEAR_WEIGHT_ADJ;
    }
    
    class func getHerdId() -> String {
        return HERD_ID;
    }
    
    class func getSubContemporaryGroup() -> String {
        return SUB_CONTEMPORARY_GROUP;
    }
    
    class func getStageCode() -> String {
        return STAGE_CODE;
    }
    
    class func getHipHeightOld() -> String {
        return HIP_HEIGHT_OLD;
    }
    
    class func getConformationScore() -> String {
        return CONFORMATION_SCORE;
    }
    
    class func getSheathScore() -> String {
        return SHEATH_SCORE;
    }
    
    class func getNavelScore() -> String {
        return NAVEL_SCORE;
    }
    
    class func getYwRatio() -> String {
        return YW_RATIO;
    }
    
    class func getPremiseId() -> String {
        return PREMISE_ID;
    }
    
    class func getPastureId() -> String {
        return PASTURE_ID;
    }
    
    class func getYearlingAgeRange() -> String {
        return YEARLING_AGE_RANGE;
    }
    
    class func getScrotalCircumference() -> String {
        return SCROTAL_CIRCUMFERENCE;
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
    
    class func getTemperScore() -> String {
        return TEMPER_SCORE;
    }
    
    class func getAvgDailyGain() -> String {
        return AVG_DAILY_GAIN;
    }
    
    class func getFrameScore() -> String {
        return FRAME_SCORE;
    }
    
    class func getWorkOrder() -> String {
        return WORK_ORDER;
    }
    
    class func getScrotalCircumferenceAdj() -> String {
        return SCROTAL_CIRCUMFERENCE_ADJ;
    }
    
    class func getPreContemporaryGroup() -> String {
        return PRE_CONTEMPORARY_GROUP;
    }
    
    class func getHipHeight() -> String {
        return HIP_HEIGHT;
    }
    
    class func getCommitLockId() -> String {
        return COMMIT_LOCK_ID;
    }
    
    class func getSEASON() -> String {
        return SEASON;
    }
    
    class func getPostWeaningGain() -> String {
        return POST_WEANING_GAIN;
    }
}
