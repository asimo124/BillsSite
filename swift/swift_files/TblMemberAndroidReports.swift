//
//  TblMemberAndroidReports.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblMemberAndroidReports {
    
    static var TABLE_NAME = "tbl_member_reports_android";
    static var _ID = "_id";
    static var PK_ID = "pk_id";
    static var MEMBER_ID = "member_id";
    static var REPORT_TYPE = "report_type";            // "Title" of report, EX: "Semen Inventory"
    static var REPORT_FILE_NAME = "report_file_name";        // file_name_memberID_timeStamp.pdf
    static var CREATE_STAMP = "create_stamp";                    // yyyy-mm-dd
    static var REPORT_FORMAT = "report_format";
    static var CREATE_USER = "create_user";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_member_reports_android"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getPkId() -> String {
        return PK_ID;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getReportType() -> String {
        return REPORT_TYPE;
    }
    
    class func getReportFileName() -> String {
        return REPORT_FILE_NAME;
    }
    
    class func getCreateStamp() -> String {
        return CREATE_STAMP;
    }
    
    class func getReportFormat() -> String {
        return REPORT_FORMAT;
    }
    
    class func getCreateUser() -> String {
        return CREATE_USER;
    }
}
