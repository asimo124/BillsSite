//
//  TblAssociationCodesScurScore.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAssociationCodesScurScore {
    
    static var TABLE_NAME = "codes_scur_score";
    static var _ID = "_id";
    static var SCUR_SCORE = "scur_score";
    static var SCUR_SCORE_TEXT = "scur_score_text";
    static var SCUR = "scur";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from codes_scur_score"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getScurScore() -> String {
        return SCUR_SCORE;
    }
    
    class func getScurScoreText() -> String {
        return SCUR_SCORE_TEXT;
    }
    
    class func getSCUR() -> String {
        return SCUR;
    }
}
