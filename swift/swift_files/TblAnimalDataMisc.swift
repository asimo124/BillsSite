//
//  TblAnimalDataMisc.swift
//  IOSApp3
//
//  Created by Alex Hawley on 9/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import UIKit

class TblAnimalDataMisc {
    
    static var TABLE_NAME = "tbl_animal_data_misc";
    static var _ID = "_id";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var WEIGHT = "weight";
    static var MEASUREMENT_DATE = "measurement_date";
    static var RUMP_FAT = "rump_fat";
    static var BODY_CONDITION_SCORE = "body_condition_score";
    static var MEASUREMENT_TYPE = "measurement_type";
    static var MEASUREMENT_DIAMETER = "measurement_diameter";
    static var DAYS_BRED = "days_bred";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func truncate() {
        
        let query = "delete from tbl_animal_data_misc"
        let dbn = DatabaseOld()
        dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getAnimalRegistration() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getWEIGHT() -> String {
        return WEIGHT;
    }
    
    class func getMeasurementDate() -> String {
        return MEASUREMENT_DATE;
    }
    
    class func getRumpFat() -> String {
        return RUMP_FAT;
    }
    
    class func getBodyConditionScore() -> String {
        return BODY_CONDITION_SCORE;
    }
    
    class func getMeasurementType() -> String {
        return MEASUREMENT_TYPE;
    }
    
    class func getMeasurementDiameter() -> String {
        return MEASUREMENT_DIAMETER;
    }
    
    class func getDaysBred() -> String {
        return DAYS_BRED;
    }
}
