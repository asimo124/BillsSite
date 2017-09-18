//
//  AnimalsYear.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsYear {

    static var TABLE_NAME = "animal_year";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var YEAR_DATE = "year_date";
    static var WEIGHT = "weight";
    static var WEIGHT_ADJ = "weight_adj";
    static var WEIGHT_RATIO = "weight_ratio";
    static var HEIGHT = "height";
    static var SCROTAL_CIRCUMFERENCE = "scrotal_circumference";
    static var SHEATH_SCORE = "sheath_score";
    static var NAVEL_SCORE = "navel_score";
    static var TEMPER_SCORE = "temper_score";
    static var MANAGEMENT_CODE = "management_code";
    static var CONTEMPORARY_GROUP = "contemporary_group";
    static var FRAME_SCORE = "frame_score";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from animal_year"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getYearDate() -> String {
        return YEAR_DATE;
    }
    
    class func getWEIGHT() -> String {
        return WEIGHT;
    }
    
    class func getWeightAdj() -> String {
        return WEIGHT_ADJ;
    }
    
    class func getWeightRatio() -> String {
        return WEIGHT_RATIO;
    }
    
    class func getHEIGHT() -> String {
        return HEIGHT;
    }
    
    class func getScrotalCircumference() -> String {
        return SCROTAL_CIRCUMFERENCE;
    }
    
    class func getSheathScore() -> String {
        return SHEATH_SCORE;
    }
    
    class func getNavelScore() -> String {
        return NAVEL_SCORE;
    }
    
    class func getTemperScore() -> String {
        return TEMPER_SCORE;
    }
    
    class func getManagementCode() -> String {
        return MANAGEMENT_CODE;
    }
    
    class func getContemporaryGroup() -> String {
        return CONTEMPORARY_GROUP;
    }
    
    class func getFrameScore() -> String {
        return FRAME_SCORE;
    }
}
