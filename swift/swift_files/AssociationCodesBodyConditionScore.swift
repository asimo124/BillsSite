//
//  AssociationCodesBodyConditionScore.swift
//  IOSApp3
//
//  Created by Alex Hawley on 9/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import UIKit

class AssociationCodesBodyConditionScore {
    
    static var TABLE_NAME = "codes_body_condition_score";
    static var _ID = "_id";
    static var CODE = "code";
    static var TEXT = "text";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getCODE() -> String {
        return CODE;
    }
    
    class func getTEXT() -> String {
        return TEXT;
    }
}
