//
//  TblAssociationCodesBodyCondition.swift
//  IOSApp3
//
//  Created by Alex Hawley on 9/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import UIKit

class TblAssociationCodesBodyCondition {
    
    static var TABLE_NAME = "codes_body_condition";
    static var _ID = "_id";
    static var BODY_CONDITION_SCORE = "body_condition_score";
    static var BODY_CONDITION_TEXT = "body_condition_text";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func truncate() {
        
        let query = "delete from codes_body_condition "
        let dbn = DatabaseOld()
        dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getBodyConditionScore() -> String {
        return BODY_CONDITION_SCORE;
    }
    
    class func getBodyConditionText() -> String {
        return BODY_CONDITION_TEXT;
    }
}
