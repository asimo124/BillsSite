//
//  TblFeedback.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblFeedback {
    
    static var TABLE_NAME = "tbl_feedback";
    static var _ID = "_id";
    static var SUBMISSION_DATE = "submission_date";
    static var FEEDBACK = "feedback";
    static var CREATE_USER = "create_user";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getSubmissionDate() -> String {
        return SUBMISSION_DATE;
    }
    
    class func getFEEDBACK() -> String {
        return FEEDBACK;
    }
    
    class func getCreateUser() -> String {
        return CREATE_USER;
    }
}
