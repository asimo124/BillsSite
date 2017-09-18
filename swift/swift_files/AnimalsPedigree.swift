//
//  AnimalsPedigree.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsPedigree {
    
    static var TABLE_NAME = "animal_pedigree";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var MEMBER_ID = "member_id";
    static var IS_VALIDATED = "is_validated";
    static var SIRE = "sire";
    static var DAM = "dam";
    static var SIRE_SIRE = "sire_sire";
    static var SIRE_SIRE_SIRE = "sire_sire_sire";
    static var SIRE_SIRE_DAM = "sire_sire_dam";
    static var SIRE_DAM = "sire_dam";
    static var SIRE_DAM_SIRE = "sire_dam_sire";
    static var SIRE_DAM_DAM = "sire_dam_dam";
    static var DAM_SIRE_SIRE = "dam_sire_sire";
    static var DAM_SIRE_DAM = "dam_sire_dam";
    static var DAM_SIRE = "dam_sire";
    static var DAM_DAM = "dam_dam";
    static var DAM_DAM_SIRE = "dam_dam_sire";
    static var DAM_DAM_DAM = "dam_dam_dam";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from animal_pedigree"
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
    
    class func getIsValidated() -> String {
        return IS_VALIDATED;
    }
    
    class func getSIRE() -> String {
        return SIRE;
    }
    
    class func getDAM() -> String {
        return DAM;
    }
    
    class func getSireSire() -> String {
        return SIRE_SIRE;
    }
    
    class func getSireSireSire() -> String {
        return SIRE_SIRE_SIRE;
    }
    
    class func getSireSireDam() -> String {
        return SIRE_SIRE_DAM;
    }
    
    class func getSireDam() -> String {
        return SIRE_DAM;
    }
    
    class func getSireDamSire() -> String {
        return SIRE_DAM_SIRE;
    }
    
    class func getSireDamDam() -> String {
        return SIRE_DAM_DAM;
    }
    
    class func getDamSireSire() -> String {
        return DAM_SIRE_SIRE;
    }
    
    class func getDamSireDam() -> String {
        return DAM_SIRE_DAM;
    }
    
    class func getDamSire() -> String {
        return DAM_SIRE;
    }
    
    class func getDamDam() -> String {
        return DAM_DAM;
    }
    
    class func getDamDamSire() -> String {
        return DAM_DAM_SIRE;
    }
    
    class func getDamDamDam() -> String {
        return DAM_DAM_DAM;
    }
}
