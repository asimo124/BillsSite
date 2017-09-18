//
//  AnimalsCarcass.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsCarcass {
    
    static var TABLE_NAME = "animal_carcass";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var CARCASS_DATE = "carcass_date";
    static var WEIGHT = "weight";
    static var CARCASS_NUMBER = "carcass_number";
    static var GRADE_DATE = "grade_date";
    static var FAT_THICKNESS = "fat_thickness";
    static var RIBEYE_AREA = "ribeye_area";
    static var KPH_FAT = "kph_fat";
    static var MARBLING_SCORE = "marbling_score";
    static var QUALITY_GRADE = "quality_grade";
    static var YIELD_GRADE = "yield_grade";
    static var MUSCLE_DEPTH = "muscle_depth";
    static var CARCASS_COLOR = "carcass_color";
    static var GROUP_PEN = "group_pen";
    static var CONTEMPORARY_GROUP = "contemporary_group";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getCarcassDate() -> String {
        return CARCASS_DATE;
    }
    
    class func getWEIGHT() -> String {
        return WEIGHT;
    }
    
    class func getCarcassNumber() -> String {
        return CARCASS_NUMBER;
    }
    
    class func getGradeDate() -> String {
        return GRADE_DATE;
    }
    
    class func getFatThickness() -> String {
        return FAT_THICKNESS;
    }
    
    class func getRibeyeArea() -> String {
        return RIBEYE_AREA;
    }
    
    class func getKphFat() -> String {
        return KPH_FAT;
    }
    
    class func getMarblingScore() -> String {
        return MARBLING_SCORE;
    }
    
    class func getQualityGrade() -> String {
        return QUALITY_GRADE;
    }
    
    class func getYieldGrade() -> String {
        return YIELD_GRADE;
    }
    
    class func getMuscleDepth() -> String {
        return MUSCLE_DEPTH;
    }
    
    class func getCarcassColor() -> String {
        return CARCASS_COLOR;
    }
    
    class func getGroupPen() -> String {
        return GROUP_PEN;
    }
    
    class func getContemporaryGroup() -> String {
        return CONTEMPORARY_GROUP;
    }
    
    class func truncate() {
        
        let dbn = Database()
        let query = "delete from animal_carcass"
        dbn.query(query)
    }
}
