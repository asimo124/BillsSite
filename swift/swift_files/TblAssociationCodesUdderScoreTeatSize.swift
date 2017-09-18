//
//  TblAssociationCodesUdderScoreTeatSize.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAssociationCodesUdderScoreTeatSize {
    
    static var TABLE_NAME = "codes_udder_score_teat_size";
    static var _ID = "_id";
    static var TEAT_SIZE_ID = "teat_size_id";
    static var TEAT_SIZE_TEXT = "teat_size_text";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from codes_udder_score_teat_size"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getTeatSizeId() -> String {
        return TEAT_SIZE_ID;
    }
    
    class func getTeatSizeText() -> String {
        return TEAT_SIZE_TEXT;
    }
}
