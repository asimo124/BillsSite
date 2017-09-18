//
//  TblAssociationCodesSheathScore.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAssociationCodesSheathScore {
    
    static var TABLE_NAME = "codes_sheath_score";
    static var _ID = "_id";
    static var SHEATH_SCORE_ID = "sheath_score_id";
    static var SHEATH_SCORE_TEXT = "sheath_score_text";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from codes_sheath_score"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getSheathScoreId() -> String {
        return SHEATH_SCORE_ID;
    }
    
    class func getSheathScoreText() -> String {
        return SHEATH_SCORE_TEXT;
    }
}
