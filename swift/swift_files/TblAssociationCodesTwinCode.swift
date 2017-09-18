//
//  TblAssociationCodesTwinCode.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAssociationCodesTwinCode {
    
    static var TABLE_NAME = "codes_twin_code";
    static var _ID = "_id";
    static var TWIN_CODE_ID = "twin_code_id";
    static var TWIN_CODE_TEXT = "twin_code_text";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from codes_twin_code"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getTwinCodeId() -> String {
        return TWIN_CODE_ID;
    }
    
    class func getTwinCodeText() -> String {
        return TWIN_CODE_TEXT;
    }
}
