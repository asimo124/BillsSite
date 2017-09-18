//
//  AnimalsEnrolled.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsEnrolled {
    
    static var TABLE_NAME = "animal_enrolled";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var SPI = "spi";
    static var EPD = "epd";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getSPI() -> String {
        return SPI;
    }
    
    class func getEPD() -> String {
        return EPD;
    }
    
    class func truncate() {
        
        let dbn = Database()
        let query = "delete from animal_enrolled"
        dbn.query(query)
    }
}
