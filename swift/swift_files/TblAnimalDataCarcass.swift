//
//  TblAnimalDataCarcass.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalDataCarcass {
    
    static var TABLE_NAME = "tbl_animal_data_carcass";
    static var _ID = "_id";
    static var CARCASS_ID = "carcass_id";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var CARCASS_TAG = "carcass_tag";
    static var ANIMAL_SIRE = "animal_sire";
    static var BIRTH_DATE = "birth_date";
    static var KILL_DATE = "kill_date";
    static var CONTEMPORARY_GROUP = "contemporary_group";
    static var ANIMAL_SEX = "animal_sex";
    static var COHORT_GROUP = "cohort_group";
    static var HOT_CARCASS_WEIGHT = "hot_carcass_weight";
    static var MARBLING_SCORE = "marbling_score";
    static var QUALITY_GRADE = "quality_grade";
    static var PYG = "pyg";
    static var FAT_THICKNESS = "fat_thickness";
    static var RIBEYE_AREA = "ribeye_area";
    static var KPH = "kph";
    static var INTERNAL_FAT = "internal_fat";
    static var YIELD_GRADE = "yield_grade";
    static var DAYS_ON_FEED = "days_on_feed";
    static var CREATE_USER = "create_user";
    static var CREATE_DATE = "create_date";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_animal_data_carcass"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getCarcassId() -> String {
        return CARCASS_ID;
    }
    
    class func getAnimalRegistration() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getCarcassTag() -> String {
        return CARCASS_TAG;
    }
    
    class func getAnimalSire() -> String {
        return ANIMAL_SIRE;
    }
    
    class func getBirthDate() -> String {
        return BIRTH_DATE;
    }
    
    class func getKillDate() -> String {
        return KILL_DATE;
    }
    
    class func getContemporaryGroup() -> String {
        return CONTEMPORARY_GROUP;
    }
    
    class func getAnimalSex() -> String {
        return ANIMAL_SEX;
    }
    
    class func getCohortGroup() -> String {
        return COHORT_GROUP;
    }
    
    class func getHotCarcassWeight() -> String {
        return HOT_CARCASS_WEIGHT;
    }
    
    class func getMarblingScore() -> String {
        return MARBLING_SCORE;
    }
    
    class func getQualityGrade() -> String {
        return QUALITY_GRADE;
    }
    
    class func getPYG() -> String {
        return PYG;
    }
    
    class func getFatThickness() -> String {
        return FAT_THICKNESS;
    }
    
    class func getRibeyeArea() -> String {
        return RIBEYE_AREA;
    }
    
    class func getKPH() -> String {
        return KPH;
    }
    
    class func getInternalFat() -> String {
        return INTERNAL_FAT;
    }
    
    class func getYieldGrade() -> String {
        return YIELD_GRADE;
    }
    
    class func getDaysOnFeed() -> String {
        return DAYS_ON_FEED;
    }
    
    class func getCreateUser() -> String {
        return CREATE_USER;
    }
    
    class func getCreateDate() -> String {
        return CREATE_DATE;
    }
}
