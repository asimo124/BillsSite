//
//  Tasks.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/26/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class Tasks {
    
    static var TABLE_NAME = "tasks";
    static var _ID = "_id";
    static var TASK_ID = "task_id";
    static var MEMBER_ID = "member_id";
    static var HEADER = "header";
    static var DETAILS = "details";
    static var DUE_DATE = "due_date";
    static var DATE_COMPLETED = "date_completed";
    static var IS_COMPLETED = "is_completed";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getTaskId() -> String {
        return TASK_ID;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getHEADER() -> String {
        return HEADER;
    }
    
    class func getDETAILS() -> String {
        return DETAILS;
    }
    
    class func getDueDate() -> String {
        return DUE_DATE;
    }
    
    class func getDateCompleted() -> String {
        return DATE_COMPLETED;
    }
    
    class func getIsCompleted() -> String {
        return IS_COMPLETED;
    }
    
    class func truncate() {
        let dbn = Database()
        let query = "delete from tasks"
        dbn.query(query)
    }
}
