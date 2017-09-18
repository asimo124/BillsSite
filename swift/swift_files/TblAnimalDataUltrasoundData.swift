

//
//  TblAnimalDataUltrasound.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalDataUltrasoundData {

	var animal_registration: String = "unset"
    var animal_registration_str: String = "unset"
	var ribeye_area: Double = -1.0
    var ribeye_area_str: String = "unset"
	var backfat_thickness: Double = -1.0
    var backfat_thickness_str: String = "unset"
	var intramuscular_fat: Double = -1.0
    var intramuscular_fat_str: String = "unset"
	var rump_fat: Double = -1.0
    var rump_fat_str: String = "unset"
	var management_group: String = "unset"
    var management_group_str: String = "unset"
	var technician: String = "unset"
    var technician_str: String = "unset"
	var hardware: String = "unset"
    var hardware_str: String = "unset"
	var software: String = "unset"
    var software_str: String = "unset"
	var measurement_date: NSDate = NSDate.distantFuture() as NSDate
    var measurement_date_str: String = "unset"
	var ultrasound_weight: Double = -1.0
    var ultrasound_weight_str: String = "unset"
	var contemporary_group: Int = -1
    var contemporary_group_str: String = "unset"
	var ribeye_area_adj: Double = -1.0
    var ribeye_area_adj_str: String = "unset"
	var backfat_thickness_adj: Double = -1.0
    var backfat_thickness_adj_str: String = "unset"
	var intramuscular_fat_adj: Double = -1.0
    var intramuscular_fat_adj_str: String = "unset"
	var animal_sex: String = "unset"
    var animal_sex_str: String = "unset"
	var create_user: String = "unset"
    var create_user_str: String = "unset"
	var create_stamp: NSDate = NSDate.distantFuture() as NSDate
    var create_stamp_str: String = "unset"
	var update_user: String = "unset"
    var update_user_str: String = "unset"
	var update_stamp: NSDate = NSDate.distantFuture() as NSDate
    var update_stamp_str: String = "unset"
	var sub_contemporary_group: Int = -1
    var sub_contemporary_group_str: String = "unset"
	var herd_id: Int = -1
    var herd_id_str: String = "unset"
	var premise_id: String = "unset"
    var premise_id_str: String = "unset"
	var pasture_id: String = "unset"
    var pasture_id_str: String = "unset"
	var work_order: String = "unset"
    var work_order_str: String = "unset"
	var scrotal_circumference: Double = -1.0
    var scrotal_circumference_str: String = "unset"
	var scrotal_circumference_adj: Double = -1.0
    var scrotal_circumference_adj_str: String = "unset"
	var pre_contemporary_group: Int = -1
    var pre_contemporary_group_str: String = "unset"
	var commit_lock_id: Int = -1
    var commit_lock_id_str: String = "unset"
	var season: Int = -1
    var season_str: String = "unset"
	var rea_ratio: Int = -1
    var rea_ratio_str: String = "unset"
	var imf_ratio: Int = -1
    var imf_ratio_str: String = "unset"
	var fat_ratio: Int = -1
    var fat_ratio_str: String = "unset"
	var hip_height: Double = -1.0
    var hip_height_str: String = "unset"
	var frame_score: Double = -1.0
    var frame_score_str: String = "unset"
	
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

	func setRibeyeArea(ribeye_area: Double?) {
   	   self.ribeye_area = ribeye_area ?? 0.0
   	   self.ribeye_area_str = String(self.ribeye_area)
    }
    func getRibeyeArea() -> Double {
        return self.ribeye_area
    }
    func getRibeyeAreaType() -> String {
        return "Double"
    };
	func getRibeyeAreaStr() -> String {
        return ribeye_area_str
    };
	func getRibeyeAreaStrPG() -> String {
        return ribeye_area_str
    };

	func setBackfatThickness(backfat_thickness: Double?) {
   	   self.backfat_thickness = backfat_thickness ?? 0.0
   	   self.backfat_thickness_str = String(self.backfat_thickness)
    }
    func getBackfatThickness() -> Double {
        return self.backfat_thickness
    }
    func getBackfatThicknessType() -> String {
        return "Double"
    };
	func getBackfatThicknessStr() -> String {
        return backfat_thickness_str
    };
	func getBackfatThicknessStrPG() -> String {
        return backfat_thickness_str
    };

	func setIntramuscularFat(intramuscular_fat: Double?) {
   	   self.intramuscular_fat = intramuscular_fat ?? 0.0
   	   self.intramuscular_fat_str = String(self.intramuscular_fat)
    }
    func getIntramuscularFat() -> Double {
        return self.intramuscular_fat
    }
    func getIntramuscularFatType() -> String {
        return "Double"
    };
	func getIntramuscularFatStr() -> String {
        return intramuscular_fat_str
    };
	func getIntramuscularFatStrPG() -> String {
        return intramuscular_fat_str
    };

	func setRumpFat(rump_fat: Double?) {
   	   self.rump_fat = rump_fat ?? 0.0
   	   self.rump_fat_str = String(self.rump_fat)
    }
    func getRumpFat() -> Double {
        return self.rump_fat
    }
    func getRumpFatType() -> String {
        return "Double"
    };
	func getRumpFatStr() -> String {
        return rump_fat_str
    };
	func getRumpFatStrPG() -> String {
        return rump_fat_str
    };

	func setManagementGroup(management_group: String?) {
        self.management_group = management_group ?? ""
        self.management_group_str = String(self.management_group)
    }
    func getManagementGroup() -> String {
        return self.management_group
    }
    func getManagementGroupType() -> String {
        return "String"
    };
	func getManagementGroupStr() -> String {
        return management_group_str == "unset" ? "" : management_group_str
    };
	func getManagementGroupStrPG() -> String {
        return management_group_str == "unset" ? "" : management_group_str
    };

	func setTechnician(technician: String?) {
        self.technician = technician ?? ""
        self.technician_str = String(self.technician)
    }
    func getTechnician() -> String {
        return self.technician
    }
    func getTechnicianType() -> String {
        return "String"
    };
	func getTechnicianStr() -> String {
        return technician_str == "unset" ? "" : technician_str
    };
	func getTechnicianStrPG() -> String {
        return technician_str == "unset" ? "" : technician_str
    };

	func setHardware(hardware: String?) {
        self.hardware = hardware ?? ""
        self.hardware_str = String(self.hardware)
    }
    func getHardware() -> String {
        return self.hardware
    }
    func getHardwareType() -> String {
        return "String"
    };
	func getHardwareStr() -> String {
        return hardware_str == "unset" ? "" : hardware_str
    };
	func getHardwareStrPG() -> String {
        return hardware_str == "unset" ? "" : hardware_str
    };

	func setSoftware(software: String?) {
        self.software = software ?? ""
        self.software_str = String(self.software)
    }
    func getSoftware() -> String {
        return self.software
    }
    func getSoftwareType() -> String {
        return "String"
    };
	func getSoftwareStr() -> String {
        return software_str == "unset" ? "" : software_str
    };
	func getSoftwareStrPG() -> String {
        return software_str == "unset" ? "" : software_str
    };

	func setMeasurementDate(measurement_date: NSDate?) {
        self.measurement_date = measurement_date ?? NSDate.distantPast() as NSDate
        self.measurement_date_str = Utils.dateToString(self.measurement_date)
    }
    func getMeasurementDate() -> NSDate {
        return self.measurement_date
    }
    func getMeasurementDateType() -> String {
        return "NSDate"
    };
	func getMeasurementDateStr() -> String {
        return measurement_date_str == "unset" || measurement_date_str == "0000-12-30 00:00:00 +0000" ? "" : measurement_date_str
    };
	func getMeasurementDateStrPG() -> String {
        return measurement_date_str == "unset" || measurement_date_str == "0000-12-30 00:00:00 +0000" ? "" : measurement_date_str
    };

	func setUltrasoundWeight(ultrasound_weight: Double?) {
   	   self.ultrasound_weight = ultrasound_weight ?? 0.0
   	   self.ultrasound_weight_str = String(self.ultrasound_weight)
    }
    func getUltrasoundWeight() -> Double {
        return self.ultrasound_weight
    }
    func getUltrasoundWeightType() -> String {
        return "Double"
    };
	func getUltrasoundWeightStr() -> String {
        return ultrasound_weight_str
    };
	func getUltrasoundWeightStrPG() -> String {
        return ultrasound_weight_str
    };

	func setContemporaryGroup(contemporary_group: Int?) {
        self.contemporary_group = contemporary_group ?? 0
        let contemporary_group2 = contemporary_group ?? 0
        self.contemporary_group_str = String(contemporary_group2)
        self.contemporary_group_str = (self.contemporary_group_str == "0") ? "" : self.contemporary_group_str
    }
    func getContemporaryGroup() -> Int {
        return self.contemporary_group
    }
    func getContemporaryGroupType() -> String {
        return "Int"
    };
	func getContemporaryGroupStr() -> String {
        return contemporary_group_str
    };
	func getContemporaryGroupStrPG() -> String {
        return contemporary_group_str
    };

	func setRibeyeAreaAdj(ribeye_area_adj: Double?) {
   	   self.ribeye_area_adj = ribeye_area_adj ?? 0.0
   	   self.ribeye_area_adj_str = String(self.ribeye_area_adj)
    }
    func getRibeyeAreaAdj() -> Double {
        return self.ribeye_area_adj
    }
    func getRibeyeAreaAdjType() -> String {
        return "Double"
    };
	func getRibeyeAreaAdjStr() -> String {
        return ribeye_area_adj_str
    };
	func getRibeyeAreaAdjStrPG() -> String {
        return ribeye_area_adj_str
    };

	func setBackfatThicknessAdj(backfat_thickness_adj: Double?) {
   	   self.backfat_thickness_adj = backfat_thickness_adj ?? 0.0
   	   self.backfat_thickness_adj_str = String(self.backfat_thickness_adj)
    }
    func getBackfatThicknessAdj() -> Double {
        return self.backfat_thickness_adj
    }
    func getBackfatThicknessAdjType() -> String {
        return "Double"
    };
	func getBackfatThicknessAdjStr() -> String {
        return backfat_thickness_adj_str
    };
	func getBackfatThicknessAdjStrPG() -> String {
        return backfat_thickness_adj_str
    };

	func setIntramuscularFatAdj(intramuscular_fat_adj: Double?) {
   	   self.intramuscular_fat_adj = intramuscular_fat_adj ?? 0.0
   	   self.intramuscular_fat_adj_str = String(self.intramuscular_fat_adj)
    }
    func getIntramuscularFatAdj() -> Double {
        return self.intramuscular_fat_adj
    }
    func getIntramuscularFatAdjType() -> String {
        return "Double"
    };
	func getIntramuscularFatAdjStr() -> String {
        return intramuscular_fat_adj_str
    };
	func getIntramuscularFatAdjStrPG() -> String {
        return intramuscular_fat_adj_str
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

	func setCreateUser(create_user: String?) {
        self.create_user = create_user ?? ""
        self.create_user_str = String(self.create_user)
    }
    func getCreateUser() -> String {
        return self.create_user
    }
    func getCreateUserType() -> String {
        return "String"
    };
	func getCreateUserStr() -> String {
        return create_user_str == "unset" ? "" : create_user_str
    };
	func getCreateUserStrPG() -> String {
        return create_user_str == "unset" ? "" : create_user_str
    };

	func setCreateStamp(create_stamp: NSDate?) {
        self.create_stamp = create_stamp ?? NSDate.distantPast() as NSDate
        self.create_stamp_str = Utils.dateToString(self.create_stamp)
    }
    func getCreateStamp() -> NSDate {
        return self.create_stamp
    }
    func getCreateStampType() -> String {
        return "NSDate"
    };
	func getCreateStampStr() -> String {
        return create_stamp_str == "unset" || create_stamp_str == "0000-12-30 00:00:00 +0000" ? "" : create_stamp_str
    };
	func getCreateStampStrPG() -> String {
        return create_stamp_str == "unset" || create_stamp_str == "0000-12-30 00:00:00 +0000" ? "" : create_stamp_str
    };

	func setUpdateUser(update_user: String?) {
        self.update_user = update_user ?? ""
        self.update_user_str = String(self.update_user)
    }
    func getUpdateUser() -> String {
        return self.update_user
    }
    func getUpdateUserType() -> String {
        return "String"
    };
	func getUpdateUserStr() -> String {
        return update_user_str == "unset" ? "" : update_user_str
    };
	func getUpdateUserStrPG() -> String {
        return update_user_str == "unset" ? "" : update_user_str
    };

	func setUpdateStamp(update_stamp: NSDate?) {
        self.update_stamp = update_stamp ?? NSDate.distantPast() as NSDate
        self.update_stamp_str = Utils.dateToString(self.update_stamp)
    }
    func getUpdateStamp() -> NSDate {
        return self.update_stamp
    }
    func getUpdateStampType() -> String {
        return "NSDate"
    };
	func getUpdateStampStr() -> String {
        return update_stamp_str == "unset" || update_stamp_str == "0000-12-30 00:00:00 +0000" ? "" : update_stamp_str
    };
	func getUpdateStampStrPG() -> String {
        return update_stamp_str == "unset" || update_stamp_str == "0000-12-30 00:00:00 +0000" ? "" : update_stamp_str
    };

	func setSubContemporaryGroup(sub_contemporary_group: Int?) {
        self.sub_contemporary_group = sub_contemporary_group ?? 0
        let sub_contemporary_group2 = sub_contemporary_group ?? 0
        self.sub_contemporary_group_str = String(sub_contemporary_group2)
        self.sub_contemporary_group_str = (self.sub_contemporary_group_str == "0") ? "" : self.sub_contemporary_group_str
    }
    func getSubContemporaryGroup() -> Int {
        return self.sub_contemporary_group
    }
    func getSubContemporaryGroupType() -> String {
        return "Int"
    };
	func getSubContemporaryGroupStr() -> String {
        return sub_contemporary_group_str
    };
	func getSubContemporaryGroupStrPG() -> String {
        return sub_contemporary_group_str
    };

	func setHerdId(herd_id: Int?) {
        self.herd_id = herd_id ?? 0
        let herd_id2 = herd_id ?? 0
        self.herd_id_str = String(herd_id2)
        self.herd_id_str = (self.herd_id_str == "0") ? "" : self.herd_id_str
    }
    func getHerdId() -> Int {
        return self.herd_id
    }
    func getHerdIdType() -> String {
        return "Int"
    };
	func getHerdIdStr() -> String {
        return herd_id_str
    };
	func getHerdIdStrPG() -> String {
        return herd_id_str
    };

	func setPremiseId(premise_id: String?) {
        self.premise_id = premise_id ?? ""
        self.premise_id_str = String(self.premise_id)
    }
    func getPremiseId() -> String {
        return self.premise_id
    }
    func getPremiseIdType() -> String {
        return "String"
    };
	func getPremiseIdStr() -> String {
        return premise_id_str == "unset" ? "" : premise_id_str
    };
	func getPremiseIdStrPG() -> String {
        return premise_id_str == "unset" ? "" : premise_id_str
    };

	func setPastureId(pasture_id: String?) {
        self.pasture_id = pasture_id ?? ""
        self.pasture_id_str = String(self.pasture_id)
    }
    func getPastureId() -> String {
        return self.pasture_id
    }
    func getPastureIdType() -> String {
        return "String"
    };
	func getPastureIdStr() -> String {
        return pasture_id_str == "unset" ? "" : pasture_id_str
    };
	func getPastureIdStrPG() -> String {
        return pasture_id_str == "unset" ? "" : pasture_id_str
    };

	func setWorkOrder(work_order: String?) {
        self.work_order = work_order ?? ""
        self.work_order_str = String(self.work_order)
    }
    func getWorkOrder() -> String {
        return self.work_order
    }
    func getWorkOrderType() -> String {
        return "String"
    };
	func getWorkOrderStr() -> String {
        return work_order_str == "unset" ? "" : work_order_str
    };
	func getWorkOrderStrPG() -> String {
        return work_order_str == "unset" ? "" : work_order_str
    };

	func setScrotalCircumference(scrotal_circumference: Double?) {
   	   self.scrotal_circumference = scrotal_circumference ?? 0.0
   	   self.scrotal_circumference_str = String(self.scrotal_circumference)
    }
    func getScrotalCircumference() -> Double {
        return self.scrotal_circumference
    }
    func getScrotalCircumferenceType() -> String {
        return "Double"
    };
	func getScrotalCircumferenceStr() -> String {
        return scrotal_circumference_str
    };
	func getScrotalCircumferenceStrPG() -> String {
        return scrotal_circumference_str
    };

	func setScrotalCircumferenceAdj(scrotal_circumference_adj: Double?) {
   	   self.scrotal_circumference_adj = scrotal_circumference_adj ?? 0.0
   	   self.scrotal_circumference_adj_str = String(self.scrotal_circumference_adj)
    }
    func getScrotalCircumferenceAdj() -> Double {
        return self.scrotal_circumference_adj
    }
    func getScrotalCircumferenceAdjType() -> String {
        return "Double"
    };
	func getScrotalCircumferenceAdjStr() -> String {
        return scrotal_circumference_adj_str
    };
	func getScrotalCircumferenceAdjStrPG() -> String {
        return scrotal_circumference_adj_str
    };

	func setPreContemporaryGroup(pre_contemporary_group: Int?) {
        self.pre_contemporary_group = pre_contemporary_group ?? 0
        let pre_contemporary_group2 = pre_contemporary_group ?? 0
        self.pre_contemporary_group_str = String(pre_contemporary_group2)
        self.pre_contemporary_group_str = (self.pre_contemporary_group_str == "0") ? "" : self.pre_contemporary_group_str
    }
    func getPreContemporaryGroup() -> Int {
        return self.pre_contemporary_group
    }
    func getPreContemporaryGroupType() -> String {
        return "Int"
    };
	func getPreContemporaryGroupStr() -> String {
        return pre_contemporary_group_str
    };
	func getPreContemporaryGroupStrPG() -> String {
        return pre_contemporary_group_str
    };

	func setCommitLockId(commit_lock_id: Int?) {
        self.commit_lock_id = commit_lock_id ?? 0
        let commit_lock_id2 = commit_lock_id ?? 0
        self.commit_lock_id_str = String(commit_lock_id2)
        self.commit_lock_id_str = (self.commit_lock_id_str == "0") ? "" : self.commit_lock_id_str
    }
    func getCommitLockId() -> Int {
        return self.commit_lock_id
    }
    func getCommitLockIdType() -> String {
        return "Int"
    };
	func getCommitLockIdStr() -> String {
        return commit_lock_id_str
    };
	func getCommitLockIdStrPG() -> String {
        return commit_lock_id_str
    };

	func setSeason(season: Int?) {
        self.season = season ?? 0
        let season2 = season ?? 0
        self.season_str = String(season2)
        self.season_str = (self.season_str == "0") ? "" : self.season_str
    }
    func getSeason() -> Int {
        return self.season
    }
    func getSeasonType() -> String {
        return "Int"
    };
	func getSeasonStr() -> String {
        return season_str
    };
	func getSeasonStrPG() -> String {
        return season_str
    };

	func setReaRatio(rea_ratio: Int?) {
        self.rea_ratio = rea_ratio ?? 0
        let rea_ratio2 = rea_ratio ?? 0
        self.rea_ratio_str = String(rea_ratio2)
        self.rea_ratio_str = (self.rea_ratio_str == "0") ? "" : self.rea_ratio_str
    }
    func getReaRatio() -> Int {
        return self.rea_ratio
    }
    func getReaRatioType() -> String {
        return "Int"
    };
	func getReaRatioStr() -> String {
        return rea_ratio_str
    };
	func getReaRatioStrPG() -> String {
        return rea_ratio_str
    };

	func setImfRatio(imf_ratio: Int?) {
        self.imf_ratio = imf_ratio ?? 0
        let imf_ratio2 = imf_ratio ?? 0
        self.imf_ratio_str = String(imf_ratio2)
        self.imf_ratio_str = (self.imf_ratio_str == "0") ? "" : self.imf_ratio_str
    }
    func getImfRatio() -> Int {
        return self.imf_ratio
    }
    func getImfRatioType() -> String {
        return "Int"
    };
	func getImfRatioStr() -> String {
        return imf_ratio_str
    };
	func getImfRatioStrPG() -> String {
        return imf_ratio_str
    };

	func setFatRatio(fat_ratio: Int?) {
        self.fat_ratio = fat_ratio ?? 0
        let fat_ratio2 = fat_ratio ?? 0
        self.fat_ratio_str = String(fat_ratio2)
        self.fat_ratio_str = (self.fat_ratio_str == "0") ? "" : self.fat_ratio_str
    }
    func getFatRatio() -> Int {
        return self.fat_ratio
    }
    func getFatRatioType() -> String {
        return "Int"
    };
	func getFatRatioStr() -> String {
        return fat_ratio_str
    };
	func getFatRatioStrPG() -> String {
        return fat_ratio_str
    };

	func setHipHeight(hip_height: Double?) {
   	   self.hip_height = hip_height ?? 0.0
   	   self.hip_height_str = String(self.hip_height)
    }
    func getHipHeight() -> Double {
        return self.hip_height
    }
    func getHipHeightType() -> String {
        return "Double"
    };
	func getHipHeightStr() -> String {
        return hip_height_str
    };
	func getHipHeightStrPG() -> String {
        return hip_height_str
    };

	func setFrameScore(frame_score: Double?) {
   	   self.frame_score = frame_score ?? 0.0
   	   self.frame_score_str = String(self.frame_score)
    }
    func getFrameScore() -> Double {
        return self.frame_score
    }
    func getFrameScoreType() -> String {
        return "Double"
    };
	func getFrameScoreStr() -> String {
        return frame_score_str
    };
	func getFrameScoreStrPG() -> String {
        return frame_score_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "animal_registration":
				return "String"
			case "ribeye_area":
				return "Double"
			case "backfat_thickness":
				return "Double"
			case "intramuscular_fat":
				return "Double"
			case "rump_fat":
				return "Double"
			case "management_group":
				return "String"
			case "technician":
				return "String"
			case "hardware":
				return "String"
			case "software":
				return "String"
			case "measurement_date":
				return "NSDate"
			case "ultrasound_weight":
				return "Double"
			case "contemporary_group":
				return "Int"
			case "ribeye_area_adj":
				return "Double"
			case "backfat_thickness_adj":
				return "Double"
			case "intramuscular_fat_adj":
				return "Double"
			case "animal_sex":
				return "String"
			case "create_user":
				return "String"
			case "create_stamp":
				return "NSDate"
			case "update_user":
				return "String"
			case "update_stamp":
				return "NSDate"
			case "sub_contemporary_group":
				return "Int"
			case "herd_id":
				return "Int"
			case "premise_id":
				return "String"
			case "pasture_id":
				return "String"
			case "work_order":
				return "String"
			case "scrotal_circumference":
				return "Double"
			case "scrotal_circumference_adj":
				return "Double"
			case "pre_contemporary_group":
				return "Int"
			case "commit_lock_id":
				return "Int"
			case "season":
				return "Int"
			case "rea_ratio":
				return "Int"
			case "imf_ratio":
				return "Int"
			case "fat_ratio":
				return "Int"
			case "hip_height":
				return "Double"
			case "frame_score":
				return "Double"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "animal_registration":
			return self.getAnimalRegistrationStr()
			case "ribeye_area":
			return self.getRibeyeAreaStr()
			case "backfat_thickness":
			return self.getBackfatThicknessStr()
			case "intramuscular_fat":
			return self.getIntramuscularFatStr()
			case "rump_fat":
			return self.getRumpFatStr()
			case "management_group":
			return self.getManagementGroupStr()
			case "technician":
			return self.getTechnicianStr()
			case "hardware":
			return self.getHardwareStr()
			case "software":
			return self.getSoftwareStr()
			case "measurement_date":
			return self.getMeasurementDateStr()
			case "ultrasound_weight":
			return self.getUltrasoundWeightStr()
			case "contemporary_group":
			return self.getContemporaryGroupStr()
			case "ribeye_area_adj":
			return self.getRibeyeAreaAdjStr()
			case "backfat_thickness_adj":
			return self.getBackfatThicknessAdjStr()
			case "intramuscular_fat_adj":
			return self.getIntramuscularFatAdjStr()
			case "animal_sex":
			return self.getAnimalSexStr()
			case "create_user":
			return self.getCreateUserStr()
			case "create_stamp":
			return self.getCreateStampStr()
			case "update_user":
			return self.getUpdateUserStr()
			case "update_stamp":
			return self.getUpdateStampStr()
			case "sub_contemporary_group":
			return self.getSubContemporaryGroupStr()
			case "herd_id":
			return self.getHerdIdStr()
			case "premise_id":
			return self.getPremiseIdStr()
			case "pasture_id":
			return self.getPastureIdStr()
			case "work_order":
			return self.getWorkOrderStr()
			case "scrotal_circumference":
			return self.getScrotalCircumferenceStr()
			case "scrotal_circumference_adj":
			return self.getScrotalCircumferenceAdjStr()
			case "pre_contemporary_group":
			return self.getPreContemporaryGroupStr()
			case "commit_lock_id":
			return self.getCommitLockIdStr()
			case "season":
			return self.getSeasonStr()
			case "rea_ratio":
			return self.getReaRatioStr()
			case "imf_ratio":
			return self.getImfRatioStr()
			case "fat_ratio":
			return self.getFatRatioStr()
			case "hip_height":
			return self.getHipHeightStr()
			case "frame_score":
			return self.getFrameScoreStr()
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
    func loadByID(animal_registration: String) -> [String: String] {
        let qb = QueryBuilder()
        qb.selectFrom("tbl_animal_data_ultrasound")
            .Where("animal_registration = ?")

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(animal_registration)

        let fields = [String: String]()
        let (resultset, error) = SDOld.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setAnimalRegistration((row["animal_registration"]?.asString()));
				self.setRibeyeArea((row["ribeye_area"]?.asDouble()));
				self.setBackfatThickness((row["backfat_thickness"]?.asDouble()));
				self.setIntramuscularFat((row["intramuscular_fat"]?.asDouble()));
				self.setRumpFat((row["rump_fat"]?.asDouble()));
				self.setManagementGroup((row["management_group"]?.asString()));
				self.setTechnician((row["technician"]?.asString()));
				self.setHardware((row["hardware"]?.asString()));
				self.setSoftware((row["software"]?.asString()));
				self.setMeasurementDate((row["measurement_date"]?.asDate()));
				self.setUltrasoundWeight((row["ultrasound_weight"]?.asDouble()));
				self.setContemporaryGroup((row["contemporary_group"]?.asInt()));
				self.setRibeyeAreaAdj((row["ribeye_area_adj"]?.asDouble()));
				self.setBackfatThicknessAdj((row["backfat_thickness_adj"]?.asDouble()));
				self.setIntramuscularFatAdj((row["intramuscular_fat_adj"]?.asDouble()));
				self.setAnimalSex((row["animal_sex"]?.asString()));
				self.setCreateUser((row["create_user"]?.asString()));
				self.setCreateStamp((row["create_stamp"]?.asDate()));
				self.setUpdateUser((row["update_user"]?.asString()));
				self.setUpdateStamp((row["update_stamp"]?.asDate()));
				self.setSubContemporaryGroup((row["sub_contemporary_group"]?.asInt()));
				self.setHerdId((row["herd_id"]?.asInt()));
				self.setPremiseId((row["premise_id"]?.asString()));
				self.setPastureId((row["pasture_id"]?.asString()));
				self.setWorkOrder((row["work_order"]?.asString()));
				self.setScrotalCircumference((row["scrotal_circumference"]?.asDouble()));
				self.setScrotalCircumferenceAdj((row["scrotal_circumference_adj"]?.asDouble()));
				self.setPreContemporaryGroup((row["pre_contemporary_group"]?.asInt()));
				self.setCommitLockId((row["commit_lock_id"]?.asInt()));
				self.setSeason((row["season"]?.asInt()));
				self.setReaRatio((row["rea_ratio"]?.asInt()));
				self.setImfRatio((row["imf_ratio"]?.asInt()));
				self.setFatRatio((row["fat_ratio"]?.asInt()));
				self.setHipHeight((row["hip_height"]?.asDouble()));
				self.setFrameScore((row["frame_score"]?.asDouble()));

				var fields = [String: String]()
				fields["animal_registration"] = self.getAnimalRegistrationStr()
				fields["ribeye_area"] = self.getRibeyeAreaStr()
				fields["backfat_thickness"] = self.getBackfatThicknessStr()
				fields["intramuscular_fat"] = self.getIntramuscularFatStr()
				fields["rump_fat"] = self.getRumpFatStr()
				fields["management_group"] = self.getManagementGroupStr()
				fields["technician"] = self.getTechnicianStr()
				fields["hardware"] = self.getHardwareStr()
				fields["software"] = self.getSoftwareStr()
				fields["measurement_date"] = self.getMeasurementDateStr()
				fields["ultrasound_weight"] = self.getUltrasoundWeightStr()
				fields["contemporary_group"] = self.getContemporaryGroupStr()
				fields["ribeye_area_adj"] = self.getRibeyeAreaAdjStr()
				fields["backfat_thickness_adj"] = self.getBackfatThicknessAdjStr()
				fields["intramuscular_fat_adj"] = self.getIntramuscularFatAdjStr()
				fields["animal_sex"] = self.getAnimalSexStr()
				fields["create_user"] = self.getCreateUserStr()
				fields["create_stamp"] = self.getCreateStampStr()
				fields["update_user"] = self.getUpdateUserStr()
				fields["update_stamp"] = self.getUpdateStampStr()
				fields["sub_contemporary_group"] = self.getSubContemporaryGroupStr()
				fields["herd_id"] = self.getHerdIdStr()
				fields["premise_id"] = self.getPremiseIdStr()
				fields["pasture_id"] = self.getPastureIdStr()
				fields["work_order"] = self.getWorkOrderStr()
				fields["scrotal_circumference"] = self.getScrotalCircumferenceStr()
				fields["scrotal_circumference_adj"] = self.getScrotalCircumferenceAdjStr()
				fields["pre_contemporary_group"] = self.getPreContemporaryGroupStr()
				fields["commit_lock_id"] = self.getCommitLockIdStr()
				fields["season"] = self.getSeasonStr()
				fields["rea_ratio"] = self.getReaRatioStr()
				fields["imf_ratio"] = self.getImfRatioStr()
				fields["fat_ratio"] = self.getFatRatioStr()
				fields["hip_height"] = self.getHipHeightStr()
				fields["frame_score"] = self.getFrameScoreStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["animal_registration"] = self.getAnimalRegistrationStr()
		fields["ribeye_area"] = self.getRibeyeAreaStr()
		fields["backfat_thickness"] = self.getBackfatThicknessStr()
		fields["intramuscular_fat"] = self.getIntramuscularFatStr()
		fields["rump_fat"] = self.getRumpFatStr()
		fields["management_group"] = self.getManagementGroupStr()
		fields["technician"] = self.getTechnicianStr()
		fields["hardware"] = self.getHardwareStr()
		fields["software"] = self.getSoftwareStr()
		fields["measurement_date"] = self.getMeasurementDateStr()
		fields["ultrasound_weight"] = self.getUltrasoundWeightStr()
		fields["contemporary_group"] = self.getContemporaryGroupStr()
		fields["ribeye_area_adj"] = self.getRibeyeAreaAdjStr()
		fields["backfat_thickness_adj"] = self.getBackfatThicknessAdjStr()
		fields["intramuscular_fat_adj"] = self.getIntramuscularFatAdjStr()
		fields["animal_sex"] = self.getAnimalSexStr()
		fields["create_user"] = self.getCreateUserStr()
		fields["create_stamp"] = self.getCreateStampStr()
		fields["update_user"] = self.getUpdateUserStr()
		fields["update_stamp"] = self.getUpdateStampStr()
		fields["sub_contemporary_group"] = self.getSubContemporaryGroupStr()
		fields["herd_id"] = self.getHerdIdStr()
		fields["premise_id"] = self.getPremiseIdStr()
		fields["pasture_id"] = self.getPastureIdStr()
		fields["work_order"] = self.getWorkOrderStr()
		fields["scrotal_circumference"] = self.getScrotalCircumferenceStr()
		fields["scrotal_circumference_adj"] = self.getScrotalCircumferenceAdjStr()
		fields["pre_contemporary_group"] = self.getPreContemporaryGroupStr()
		fields["commit_lock_id"] = self.getCommitLockIdStr()
		fields["season"] = self.getSeasonStr()
		fields["rea_ratio"] = self.getReaRatioStr()
		fields["imf_ratio"] = self.getImfRatioStr()
		fields["fat_ratio"] = self.getFatRatioStr()
		fields["hip_height"] = self.getHipHeightStr()
		fields["frame_score"] = self.getFrameScoreStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["animal_registration"] = self.getAnimalRegistrationStrPG()
		fields["ribeye_area"] = self.getRibeyeAreaStrPG()
		fields["backfat_thickness"] = self.getBackfatThicknessStrPG()
		fields["intramuscular_fat"] = self.getIntramuscularFatStrPG()
		fields["rump_fat"] = self.getRumpFatStrPG()
		fields["management_group"] = self.getManagementGroupStrPG()
		fields["technician"] = self.getTechnicianStrPG()
		fields["hardware"] = self.getHardwareStrPG()
		fields["software"] = self.getSoftwareStrPG()
		fields["measurement_date"] = self.getMeasurementDateStrPG()
		fields["ultrasound_weight"] = self.getUltrasoundWeightStrPG()
		fields["contemporary_group"] = self.getContemporaryGroupStrPG()
		fields["ribeye_area_adj"] = self.getRibeyeAreaAdjStrPG()
		fields["backfat_thickness_adj"] = self.getBackfatThicknessAdjStrPG()
		fields["intramuscular_fat_adj"] = self.getIntramuscularFatAdjStrPG()
		fields["animal_sex"] = self.getAnimalSexStrPG()
		fields["create_user"] = self.getCreateUserStrPG()
		fields["create_stamp"] = self.getCreateStampStrPG()
		fields["update_user"] = self.getUpdateUserStrPG()
		fields["update_stamp"] = self.getUpdateStampStrPG()
		fields["sub_contemporary_group"] = self.getSubContemporaryGroupStrPG()
		fields["herd_id"] = self.getHerdIdStrPG()
		fields["premise_id"] = self.getPremiseIdStrPG()
		fields["pasture_id"] = self.getPastureIdStrPG()
		fields["work_order"] = self.getWorkOrderStrPG()
		fields["scrotal_circumference"] = self.getScrotalCircumferenceStrPG()
		fields["scrotal_circumference_adj"] = self.getScrotalCircumferenceAdjStrPG()
		fields["pre_contemporary_group"] = self.getPreContemporaryGroupStrPG()
		fields["commit_lock_id"] = self.getCommitLockIdStrPG()
		fields["season"] = self.getSeasonStrPG()
		fields["rea_ratio"] = self.getReaRatioStrPG()
		fields["imf_ratio"] = self.getImfRatioStrPG()
		fields["fat_ratio"] = self.getFatRatioStrPG()
		fields["hip_height"] = self.getHipHeightStrPG()
		fields["frame_score"] = self.getFrameScoreStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_animal_data_ultrasound ("
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

        var statement = "INSERT INTO tbl_animal_data_ultrasound ("
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

            var statement = "INSERT INTO tbl_animal_data_ultrasound ("

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

        var statement = "UPDATE tbl_animal_data_ultrasound "
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
        statement += "WHERE animal_registration = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query(statement)
    }

    func updatePG(forID: String) {

        // get all field/values as string values
        var fields = self.getFieldsPG()

        var statement = "UPDATE tbl_animal_data_ultrasound "
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
        statement += "WHERE animal_registration = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    func delete(forID: Int) {
        let query = "DELETE FROM tbl_animal_data_ultrasound WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM tbl_animal_data_ultrasound WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastanimalRegistration() -> String {
        let animal_registration: String = ""
        let query = "SELECT animal_registration from tbl_animal_data_ultrasound ORDER BY _id DESC LIMIT 1 "
        let (resultset, err) = SDOld.executeQuery(query)
        if (err == nil) {
            if resultset.count > 0 {
                let row = resultset[0]
                let animal_registration2 = row["animal_registration"]?.asString() ?? ""

                return animal_registration2

            }
        }
        return animal_registration
    }
}
