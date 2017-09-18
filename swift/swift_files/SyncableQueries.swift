//
//  SyncableQueries.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class SyncableQueries {
    
    static var TABLE_NAME = "syncable_queries";
    static var _ID = "_id";
    static var SQL_QUERY = "sql_query";
    static var TIMESTAMP = "query_timestamp";
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getSqlQuery() -> String {
        return SQL_QUERY;
    }
    
    class func getTIMESTAMP() -> String {
        return TIMESTAMP;
    }
}
