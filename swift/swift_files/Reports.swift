//
//  Reports.swift
//  IOSApp3
//
//  Created by Alex Hawley on 9/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import UIKit

class Reports {
    
    static var TABLE_NAME = "reports";
    static var _ID = "_id";
    static var REPORT_TITLE = "report_title";  // title of the report, i.e., semen inventory
    static var REPORT_FILE_NAME = "report_file_name";   // file_name_memberID_timeStamp.pdf
    static var REPORT_DATE = "report_date";    // yyy-mm-dd
    static var REPORT_FORMAT = "report_format";  // format = P(PDF) or E(EXCEL)
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
        
        let query = "DELETE FROM reports"
        let dbn = Database()
        dbn.query(query)
    }
    
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getReportTitle() -> String {
        return REPORT_TITLE;
    }
    
    class func getReportFileName() -> String {
        return REPORT_FILE_NAME;
    }
    
    class func getReportDate() -> String {
        return REPORT_DATE;
    }
    
    class func getReportFormat() -> String {
        return REPORT_FORMAT;
    }
}
