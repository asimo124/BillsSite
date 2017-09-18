//
//  AnimalsEpd.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsEpd {
    
    static var TABLE_NAME = "animal_epd";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var EPD_YEAR = "epd_year";
    static var EPD_SEASON = "epd_season";
    static var BW_EPD = "bw_epd";
    static var BW_ACC = "bw_acc";
    static var WW_EPD = "ww_epd";
    static var WW_ACC = "ww_acc";
    static var YW_EPD = "yw_epd";
    static var YW_ACC = "yw_acc";
    static var MILK_EPD = "milk_epd";
    static var MILK_ACC = "milk_acc";
    static var SC_EPD = "sc_epd";
    static var SC_ACC = "sc_acc";
    static var REA_EPD = "rea_epd";
    static var REA_ACC = "rea_acc";
    static var FAT_EPD = "fat_epd";
    static var FAT_ACC = "fat_acc";
    static var IMF_EPD = "imf_epd";
    static var IMF_ACC = "imf_acc";
    static var CED_EPD = "ced_epd";
    static var CED_ACC = "ced_acc";
    static var CEM_EPD = "cem_epd";
    static var CEM_ACC = "cem_acc";
    static var TM_EPD = "tm_epd";
    static var TM_ACC = "tm_acc";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getEpdYear() -> String {
        return EPD_YEAR;
    }
    
    class func getEpdSeason() -> String {
        return EPD_SEASON;
    }
    
    class func getBwEpd() -> String {
        return BW_EPD;
    }
    
    class func getBwAcc() -> String {
        return BW_ACC;
    }
    
    class func getWwEpd() -> String {
        return WW_EPD;
    }
    
    class func getWwAcc() -> String {
        return WW_ACC;
    }
    
    class func getYwEpd() -> String {
        return YW_EPD;
    }
    
    class func getYwAcc() -> String {
        return YW_ACC;
    }
    
    class func getMilkEpd() -> String {
        return MILK_EPD;
    }
    
    class func getMilkAcc() -> String {
        return MILK_ACC;
    }
    
    class func getScEpd() -> String {
        return SC_EPD;
    }
    
    class func getScAcc() -> String {
        return SC_ACC;
    }
    
    class func getReaEpd() -> String {
        return REA_EPD;
    }
    
    class func getReaAcc() -> String {
        return REA_ACC;
    }
    
    class func getFatEpd() -> String {
        return FAT_EPD;
    }
    
    class func getFatAcc() -> String {
        return FAT_ACC;
    }
    
    class func getImfEpd() -> String {
        return IMF_EPD;
    }
    
    class func getImfAcc() -> String {
        return IMF_ACC;
    }
    
    class func getCedEpd() -> String {
        return CED_EPD;
    }
    
    class func getCedAcc() -> String {
        return CED_ACC;
    }
    
    class func getCemEpd() -> String {
        return CEM_EPD;
    }
    
    class func getCemAcc() -> String {
        return CEM_ACC;
    }
    
    class func getTmEpd() -> String {
        return TM_EPD;
    }
    
    class func getTmAcc() -> String {
        return TM_ACC;
    }
}
