//
//  TblAssociationCodesStatus.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAssociationCodesStatus {
    
    static var TABLE_NAME = "codes_status";
    static var _ID = "_id";
    static var STATUS = "status";
    static var STATUS_DESCRIPTION = "status_description";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from codes_status"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getSTATUS() -> String {
        return STATUS;
    }
    
    class func getStatusDescription() -> String {
        return STATUS_DESCRIPTION;
    }
}
