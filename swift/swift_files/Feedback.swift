//
//  Feedback.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/22/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class Feedback {
    
    static var TABLE_NAME = "feedback";
    static var _ID = "_id";
    static var SUBMISSION_DATE = "submission_date";
    static var MESSAGE = "message";
    static var MEMBER_ID = "member_id";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getSubmissionDate() -> String {
        return SUBMISSION_DATE;
    }
    
    class func getMESSAGE() -> String {
        return MESSAGE;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
}
