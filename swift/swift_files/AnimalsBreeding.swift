//
//  AnimalsBreeding.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsBreeding {
    
    static var TABLE_NAME = "animal_breeding";
    static var _ID = "_id";
    static var BREEDING_ID = "breeding_id";
    static var TYPE = "type";
    static var WORK_ORDER = "work_order";
    static var DAM = "dam";
    static var SIRE = "sire";
    static var CALF = "calf";
    static var BEGIN_DATE = "begin_date";
    static var END_DATE = "end_date";
    static var AI_DATE = "ai_date";
    static var RECIPIENT_DAM = "recipient_dam";
    static var TRANSFER_DATE = "transfer_date";
    static var FLUSH_DATE = "flush_date";
    static var PALPATION_RESULT = "palpation_result";
    static var PALPATION_DATE = "palpation_date";
    static var AI_CERT = "ai_cert";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from animal_breeding"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getBreedingId() -> String {
        return BREEDING_ID;
    }
    
    class func getTYPE() -> String {
        return TYPE;
    }
    
    class func getWorkOrder() -> String {
        return WORK_ORDER;
    }
    
    class func getDAM() -> String {
        return DAM;
    }
    
    class func getSIRE() -> String {
        return SIRE;
    }
    
    class func getCALF() -> String {
        return CALF;
    }
    
    class func getBeginDate() -> String {
        return BEGIN_DATE;
    }
    
    class func getEndDate() -> String {
        return END_DATE;
    }
    
    class func getAiDate() -> String {
        return AI_DATE;
    }
    
    class func getRecipientDam() -> String {
        return RECIPIENT_DAM;
    }
    
    class func getTransferDate() -> String {
        return TRANSFER_DATE;
    }
    
    class func getFlushDate() -> String {
        return FLUSH_DATE;
    }
    
    class func getPalpationResult() -> String {
        return PALPATION_RESULT;
    }
    
    class func getPalpationDate() -> String {
        return PALPATION_DATE;
    }
    
    class func getAiCert() -> String {
        return AI_CERT;
    }}
