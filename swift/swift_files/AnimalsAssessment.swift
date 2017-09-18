//
//  AnimalsAssessment.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsAssessment {
    
    static var TABLE_NAME = "animal_assessment";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var MEMBER_ID = "member_id";
    static var ASSESSMENT_DATE = "assessment_date";
    static var ASSESSMENT_YEAR = "assessment_year";
    static var ASSESSMENT_SEASON = "assessment_season";
    static var WORK_ORDER = "work_order";
    static var SEX = "sex";
    static var CALF = "calf";
    static var CALF_BIRTH_DATE = "calf_birth_date";
    static var IS_CANCELED = "is_canceled";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getAssessmentDate() -> String {
        return ASSESSMENT_DATE;
    }
    
    class func getAssessmentYear() -> String {
        return ASSESSMENT_YEAR;
    }
    
    class func getAssessmentSeason() -> String {
        return ASSESSMENT_SEASON;
    }
    
    class func getWorkOrder() -> String {
        return WORK_ORDER;
    }
    
    class func getSEX() -> String {
        return SEX;
    }
    
    class func getCALF() -> String {
        return CALF;
    }
    
    class func getCalfBirthDate() -> String {
        return CALF_BIRTH_DATE;
    }
    
    class func getIsCanceled() -> String {
        return IS_CANCELED;
    }
    
    
}
