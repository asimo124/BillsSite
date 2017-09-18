//
//  TblAssociationCodesCalvingEase.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAssociationCodesCalvingEase {
    
    static var TABLE_NAME = "codes_calving_ease";
    static var _ID = "_id";
    static var CALVING_EASE_ID = "calving_ease_id";
    static var CALVING_EASE_TEXT = "calving_ease_text";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from codes_calving_ease"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getCalvingEaseId() -> String {
        return CALVING_EASE_ID;
    }
    
    class func getCalvingEaseText() -> String {
        return CALVING_EASE_TEXT;
    }
}
