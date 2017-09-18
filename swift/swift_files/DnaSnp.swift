//
//  DnaSnp.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class DnaSnp {
    
    static var TABLE_NAME = "dna_snp";
    static var _ID = "_id";
    static var SAMPLE_ID = "sample_id";
    static var TEST = "test";
    static var DATE_BANKED = "date_banked";
    static var BARCODE = "barcode";
    static var REGISTRATION = "registration";
    static var SAMPLE_STATUS = "sample_status";
    
    // NOTE: i am not including the actual snp results here
    //  there are over 100 columns that I am not going to have transferred
    //  to the tablet
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from dna_snp"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getSampleId() -> String {
        return SAMPLE_ID;
    }
    
    class func getTEST() -> String {
        return TEST;
    }
    
    class func getDateBanked() -> String {
        return DATE_BANKED;
    }
    
    class func getBARCODE() -> String {
        return BARCODE;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getSampleStatus() -> String {
        return SAMPLE_STATUS;
    }
}
