//
//  TblAssociationCodesNavelScore.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAssociationCodesNavelScore {
    
    
    static var TABLE_NAME = "codes_navel_score";
    static var _ID = "_id";
    static var NAVEL_SCORE_ID = "navel_score_id";
    static var NAVEL_SCORE_TEXT = "navel_score_text";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from codes_navel_score"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getNavelScoreId() -> String {
        return NAVEL_SCORE_ID;
    }
    
    class func getNavelScoreText() -> String {
        return NAVEL_SCORE_TEXT;
    }
}
