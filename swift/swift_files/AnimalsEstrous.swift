//
//  AnimalsEstrous.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsEstrous {
    
    static var TABLE_NAME = "animal_estrous";
    static var _ID = "_id";
    static var ESTROUS_ID = "estrous_id";
    static var REGISTRATION = "registration";
    static var ESTROUS_DATE = "estrous_date";
    static var TIME_PERIOD = "time_period";
    static var IS_DELETED = "is_deleted";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func truncate() {
        
        let query = "delete from animal_estrous"
        let dbn = Database()
        dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getEstrousId() -> String {
        return ESTROUS_ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getEstrousDate() -> String {
        return ESTROUS_DATE;
    }
    
    class func getTimePeriod() -> String {
        return TIME_PERIOD;
    }
    
    class func getIsDeleted() -> String {
        return IS_DELETED;
    }
}
