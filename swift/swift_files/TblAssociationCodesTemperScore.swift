//
//  TblAssociationCodesTemperScore.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAssociationCodesTemperScore {
    
    static var TABLE_NAME = "codes_temper_score";
    static var _ID = "_id";
    static var TEMPER_SCORE_ID = "temper_score_id";
    static var TEMPER_SCORE_TEXT = "temper_score_text";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func truncate() {
        
        let query = "delete from codes_temper_score"
        let dbn = DatabaseOld()
        dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getTemperScoreId() -> String {
        return TEMPER_SCORE_ID;
    }
    
    class func getTemperScoreText() -> String {
        return TEMPER_SCORE_TEXT;
    }
}
