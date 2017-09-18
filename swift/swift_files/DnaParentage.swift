//
//  DnaParentage.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class DnaParentage {
    
    static var TABLE_NAME = "dna_parentage";
    static var _ID = "_id";
    static var SAMPLE_ID = "sample_id";
    static var ANIMAL_ID = "animal_id";
    static var BARCODE = "barcode";
    static var REGISTRATION = "registration";
    static var SAMPLE_STATUS = "sample_status";
    static var SIRE_1 = "sire_1";
    static var SIRE_2 = "sire_2";
    static var DAM = "dam";
    static var SIRE_1_RESULT = "sire_1_result";
    static var SIRE_2_RESULT = "sire_2_result";
    static var DAM_RESULT = "dam_result";
    static var SIRE_1_DAM_RESULT = "sire_1_dam_result";
    static var SIRE_2_DAM_RESULT = "sire_2_dam_result";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from dna_parentage"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getSampleId() -> String {
        return SAMPLE_ID;
    }
    
    class func getAnimalId() -> String {
        return ANIMAL_ID;
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
    
    class func getSire1() -> String {
        return SIRE_1;
    }
    
    class func getSire2() -> String {
        return SIRE_2;
    }
    
    class func getDAM() -> String {
        return DAM;
    }
    
    class func getSire1Result() -> String {
        return SIRE_1_RESULT;
    }
    
    class func getSire2Result() -> String {
        return SIRE_2_RESULT;
    }
    
    class func getDamResult() -> String {
        return DAM_RESULT;
    }
    
    class func getSire1DamResult() -> String {
        return SIRE_1_DAM_RESULT;
    }
    
    class func getSire2DamResult() -> String {
        return SIRE_2_DAM_RESULT;
    }
}
