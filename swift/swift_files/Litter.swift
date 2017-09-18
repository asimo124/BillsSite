//
//  Litter.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class Litter {
    
    static var TABLE_NAME = "litter";
    static var _ID = "_id";
    static var MEMBER_ID = "member_id";
    static var BIRTH_DATE = "birth_date";
    static var LITTER_GROUP = "litter_group";
    static var MOTHER = "mother";
    static var FATHER = "father";
    static var REGISTRATION = "registration";
    static var TOTAL_BORN = "total_born";
    static var BORN_ALIVE = "born_alive";
    static var LITTER_NUMBER = "litter_number";
    static var NUMBER_WEANED = "number_weaned";
    static var DATE_RECEIVED = "date_received";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from litter"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getBirthDate() -> String {
        return BIRTH_DATE;
    }
    
    class func getLitterGroup() -> String {
        return LITTER_GROUP;
    }
    
    class func getMOTHER() -> String {
        return MOTHER;
    }
    
    class func getFATHER() -> String {
        return FATHER;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getTotalBorn() -> String {
        return TOTAL_BORN;
    }
    
    class func getBornAlive() -> String {
        return BORN_ALIVE;
    }
    
    class func getLitterNumber() -> String {
        return LITTER_NUMBER;
    }
    
    class func getNumberWeaned() -> String {
        return NUMBER_WEANED;
    }
    
    class func getDateReceived() -> String {
        return DATE_RECEIVED;
    }
}
