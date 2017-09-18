//
//  AnimalsData.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/23/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsData {
    
    static var TABLE_NAME = "animal_data";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var LEFT_TEAT_COUNT = "left_teat_count";
    static var RIGHT_TEAT_COUNT = "right_teat_count";
    static var DAY_WEIGHT_250 = "day_weight_250";
    static var SPI = "spi";
    static var MLI = "mli";
    static var TSI = "tsi";
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
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getLeftTeatCount() -> String {
        return LEFT_TEAT_COUNT;
    }
    
    class func getRightTeatCount() -> String {
        return RIGHT_TEAT_COUNT;
    }
    
    class func getDayWeight250() -> String {
        return DAY_WEIGHT_250;
    }
    
    class func getSPI() -> String {
        return SPI;
    }
    
    class func getMLI() -> String {
        return MLI;
    }
    
    class func getTSI() -> String {
        return TSI;
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
    
    class func truncate() {
        
        let dbn = Database()
        let query = "delete from animal_data"
        dbn.query(query)
    }
}
