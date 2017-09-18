//
//  DnaTests.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class DnaTests {
    
    static var TABLE_NAME = "dna_tests";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var MEMBER_ID = "member_id";
    static var BREED = "breed";
    static var DATE_BANKED = "date_banked";
    static var BLOOD_BANK = "blood_bank";
    static var HAL_1843_STRESS = "hal_1843_stress";
    static var HAMP_COLOR_GENE = "hamp_color_gene";
    static var DNA_BREED_PROFILE = "dna_breed_profile";
    static var RN_GENE_NAPOLE = "rn_gene_napole";
    static var TOTAL_GAIN = "total_gain";
    static var LITTER_SIZE = "litter_size";
    static var ANIMAL_GROWTH = "animal_growth";
    static var MEAT_QUALITY = "meat_quality";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from dna_tests"
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
    
    class func getBREED() -> String {
        return BREED;
    }
    
    class func getDateBanked() -> String {
        return DATE_BANKED;
    }
    
    class func getBloodBank() -> String {
        return BLOOD_BANK;
    }
    
    class func getHal1843Stress() -> String {
        return HAL_1843_STRESS;
    }
    
    class func getHampColorGene() -> String {
        return HAMP_COLOR_GENE;
    }
    
    class func getDnaBreedProfile() -> String {
        return DNA_BREED_PROFILE;
    }
    
    class func getRnGeneNapole() -> String {
        return RN_GENE_NAPOLE;
    }
    
    class func getTotalGain() -> String {
        return TOTAL_GAIN;
    }
    
    class func getLitterSize() -> String {
        return LITTER_SIZE;
    }
    
    class func getAnimalGrowth() -> String {
        return ANIMAL_GROWTH;
    }
    
    class func getMeatQuality() -> String {
        return MEAT_QUALITY;
    }
}
