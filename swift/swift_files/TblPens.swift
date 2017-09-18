//
//  TblPens.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblPens {
    
    static var TABLE_NAME = "tbl_pens";
    static var _ID = "_id";
    static var PEN_ID = "pen_id";
    static var MEMBER_ID = "member_id";
    static var PEN_NAME = "pen_name";
    static var PEN_DESCRIPTION = "pen_description";
    static var PREMISE_ID = "premise_id";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_STAMP = "update_stamp";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_pens"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getPenId() -> String {
        return PEN_ID;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getPenName() -> String {
        return PEN_NAME;
    }
    
    class func getPenDescription() -> String {
        return PEN_DESCRIPTION;
    }
    
    class func getPremiseId() -> String {
        return PREMISE_ID;
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
}
