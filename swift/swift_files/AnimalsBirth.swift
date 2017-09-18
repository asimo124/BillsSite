//
//  AnimalsBirth.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsBirth {
    
    static var TABLE_NAME = "animal_birth";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var BIRTH_DATE = "birth_date";
    static var WEIGHT = "weight";
    static var WEIGHT_ADJ = "weight_adj";
    static var WEIGHT_RATIO = "weight_ratio";
    static var SEASON = "season";
    static var SERVICE_TYPE = "service_type";
    static var CALVING_EASE = "calving_ease";
    static var BIRTH_TYPE = "birth_type";
    static var SCUR_SCORE = "scur_score";
    static var COLOR_SCORE = "color_score";
    static var CONTEMPORARY_GROUP = "contemporary_group";
    static var UDDER_SUSPENSION_SCORE = "udder_suspension_score";
    static var UDDER_TEAT_SCORE = "udder_teat_score";
    static var RECIPIENT_DAM = "recipient_dam";
    static var FLUSH_DATE = "flush_date";
    static var TRANSFER_DATE = "transfer_date";
    static var DISPOSITION_SCORE = "disposition_score";
    static var FERTILITY_SCORE = "fertility_score";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getBirthDate() -> String {
        return BIRTH_DATE;
    }
    
    class func getWEIGHT() -> String {
        return WEIGHT;
    }
    
    class func getWeightAdj() -> String {
        return WEIGHT_ADJ;
    }
    
    class func getWeightRatio() -> String {
        return WEIGHT_RATIO;
    }
    
    class func getSEASON() -> String {
        return SEASON;
    }
    
    class func getServiceType() -> String {
        return SERVICE_TYPE;
    }
    
    class func getCalvingEase() -> String {
        return CALVING_EASE;
    }
    
    class func getBirthType() -> String {
        return BIRTH_TYPE;
    }
    
    class func getScurScore() -> String {
        return SCUR_SCORE;
    }
    
    class func getColorScore() -> String {
        return COLOR_SCORE;
    }
    
    class func getContemporaryGroup() -> String {
        return CONTEMPORARY_GROUP;
    }
    
    class func getUdderSuspensionScore() -> String {
        return UDDER_SUSPENSION_SCORE;
    }
    
    class func getUdderTeatScore() -> String {
        return UDDER_TEAT_SCORE;
    }
    
    class func getRecipientDam() -> String {
        return RECIPIENT_DAM;
    }
    
    class func getFlushDate() -> String {
        return FLUSH_DATE;
    }
    
    class func getTransferDate() -> String {
        return TRANSFER_DATE;
    }
    
    class func getDispositionScore() -> String {
        return DISPOSITION_SCORE;
    }
    
    class func getFertilityScore() -> String {
        return FERTILITY_SCORE;
    }
    
    class func truncate() {
        
        let dbn = Database()
        let query = "delete from animal_birth"
        dbn.query(query)
    }
}
