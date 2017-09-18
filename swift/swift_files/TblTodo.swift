//
//  TblTodo.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblTodo {
    
    static var TABLE_NAME = "tbl_todo";
    static var _ID = "_id";
    static var TODO_ID = "todo_id";
    static var MEMBER_ID = "member_id";
    static var HEADER = "header";
    static var DETAILS = "details";
    static var DATE_DUE = "date_due";
    static var DATE_COMPLETED = "date_completed";
    static var FLAG_COMPLETED = "flag_completed";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    static var FLAG_DELETED = "flag_deleted";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_todo"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getTodoId() -> String {
        return TODO_ID;
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
    
    class func getDateDue() -> String {
        return DATE_DUE;
    }
    
    class func getDateCompleted() -> String {
        return DATE_COMPLETED;
    }
    
    class func getFlagCompleted() -> String {
        return FLAG_COMPLETED;
    }
    
    class func getCreateUser() -> String {
        return CREATE_USER;
    }
    
    class func getCreateStamp() -> String {
        return CREATE_STAMP;
    }
    
    class func getUpdateUser() -> String {
        return UPDATE_USER;
    }
    
    class func getUpdateStamp() -> String {
        return UPDATE_STAMP;
    }
    
    class func getFlagDeleted() -> String {
        return FLAG_DELETED;
    }
}
