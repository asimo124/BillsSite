//
//  AnimalsBreed.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsBreed {
    
    static var TABLE_NAME = "animal_breed";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var CODE = "code";
    static var PERCENTAGE = "percentage";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getCODE() -> String {
        return CODE;
    }
    
    class func getPERCENTAGE() -> String {
        return PERCENTAGE;
    }
    
    class func truncate() {
        
        let dbn = Database()
        let query = "delete from animal_breed"
        dbn.query(query)
    }
}
