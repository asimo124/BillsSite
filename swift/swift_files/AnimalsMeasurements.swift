//
//  AnimalsMeasurements.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsMeasurements {
    
    static var TABLE_NAME = "animal_measurements";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var MEASUREMENT_DATE = "measurement_date";
    static var WEIGHT = "weight";
    static var HEIGHT = "height";
    static var FRAME_SCORE = "frame_score";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getMeasurementDate() -> String {
        return MEASUREMENT_DATE;
    }
    
    class func getWEIGHT() -> String {
        return WEIGHT;
    }
    
    class func getHEIGHT() -> String {
        return HEIGHT;
    }
    
    class func getFrameScore() -> String {
        return FRAME_SCORE;
    }
    
    class func truncate() {
        
        let dbn = Database()
        let query = "delete from animal_measurements"
        dbn.query(query)
    }
}
