//
//  AssociationCodesUdderScoreSuspension.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AssociationCodesUdderScoreSuspension {
    
    static var TABLE_NAME = "codes_udder_suspension_score";
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
    
    class func truncate() {
        
        let dbn = Database()
        let query = "delete from codes_udder_suspension_score"
        dbn.query(query)
    }
}
