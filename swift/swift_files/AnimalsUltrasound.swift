//
//  AnimalsUltrasound.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsUltrasound {
    
    static var TABLE_NAME = "animal_ultrasound";
    static var _ID = "_id";
    static var REGISTRATION = "registration";
    static var ULTRASOUND_DATE = "ultrasound_date";
    static var WEIGHT = "weight";
    static var HEIGHT = "height";
    static var SCROTAL_CIRCUMFERENCE = "scrotal_circumference";
    static var MANAGEMENT_CODE = "management_code";
    static var CONTEMPORARY_GROUP = "contemporary_group";
    static var TECHNICIAN = "technician";
    static var HARDWARE = "hardware";
    static var SOFTWARE = "software";
    static var RIBEYE_AREA = "ribeye_area";
    static var BACKFAT_THICKNESS = "backfat_thickness";
    static var INTRAMUSCULAR_FAT = "intramuscular_fat";
    static var RUMP_FAT = "rump_fat";
    static var RIBEYE_AREA_ADJ = "ribeye_area_adj";
    static var BACKFAT_THICKNESS_ADJ = "backfat_thickness_adj";
    static var INTRAMUSCULAR_FAT_ADJ = "intramuscular_fat_adj";
    static var RUMP_FAT_ADJ = "rump_fat_adj";
    static var RIBEYE_AREA_RATIO = "ribeye_area_ratio";
    static var BACKFAT_THICKNESS_RATIO = "backfat_thickness_ratio";
    static var INTRAMUSCULAR_FAT_RATIO = "intramuscular_fat_ratio";
    static var RUMP_FAT_RATIO = "rump_fat_ratio";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from animal_ultrasound"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getREGISTRATION() -> String {
        return REGISTRATION;
    }
    
    class func getUltrasoundDate() -> String {
        return ULTRASOUND_DATE;
    }
    
    class func getWEIGHT() -> String {
        return WEIGHT;
    }
    
    class func getHEIGHT() -> String {
        return HEIGHT;
    }
    
    class func getScrotalCircumference() -> String {
        return SCROTAL_CIRCUMFERENCE;
    }
    
    class func getManagementCode() -> String {
        return MANAGEMENT_CODE;
    }
    
    class func getContemporaryGroup() -> String {
        return CONTEMPORARY_GROUP;
    }
    
    class func getTECHNICIAN() -> String {
        return TECHNICIAN;
    }
    
    class func getHARDWARE() -> String {
        return HARDWARE;
    }
    
    class func getSOFTWARE() -> String {
        return SOFTWARE;
    }
    
    class func getRibeyeArea() -> String {
        return RIBEYE_AREA;
    }
    
    class func getBackfatThickness() -> String {
        return BACKFAT_THICKNESS;
    }
    
    class func getIntramuscularFat() -> String {
        return INTRAMUSCULAR_FAT;
    }
    
    class func getRumpFat() -> String {
        return RUMP_FAT;
    }
    
    class func getRibeyeAreaAdj() -> String {
        return RIBEYE_AREA_ADJ;
    }
    
    class func getBackfatThicknessAdj() -> String {
        return BACKFAT_THICKNESS_ADJ;
    }
    
    class func getIntramuscularFatAdj() -> String {
        return INTRAMUSCULAR_FAT_ADJ;
    }
    
    class func getRumpFatAdj() -> String {
        return RUMP_FAT_ADJ;
    }
    
    class func getRibeyeAreaRatio() -> String {
        return RIBEYE_AREA_RATIO;
    }
    
    class func getBackfatThicknessRatio() -> String {
        return BACKFAT_THICKNESS_RATIO;
    }
    
    class func getIntramuscularFatRatio() -> String {
        return INTRAMUSCULAR_FAT_RATIO;
    }
    
    class func getRumpFatRatio() -> String {
        return RUMP_FAT_RATIO;
    }
}
