//
//  TblAssociationCodesColorScore.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAssociationCodesColorScore {
    
    static var TABLE_NAME = "codes_color_score";
    static var _ID = "_id";
    static var COLOR_SCORE_ID = "color_score_id";
    static var COLOR_SCORE_TEXT = "color_score_text";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from codes_color_score"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getColorScoreId() -> String {
        return COLOR_SCORE_ID;
    }
    
    class func getColorScoreText() -> String {
        return COLOR_SCORE_TEXT;
    }

}
