//
//  DnaRequests.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class DnaRequests {
    
    static var TABLE_NAME = "dna_requests";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var MEMBER_ID = "member_id";
    static var BARCODE = "barcode";
    static var SAMPLE_TYPE = "sample_type";
    static var WORK_ORDER = "work_order";
    static var REASON = "reason";
    static var ALTERNATE_FATHERS = "alternate_fathers";
    static var ALTERNATE_MOTHERS = "alternate_mothers";
    static var IN_PROGRESS = "in_progress";
    static var IS_COMPLETED = "is_completed";
    static var IS_REDO = "is_redo";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from dna_requests"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getBARCODE() -> String {
        return BARCODE;
    }
    
    class func getSampleType() -> String {
        return SAMPLE_TYPE;
    }
    
    class func getWorkOrder() -> String {
        return WORK_ORDER;
    }
    
    class func getREASON() -> String {
        return REASON;
    }
    
    class func getAlternateFathers() -> String {
        return ALTERNATE_FATHERS;
    }
    
    class func getAlternateMothers() -> String {
        return ALTERNATE_MOTHERS;
    }
    
    class func getInProgress() -> String {
        return IN_PROGRESS;
    }
    
    class func getIsCompleted() -> String {
        return IS_COMPLETED;
    }
    
    class func getIsRedo() -> String {
        return IS_REDO;
    }
}
