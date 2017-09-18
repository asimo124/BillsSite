//
//  TblAssociationCodesUdderScoreSuspension.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAssociationCodesUdderScoreSuspension {
    
    static var TABLE_NAME = "codes_udder_score_suspension";
    static var _ID = "_id";
    static var SUSPENSION_ID = "suspension_id";
    static var SUSPENSION_TEXT = "suspension_text";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from codes_udder_score_suspension"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getSuspensionId() -> String {
        return SUSPENSION_ID;
    }
    
    class func getSuspensionText() -> String {
        return SUSPENSION_TEXT;
    }
}
