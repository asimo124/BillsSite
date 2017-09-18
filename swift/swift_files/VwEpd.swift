//
//  VwEpd.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class VwEpd {
    
    static var TABLE_NAME = "vw_animal_epd";
    
    static var _ID = "_id";
    static var ANIMAL_ID = "animal_id";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var ANIMAL_PRIVATE_HERD_ID = "animal_private_herd_id";
    static var RECORD_TYPE = "record_type";
    static var ACTIVE = "active";
    static var PROGENY_COUNT = "progeny_count";
    static var ANIMAL_SEX = "animal_sex";
    static var ANIMAL_NAME = "animal_name";
    static var BIRTH_DATE = "birth_date";
    static var ANIMAL_SIRE = "animal_sire";
    static var ANIMAL_DAM = "animal_dam";
    static var BW = "bw";
    static var BW_ACCURACY = "bw_accuracy";
    static var BW_PROGENY_COUNT = "bw_progeny_count";
    static var BW_PROGENY_HERD_COUNT = "bw_progeny_herd_count";
    static var BW_PROGENY_CG_COUNT = "bw_progeny_cg_count";
    
    static var TM = "tm";
    static var TM_PERCENT = "tm_percent";
    
    static var WW = "ww";
    static var WW_ACCURACY = "ww_accuracy";
    static var WW_PROGENY_COUNT = "ww_progeny_count";
    static var WW_PROGENY_HERD_COUNT = "ww_progeny_herd_count";
    static var WW_PROGENY_CG_COUNT = "ww_progeny_cg_count";
    static var WW_MATERNAL = "ww_maternal";
    static var WW_MATERNAL_ACCURACY = "ww_maternal_accuracy";
    static var WW_PROGENY_DAUGHTER_COUNT = "ww_progeny_daughter_count";
    static var WW_PROGENY_DAUGHTER_HERD_COUNT = "ww_progeny_daughter_herd_count";
    static var WW_PROGENY_DAUGHTER_CG_COUNT = "ww_progeny_daughter_cg_count";
    static var WEANING_MILK_GROWTH = "weaning_milk_growth";
    static var WEANING_MILK_GROWTH_ACCURACY = "weaning_milk_growth_accuracy";
    static var WEANING_MILK_GROWTH_PERCENT = "weaning_milk_growth_percent";
    static var WEANING_PERMANENT_ENVIRONMENT = "weaning_permanent_environment";
    static var YW = "yw";
    static var YW_ACCURACY = "yw_accuracy";
    static var YW_PERCENT = "yw_percent";
    static var YW_PROGENY_COUNT = "yw_progeny_count";
    static var YW_PROGENY_HERD_COUNT = "yw_progeny_herd_count";
    static var YW_PROGENY_CG_COUNT = "yw_progeny_cg_count";
    static var SC = "sc";
    static var SC_ACCURACY = "sc_accuracy";
    static var SC_PERCENT = "sc_percent";
    static var SC_PROGENY_COUNT = "sc_progeny_count";
    static var SC_PROGENY_HERD_COUNT = "sc_progeny_herd_count";
    static var SC_PROGENY_CG_COUNT = "sc_progeny_cg_count";
    static var US_REA = "us_rea";
    static var US_REA_ACCURACY = "us_rea_accuracy";
    static var US_REA_PERCENT = "us_rea_percent";
    static var US_REA_PROGENY_COUNT = "us_rea_progeny_count";
    static var US_REA_PROGENY_HERD_COUNT = "us_rea_progeny_herd_count";
    static var US_REA_PROGENY_CG_COUNT = "us_rea_progeny_cg_count";
    static var US_IMF = "us_imf";
    static var US_IMF_ACCURACY = "us_imf_accuracy";
    static var US_IMF_PERCENT = "us_imf_percent";
    static var US_IMF_PROGENY_COUNT = "us_imf_progeny_count";
    static var US_IMF_PROGENY_HERD_COUNT = "us_imf_progeny_herd_count";
    static var US_IMF_PROGENY_CG_COUNT = "us_imf_progeny_cg_count";
    static var US_FAT = "us_fat";
    static var US_FAT_ACCURACY = "us_fat_accuracy";
    static var US_FAT_PERCENT = "us_fat_percent";
    static var US_FAT_PROGENY_COUNT = "us_fat_progeny_count";
    static var US_FAT_PROGENY_HERD_COUNT = "us_fat_progeny_herd_count";
    static var US_FAT_PROGENY_CG_COUNT = "us_fat_progeny_cg_count";
    static var SOURCE = "source";
    static var CED = "ced";
    static var CED_ACCURACY = "ced_accuracy";
    static var CED_PERCENT = "ced_percent";
    static var CEM = "cem";
    static var CEM_ACCURACY = "cem_accuracy";
    static var CEM_PERCENT = "cem_percent";
    static var CARC_WT = "carc_wt";
    static var CARC_WT_ACCURACY = "carc_wt_accuracy";
    static var CARC_REA = "carc_rea";
    static var CARC_REA_ACCURACY = "carc_rea_accuracy";
    static var CARC_FAT = "carc_fat";
    static var CARC_FAT_ACCURACY = "carc_fat_accuracy";
    static var CARC_MARB = "carc_marb";
    static var CARC_MARB_ACCURACY = "carc_marb_accuracy";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from vw_animal_epd"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getAnimalId() -> String {
        return ANIMAL_ID;
    }
    
    class func getAnimalRegistration() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getRegNo() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getAnimalPrivateHerdId() -> String {
        return ANIMAL_PRIVATE_HERD_ID;
    }
    
    class func getRecordType() -> String {
        return RECORD_TYPE;
    }
    
    class func getActive() -> String {
        return ACTIVE;
    }
    
    class func getProgenyCount() -> String {
        return PROGENY_COUNT;
    }
    
    class func getAnimalSex() -> String {
        return ANIMAL_SEX;
    }
    
    class func getAnimalName() -> String {
        return ANIMAL_NAME;
    }
    
    class func getBirthDate() -> String {
        return BIRTH_DATE;
    }
    
    class func getAnimalSire() -> String {
        return ANIMAL_SIRE;
    }
    
    class func getAnimalDam() -> String {
        return ANIMAL_DAM;
    }
    
    class func getBw() -> String {
        return BW;
    }
    
    class func getBwAccuracy() -> String {
        return BW_ACCURACY;
    }
    
    class func getBwProgenyCount() -> String {
        return BW_PROGENY_COUNT;
    }
    
    class func getBwProgenyHerdCount() -> String {
        return BW_PROGENY_HERD_COUNT;
    }
    
    class func getBwProgenyCgCount() -> String {
        return BW_PROGENY_CG_COUNT;
    }
    
    class func getTm() -> String {
        return TM;
    }
    
    class func getTmPercent() -> String {
        return TM_PERCENT;
    }
    
    class func getWw() -> String {
        return WW;
    }
    
    class func getWwAccuracy() -> String {
        return WW_ACCURACY;
    }
    
    class func getWwProgenyCount() -> String {
        return WW_PROGENY_COUNT;
    }
    
    class func getWwProgenyHerdCount() -> String {
        return WW_PROGENY_HERD_COUNT;
    }
    
    class func getWwProgenyCgCount() -> String {
        return WW_PROGENY_CG_COUNT;
    }
    
    class func getWwMaternal() -> String {
        return WW_MATERNAL;
    }
    
    class func getWwMaternalAccuracy() -> String {
        return WW_MATERNAL_ACCURACY;
    }
    
    class func getWwProgenyDaughterCount() -> String {
        return WW_PROGENY_DAUGHTER_COUNT;
    }
    
    class func getWwProgenyDaughterHerdCount() -> String {
        return WW_PROGENY_DAUGHTER_HERD_COUNT;
    }
    
    class func getWwProgenyDaughterCgCount() -> String {
        return WW_PROGENY_DAUGHTER_CG_COUNT;
    }
    
    class func getWeaningMilkGrowth() -> String {
        return WEANING_MILK_GROWTH;
    }
    
    class func getWeaningMilkGrowthAccuracy() -> String {
        return WEANING_MILK_GROWTH_ACCURACY;
    }
    
    class func getWeaningMilkGrowthPercent() -> String {
        return WEANING_MILK_GROWTH_PERCENT;
    }
    
    class func getWeaningPermanentEnvironment() -> String {
        return WEANING_PERMANENT_ENVIRONMENT;
    }
    
    class func getYw() -> String {
        return YW;
    }
    
    class func getYwAccuracy() -> String {
        return YW_ACCURACY;
    }
    
    class func getYwPercent() -> String {
        return YW_PERCENT;
    }

    
    class func getYwProgenyCount() -> String {
        return YW_PROGENY_COUNT;
    }
    
    class func getYwProgenyHerdCount() -> String {
        return YW_PROGENY_HERD_COUNT;
    }
    
    class func getYwProgenyCgCount() -> String {
        return YW_PROGENY_CG_COUNT;
    }
    
    class func getSc() -> String {
        return SC;
    }
    
    class func getScAccuracy() -> String {
        return SC_ACCURACY;
    }
    
    class func getScPercent() -> String {
        return SC_PERCENT;
    }
    
    class func getScProgenyHerdCount() -> String {
        return SC_PROGENY_HERD_COUNT;
    }
    
    class func getScProgenyCgCount() -> String {
        return SC_PROGENY_CG_COUNT;
    }
    
    class func getUsRea() -> String {
        return US_REA;
    }
    
    class func getUsReaAccuracy() -> String {
        return US_REA_ACCURACY;
    }
    
    class func getUsReaPercent() -> String {
        return US_REA_PERCENT;
    }
    
    class func getUsReaProgenyCount() -> String {
        return US_REA_PROGENY_COUNT;
    }
    
    class func getUsReaProgenyHerdCount() -> String {
        return US_REA_PROGENY_HERD_COUNT;
    }
    
    class func getUsReaProgenyCgCount() -> String {
        return US_REA_PROGENY_CG_COUNT;
    }
    
    class func getUsImf() -> String {
        return US_IMF;
    }
    
    class func getUsImfAccuracy() -> String {
        return US_IMF_ACCURACY;
    }
    
    class func getUsImfPercent() -> String {
        return US_IMF_PERCENT;
    }
    
    class func getUsImfProgenyCount() -> String {
        return US_IMF_PROGENY_COUNT;
    }
    
    class func getUsImfProgenyHerdCount() -> String {
        return US_IMF_PROGENY_HERD_COUNT;
    }
    
    class func getUsImfProgenyCgCount() -> String {
        return US_IMF_PROGENY_CG_COUNT;
    }
    
    class func getUsFat() -> String {
        return US_FAT;
    }
    
    class func getUsFatAccuracy() -> String {
        return US_FAT_ACCURACY;
    }
    
    class func getUsFatPercent() -> String {
        return US_FAT_PERCENT;
    }
    
    class func getUsFatProgenyCount() -> String {
        return US_FAT_PROGENY_COUNT;
    }
    
    class func getUsFatProgenyHerdCount() -> String {
        return US_FAT_PROGENY_HERD_COUNT;
    }
    
    class func getUsFatProgenyCgCount() -> String {
        return US_FAT_PROGENY_CG_COUNT;
    }
    
    class func getSource() -> String {
        return SOURCE;
    }
    
    class func getCed() -> String {
        return CED;
    }
    
    class func getCedAccuracy() -> String {
        return CED_ACCURACY;
    }
    
    class func getCedPercent() -> String {
        return CED_PERCENT;
    }
    
    class func getCem() -> String {
        return CEM;
    }
    
    class func getCemAccuracy() -> String {
        return CEM_ACCURACY;
    }
    
    class func getCemPercent() -> String {
        return CEM_PERCENT;
    }
    
    class func getCarcWt() -> String {
        return CARC_WT;
    }
    
    class func getCarcWtAccuracy() -> String {
        return CARC_WT_ACCURACY;
    }
    
    class func getCarcRea() -> String {
        return CARC_REA;
    }
    
    class func getCarcReaAccuracy() -> String {
        return CARC_REA_ACCURACY;
    }
    
    class func getCarcFat() -> String {
        return CARC_FAT;
    }
    
    class func getCarcFatAccuracy() -> String {
        return CARC_FAT_ACCURACY;
    }
    
    class func getCarcMarb() -> String {
        return CARC_MARB;
    }
    
    class func getCarcMarbAccuracy() -> String {
        return CARC_MARB_ACCURACY;
    }
}
