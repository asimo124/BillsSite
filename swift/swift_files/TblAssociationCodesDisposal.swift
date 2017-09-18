//
//  TblAssociationCodesDisposal.swift
//  IOSApp3
//
//  Created by Alex Hawley on 9/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import UIKit

class TblAssociationCodesDisposal {
    
    static var TABLE_NAME = "codes_disposal";
    static var _ID = "_id";
    static var DISPOSAL = "disposal";  // numeric
    static var DISPOSAL_STAT = "disposal_stat"; // character
    static var DISPOSAL_TEXT = "disposal_text"; // description
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func truncate() {
        
        let query = "delete from codes_disposal"
        let dbn = DatabaseOld()
        dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getDISPOSAL() -> String {
        return DISPOSAL;
    }
    
    class func getDisposalStat() -> String {
        return DISPOSAL_STAT;
    }
    
    class func getDisposalText() -> String {
        return DISPOSAL_TEXT;
    }
}
