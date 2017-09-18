//
//  TblWorkOrder.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblWorkOrder {

    static var TABLE_NAME = "tbl_work_recieved";
    static var _ID = "_id";
    static var WORK_RECEIVED_ID = "work_received_id";
    static var MEMBER_ID = "member_id";
    static var DATE_RECEIVED = "date_received";
    static var RECEIVED_BY = "received_by";
    static var WORK_DESCRIPTION = "work_description";
    static var DATE_WORKED = "date_worked";
    static var WORKED_BY = "worked_by";
    static var DATE_PRINTED = "date_printed";
    static var PRINTED_BY = "printed_by";
    static var DATE_MAILED = "date_mailed";
    static var MAILED_BY = "mailed_by";
    static var STARTED_BY = "started_by";
    static var START_DATE = "start_date";
    static var TIME_STAMP = "time_stamp";
    static var CLOSE_FLAG = "close_flag";
    static var CLOSED_BY = "closed_by";
    static var PAYPAL_ID = "paypal_id";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_work_recieved"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getWorkReceivedId() -> String {
        return WORK_RECEIVED_ID;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getDateReceived() -> String {
        return DATE_RECEIVED;
    }
    
    class func getReceivedBy() -> String {
        return RECEIVED_BY;
    }
    
    class func getWorkDescription() -> String {
        return WORK_DESCRIPTION;
    }
    
    class func getDateWorked() -> String {
        return DATE_WORKED;
    }
    
    class func getWorkedBy() -> String {
        return WORKED_BY;
    }
    
    class func getDatePrinted() -> String {
        return DATE_PRINTED;
    }
    
    class func getPrintedBy() -> String {
        return PRINTED_BY;
    }
    
    class func getDateMailed() -> String {
        return DATE_MAILED;
    }
    
    class func getMailedBy() -> String {
        return MAILED_BY;
    }
    
    class func getStartedBy() -> String {
        return STARTED_BY;
    }
    
    class func getStartDate() -> String {
        return START_DATE;
    }
    
    class func getTimeStamp() -> String {
        return TIME_STAMP;
    }
    
    class func getCloseFlag() -> String {
        return CLOSE_FLAG;
    }
    
    class func getClosedBy() -> String {
        return CLOSED_BY;
    }
    
    class func getPaypalId() -> String {
        return PAYPAL_ID;
    }
}
