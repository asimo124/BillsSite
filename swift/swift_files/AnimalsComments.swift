//
//  AnimalsComments.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsComments {
    
    static var TABLE_NAME = "animal_comments";
    static var _ID = "_id";
    static var COMMENT_ID = "comment_id";
    static var REGISTRATION = "registration";
    static var COMMENT = "comment";
    static var COMMENT_DATE = "comment_date";
    static var IS_DELETED = "is_deleted";
    static var NOTIFY_USER = "notify_user";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getCommentId() -> String {
        return COMMENT_ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getCOMMENT() -> String {
        return COMMENT;
    }
    
    class func getCommentDate() -> String {
        return COMMENT_DATE;
    }
    
    class func getIsDeleted() -> String {
        return IS_DELETED;
    }
    
    class func getNotifyUser() -> String {
        return NOTIFY_USER;
    }
    
    class func truncate() {
        
        let dbn = Database()
        let query = "delete from animal_comments"
        dbn.query(query)
    }
}
