

//
//  VwEpd.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class VwEpdData {

	var _id: Int = -1
    var _id_str: String = "unset"
	var animal_id: Int = -1
    var animal_id_str: String = "unset"
	var animal_registration: String = "unset"
    var animal_registration_str: String = "unset"
	var animal_private_herd_id: String = "unset"
    var animal_private_herd_id_str: String = "unset"
	var record_type: String = "unset"
    var record_type_str: String = "unset"
	var active: Int = -1
    var active_str: String = "unset"
	var progeny_count: Int = -1
    var progeny_count_str: String = "unset"
	var animal_sex: String = "unset"
    var animal_sex_str: String = "unset"
	var animal_name: String = "unset"
    var animal_name_str: String = "unset"
	var birth_date: NSDate = NSDate.distantFuture() as NSDate
    var birth_date_str: String = "unset"
	var animal_sire: String = "unset"
    var animal_sire_str: String = "unset"
	var animal_dam: String = "unset"
    var animal_dam_str: String = "unset"
	var bw: Double = -1.0
    var bw_str: String = "unset"
	var bw_accuracy: Double = -1.0
    var bw_accuracy_str: String = "unset"
	var bw_progeny_count: Int = -1
    var bw_progeny_count_str: String = "unset"
	var bw_progeny_herd_count: Int = -1
    var bw_progeny_herd_count_str: String = "unset"
	var bw_progeny_cg_count: Int = -1
    var bw_progeny_cg_count_str: String = "unset"
	var ww: Double = -1.0
    var ww_str: String = "unset"
	var ww_accuracy: Double = -1.0
    var ww_accuracy_str: String = "unset"
	var ww_progeny_count: Int = -1
    var ww_progeny_count_str: String = "unset"
	var ww_progeny_herd_count: Int = -1
    var ww_progeny_herd_count_str: String = "unset"
	var ww_progeny_cg_count: Int = -1
    var ww_progeny_cg_count_str: String = "unset"
	var ww_maternal: Double = -1.0
    var ww_maternal_str: String = "unset"
	var ww_maternal_accuracy: Double = -1.0
    var ww_maternal_accuracy_str: String = "unset"
	var ww_progeny_daughter_count: Int = -1
    var ww_progeny_daughter_count_str: String = "unset"
	var ww_progeny_daughter_herd_count: Int = -1
    var ww_progeny_daughter_herd_count_str: String = "unset"
	var ww_progeny_daughter_cg_count: Int = -1
    var ww_progeny_daughter_cg_count_str: String = "unset"
	var weaning_milk_growth: Double = -1.0
    var weaning_milk_growth_str: String = "unset"
	var weaning_permanent_environment: Double = -1.0
    var weaning_permanent_environment_str: String = "unset"
	var yw: Double = -1.0
    var yw_str: String = "unset"
	var yw_accuracy: Double = -1.0
    var yw_accuracy_str: String = "unset"
	var yw_progeny_count: Int = -1
    var yw_progeny_count_str: String = "unset"
	var yw_progeny_herd_count: Int = -1
    var yw_progeny_herd_count_str: String = "unset"
	var yw_progeny_cg_count: Int = -1
    var yw_progeny_cg_count_str: String = "unset"
	var sc: Double = -1.0
    var sc_str: String = "unset"
	var sc_accuracy: Double = -1.0
    var sc_accuracy_str: String = "unset"
	var sc_progeny_count: Int = -1
    var sc_progeny_count_str: String = "unset"
	var sc_progeny_herd_count: Int = -1
    var sc_progeny_herd_count_str: String = "unset"
	var sc_progeny_cg_count: Int = -1
    var sc_progeny_cg_count_str: String = "unset"
	var us_rea: Double = -1.0
    var us_rea_str: String = "unset"
	var us_rea_accuracy: Double = -1.0
    var us_rea_accuracy_str: String = "unset"
	var us_rea_progeny_count: Int = -1
    var us_rea_progeny_count_str: String = "unset"
	var us_rea_progeny_herd_count: Int = -1
    var us_rea_progeny_herd_count_str: String = "unset"
	var us_rea_progeny_cg_count: Int = -1
    var us_rea_progeny_cg_count_str: String = "unset"
	var us_imf: Double = -1.0
    var us_imf_str: String = "unset"
	var us_imf_accuracy: Double = -1.0
    var us_imf_accuracy_str: String = "unset"
	var us_imf_progeny_count: Int = -1
    var us_imf_progeny_count_str: String = "unset"
	var us_imf_progeny_herd_count: Int = -1
    var us_imf_progeny_herd_count_str: String = "unset"
	var us_imf_progeny_cg_count: Int = -1
    var us_imf_progeny_cg_count_str: String = "unset"
	var us_fat: Double = -1.0
    var us_fat_str: String = "unset"
	var us_fat_accuracy: Double = -1.0
    var us_fat_accuracy_str: String = "unset"
	var us_fat_progeny_count: Int = -1
    var us_fat_progeny_count_str: String = "unset"
	var us_fat_progeny_herd_count: Int = -1
    var us_fat_progeny_herd_count_str: String = "unset"
	var us_fat_progeny_cg_count: Int = -1
    var us_fat_progeny_cg_count_str: String = "unset"
	var source: String = "unset"
    var source_str: String = "unset"
	var ced: Double = -1.0
    var ced_str: String = "unset"
	var ced_accuracy: Double = -1.0
    var ced_accuracy_str: String = "unset"
	var cem: Double = -1.0
    var cem_str: String = "unset"
	var cem_accuracy: Double = -1.0
    var cem_accuracy_str: String = "unset"
	var carc_wt: Double = -1.0
    var carc_wt_str: String = "unset"
	var carc_wt_accuracy: Double = -1.0
    var carc_wt_accuracy_str: String = "unset"
	var carc_rea: Double = -1.0
    var carc_rea_str: String = "unset"
	var carc_rea_accuracy: Double = -1.0
    var carc_rea_accuracy_str: String = "unset"
	var carc_fat: Double = -1.0
    var carc_fat_str: String = "unset"
	var carc_fat_accuracy: Double = -1.0
    var carc_fat_accuracy_str: String = "unset"
	var carc_marb: Double = -1.0
    var carc_marb_str: String = "unset"
	var carc_marb_accuracy: Double = -1.0
    var carc_marb_accuracy_str: String = "unset"
	
	func setId(_id: Int?) {
        self._id = _id ?? 0
        let _id2 = _id ?? 0
        self._id_str = String(_id2)
        self._id_str = (self._id_str == "0") ? "" : self._id_str
    }
    func getId() -> Int {
        return self._id
    }
    func getIdType() -> String {
        return "Int"
    };
	func getIdStr() -> String {
        return _id_str
    };
	func getIdStrPG() -> String {
        return _id_str
    };

	func setAnimalId(animal_id: Int?) {
        self.animal_id = animal_id ?? 0
        let animal_id2 = animal_id ?? 0
        self.animal_id_str = String(animal_id2)
        self.animal_id_str = (self.animal_id_str == "0") ? "" : self.animal_id_str
    }
    func getAnimalId() -> Int {
        return self.animal_id
    }
    func getAnimalIdType() -> String {
        return "Int"
    };
	func getAnimalIdStr() -> String {
        return animal_id_str
    };
	func getAnimalIdStrPG() -> String {
        return animal_id_str
    };

	func setAnimalRegistration(animal_registration: String?) {
        self.animal_registration = animal_registration ?? ""
        self.animal_registration_str = String(self.animal_registration)
    }
    func getAnimalRegistration() -> String {
        return self.animal_registration
    }
    func getAnimalRegistrationType() -> String {
        return "String"
    };
	func getAnimalRegistrationStr() -> String {
        return animal_registration_str == "unset" ? "" : animal_registration_str
    };
	func getAnimalRegistrationStrPG() -> String {
        return animal_registration_str == "unset" ? "" : animal_registration_str
    };

	func setAnimalPrivateHerdId(animal_private_herd_id: String?) {
        self.animal_private_herd_id = animal_private_herd_id ?? ""
        self.animal_private_herd_id_str = String(self.animal_private_herd_id)
    }
    func getAnimalPrivateHerdId() -> String {
        return self.animal_private_herd_id
    }
    func getAnimalPrivateHerdIdType() -> String {
        return "String"
    };
	func getAnimalPrivateHerdIdStr() -> String {
        return animal_private_herd_id_str == "unset" ? "" : animal_private_herd_id_str
    };
	func getAnimalPrivateHerdIdStrPG() -> String {
        return animal_private_herd_id_str == "unset" ? "" : animal_private_herd_id_str
    };

	func setRecordType(record_type: String?) {
        self.record_type = record_type ?? ""
        self.record_type_str = String(self.record_type)
    }
    func getRecordType() -> String {
        return self.record_type
    }
    func getRecordTypeType() -> String {
        return "String"
    };
	func getRecordTypeStr() -> String {
        return record_type_str == "unset" ? "" : record_type_str
    };
	func getRecordTypeStrPG() -> String {
        return record_type_str == "unset" ? "" : record_type_str
    };

	func setActive(active: Int?) {
        self.active = active ?? 0
        self.active_str = ((self.active) == 1) ? "t" : "f"
    }
    func getActive() -> Int {
        return self.active
    }
    func getActiveType() -> String {
        return "Int"
    };
	func getActiveStr() -> String {
        return String(active)
    };
	func getActiveStrPG() -> String {
        return active_str
    };

	func setProgenyCount(progeny_count: Int?) {
        self.progeny_count = progeny_count ?? 0
        let progeny_count2 = progeny_count ?? 0
        self.progeny_count_str = String(progeny_count2)
        self.progeny_count_str = (self.progeny_count_str == "0") ? "" : self.progeny_count_str
    }
    func getProgenyCount() -> Int {
        return self.progeny_count
    }
    func getProgenyCountType() -> String {
        return "Int"
    };
	func getProgenyCountStr() -> String {
        return progeny_count_str
    };
	func getProgenyCountStrPG() -> String {
        return progeny_count_str
    };

	func setAnimalSex(animal_sex: String?) {
        self.animal_sex = animal_sex ?? ""
        self.animal_sex_str = String(self.animal_sex)
    }
    func getAnimalSex() -> String {
        return self.animal_sex
    }
    func getAnimalSexType() -> String {
        return "String"
    };
	func getAnimalSexStr() -> String {
        return animal_sex_str == "unset" ? "" : animal_sex_str
    };
	func getAnimalSexStrPG() -> String {
        return animal_sex_str == "unset" ? "" : animal_sex_str
    };

	func setAnimalName(animal_name: String?) {
        self.animal_name = animal_name ?? ""
        self.animal_name_str = String(self.animal_name)
    }
    func getAnimalName() -> String {
        return self.animal_name
    }
    func getAnimalNameType() -> String {
        return "String"
    };
	func getAnimalNameStr() -> String {
        return animal_name_str == "unset" ? "" : animal_name_str
    };
	func getAnimalNameStrPG() -> String {
        return animal_name_str == "unset" ? "" : animal_name_str
    };

	func setBirthDate(birth_date: NSDate?) {
        self.birth_date = birth_date ?? NSDate.distantPast() as NSDate
        self.birth_date_str = Utils.dateToString(self.birth_date)
    }
    func getBirthDate() -> NSDate {
        return self.birth_date
    }
    func getBirthDateType() -> String {
        return "NSDate"
    };
	func getBirthDateStr() -> String {
        return birth_date_str == "unset" || birth_date_str == "0000-12-30 00:00:00 +0000" ? "" : birth_date_str
    };
	func getBirthDateStrPG() -> String {
        return birth_date_str == "unset" || birth_date_str == "0000-12-30 00:00:00 +0000" ? "" : birth_date_str
    };

	func setAnimalSire(animal_sire: String?) {
        self.animal_sire = animal_sire ?? ""
        self.animal_sire_str = String(self.animal_sire)
    }
    func getAnimalSire() -> String {
        return self.animal_sire
    }
    func getAnimalSireType() -> String {
        return "String"
    };
	func getAnimalSireStr() -> String {
        return animal_sire_str == "unset" ? "" : animal_sire_str
    };
	func getAnimalSireStrPG() -> String {
        return animal_sire_str == "unset" ? "" : animal_sire_str
    };

	func setAnimalDam(animal_dam: String?) {
        self.animal_dam = animal_dam ?? ""
        self.animal_dam_str = String(self.animal_dam)
    }
    func getAnimalDam() -> String {
        return self.animal_dam
    }
    func getAnimalDamType() -> String {
        return "String"
    };
	func getAnimalDamStr() -> String {
        return animal_dam_str == "unset" ? "" : animal_dam_str
    };
	func getAnimalDamStrPG() -> String {
        return animal_dam_str == "unset" ? "" : animal_dam_str
    };

	func setBw(bw: Double?) {
   	   self.bw = bw ?? 0.0
   	   self.bw_str = String(self.bw)
    }
    func getBw() -> Double {
        return self.bw
    }
    func getBwType() -> String {
        return "Double"
    };
	func getBwStr() -> String {
        return bw_str
    };
	func getBwStrPG() -> String {
        return bw_str
    };

	func setBwAccuracy(bw_accuracy: Double?) {
   	   self.bw_accuracy = bw_accuracy ?? 0.0
   	   self.bw_accuracy_str = String(self.bw_accuracy)
    }
    func getBwAccuracy() -> Double {
        return self.bw_accuracy
    }
    func getBwAccuracyType() -> String {
        return "Double"
    };
	func getBwAccuracyStr() -> String {
        return bw_accuracy_str
    };
	func getBwAccuracyStrPG() -> String {
        return bw_accuracy_str
    };

	func setBwProgenyCount(bw_progeny_count: Int?) {
        self.bw_progeny_count = bw_progeny_count ?? 0
        let bw_progeny_count2 = bw_progeny_count ?? 0
        self.bw_progeny_count_str = String(bw_progeny_count2)
        self.bw_progeny_count_str = (self.bw_progeny_count_str == "0") ? "" : self.bw_progeny_count_str
    }
    func getBwProgenyCount() -> Int {
        return self.bw_progeny_count
    }
    func getBwProgenyCountType() -> String {
        return "Int"
    };
	func getBwProgenyCountStr() -> String {
        return bw_progeny_count_str
    };
	func getBwProgenyCountStrPG() -> String {
        return bw_progeny_count_str
    };

	func setBwProgenyHerdCount(bw_progeny_herd_count: Int?) {
        self.bw_progeny_herd_count = bw_progeny_herd_count ?? 0
        let bw_progeny_herd_count2 = bw_progeny_herd_count ?? 0
        self.bw_progeny_herd_count_str = String(bw_progeny_herd_count2)
        self.bw_progeny_herd_count_str = (self.bw_progeny_herd_count_str == "0") ? "" : self.bw_progeny_herd_count_str
    }
    func getBwProgenyHerdCount() -> Int {
        return self.bw_progeny_herd_count
    }
    func getBwProgenyHerdCountType() -> String {
        return "Int"
    };
	func getBwProgenyHerdCountStr() -> String {
        return bw_progeny_herd_count_str
    };
	func getBwProgenyHerdCountStrPG() -> String {
        return bw_progeny_herd_count_str
    };

	func setBwProgenyCgCount(bw_progeny_cg_count: Int?) {
        self.bw_progeny_cg_count = bw_progeny_cg_count ?? 0
        let bw_progeny_cg_count2 = bw_progeny_cg_count ?? 0
        self.bw_progeny_cg_count_str = String(bw_progeny_cg_count2)
        self.bw_progeny_cg_count_str = (self.bw_progeny_cg_count_str == "0") ? "" : self.bw_progeny_cg_count_str
    }
    func getBwProgenyCgCount() -> Int {
        return self.bw_progeny_cg_count
    }
    func getBwProgenyCgCountType() -> String {
        return "Int"
    };
	func getBwProgenyCgCountStr() -> String {
        return bw_progeny_cg_count_str
    };
	func getBwProgenyCgCountStrPG() -> String {
        return bw_progeny_cg_count_str
    };

	func setWw(ww: Double?) {
   	   self.ww = ww ?? 0.0
   	   self.ww_str = String(self.ww)
    }
    func getWw() -> Double {
        return self.ww
    }
    func getWwType() -> String {
        return "Double"
    };
	func getWwStr() -> String {
        return ww_str
    };
	func getWwStrPG() -> String {
        return ww_str
    };

	func setWwAccuracy(ww_accuracy: Double?) {
   	   self.ww_accuracy = ww_accuracy ?? 0.0
   	   self.ww_accuracy_str = String(self.ww_accuracy)
    }
    func getWwAccuracy() -> Double {
        return self.ww_accuracy
    }
    func getWwAccuracyType() -> String {
        return "Double"
    };
	func getWwAccuracyStr() -> String {
        return ww_accuracy_str
    };
	func getWwAccuracyStrPG() -> String {
        return ww_accuracy_str
    };

	func setWwProgenyCount(ww_progeny_count: Int?) {
        self.ww_progeny_count = ww_progeny_count ?? 0
        let ww_progeny_count2 = ww_progeny_count ?? 0
        self.ww_progeny_count_str = String(ww_progeny_count2)
        self.ww_progeny_count_str = (self.ww_progeny_count_str == "0") ? "" : self.ww_progeny_count_str
    }
    func getWwProgenyCount() -> Int {
        return self.ww_progeny_count
    }
    func getWwProgenyCountType() -> String {
        return "Int"
    };
	func getWwProgenyCountStr() -> String {
        return ww_progeny_count_str
    };
	func getWwProgenyCountStrPG() -> String {
        return ww_progeny_count_str
    };

	func setWwProgenyHerdCount(ww_progeny_herd_count: Int?) {
        self.ww_progeny_herd_count = ww_progeny_herd_count ?? 0
        let ww_progeny_herd_count2 = ww_progeny_herd_count ?? 0
        self.ww_progeny_herd_count_str = String(ww_progeny_herd_count2)
        self.ww_progeny_herd_count_str = (self.ww_progeny_herd_count_str == "0") ? "" : self.ww_progeny_herd_count_str
    }
    func getWwProgenyHerdCount() -> Int {
        return self.ww_progeny_herd_count
    }
    func getWwProgenyHerdCountType() -> String {
        return "Int"
    };
	func getWwProgenyHerdCountStr() -> String {
        return ww_progeny_herd_count_str
    };
	func getWwProgenyHerdCountStrPG() -> String {
        return ww_progeny_herd_count_str
    };

	func setWwProgenyCgCount(ww_progeny_cg_count: Int?) {
        self.ww_progeny_cg_count = ww_progeny_cg_count ?? 0
        let ww_progeny_cg_count2 = ww_progeny_cg_count ?? 0
        self.ww_progeny_cg_count_str = String(ww_progeny_cg_count2)
        self.ww_progeny_cg_count_str = (self.ww_progeny_cg_count_str == "0") ? "" : self.ww_progeny_cg_count_str
    }
    func getWwProgenyCgCount() -> Int {
        return self.ww_progeny_cg_count
    }
    func getWwProgenyCgCountType() -> String {
        return "Int"
    };
	func getWwProgenyCgCountStr() -> String {
        return ww_progeny_cg_count_str
    };
	func getWwProgenyCgCountStrPG() -> String {
        return ww_progeny_cg_count_str
    };

	func setWwMaternal(ww_maternal: Double?) {
   	   self.ww_maternal = ww_maternal ?? 0.0
   	   self.ww_maternal_str = String(self.ww_maternal)
    }
    func getWwMaternal() -> Double {
        return self.ww_maternal
    }
    func getWwMaternalType() -> String {
        return "Double"
    };
	func getWwMaternalStr() -> String {
        return ww_maternal_str
    };
	func getWwMaternalStrPG() -> String {
        return ww_maternal_str
    };

	func setWwMaternalAccuracy(ww_maternal_accuracy: Double?) {
   	   self.ww_maternal_accuracy = ww_maternal_accuracy ?? 0.0
   	   self.ww_maternal_accuracy_str = String(self.ww_maternal_accuracy)
    }
    func getWwMaternalAccuracy() -> Double {
        return self.ww_maternal_accuracy
    }
    func getWwMaternalAccuracyType() -> String {
        return "Double"
    };
	func getWwMaternalAccuracyStr() -> String {
        return ww_maternal_accuracy_str
    };
	func getWwMaternalAccuracyStrPG() -> String {
        return ww_maternal_accuracy_str
    };

	func setWwProgenyDaughterCount(ww_progeny_daughter_count: Int?) {
        self.ww_progeny_daughter_count = ww_progeny_daughter_count ?? 0
        let ww_progeny_daughter_count2 = ww_progeny_daughter_count ?? 0
        self.ww_progeny_daughter_count_str = String(ww_progeny_daughter_count2)
        self.ww_progeny_daughter_count_str = (self.ww_progeny_daughter_count_str == "0") ? "" : self.ww_progeny_daughter_count_str
    }
    func getWwProgenyDaughterCount() -> Int {
        return self.ww_progeny_daughter_count
    }
    func getWwProgenyDaughterCountType() -> String {
        return "Int"
    };
	func getWwProgenyDaughterCountStr() -> String {
        return ww_progeny_daughter_count_str
    };
	func getWwProgenyDaughterCountStrPG() -> String {
        return ww_progeny_daughter_count_str
    };

	func setWwProgenyDaughterHerdCount(ww_progeny_daughter_herd_count: Int?) {
        self.ww_progeny_daughter_herd_count = ww_progeny_daughter_herd_count ?? 0
        let ww_progeny_daughter_herd_count2 = ww_progeny_daughter_herd_count ?? 0
        self.ww_progeny_daughter_herd_count_str = String(ww_progeny_daughter_herd_count2)
        self.ww_progeny_daughter_herd_count_str = (self.ww_progeny_daughter_herd_count_str == "0") ? "" : self.ww_progeny_daughter_herd_count_str
    }
    func getWwProgenyDaughterHerdCount() -> Int {
        return self.ww_progeny_daughter_herd_count
    }
    func getWwProgenyDaughterHerdCountType() -> String {
        return "Int"
    };
	func getWwProgenyDaughterHerdCountStr() -> String {
        return ww_progeny_daughter_herd_count_str
    };
	func getWwProgenyDaughterHerdCountStrPG() -> String {
        return ww_progeny_daughter_herd_count_str
    };

	func setWwProgenyDaughterCgCount(ww_progeny_daughter_cg_count: Int?) {
        self.ww_progeny_daughter_cg_count = ww_progeny_daughter_cg_count ?? 0
        let ww_progeny_daughter_cg_count2 = ww_progeny_daughter_cg_count ?? 0
        self.ww_progeny_daughter_cg_count_str = String(ww_progeny_daughter_cg_count2)
        self.ww_progeny_daughter_cg_count_str = (self.ww_progeny_daughter_cg_count_str == "0") ? "" : self.ww_progeny_daughter_cg_count_str
    }
    func getWwProgenyDaughterCgCount() -> Int {
        return self.ww_progeny_daughter_cg_count
    }
    func getWwProgenyDaughterCgCountType() -> String {
        return "Int"
    };
	func getWwProgenyDaughterCgCountStr() -> String {
        return ww_progeny_daughter_cg_count_str
    };
	func getWwProgenyDaughterCgCountStrPG() -> String {
        return ww_progeny_daughter_cg_count_str
    };

	func setWeaningMilkGrowth(weaning_milk_growth: Double?) {
   	   self.weaning_milk_growth = weaning_milk_growth ?? 0.0
   	   self.weaning_milk_growth_str = String(self.weaning_milk_growth)
    }
    func getWeaningMilkGrowth() -> Double {
        return self.weaning_milk_growth
    }
    func getWeaningMilkGrowthType() -> String {
        return "Double"
    };
	func getWeaningMilkGrowthStr() -> String {
        return weaning_milk_growth_str
    };
	func getWeaningMilkGrowthStrPG() -> String {
        return weaning_milk_growth_str
    };

	func setWeaningPermanentEnvironment(weaning_permanent_environment: Double?) {
   	   self.weaning_permanent_environment = weaning_permanent_environment ?? 0.0
   	   self.weaning_permanent_environment_str = String(self.weaning_permanent_environment)
    }
    func getWeaningPermanentEnvironment() -> Double {
        return self.weaning_permanent_environment
    }
    func getWeaningPermanentEnvironmentType() -> String {
        return "Double"
    };
	func getWeaningPermanentEnvironmentStr() -> String {
        return weaning_permanent_environment_str
    };
	func getWeaningPermanentEnvironmentStrPG() -> String {
        return weaning_permanent_environment_str
    };

	func setYw(yw: Double?) {
   	   self.yw = yw ?? 0.0
   	   self.yw_str = String(self.yw)
    }
    func getYw() -> Double {
        return self.yw
    }
    func getYwType() -> String {
        return "Double"
    };
	func getYwStr() -> String {
        return yw_str
    };
	func getYwStrPG() -> String {
        return yw_str
    };

	func setYwAccuracy(yw_accuracy: Double?) {
   	   self.yw_accuracy = yw_accuracy ?? 0.0
   	   self.yw_accuracy_str = String(self.yw_accuracy)
    }
    func getYwAccuracy() -> Double {
        return self.yw_accuracy
    }
    func getYwAccuracyType() -> String {
        return "Double"
    };
	func getYwAccuracyStr() -> String {
        return yw_accuracy_str
    };
	func getYwAccuracyStrPG() -> String {
        return yw_accuracy_str
    };

	func setYwProgenyCount(yw_progeny_count: Int?) {
        self.yw_progeny_count = yw_progeny_count ?? 0
        let yw_progeny_count2 = yw_progeny_count ?? 0
        self.yw_progeny_count_str = String(yw_progeny_count2)
        self.yw_progeny_count_str = (self.yw_progeny_count_str == "0") ? "" : self.yw_progeny_count_str
    }
    func getYwProgenyCount() -> Int {
        return self.yw_progeny_count
    }
    func getYwProgenyCountType() -> String {
        return "Int"
    };
	func getYwProgenyCountStr() -> String {
        return yw_progeny_count_str
    };
	func getYwProgenyCountStrPG() -> String {
        return yw_progeny_count_str
    };

	func setYwProgenyHerdCount(yw_progeny_herd_count: Int?) {
        self.yw_progeny_herd_count = yw_progeny_herd_count ?? 0
        let yw_progeny_herd_count2 = yw_progeny_herd_count ?? 0
        self.yw_progeny_herd_count_str = String(yw_progeny_herd_count2)
        self.yw_progeny_herd_count_str = (self.yw_progeny_herd_count_str == "0") ? "" : self.yw_progeny_herd_count_str
    }
    func getYwProgenyHerdCount() -> Int {
        return self.yw_progeny_herd_count
    }
    func getYwProgenyHerdCountType() -> String {
        return "Int"
    };
	func getYwProgenyHerdCountStr() -> String {
        return yw_progeny_herd_count_str
    };
	func getYwProgenyHerdCountStrPG() -> String {
        return yw_progeny_herd_count_str
    };

	func setYwProgenyCgCount(yw_progeny_cg_count: Int?) {
        self.yw_progeny_cg_count = yw_progeny_cg_count ?? 0
        let yw_progeny_cg_count2 = yw_progeny_cg_count ?? 0
        self.yw_progeny_cg_count_str = String(yw_progeny_cg_count2)
        self.yw_progeny_cg_count_str = (self.yw_progeny_cg_count_str == "0") ? "" : self.yw_progeny_cg_count_str
    }
    func getYwProgenyCgCount() -> Int {
        return self.yw_progeny_cg_count
    }
    func getYwProgenyCgCountType() -> String {
        return "Int"
    };
	func getYwProgenyCgCountStr() -> String {
        return yw_progeny_cg_count_str
    };
	func getYwProgenyCgCountStrPG() -> String {
        return yw_progeny_cg_count_str
    };

	func setSc(sc: Double?) {
   	   self.sc = sc ?? 0.0
   	   self.sc_str = String(self.sc)
    }
    func getSc() -> Double {
        return self.sc
    }
    func getScType() -> String {
        return "Double"
    };
	func getScStr() -> String {
        return sc_str
    };
	func getScStrPG() -> String {
        return sc_str
    };

	func setScAccuracy(sc_accuracy: Double?) {
   	   self.sc_accuracy = sc_accuracy ?? 0.0
   	   self.sc_accuracy_str = String(self.sc_accuracy)
    }
    func getScAccuracy() -> Double {
        return self.sc_accuracy
    }
    func getScAccuracyType() -> String {
        return "Double"
    };
	func getScAccuracyStr() -> String {
        return sc_accuracy_str
    };
	func getScAccuracyStrPG() -> String {
        return sc_accuracy_str
    };

	func setScProgenyCount(sc_progeny_count: Int?) {
        self.sc_progeny_count = sc_progeny_count ?? 0
        let sc_progeny_count2 = sc_progeny_count ?? 0
        self.sc_progeny_count_str = String(sc_progeny_count2)
        self.sc_progeny_count_str = (self.sc_progeny_count_str == "0") ? "" : self.sc_progeny_count_str
    }
    func getScProgenyCount() -> Int {
        return self.sc_progeny_count
    }
    func getScProgenyCountType() -> String {
        return "Int"
    };
	func getScProgenyCountStr() -> String {
        return sc_progeny_count_str
    };
	func getScProgenyCountStrPG() -> String {
        return sc_progeny_count_str
    };

	func setScProgenyHerdCount(sc_progeny_herd_count: Int?) {
        self.sc_progeny_herd_count = sc_progeny_herd_count ?? 0
        let sc_progeny_herd_count2 = sc_progeny_herd_count ?? 0
        self.sc_progeny_herd_count_str = String(sc_progeny_herd_count2)
        self.sc_progeny_herd_count_str = (self.sc_progeny_herd_count_str == "0") ? "" : self.sc_progeny_herd_count_str
    }
    func getScProgenyHerdCount() -> Int {
        return self.sc_progeny_herd_count
    }
    func getScProgenyHerdCountType() -> String {
        return "Int"
    };
	func getScProgenyHerdCountStr() -> String {
        return sc_progeny_herd_count_str
    };
	func getScProgenyHerdCountStrPG() -> String {
        return sc_progeny_herd_count_str
    };

	func setScProgenyCgCount(sc_progeny_cg_count: Int?) {
        self.sc_progeny_cg_count = sc_progeny_cg_count ?? 0
        let sc_progeny_cg_count2 = sc_progeny_cg_count ?? 0
        self.sc_progeny_cg_count_str = String(sc_progeny_cg_count2)
        self.sc_progeny_cg_count_str = (self.sc_progeny_cg_count_str == "0") ? "" : self.sc_progeny_cg_count_str
    }
    func getScProgenyCgCount() -> Int {
        return self.sc_progeny_cg_count
    }
    func getScProgenyCgCountType() -> String {
        return "Int"
    };
	func getScProgenyCgCountStr() -> String {
        return sc_progeny_cg_count_str
    };
	func getScProgenyCgCountStrPG() -> String {
        return sc_progeny_cg_count_str
    };

	func setUsRea(us_rea: Double?) {
   	   self.us_rea = us_rea ?? 0.0
   	   self.us_rea_str = String(self.us_rea)
    }
    func getUsRea() -> Double {
        return self.us_rea
    }
    func getUsReaType() -> String {
        return "Double"
    };
	func getUsReaStr() -> String {
        return us_rea_str
    };
	func getUsReaStrPG() -> String {
        return us_rea_str
    };

	func setUsReaAccuracy(us_rea_accuracy: Double?) {
   	   self.us_rea_accuracy = us_rea_accuracy ?? 0.0
   	   self.us_rea_accuracy_str = String(self.us_rea_accuracy)
    }
    func getUsReaAccuracy() -> Double {
        return self.us_rea_accuracy
    }
    func getUsReaAccuracyType() -> String {
        return "Double"
    };
	func getUsReaAccuracyStr() -> String {
        return us_rea_accuracy_str
    };
	func getUsReaAccuracyStrPG() -> String {
        return us_rea_accuracy_str
    };

	func setUsReaProgenyCount(us_rea_progeny_count: Int?) {
        self.us_rea_progeny_count = us_rea_progeny_count ?? 0
        let us_rea_progeny_count2 = us_rea_progeny_count ?? 0
        self.us_rea_progeny_count_str = String(us_rea_progeny_count2)
        self.us_rea_progeny_count_str = (self.us_rea_progeny_count_str == "0") ? "" : self.us_rea_progeny_count_str
    }
    func getUsReaProgenyCount() -> Int {
        return self.us_rea_progeny_count
    }
    func getUsReaProgenyCountType() -> String {
        return "Int"
    };
	func getUsReaProgenyCountStr() -> String {
        return us_rea_progeny_count_str
    };
	func getUsReaProgenyCountStrPG() -> String {
        return us_rea_progeny_count_str
    };

	func setUsReaProgenyHerdCount(us_rea_progeny_herd_count: Int?) {
        self.us_rea_progeny_herd_count = us_rea_progeny_herd_count ?? 0
        let us_rea_progeny_herd_count2 = us_rea_progeny_herd_count ?? 0
        self.us_rea_progeny_herd_count_str = String(us_rea_progeny_herd_count2)
        self.us_rea_progeny_herd_count_str = (self.us_rea_progeny_herd_count_str == "0") ? "" : self.us_rea_progeny_herd_count_str
    }
    func getUsReaProgenyHerdCount() -> Int {
        return self.us_rea_progeny_herd_count
    }
    func getUsReaProgenyHerdCountType() -> String {
        return "Int"
    };
	func getUsReaProgenyHerdCountStr() -> String {
        return us_rea_progeny_herd_count_str
    };
	func getUsReaProgenyHerdCountStrPG() -> String {
        return us_rea_progeny_herd_count_str
    };

	func setUsReaProgenyCgCount(us_rea_progeny_cg_count: Int?) {
        self.us_rea_progeny_cg_count = us_rea_progeny_cg_count ?? 0
        let us_rea_progeny_cg_count2 = us_rea_progeny_cg_count ?? 0
        self.us_rea_progeny_cg_count_str = String(us_rea_progeny_cg_count2)
        self.us_rea_progeny_cg_count_str = (self.us_rea_progeny_cg_count_str == "0") ? "" : self.us_rea_progeny_cg_count_str
    }
    func getUsReaProgenyCgCount() -> Int {
        return self.us_rea_progeny_cg_count
    }
    func getUsReaProgenyCgCountType() -> String {
        return "Int"
    };
	func getUsReaProgenyCgCountStr() -> String {
        return us_rea_progeny_cg_count_str
    };
	func getUsReaProgenyCgCountStrPG() -> String {
        return us_rea_progeny_cg_count_str
    };

	func setUsImf(us_imf: Double?) {
   	   self.us_imf = us_imf ?? 0.0
   	   self.us_imf_str = String(self.us_imf)
    }
    func getUsImf() -> Double {
        return self.us_imf
    }
    func getUsImfType() -> String {
        return "Double"
    };
	func getUsImfStr() -> String {
        return us_imf_str
    };
	func getUsImfStrPG() -> String {
        return us_imf_str
    };

	func setUsImfAccuracy(us_imf_accuracy: Double?) {
   	   self.us_imf_accuracy = us_imf_accuracy ?? 0.0
   	   self.us_imf_accuracy_str = String(self.us_imf_accuracy)
    }
    func getUsImfAccuracy() -> Double {
        return self.us_imf_accuracy
    }
    func getUsImfAccuracyType() -> String {
        return "Double"
    };
	func getUsImfAccuracyStr() -> String {
        return us_imf_accuracy_str
    };
	func getUsImfAccuracyStrPG() -> String {
        return us_imf_accuracy_str
    };

	func setUsImfProgenyCount(us_imf_progeny_count: Int?) {
        self.us_imf_progeny_count = us_imf_progeny_count ?? 0
        let us_imf_progeny_count2 = us_imf_progeny_count ?? 0
        self.us_imf_progeny_count_str = String(us_imf_progeny_count2)
        self.us_imf_progeny_count_str = (self.us_imf_progeny_count_str == "0") ? "" : self.us_imf_progeny_count_str
    }
    func getUsImfProgenyCount() -> Int {
        return self.us_imf_progeny_count
    }
    func getUsImfProgenyCountType() -> String {
        return "Int"
    };
	func getUsImfProgenyCountStr() -> String {
        return us_imf_progeny_count_str
    };
	func getUsImfProgenyCountStrPG() -> String {
        return us_imf_progeny_count_str
    };

	func setUsImfProgenyHerdCount(us_imf_progeny_herd_count: Int?) {
        self.us_imf_progeny_herd_count = us_imf_progeny_herd_count ?? 0
        let us_imf_progeny_herd_count2 = us_imf_progeny_herd_count ?? 0
        self.us_imf_progeny_herd_count_str = String(us_imf_progeny_herd_count2)
        self.us_imf_progeny_herd_count_str = (self.us_imf_progeny_herd_count_str == "0") ? "" : self.us_imf_progeny_herd_count_str
    }
    func getUsImfProgenyHerdCount() -> Int {
        return self.us_imf_progeny_herd_count
    }
    func getUsImfProgenyHerdCountType() -> String {
        return "Int"
    };
	func getUsImfProgenyHerdCountStr() -> String {
        return us_imf_progeny_herd_count_str
    };
	func getUsImfProgenyHerdCountStrPG() -> String {
        return us_imf_progeny_herd_count_str
    };

	func setUsImfProgenyCgCount(us_imf_progeny_cg_count: Int?) {
        self.us_imf_progeny_cg_count = us_imf_progeny_cg_count ?? 0
        let us_imf_progeny_cg_count2 = us_imf_progeny_cg_count ?? 0
        self.us_imf_progeny_cg_count_str = String(us_imf_progeny_cg_count2)
        self.us_imf_progeny_cg_count_str = (self.us_imf_progeny_cg_count_str == "0") ? "" : self.us_imf_progeny_cg_count_str
    }
    func getUsImfProgenyCgCount() -> Int {
        return self.us_imf_progeny_cg_count
    }
    func getUsImfProgenyCgCountType() -> String {
        return "Int"
    };
	func getUsImfProgenyCgCountStr() -> String {
        return us_imf_progeny_cg_count_str
    };
	func getUsImfProgenyCgCountStrPG() -> String {
        return us_imf_progeny_cg_count_str
    };

	func setUsFat(us_fat: Double?) {
   	   self.us_fat = us_fat ?? 0.0
   	   self.us_fat_str = String(self.us_fat)
    }
    func getUsFat() -> Double {
        return self.us_fat
    }
    func getUsFatType() -> String {
        return "Double"
    };
	func getUsFatStr() -> String {
        return us_fat_str
    };
	func getUsFatStrPG() -> String {
        return us_fat_str
    };

	func setUsFatAccuracy(us_fat_accuracy: Double?) {
   	   self.us_fat_accuracy = us_fat_accuracy ?? 0.0
   	   self.us_fat_accuracy_str = String(self.us_fat_accuracy)
    }
    func getUsFatAccuracy() -> Double {
        return self.us_fat_accuracy
    }
    func getUsFatAccuracyType() -> String {
        return "Double"
    };
	func getUsFatAccuracyStr() -> String {
        return us_fat_accuracy_str
    };
	func getUsFatAccuracyStrPG() -> String {
        return us_fat_accuracy_str
    };

	func setUsFatProgenyCount(us_fat_progeny_count: Int?) {
        self.us_fat_progeny_count = us_fat_progeny_count ?? 0
        let us_fat_progeny_count2 = us_fat_progeny_count ?? 0
        self.us_fat_progeny_count_str = String(us_fat_progeny_count2)
        self.us_fat_progeny_count_str = (self.us_fat_progeny_count_str == "0") ? "" : self.us_fat_progeny_count_str
    }
    func getUsFatProgenyCount() -> Int {
        return self.us_fat_progeny_count
    }
    func getUsFatProgenyCountType() -> String {
        return "Int"
    };
	func getUsFatProgenyCountStr() -> String {
        return us_fat_progeny_count_str
    };
	func getUsFatProgenyCountStrPG() -> String {
        return us_fat_progeny_count_str
    };

	func setUsFatProgenyHerdCount(us_fat_progeny_herd_count: Int?) {
        self.us_fat_progeny_herd_count = us_fat_progeny_herd_count ?? 0
        let us_fat_progeny_herd_count2 = us_fat_progeny_herd_count ?? 0
        self.us_fat_progeny_herd_count_str = String(us_fat_progeny_herd_count2)
        self.us_fat_progeny_herd_count_str = (self.us_fat_progeny_herd_count_str == "0") ? "" : self.us_fat_progeny_herd_count_str
    }
    func getUsFatProgenyHerdCount() -> Int {
        return self.us_fat_progeny_herd_count
    }
    func getUsFatProgenyHerdCountType() -> String {
        return "Int"
    };
	func getUsFatProgenyHerdCountStr() -> String {
        return us_fat_progeny_herd_count_str
    };
	func getUsFatProgenyHerdCountStrPG() -> String {
        return us_fat_progeny_herd_count_str
    };

	func setUsFatProgenyCgCount(us_fat_progeny_cg_count: Int?) {
        self.us_fat_progeny_cg_count = us_fat_progeny_cg_count ?? 0
        let us_fat_progeny_cg_count2 = us_fat_progeny_cg_count ?? 0
        self.us_fat_progeny_cg_count_str = String(us_fat_progeny_cg_count2)
        self.us_fat_progeny_cg_count_str = (self.us_fat_progeny_cg_count_str == "0") ? "" : self.us_fat_progeny_cg_count_str
    }
    func getUsFatProgenyCgCount() -> Int {
        return self.us_fat_progeny_cg_count
    }
    func getUsFatProgenyCgCountType() -> String {
        return "Int"
    };
	func getUsFatProgenyCgCountStr() -> String {
        return us_fat_progeny_cg_count_str
    };
	func getUsFatProgenyCgCountStrPG() -> String {
        return us_fat_progeny_cg_count_str
    };

	func setSource(source: String?) {
        self.source = source ?? ""
        self.source_str = String(self.source)
    }
    func getSource() -> String {
        return self.source
    }
    func getSourceType() -> String {
        return "String"
    };
	func getSourceStr() -> String {
        return source_str == "unset" ? "" : source_str
    };
	func getSourceStrPG() -> String {
        return source_str == "unset" ? "" : source_str
    };

	func setCed(ced: Double?) {
   	   self.ced = ced ?? 0.0
   	   self.ced_str = String(self.ced)
    }
    func getCed() -> Double {
        return self.ced
    }
    func getCedType() -> String {
        return "Double"
    };
	func getCedStr() -> String {
        return ced_str
    };
	func getCedStrPG() -> String {
        return ced_str
    };

	func setCedAccuracy(ced_accuracy: Double?) {
   	   self.ced_accuracy = ced_accuracy ?? 0.0
   	   self.ced_accuracy_str = String(self.ced_accuracy)
    }
    func getCedAccuracy() -> Double {
        return self.ced_accuracy
    }
    func getCedAccuracyType() -> String {
        return "Double"
    };
	func getCedAccuracyStr() -> String {
        return ced_accuracy_str
    };
	func getCedAccuracyStrPG() -> String {
        return ced_accuracy_str
    };

	func setCem(cem: Double?) {
   	   self.cem = cem ?? 0.0
   	   self.cem_str = String(self.cem)
    }
    func getCem() -> Double {
        return self.cem
    }
    func getCemType() -> String {
        return "Double"
    };
	func getCemStr() -> String {
        return cem_str
    };
	func getCemStrPG() -> String {
        return cem_str
    };

	func setCemAccuracy(cem_accuracy: Double?) {
   	   self.cem_accuracy = cem_accuracy ?? 0.0
   	   self.cem_accuracy_str = String(self.cem_accuracy)
    }
    func getCemAccuracy() -> Double {
        return self.cem_accuracy
    }
    func getCemAccuracyType() -> String {
        return "Double"
    };
	func getCemAccuracyStr() -> String {
        return cem_accuracy_str
    };
	func getCemAccuracyStrPG() -> String {
        return cem_accuracy_str
    };

	func setCarcWt(carc_wt: Double?) {
   	   self.carc_wt = carc_wt ?? 0.0
   	   self.carc_wt_str = String(self.carc_wt)
    }
    func getCarcWt() -> Double {
        return self.carc_wt
    }
    func getCarcWtType() -> String {
        return "Double"
    };
	func getCarcWtStr() -> String {
        return carc_wt_str
    };
	func getCarcWtStrPG() -> String {
        return carc_wt_str
    };

	func setCarcWtAccuracy(carc_wt_accuracy: Double?) {
   	   self.carc_wt_accuracy = carc_wt_accuracy ?? 0.0
   	   self.carc_wt_accuracy_str = String(self.carc_wt_accuracy)
    }
    func getCarcWtAccuracy() -> Double {
        return self.carc_wt_accuracy
    }
    func getCarcWtAccuracyType() -> String {
        return "Double"
    };
	func getCarcWtAccuracyStr() -> String {
        return carc_wt_accuracy_str
    };
	func getCarcWtAccuracyStrPG() -> String {
        return carc_wt_accuracy_str
    };

	func setCarcRea(carc_rea: Double?) {
   	   self.carc_rea = carc_rea ?? 0.0
   	   self.carc_rea_str = String(self.carc_rea)
    }
    func getCarcRea() -> Double {
        return self.carc_rea
    }
    func getCarcReaType() -> String {
        return "Double"
    };
	func getCarcReaStr() -> String {
        return carc_rea_str
    };
	func getCarcReaStrPG() -> String {
        return carc_rea_str
    };

	func setCarcReaAccuracy(carc_rea_accuracy: Double?) {
   	   self.carc_rea_accuracy = carc_rea_accuracy ?? 0.0
   	   self.carc_rea_accuracy_str = String(self.carc_rea_accuracy)
    }
    func getCarcReaAccuracy() -> Double {
        return self.carc_rea_accuracy
    }
    func getCarcReaAccuracyType() -> String {
        return "Double"
    };
	func getCarcReaAccuracyStr() -> String {
        return carc_rea_accuracy_str
    };
	func getCarcReaAccuracyStrPG() -> String {
        return carc_rea_accuracy_str
    };

	func setCarcFat(carc_fat: Double?) {
   	   self.carc_fat = carc_fat ?? 0.0
   	   self.carc_fat_str = String(self.carc_fat)
    }
    func getCarcFat() -> Double {
        return self.carc_fat
    }
    func getCarcFatType() -> String {
        return "Double"
    };
	func getCarcFatStr() -> String {
        return carc_fat_str
    };
	func getCarcFatStrPG() -> String {
        return carc_fat_str
    };

	func setCarcFatAccuracy(carc_fat_accuracy: Double?) {
   	   self.carc_fat_accuracy = carc_fat_accuracy ?? 0.0
   	   self.carc_fat_accuracy_str = String(self.carc_fat_accuracy)
    }
    func getCarcFatAccuracy() -> Double {
        return self.carc_fat_accuracy
    }
    func getCarcFatAccuracyType() -> String {
        return "Double"
    };
	func getCarcFatAccuracyStr() -> String {
        return carc_fat_accuracy_str
    };
	func getCarcFatAccuracyStrPG() -> String {
        return carc_fat_accuracy_str
    };

	func setCarcMarb(carc_marb: Double?) {
   	   self.carc_marb = carc_marb ?? 0.0
   	   self.carc_marb_str = String(self.carc_marb)
    }
    func getCarcMarb() -> Double {
        return self.carc_marb
    }
    func getCarcMarbType() -> String {
        return "Double"
    };
	func getCarcMarbStr() -> String {
        return carc_marb_str
    };
	func getCarcMarbStrPG() -> String {
        return carc_marb_str
    };

	func setCarcMarbAccuracy(carc_marb_accuracy: Double?) {
   	   self.carc_marb_accuracy = carc_marb_accuracy ?? 0.0
   	   self.carc_marb_accuracy_str = String(self.carc_marb_accuracy)
    }
    func getCarcMarbAccuracy() -> Double {
        return self.carc_marb_accuracy
    }
    func getCarcMarbAccuracyType() -> String {
        return "Double"
    };
	func getCarcMarbAccuracyStr() -> String {
        return carc_marb_accuracy_str
    };
	func getCarcMarbAccuracyStrPG() -> String {
        return carc_marb_accuracy_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "_id":
				return "Int"
			case "animal_id":
				return "Int"
			case "animal_registration":
				return "String"
			case "animal_private_herd_id":
				return "String"
			case "record_type":
				return "String"
			case "active":
				return "Int"
			case "progeny_count":
				return "Int"
			case "animal_sex":
				return "String"
			case "animal_name":
				return "String"
			case "birth_date":
				return "NSDate"
			case "animal_sire":
				return "String"
			case "animal_dam":
				return "String"
			case "bw":
				return "Double"
			case "bw_accuracy":
				return "Double"
			case "bw_progeny_count":
				return "Int"
			case "bw_progeny_herd_count":
				return "Int"
			case "bw_progeny_cg_count":
				return "Int"
			case "ww":
				return "Double"
			case "ww_accuracy":
				return "Double"
			case "ww_progeny_count":
				return "Int"
			case "ww_progeny_herd_count":
				return "Int"
			case "ww_progeny_cg_count":
				return "Int"
			case "ww_maternal":
				return "Double"
			case "ww_maternal_accuracy":
				return "Double"
			case "ww_progeny_daughter_count":
				return "Int"
			case "ww_progeny_daughter_herd_count":
				return "Int"
			case "ww_progeny_daughter_cg_count":
				return "Int"
			case "weaning_milk_growth":
				return "Double"
			case "weaning_permanent_environment":
				return "Double"
			case "yw":
				return "Double"
			case "yw_accuracy":
				return "Double"
			case "yw_progeny_count":
				return "Int"
			case "yw_progeny_herd_count":
				return "Int"
			case "yw_progeny_cg_count":
				return "Int"
			case "sc":
				return "Double"
			case "sc_accuracy":
				return "Double"
			case "sc_progeny_count":
				return "Int"
			case "sc_progeny_herd_count":
				return "Int"
			case "sc_progeny_cg_count":
				return "Int"
			case "us_rea":
				return "Double"
			case "us_rea_accuracy":
				return "Double"
			case "us_rea_progeny_count":
				return "Int"
			case "us_rea_progeny_herd_count":
				return "Int"
			case "us_rea_progeny_cg_count":
				return "Int"
			case "us_imf":
				return "Double"
			case "us_imf_accuracy":
				return "Double"
			case "us_imf_progeny_count":
				return "Int"
			case "us_imf_progeny_herd_count":
				return "Int"
			case "us_imf_progeny_cg_count":
				return "Int"
			case "us_fat":
				return "Double"
			case "us_fat_accuracy":
				return "Double"
			case "us_fat_progeny_count":
				return "Int"
			case "us_fat_progeny_herd_count":
				return "Int"
			case "us_fat_progeny_cg_count":
				return "Int"
			case "source":
				return "String"
			case "ced":
				return "Double"
			case "ced_accuracy":
				return "Double"
			case "cem":
				return "Double"
			case "cem_accuracy":
				return "Double"
			case "carc_wt":
				return "Double"
			case "carc_wt_accuracy":
				return "Double"
			case "carc_rea":
				return "Double"
			case "carc_rea_accuracy":
				return "Double"
			case "carc_fat":
				return "Double"
			case "carc_fat_accuracy":
				return "Double"
			case "carc_marb":
				return "Double"
			case "carc_marb_accuracy":
				return "Double"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "_id":
			return self.getIdStr()
			case "animal_id":
			return self.getAnimalIdStr()
			case "animal_registration":
			return self.getAnimalRegistrationStr()
			case "animal_private_herd_id":
			return self.getAnimalPrivateHerdIdStr()
			case "record_type":
			return self.getRecordTypeStr()
			case "active":
			return self.getActiveStr()
			case "progeny_count":
			return self.getProgenyCountStr()
			case "animal_sex":
			return self.getAnimalSexStr()
			case "animal_name":
			return self.getAnimalNameStr()
			case "birth_date":
			return self.getBirthDateStr()
			case "animal_sire":
			return self.getAnimalSireStr()
			case "animal_dam":
			return self.getAnimalDamStr()
			case "bw":
			return self.getBwStr()
			case "bw_accuracy":
			return self.getBwAccuracyStr()
			case "bw_progeny_count":
			return self.getBwProgenyCountStr()
			case "bw_progeny_herd_count":
			return self.getBwProgenyHerdCountStr()
			case "bw_progeny_cg_count":
			return self.getBwProgenyCgCountStr()
			case "ww":
			return self.getWwStr()
			case "ww_accuracy":
			return self.getWwAccuracyStr()
			case "ww_progeny_count":
			return self.getWwProgenyCountStr()
			case "ww_progeny_herd_count":
			return self.getWwProgenyHerdCountStr()
			case "ww_progeny_cg_count":
			return self.getWwProgenyCgCountStr()
			case "ww_maternal":
			return self.getWwMaternalStr()
			case "ww_maternal_accuracy":
			return self.getWwMaternalAccuracyStr()
			case "ww_progeny_daughter_count":
			return self.getWwProgenyDaughterCountStr()
			case "ww_progeny_daughter_herd_count":
			return self.getWwProgenyDaughterHerdCountStr()
			case "ww_progeny_daughter_cg_count":
			return self.getWwProgenyDaughterCgCountStr()
			case "weaning_milk_growth":
			return self.getWeaningMilkGrowthStr()
			case "weaning_permanent_environment":
			return self.getWeaningPermanentEnvironmentStr()
			case "yw":
			return self.getYwStr()
			case "yw_accuracy":
			return self.getYwAccuracyStr()
			case "yw_progeny_count":
			return self.getYwProgenyCountStr()
			case "yw_progeny_herd_count":
			return self.getYwProgenyHerdCountStr()
			case "yw_progeny_cg_count":
			return self.getYwProgenyCgCountStr()
			case "sc":
			return self.getScStr()
			case "sc_accuracy":
			return self.getScAccuracyStr()
			case "sc_progeny_count":
			return self.getScProgenyCountStr()
			case "sc_progeny_herd_count":
			return self.getScProgenyHerdCountStr()
			case "sc_progeny_cg_count":
			return self.getScProgenyCgCountStr()
			case "us_rea":
			return self.getUsReaStr()
			case "us_rea_accuracy":
			return self.getUsReaAccuracyStr()
			case "us_rea_progeny_count":
			return self.getUsReaProgenyCountStr()
			case "us_rea_progeny_herd_count":
			return self.getUsReaProgenyHerdCountStr()
			case "us_rea_progeny_cg_count":
			return self.getUsReaProgenyCgCountStr()
			case "us_imf":
			return self.getUsImfStr()
			case "us_imf_accuracy":
			return self.getUsImfAccuracyStr()
			case "us_imf_progeny_count":
			return self.getUsImfProgenyCountStr()
			case "us_imf_progeny_herd_count":
			return self.getUsImfProgenyHerdCountStr()
			case "us_imf_progeny_cg_count":
			return self.getUsImfProgenyCgCountStr()
			case "us_fat":
			return self.getUsFatStr()
			case "us_fat_accuracy":
			return self.getUsFatAccuracyStr()
			case "us_fat_progeny_count":
			return self.getUsFatProgenyCountStr()
			case "us_fat_progeny_herd_count":
			return self.getUsFatProgenyHerdCountStr()
			case "us_fat_progeny_cg_count":
			return self.getUsFatProgenyCgCountStr()
			case "source":
			return self.getSourceStr()
			case "ced":
			return self.getCedStr()
			case "ced_accuracy":
			return self.getCedAccuracyStr()
			case "cem":
			return self.getCemStr()
			case "cem_accuracy":
			return self.getCemAccuracyStr()
			case "carc_wt":
			return self.getCarcWtStr()
			case "carc_wt_accuracy":
			return self.getCarcWtAccuracyStr()
			case "carc_rea":
			return self.getCarcReaStr()
			case "carc_rea_accuracy":
			return self.getCarcReaAccuracyStr()
			case "carc_fat":
			return self.getCarcFatStr()
			case "carc_fat_accuracy":
			return self.getCarcFatAccuracyStr()
			case "carc_marb":
			return self.getCarcMarbStr()
			case "carc_marb_accuracy":
			return self.getCarcMarbAccuracyStr()
			default:

			break;
		}
		return ""
	}
    func keyIsSet(field: String) -> Bool {

        var i = 0
        let obj = self
        let reflected = Mirror(reflecting: obj)
        for child in reflected.children {
            guard let key = child.label else { continue }
            let value: Any = child.value
            if key == field {
                let field_type = self.getFieldType(field)
                switch (field_type) {
                    case "String":
                        let str4 = value as! String
                        if str4 == "unset" {
                            return false
                        }
                    break
                    case "NSDate":
                        let date4 = value as! NSDate
                        if date4 == NSDate.distantFuture() as NSDate {
                            return false
                        }
                    break
                    case "Int":
                        let int4 = value as! Int
                        if int4 == -1 {
                            return false
                        }
                    break
                    case "Double":
                        let doub4 = value as! Double
                        if doub4 == -1.0 {
                            return false
                        }
                    break;
                    default:
                    break;
                }
                break
            }
            i += 1
        }
        return true
    }
    func loadByRegistration(registration: String) -> [String: String] {
        
        let query =
        "select * from vw_animal_epd where animal_registration = ? "

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(registration)

        print("print epd query")
        SDOld.printQuery(query, withArgs: fieldsArr)
        
        let fields = [String: String]()
        let (resultset, error) = SDOld.executeQuery(query, withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setId((row["_id"]?.asInt()));
				self.setAnimalId((row["animal_id"]?.asInt()));
				self.setAnimalRegistration((row["animal_registration"]?.asString()));
				self.setAnimalPrivateHerdId((row["animal_private_herd_id"]?.asString()));
				self.setRecordType((row["record_type"]?.asString()));
				self.setActive((row["active"]?.asMyBool()));
				self.setProgenyCount((row["progeny_count"]?.asInt()));
				self.setAnimalSex((row["animal_sex"]?.asString()));
				self.setAnimalName((row["animal_name"]?.asString()));
				self.setBirthDate((row["birth_date"]?.asDate()));
				self.setAnimalSire((row["animal_sire"]?.asString()));
				self.setAnimalDam((row["animal_dam"]?.asString()));
				self.setBw((row["bw"]?.asDouble()));
				self.setBwAccuracy((row["bw_accuracy"]?.asDouble()));
				self.setBwProgenyCount((row["bw_progeny_count"]?.asInt()));
				self.setBwProgenyHerdCount((row["bw_progeny_herd_count"]?.asInt()));
				self.setBwProgenyCgCount((row["bw_progeny_cg_count"]?.asInt()));
				self.setWw((row["ww"]?.asDouble()));
				self.setWwAccuracy((row["ww_accuracy"]?.asDouble()));
				self.setWwProgenyCount((row["ww_progeny_count"]?.asInt()));
				self.setWwProgenyHerdCount((row["ww_progeny_herd_count"]?.asInt()));
				self.setWwProgenyCgCount((row["ww_progeny_cg_count"]?.asInt()));
				self.setWwMaternal((row["ww_maternal"]?.asDouble()));
				self.setWwMaternalAccuracy((row["ww_maternal_accuracy"]?.asDouble()));
				self.setWwProgenyDaughterCount((row["ww_progeny_daughter_count"]?.asInt()));
				self.setWwProgenyDaughterHerdCount((row["ww_progeny_daughter_herd_count"]?.asInt()));
				self.setWwProgenyDaughterCgCount((row["ww_progeny_daughter_cg_count"]?.asInt()));
				self.setWeaningMilkGrowth((row["weaning_milk_growth"]?.asDouble()));
				self.setWeaningPermanentEnvironment((row["weaning_permanent_environment"]?.asDouble()));
				self.setYw((row["yw"]?.asDouble()));
				self.setYwAccuracy((row["yw_accuracy"]?.asDouble()));
				self.setYwProgenyCount((row["yw_progeny_count"]?.asInt()));
				self.setYwProgenyHerdCount((row["yw_progeny_herd_count"]?.asInt()));
				self.setYwProgenyCgCount((row["yw_progeny_cg_count"]?.asInt()));
				self.setSc((row["sc"]?.asDouble()));
				self.setScAccuracy((row["sc_accuracy"]?.asDouble()));
				self.setScProgenyCount((row["sc_progeny_count"]?.asInt()));
				self.setScProgenyHerdCount((row["sc_progeny_herd_count"]?.asInt()));
				self.setScProgenyCgCount((row["sc_progeny_cg_count"]?.asInt()));
				self.setUsRea((row["us_rea"]?.asDouble()));
				self.setUsReaAccuracy((row["us_rea_accuracy"]?.asDouble()));
				self.setUsReaProgenyCount((row["us_rea_progeny_count"]?.asInt()));
				self.setUsReaProgenyHerdCount((row["us_rea_progeny_herd_count"]?.asInt()));
				self.setUsReaProgenyCgCount((row["us_rea_progeny_cg_count"]?.asInt()));
				self.setUsImf((row["us_imf"]?.asDouble()));
				self.setUsImfAccuracy((row["us_imf_accuracy"]?.asDouble()));
				self.setUsImfProgenyCount((row["us_imf_progeny_count"]?.asInt()));
				self.setUsImfProgenyHerdCount((row["us_imf_progeny_herd_count"]?.asInt()));
				self.setUsImfProgenyCgCount((row["us_imf_progeny_cg_count"]?.asInt()));
				self.setUsFat((row["us_fat"]?.asDouble()));
				self.setUsFatAccuracy((row["us_fat_accuracy"]?.asDouble()));
				self.setUsFatProgenyCount((row["us_fat_progeny_count"]?.asInt()));
				self.setUsFatProgenyHerdCount((row["us_fat_progeny_herd_count"]?.asInt()));
				self.setUsFatProgenyCgCount((row["us_fat_progeny_cg_count"]?.asInt()));
				self.setSource((row["source"]?.asString()));
				self.setCed((row["ced"]?.asDouble()));
				self.setCedAccuracy((row["ced_accuracy"]?.asDouble()));
				self.setCem((row["cem"]?.asDouble()));
				self.setCemAccuracy((row["cem_accuracy"]?.asDouble()));
				self.setCarcWt((row["carc_wt"]?.asDouble()));
				self.setCarcWtAccuracy((row["carc_wt_accuracy"]?.asDouble()));
				self.setCarcRea((row["carc_rea"]?.asDouble()));
				self.setCarcReaAccuracy((row["carc_rea_accuracy"]?.asDouble()));
				self.setCarcFat((row["carc_fat"]?.asDouble()));
				self.setCarcFatAccuracy((row["carc_fat_accuracy"]?.asDouble()));
				self.setCarcMarb((row["carc_marb"]?.asDouble()));
				self.setCarcMarbAccuracy((row["carc_marb_accuracy"]?.asDouble()));

				var fields = [String: String]()
				fields["_id"] = self.getIdStr()
				fields["animal_id"] = self.getAnimalIdStr()
				fields["animal_registration"] = self.getAnimalRegistrationStr()
				fields["animal_private_herd_id"] = self.getAnimalPrivateHerdIdStr()
				fields["record_type"] = self.getRecordTypeStr()
				fields["active"] = self.getActiveStr()
				fields["progeny_count"] = self.getProgenyCountStr()
				fields["animal_sex"] = self.getAnimalSexStr()
				fields["animal_name"] = self.getAnimalNameStr()
				fields["birth_date"] = self.getBirthDateStr()
				fields["animal_sire"] = self.getAnimalSireStr()
				fields["animal_dam"] = self.getAnimalDamStr()
				fields["bw"] = self.getBwStr()
				fields["bw_accuracy"] = self.getBwAccuracyStr()
				fields["bw_progeny_count"] = self.getBwProgenyCountStr()
				fields["bw_progeny_herd_count"] = self.getBwProgenyHerdCountStr()
				fields["bw_progeny_cg_count"] = self.getBwProgenyCgCountStr()
				fields["ww"] = self.getWwStr()
				fields["ww_accuracy"] = self.getWwAccuracyStr()
				fields["ww_progeny_count"] = self.getWwProgenyCountStr()
				fields["ww_progeny_herd_count"] = self.getWwProgenyHerdCountStr()
				fields["ww_progeny_cg_count"] = self.getWwProgenyCgCountStr()
				fields["ww_maternal"] = self.getWwMaternalStr()
				fields["ww_maternal_accuracy"] = self.getWwMaternalAccuracyStr()
				fields["ww_progeny_daughter_count"] = self.getWwProgenyDaughterCountStr()
				fields["ww_progeny_daughter_herd_count"] = self.getWwProgenyDaughterHerdCountStr()
				fields["ww_progeny_daughter_cg_count"] = self.getWwProgenyDaughterCgCountStr()
				fields["weaning_milk_growth"] = self.getWeaningMilkGrowthStr()
				fields["weaning_permanent_environment"] = self.getWeaningPermanentEnvironmentStr()
				fields["yw"] = self.getYwStr()
				fields["yw_accuracy"] = self.getYwAccuracyStr()
				fields["yw_progeny_count"] = self.getYwProgenyCountStr()
				fields["yw_progeny_herd_count"] = self.getYwProgenyHerdCountStr()
				fields["yw_progeny_cg_count"] = self.getYwProgenyCgCountStr()
				fields["sc"] = self.getScStr()
				fields["sc_accuracy"] = self.getScAccuracyStr()
				fields["sc_progeny_count"] = self.getScProgenyCountStr()
				fields["sc_progeny_herd_count"] = self.getScProgenyHerdCountStr()
				fields["sc_progeny_cg_count"] = self.getScProgenyCgCountStr()
				fields["us_rea"] = self.getUsReaStr()
				fields["us_rea_accuracy"] = self.getUsReaAccuracyStr()
				fields["us_rea_progeny_count"] = self.getUsReaProgenyCountStr()
				fields["us_rea_progeny_herd_count"] = self.getUsReaProgenyHerdCountStr()
				fields["us_rea_progeny_cg_count"] = self.getUsReaProgenyCgCountStr()
				fields["us_imf"] = self.getUsImfStr()
				fields["us_imf_accuracy"] = self.getUsImfAccuracyStr()
				fields["us_imf_progeny_count"] = self.getUsImfProgenyCountStr()
				fields["us_imf_progeny_herd_count"] = self.getUsImfProgenyHerdCountStr()
				fields["us_imf_progeny_cg_count"] = self.getUsImfProgenyCgCountStr()
				fields["us_fat"] = self.getUsFatStr()
				fields["us_fat_accuracy"] = self.getUsFatAccuracyStr()
				fields["us_fat_progeny_count"] = self.getUsFatProgenyCountStr()
				fields["us_fat_progeny_herd_count"] = self.getUsFatProgenyHerdCountStr()
				fields["us_fat_progeny_cg_count"] = self.getUsFatProgenyCgCountStr()
				fields["source"] = self.getSourceStr()
				fields["ced"] = self.getCedStr()
				fields["ced_accuracy"] = self.getCedAccuracyStr()
				fields["cem"] = self.getCemStr()
				fields["cem_accuracy"] = self.getCemAccuracyStr()
				fields["carc_wt"] = self.getCarcWtStr()
				fields["carc_wt_accuracy"] = self.getCarcWtAccuracyStr()
				fields["carc_rea"] = self.getCarcReaStr()
				fields["carc_rea_accuracy"] = self.getCarcReaAccuracyStr()
				fields["carc_fat"] = self.getCarcFatStr()
				fields["carc_fat_accuracy"] = self.getCarcFatAccuracyStr()
				fields["carc_marb"] = self.getCarcMarbStr()
				fields["carc_marb_accuracy"] = self.getCarcMarbAccuracyStr()

                return fields
            } else {
                
                self.clearFields()
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["_id"] = self.getIdStr()
		fields["animal_id"] = self.getAnimalIdStr()
		fields["animal_registration"] = self.getAnimalRegistrationStr()
		fields["animal_private_herd_id"] = self.getAnimalPrivateHerdIdStr()
		fields["record_type"] = self.getRecordTypeStr()
		fields["active"] = self.getActiveStr()
		fields["progeny_count"] = self.getProgenyCountStr()
		fields["animal_sex"] = self.getAnimalSexStr()
		fields["animal_name"] = self.getAnimalNameStr()
		fields["birth_date"] = self.getBirthDateStr()
		fields["animal_sire"] = self.getAnimalSireStr()
		fields["animal_dam"] = self.getAnimalDamStr()
		fields["bw"] = self.getBwStr()
		fields["bw_accuracy"] = self.getBwAccuracyStr()
		fields["bw_progeny_count"] = self.getBwProgenyCountStr()
		fields["bw_progeny_herd_count"] = self.getBwProgenyHerdCountStr()
		fields["bw_progeny_cg_count"] = self.getBwProgenyCgCountStr()
		fields["ww"] = self.getWwStr()
		fields["ww_accuracy"] = self.getWwAccuracyStr()
		fields["ww_progeny_count"] = self.getWwProgenyCountStr()
		fields["ww_progeny_herd_count"] = self.getWwProgenyHerdCountStr()
		fields["ww_progeny_cg_count"] = self.getWwProgenyCgCountStr()
		fields["ww_maternal"] = self.getWwMaternalStr()
		fields["ww_maternal_accuracy"] = self.getWwMaternalAccuracyStr()
		fields["ww_progeny_daughter_count"] = self.getWwProgenyDaughterCountStr()
		fields["ww_progeny_daughter_herd_count"] = self.getWwProgenyDaughterHerdCountStr()
		fields["ww_progeny_daughter_cg_count"] = self.getWwProgenyDaughterCgCountStr()
		fields["weaning_milk_growth"] = self.getWeaningMilkGrowthStr()
		fields["weaning_permanent_environment"] = self.getWeaningPermanentEnvironmentStr()
		fields["yw"] = self.getYwStr()
		fields["yw_accuracy"] = self.getYwAccuracyStr()
		fields["yw_progeny_count"] = self.getYwProgenyCountStr()
		fields["yw_progeny_herd_count"] = self.getYwProgenyHerdCountStr()
		fields["yw_progeny_cg_count"] = self.getYwProgenyCgCountStr()
		fields["sc"] = self.getScStr()
		fields["sc_accuracy"] = self.getScAccuracyStr()
		fields["sc_progeny_count"] = self.getScProgenyCountStr()
		fields["sc_progeny_herd_count"] = self.getScProgenyHerdCountStr()
		fields["sc_progeny_cg_count"] = self.getScProgenyCgCountStr()
		fields["us_rea"] = self.getUsReaStr()
		fields["us_rea_accuracy"] = self.getUsReaAccuracyStr()
		fields["us_rea_progeny_count"] = self.getUsReaProgenyCountStr()
		fields["us_rea_progeny_herd_count"] = self.getUsReaProgenyHerdCountStr()
		fields["us_rea_progeny_cg_count"] = self.getUsReaProgenyCgCountStr()
		fields["us_imf"] = self.getUsImfStr()
		fields["us_imf_accuracy"] = self.getUsImfAccuracyStr()
		fields["us_imf_progeny_count"] = self.getUsImfProgenyCountStr()
		fields["us_imf_progeny_herd_count"] = self.getUsImfProgenyHerdCountStr()
		fields["us_imf_progeny_cg_count"] = self.getUsImfProgenyCgCountStr()
		fields["us_fat"] = self.getUsFatStr()
		fields["us_fat_accuracy"] = self.getUsFatAccuracyStr()
		fields["us_fat_progeny_count"] = self.getUsFatProgenyCountStr()
		fields["us_fat_progeny_herd_count"] = self.getUsFatProgenyHerdCountStr()
		fields["us_fat_progeny_cg_count"] = self.getUsFatProgenyCgCountStr()
		fields["source"] = self.getSourceStr()
		fields["ced"] = self.getCedStr()
		fields["ced_accuracy"] = self.getCedAccuracyStr()
		fields["cem"] = self.getCemStr()
		fields["cem_accuracy"] = self.getCemAccuracyStr()
		fields["carc_wt"] = self.getCarcWtStr()
		fields["carc_wt_accuracy"] = self.getCarcWtAccuracyStr()
		fields["carc_rea"] = self.getCarcReaStr()
		fields["carc_rea_accuracy"] = self.getCarcReaAccuracyStr()
		fields["carc_fat"] = self.getCarcFatStr()
		fields["carc_fat_accuracy"] = self.getCarcFatAccuracyStr()
		fields["carc_marb"] = self.getCarcMarbStr()
		fields["carc_marb_accuracy"] = self.getCarcMarbAccuracyStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["_id"] = self.getIdStrPG()
		fields["animal_id"] = self.getAnimalIdStrPG()
		fields["animal_registration"] = self.getAnimalRegistrationStrPG()
		fields["animal_private_herd_id"] = self.getAnimalPrivateHerdIdStrPG()
		fields["record_type"] = self.getRecordTypeStrPG()
		fields["active"] = self.getActiveStrPG()
		fields["progeny_count"] = self.getProgenyCountStrPG()
		fields["animal_sex"] = self.getAnimalSexStrPG()
		fields["animal_name"] = self.getAnimalNameStrPG()
		fields["birth_date"] = self.getBirthDateStrPG()
		fields["animal_sire"] = self.getAnimalSireStrPG()
		fields["animal_dam"] = self.getAnimalDamStrPG()
		fields["bw"] = self.getBwStrPG()
		fields["bw_accuracy"] = self.getBwAccuracyStrPG()
		fields["bw_progeny_count"] = self.getBwProgenyCountStrPG()
		fields["bw_progeny_herd_count"] = self.getBwProgenyHerdCountStrPG()
		fields["bw_progeny_cg_count"] = self.getBwProgenyCgCountStrPG()
		fields["ww"] = self.getWwStrPG()
		fields["ww_accuracy"] = self.getWwAccuracyStrPG()
		fields["ww_progeny_count"] = self.getWwProgenyCountStrPG()
		fields["ww_progeny_herd_count"] = self.getWwProgenyHerdCountStrPG()
		fields["ww_progeny_cg_count"] = self.getWwProgenyCgCountStrPG()
		fields["ww_maternal"] = self.getWwMaternalStrPG()
		fields["ww_maternal_accuracy"] = self.getWwMaternalAccuracyStrPG()
		fields["ww_progeny_daughter_count"] = self.getWwProgenyDaughterCountStrPG()
		fields["ww_progeny_daughter_herd_count"] = self.getWwProgenyDaughterHerdCountStrPG()
		fields["ww_progeny_daughter_cg_count"] = self.getWwProgenyDaughterCgCountStrPG()
		fields["weaning_milk_growth"] = self.getWeaningMilkGrowthStrPG()
		fields["weaning_permanent_environment"] = self.getWeaningPermanentEnvironmentStrPG()
		fields["yw"] = self.getYwStrPG()
		fields["yw_accuracy"] = self.getYwAccuracyStrPG()
		fields["yw_progeny_count"] = self.getYwProgenyCountStrPG()
		fields["yw_progeny_herd_count"] = self.getYwProgenyHerdCountStrPG()
		fields["yw_progeny_cg_count"] = self.getYwProgenyCgCountStrPG()
		fields["sc"] = self.getScStrPG()
		fields["sc_accuracy"] = self.getScAccuracyStrPG()
		fields["sc_progeny_count"] = self.getScProgenyCountStrPG()
		fields["sc_progeny_herd_count"] = self.getScProgenyHerdCountStrPG()
		fields["sc_progeny_cg_count"] = self.getScProgenyCgCountStrPG()
		fields["us_rea"] = self.getUsReaStrPG()
		fields["us_rea_accuracy"] = self.getUsReaAccuracyStrPG()
		fields["us_rea_progeny_count"] = self.getUsReaProgenyCountStrPG()
		fields["us_rea_progeny_herd_count"] = self.getUsReaProgenyHerdCountStrPG()
		fields["us_rea_progeny_cg_count"] = self.getUsReaProgenyCgCountStrPG()
		fields["us_imf"] = self.getUsImfStrPG()
		fields["us_imf_accuracy"] = self.getUsImfAccuracyStrPG()
		fields["us_imf_progeny_count"] = self.getUsImfProgenyCountStrPG()
		fields["us_imf_progeny_herd_count"] = self.getUsImfProgenyHerdCountStrPG()
		fields["us_imf_progeny_cg_count"] = self.getUsImfProgenyCgCountStrPG()
		fields["us_fat"] = self.getUsFatStrPG()
		fields["us_fat_accuracy"] = self.getUsFatAccuracyStrPG()
		fields["us_fat_progeny_count"] = self.getUsFatProgenyCountStrPG()
		fields["us_fat_progeny_herd_count"] = self.getUsFatProgenyHerdCountStrPG()
		fields["us_fat_progeny_cg_count"] = self.getUsFatProgenyCgCountStrPG()
		fields["source"] = self.getSourceStrPG()
		fields["ced"] = self.getCedStrPG()
		fields["ced_accuracy"] = self.getCedAccuracyStrPG()
		fields["cem"] = self.getCemStrPG()
		fields["cem_accuracy"] = self.getCemAccuracyStrPG()
		fields["carc_wt"] = self.getCarcWtStrPG()
		fields["carc_wt_accuracy"] = self.getCarcWtAccuracyStrPG()
		fields["carc_rea"] = self.getCarcReaStrPG()
		fields["carc_rea_accuracy"] = self.getCarcReaAccuracyStrPG()
		fields["carc_fat"] = self.getCarcFatStrPG()
		fields["carc_fat_accuracy"] = self.getCarcFatAccuracyStrPG()
		fields["carc_marb"] = self.getCarcMarbStrPG()
		fields["carc_marb_accuracy"] = self.getCarcMarbAccuracyStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO vw_animal_epd ("
        var i = 0
        let obj = self
        let reflected = Mirror(reflecting: obj)
        for child in reflected.children {
            guard let key = child.label else { continue }
            let _: Any = child.value
            if key != "_id" && key.rangeOfString("_str") != nil {

                let use_key = key.stringByReplacingOccurrencesOfString("_str", withString: "")
                if self.keyIsSet(use_key) {
                    if i == 0 {
                        statement += use_key
                    } else {
                        statement += ", " + use_key
                    }
                    i += 1
                }
            }
        }
        statement += ") VALUES ("

        // get all field/values as string values
        var fields = self.getFields()

        i = 0
        for child in reflected.children {
            guard let key = child.label else { continue }
            let _: Any = child.value
            if key != "_id" && key.rangeOfString("_str") != nil {
                let use_key = key.stringByReplacingOccurrencesOfString("_str", withString: "")
                if self.keyIsSet(use_key) {
                    var value2 = fields[use_key]!.stringByReplacingOccurrencesOfString("'", withString: "''")
					
					let matches = Utils.matchesForRegexInText("^Optional\\(", text: value2)
					if matches.count > 0 {
						value2 = value2.stringByReplacingOccurrencesOfString("Optional(", withString: "")
						value2.removeAtIndex(value2.endIndex.predecessor())
					}
                    if i == 0 {
                        statement += "'" + value2 + "'"
                    } else {
                        statement += ", '" + value2 + "'"
                    }
                    i += 1
                }
            }
        }
        statement += ")"

        let dbn = DatabaseOld()
        dbn.query(statement)
    }

    func addNewPG() {

        var statement = "INSERT INTO vw_animal_epd ("
        var i = 0
        let obj = self
        let reflected = Mirror(reflecting: obj)
        for child in reflected.children {
            guard let key = child.label else { continue }
            let _: Any = child.value
            if key != "_id" && key.rangeOfString("_str") != nil {

                let use_key = key.stringByReplacingOccurrencesOfString("_str", withString: "")
                if self.keyIsSet(use_key) {
                    if i == 0 {
                        statement += use_key
                    } else {
                        statement += ", " + use_key
                    }
                    i += 1
                }
            }
        }
        statement += ") VALUES ("

        // get all field/values as string values
        var fields = self.getFieldsPG()

        i = 0
        for child in reflected.children {
            guard let key = child.label else { continue }
            let _: Any = child.value
            if key != "_id" && key.rangeOfString("_str") != nil {
                let use_key = key.stringByReplacingOccurrencesOfString("_str", withString: "")
                if self.keyIsSet(use_key) {
                    var value2 = fields[use_key]!.stringByReplacingOccurrencesOfString("'", withString: "''")
					
					let matches = Utils.matchesForRegexInText("^Optional\\(", text: value2)
					if matches.count > 0 {
						value2 = value2.stringByReplacingOccurrencesOfString("Optional(", withString: "")
						value2.removeAtIndex(value2.endIndex.predecessor())
					}
                    if i == 0 {
                        statement += "'" + value2 + "'"
                    } else {
                        statement += ", '" + value2 + "'"
                    }
                    i += 1
                }
            }
        }
        statement += ")"

        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    func appendInsert(withString: String) -> String {

        var ret_str = withString
        let obj = self
        var i = 0
        if (withString == "") {

            var statement = "INSERT INTO vw_animal_epd ("

            let reflected = Mirror(reflecting: obj)
            for child in reflected.children {
                guard let key = child.label else { continue }
                let _: Any = child.value
                if key != "_id" && key.rangeOfString("_str") != nil {

                    let use_key = key.stringByReplacingOccurrencesOfString("_str", withString: "")
                    if self.keyIsSet(use_key) {
                        if i == 0 {
                            statement += use_key
                        } else {
                            statement += ", " + use_key
                        }
                        i += 1
                    }
                }
            }
            statement += ") "
            ret_str = statement
        }

        // get all field/values as string values
        var fields = self.getFields()

        i = 0
        var statement = ""

        if ret_str.rangeOfString("select") == nil {
            statement = "select "
        } else {
            statement = "union all select "
        }

        let reflected = Mirror(reflecting: obj)
        for child in reflected.children {
            guard let key = child.label else { continue }
            let _: Any = child.value
            if key != "_id" && key.rangeOfString("_str") != nil {
                let use_key = key.stringByReplacingOccurrencesOfString("_str", withString: "")
                if self.keyIsSet(use_key) {
                    var value2 = fields[use_key]!.stringByReplacingOccurrencesOfString("'", withString: "''")
					
					let matches = Utils.matchesForRegexInText("^Optional\\(", text: value2)
					if matches.count > 0 {
						value2 = value2.stringByReplacingOccurrencesOfString("Optional(", withString: "")
						value2.removeAtIndex(value2.endIndex.predecessor())
					}
                    if i == 0 {
                        statement += "'" + value2 + "'"
                    } else {
                        statement += ", '" + value2 + "'"
                    }
                    i += 1
                }
            }
        }
        ret_str += statement
        return ret_str
    }

    func update(forID: String) {

        // get all field/values as string values
        var fields = self.getFields()

        var statement = "UPDATE vw_animal_epd "
        var i = 0
        let obj = self
        let reflected = Mirror(reflecting: obj)
        for child in reflected.children {
            guard let key = child.label else { continue }
            let _: Any = child.value
            if key != "_id" && key.rangeOfString("_str") != nil {
                let use_key = key.stringByReplacingOccurrencesOfString("_str", withString: "")
                if self.keyIsSet(use_key) {
                    var value2 = fields[use_key]!.stringByReplacingOccurrencesOfString("'", withString: "''")
					
					let matches = Utils.matchesForRegexInText("^Optional\\(", text: value2)
					if matches.count > 0 {
						value2 = value2.stringByReplacingOccurrencesOfString("Optional(", withString: "")
						value2.removeAtIndex(value2.endIndex.predecessor())
					}
                    if i == 0 {
                        statement += "SET " + use_key + " = '" + value2 + "' "
                    } else {
                        statement += ", " + use_key + " = '" + value2 + "' "
                    }
                    i += 1
                }
            }
        }
        statement += "WHERE registration = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query(statement)
    }

    func updatePG(forID: String) {

        // get all field/values as string values
        var fields = self.getFieldsPG()

        var statement = "UPDATE vw_animal_epd "
        var i = 0
        let obj = self
        let reflected = Mirror(reflecting: obj)
        for child in reflected.children {
            guard let key = child.label else { continue }
            let _: Any = child.value
            if key != "_id" && key.rangeOfString("_str") != nil {
                let use_key = key.stringByReplacingOccurrencesOfString("_str", withString: "")
                if self.keyIsSet(use_key) {
                    var value2 = fields[use_key]!.stringByReplacingOccurrencesOfString("'", withString: "''")
					
					let matches = Utils.matchesForRegexInText("^Optional\\(", text: value2)
					if matches.count > 0 {
						value2 = value2.stringByReplacingOccurrencesOfString("Optional(", withString: "")
						value2.removeAtIndex(value2.endIndex.predecessor())
					}
                    if i == 0 {
                        statement += "SET " + use_key + " = '" + value2 + "' "
                    } else {
                        statement += ", " + use_key + " = '" + value2 + "' "
                    }
                    i += 1
                }
            }
        }
        statement += "WHERE registration = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    func delete(forID: Int) {
        let query = "DELETE FROM vw_animal_epd WHERE registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM vw_animal_epd WHERE registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    func clearFields() {
        self.animal_registration = ""
        self.animal_registration_str = ""
        self.animal_private_herd_id = ""
        self.animal_private_herd_id_str = ""
        self.record_type = ""
        self.record_type_str = ""
        
        self.active = 0
        self.active_str = "f"
        self.progeny_count = 0
        self.progeny_count_str = ""
        self.animal_sex = ""
        self.animal_sex_str = ""
        
        self.birth_date = NSDate.distantPast() as NSDate
        self.birth_date_str = ""
        self.animal_name = ""
        self.animal_name_str = ""
        self.animal_sire = ""
        self.animal_sire_str = ""
        self.animal_dam = ""
        self.animal_dam_str = ""
        
        self.bw = 0.0
        self.bw_str = ""
        self.bw_accuracy = 0.0
        self.bw_accuracy_str = ""
        
        self.bw_progeny_count = 0
        self.bw_progeny_count_str = ""
        self.bw_progeny_herd_count = 0
        self.bw_progeny_herd_count_str = ""
        self.bw_progeny_cg_count = 0
        self.bw_progeny_cg_count_str = ""
        
        self.ww = 0.0
        self.ww_str = ""
        self.ww_accuracy = 0.0
        self.ww_accuracy_str = ""
        self.ww_maternal = 0.0
        self.ww_maternal_str = ""
        self.ww_maternal_accuracy = 0.0
        self.ww_maternal_accuracy_str = ""
        self.weaning_milk_growth = 0.0
        self.weaning_milk_growth_str = ""
        self.weaning_permanent_environment = 0.0
        self.weaning_permanent_environment_str = ""
        
        self.ww_progeny_count = 0
        self.ww_progeny_count_str = ""
        self.ww_progeny_herd_count = 0
        self.ww_progeny_herd_count_str = ""
        self.ww_progeny_cg_count = 0
        self.ww_progeny_cg_count_str = ""
        
        self.ww_progeny_daughter_count = 0
        self.ww_progeny_daughter_count_str = ""
        
        self.ww_progeny_daughter_herd_count = 0
        self.ww_progeny_daughter_herd_count_str = ""
        self.ww_progeny_daughter_cg_count = 0
        self.ww_progeny_daughter_cg_count_str = ""
        self.yw = 0.0
        self.yw_str = ""
        self.yw_accuracy = 0.0
        self.yw_accuracy_str = ""
        self.yw_progeny_count = 0
        self.yw_progeny_count_str = ""
        self.yw_progeny_herd_count = 0
        self.yw_progeny_herd_count_str = ""
        self.yw_progeny_cg_count = 0
        self.yw_progeny_cg_count_str = ""
        self.ced = 0.0
        self.ced_str = ""
        self.ced_accuracy = 0.0
        self.ced_accuracy_str = ""
        self.cem_accuracy = 0.0
        self.cem_accuracy_str = ""
        self.cem = 0.0
        self.cem_str = ""
        self.sc = 0.0
        self.sc_str = ""
        self.sc_accuracy = 0.0
        self.sc_accuracy_str = ""
        self.sc_progeny_count = 0
        self.sc_progeny_count_str = ""
        self.sc_progeny_herd_count = 0
        self.sc_progeny_herd_count_str = ""
        self.sc_progeny_cg_count = 0
        self.sc_progeny_cg_count_str = ""
        self.us_rea = 0.0
        self.us_rea_str = ""
        self.us_rea_accuracy = 0.0
        self.us_rea_accuracy_str = ""
        self.us_rea_progeny_count = 0
        self.us_rea_progeny_count_str = ""
        self.us_rea_progeny_herd_count = 0
        self.us_rea_progeny_herd_count_str = ""
        self.us_rea_progeny_cg_count = 0
        self.us_rea_progeny_cg_count_str = ""
        self.us_fat = 0.0
        self.us_fat_str = ""
        self.us_fat_accuracy = 0.0
        self.us_fat_accuracy_str = ""
        self.us_fat_progeny_count = 0
        self.us_fat_progeny_count_str = ""
        self.us_fat_progeny_herd_count = 0
        self.us_fat_progeny_herd_count_str = ""
        self.us_fat_progeny_cg_count = 0
        self.us_fat_progeny_cg_count_str = ""
        
        self.us_imf = 0.0
        self.us_imf_str = ""
        self.us_imf_accuracy = 0.0
        self.us_imf_accuracy_str = ""
        
        self.us_imf_progeny_count = 0
        self.us_imf_progeny_count_str = ""
        self.us_imf_progeny_herd_count = 0
        self.us_imf_progeny_herd_count_str = ""
        self.us_imf_progeny_cg_count = 0
        self.us_imf_progeny_cg_count_str = ""
        
        self.carc_wt = 0.0
        self.carc_wt_str = ""
        self.carc_wt_accuracy = 0.0
        self.carc_wt_accuracy_str = ""
        
        self.carc_rea = 0.0
        self.carc_rea_str = ""
        self.carc_rea_accuracy = 0.0
        self.carc_rea_accuracy_str = ""
        
        
        self.carc_fat = 0.0
        self.carc_fat_str = ""
        self.carc_fat_accuracy = 0.0
        self.carc_fat_accuracy_str = ""
        
        self.carc_marb = 0.0
        self.carc_marb_str = ""
        self.carc_marb_accuracy = 0.0
        self.carc_marb_accuracy_str = ""
        
        self.source = ""
        self.source_str = ""
        
        
    }

    class func getLastregistration() -> String {
        let registration: String = ""
        let query = "SELECT registration from vw_animal_epd ORDER BY _id DESC LIMIT 1 "
        let (resultset, err) = SDOld.executeQuery(query)
        if (err == nil) {
            if resultset.count > 0 {
                let row = resultset[0]
                let registration2 = row["registration"]?.asString() ?? ""

                return registration2

            }
        }
        return registration
    }
}
