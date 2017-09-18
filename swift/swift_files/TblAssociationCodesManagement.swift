//
//  TblAssociationCodesManagement.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAssociationCodesManagement {
    
    static var TABLE_NAME = "codes_management";
    static var _ID = "_id";
    static var MANAGEMENT = "management";
    static var MANAGEMENT_TEXT = "management_text";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from codes_management"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getMANAGEMENT() -> String {
        return MANAGEMENT;
    }
    
    class func getManagementText() -> String {
        return MANAGEMENT_TEXT;
    }
}
