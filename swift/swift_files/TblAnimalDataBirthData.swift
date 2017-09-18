

//
//  TblAnimalDataBirth.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalDataBirthData {

	var animal_registration: String = "unset"
    var animal_registration_str: String = "unset"
	var contemporary_group: String = "unset"
    var contemporary_group_str: String = "unset"
	var management_group: String = "unset"
    var management_group_str: String = "unset"
	var animal_service_type: String = "unset"
    var animal_service_type_str: String = "unset"
	var birth_date: NSDate = NSDate.distantFuture() as NSDate
    var birth_date_str: String = "unset"
	var birth_weight: Double = -1.0
    var birth_weight_str: String = "unset"
	var animal_sex: String = "unset"
    var animal_sex_str: String = "unset"
	var twin_code: String = "unset"
    var twin_code_str: String = "unset"
	var calving_ease: String = "unset"
    var calving_ease_str: String = "unset"
	var udder_score_suspension: String = "unset"
    var udder_score_suspension_str: String = "unset"
	var udder_score_teat_size: String = "unset"
    var udder_score_teat_size_str: String = "unset"
	var natural_breeding_agreement: Int = -1
    var natural_breeding_agreement_str: String = "unset"
	var breeding_agreement_location: String = "unset"
    var breeding_agreement_location_str: String = "unset"
	var et_flush_date: NSDate = NSDate.distantFuture() as NSDate
    var et_flush_date_str: String = "unset"
	var et_transfer_date: NSDate = NSDate.distantFuture() as NSDate
    var et_transfer_date_str: String = "unset"
	var recipient_dam_registration: String = "unset"
    var recipient_dam_registration_str: String = "unset"
	var recipient_dam_animal_tattoo: String = "unset"
    var recipient_dam_animal_tattoo_str: String = "unset"
	var create_user: String = "unset"
    var create_user_str: String = "unset"
	var create_stamp: NSDate = NSDate.distantFuture() as NSDate
    var create_stamp_str: String = "unset"
	var update_user: String = "unset"
    var update_user_str: String = "unset"
	var update_stamp: NSDate = NSDate.distantFuture() as NSDate
    var update_stamp_str: String = "unset"
	var version: Int = -1
    var version_str: String = "unset"
	var birth_weight_adj: Double = -1.0
    var birth_weight_adj_str: String = "unset"
	var sub_contemporary_group: Int = -1
    var sub_contemporary_group_str: String = "unset"
	var herd_id: String = "unset"
    var herd_id_str: String = "unset"
	var inspector_name: String = "unset"
    var inspector_name_str: String = "unset"
	var inspector_id: Int = -1
    var inspector_id_str: String = "unset"
	var bw_ratio: Int = -1
    var bw_ratio_str: String = "unset"
	var premise_id: String = "unset"
    var premise_id_str: String = "unset"
	var pasture_id: String = "unset"
    var pasture_id_str: String = "unset"
	var work_order: String = "unset"
    var work_order_str: String = "unset"
	var pre_contemporary_group: Int = -1
    var pre_contemporary_group_str: String = "unset"
	var calving_season: Int = -1
    var calving_season_str: String = "unset"
	var commit_lock_id: Int = -1
    var commit_lock_id_str: String = "unset"
	var age_of_dam: Int = -1
    var age_of_dam_str: String = "unset"
	var inventory_season: String = "unset"
    var inventory_season_str: String = "unset"
	var eid: String = "unset"
    var eid_str: String = "unset"
	
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

	func setContemporaryGroup(contemporary_group: String?) {
        self.contemporary_group = contemporary_group ?? ""
        self.contemporary_group_str = String(self.contemporary_group)
    }
    func getContemporaryGroup() -> String {
        return self.contemporary_group
    }
    func getContemporaryGroupType() -> String {
        return "String"
    };
	func getContemporaryGroupStr() -> String {
        return contemporary_group_str == "unset" ? "" : contemporary_group_str
    };
	func getContemporaryGroupStrPG() -> String {
        return contemporary_group_str == "unset" ? "" : contemporary_group_str
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

	func setAnimalServiceType(animal_service_type: String?) {
        self.animal_service_type = animal_service_type ?? ""
        self.animal_service_type_str = String(self.animal_service_type)
    }
    func getAnimalServiceType() -> String {
        return self.animal_service_type
    }
    func getAnimalServiceTypeType() -> String {
        return "String"
    };
	func getAnimalServiceTypeStr() -> String {
        return animal_service_type_str == "unset" ? "" : animal_service_type_str
    };
	func getAnimalServiceTypeStrPG() -> String {
        return animal_service_type_str == "unset" ? "" : animal_service_type_str
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

	func setBirthWeight(birth_weight: Double?) {
   	   self.birth_weight = birth_weight ?? 0.0
   	   self.birth_weight_str = String(self.birth_weight)
    }
    func getBirthWeight() -> Double {
        return self.birth_weight
    }
    func getBirthWeightType() -> String {
        return "Double"
    };
	func getBirthWeightStr() -> String {
        return birth_weight_str
    };
	func getBirthWeightStrPG() -> String {
        return birth_weight_str
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

	func setTwinCode(twin_code: String?) {
        self.twin_code = twin_code ?? ""
        self.twin_code_str = String(self.twin_code)
    }
    func getTwinCode() -> String {
        return self.twin_code
    }
    func getTwinCodeType() -> String {
        return "String"
    };
	func getTwinCodeStr() -> String {
        return twin_code_str == "unset" ? "" : twin_code_str
    };
	func getTwinCodeStrPG() -> String {
        return twin_code_str == "unset" ? "" : twin_code_str
    };

	func setCalvingEase(calving_ease: String?) {
        self.calving_ease = calving_ease ?? ""
        self.calving_ease_str = String(self.calving_ease)
    }
    func getCalvingEase() -> String {
        return self.calving_ease
    }
    func getCalvingEaseType() -> String {
        return "String"
    };
	func getCalvingEaseStr() -> String {
        return calving_ease_str == "unset" ? "" : calving_ease_str
    };
	func getCalvingEaseStrPG() -> String {
        return calving_ease_str == "unset" ? "" : calving_ease_str
    };

	func setUdderScoreSuspension(udder_score_suspension: String?) {
        self.udder_score_suspension = udder_score_suspension ?? ""
        self.udder_score_suspension_str = String(self.udder_score_suspension)
    }
    func getUdderScoreSuspension() -> String {
        return self.udder_score_suspension
    }
    func getUdderScoreSuspensionType() -> String {
        return "String"
    };
	func getUdderScoreSuspensionStr() -> String {
        return udder_score_suspension_str == "unset" ? "" : udder_score_suspension_str
    };
	func getUdderScoreSuspensionStrPG() -> String {
        return udder_score_suspension_str == "unset" ? "" : udder_score_suspension_str
    };

	func setUdderScoreTeatSize(udder_score_teat_size: String?) {
        self.udder_score_teat_size = udder_score_teat_size ?? ""
        self.udder_score_teat_size_str = String(self.udder_score_teat_size)
    }
    func getUdderScoreTeatSize() -> String {
        return self.udder_score_teat_size
    }
    func getUdderScoreTeatSizeType() -> String {
        return "String"
    };
	func getUdderScoreTeatSizeStr() -> String {
        return udder_score_teat_size_str == "unset" ? "" : udder_score_teat_size_str
    };
	func getUdderScoreTeatSizeStrPG() -> String {
        return udder_score_teat_size_str == "unset" ? "" : udder_score_teat_size_str
    };

	func setNaturalBreedingAgreement(natural_breeding_agreement: Int?) {
        self.natural_breeding_agreement = natural_breeding_agreement ?? 0
        self.natural_breeding_agreement_str = ((self.natural_breeding_agreement) == 1) ? "t" : "f"
    }
    func getNaturalBreedingAgreement() -> Int {
        return self.natural_breeding_agreement
    }
    func getNaturalBreedingAgreementType() -> String {
        return "Int"
    };
	func getNaturalBreedingAgreementStr() -> String {
        return String(natural_breeding_agreement)
    };
	func getNaturalBreedingAgreementStrPG() -> String {
        return natural_breeding_agreement_str
    };

	func setBreedingAgreementLocation(breeding_agreement_location: String?) {
        self.breeding_agreement_location = breeding_agreement_location ?? ""
        self.breeding_agreement_location_str = String(self.breeding_agreement_location)
    }
    func getBreedingAgreementLocation() -> String {
        return self.breeding_agreement_location
    }
    func getBreedingAgreementLocationType() -> String {
        return "String"
    };
	func getBreedingAgreementLocationStr() -> String {
        return breeding_agreement_location_str == "unset" ? "" : breeding_agreement_location_str
    };
	func getBreedingAgreementLocationStrPG() -> String {
        return breeding_agreement_location_str == "unset" ? "" : breeding_agreement_location_str
    };

	func setEtFlushDate(et_flush_date: NSDate?) {
        self.et_flush_date = et_flush_date ?? NSDate.distantPast() as NSDate
        self.et_flush_date_str = Utils.dateToString(self.et_flush_date)
    }
    func getEtFlushDate() -> NSDate {
        return self.et_flush_date
    }
    func getEtFlushDateType() -> String {
        return "NSDate"
    };
	func getEtFlushDateStr() -> String {
        return et_flush_date_str == "unset" || et_flush_date_str == "0000-12-30 00:00:00 +0000" ? "" : et_flush_date_str
    };
	func getEtFlushDateStrPG() -> String {
        return et_flush_date_str == "unset" || et_flush_date_str == "0000-12-30 00:00:00 +0000" ? "" : et_flush_date_str
    };

	func setEtTransferDate(et_transfer_date: NSDate?) {
        self.et_transfer_date = et_transfer_date ?? NSDate.distantPast() as NSDate
        self.et_transfer_date_str = Utils.dateToString(self.et_transfer_date)
    }
    func getEtTransferDate() -> NSDate {
        return self.et_transfer_date
    }
    func getEtTransferDateType() -> String {
        return "NSDate"
    };
	func getEtTransferDateStr() -> String {
        return et_transfer_date_str == "unset" || et_transfer_date_str == "0000-12-30 00:00:00 +0000" ? "" : et_transfer_date_str
    };
	func getEtTransferDateStrPG() -> String {
        return et_transfer_date_str == "unset" || et_transfer_date_str == "0000-12-30 00:00:00 +0000" ? "" : et_transfer_date_str
    };

	func setRecipientDamRegistration(recipient_dam_registration: String?) {
        self.recipient_dam_registration = recipient_dam_registration ?? ""
        self.recipient_dam_registration_str = String(self.recipient_dam_registration)
    }
    func getRecipientDamRegistration() -> String {
        return self.recipient_dam_registration
    }
    func getRecipientDamRegistrationType() -> String {
        return "String"
    };
	func getRecipientDamRegistrationStr() -> String {
        return recipient_dam_registration_str == "unset" ? "" : recipient_dam_registration_str
    };
	func getRecipientDamRegistrationStrPG() -> String {
        return recipient_dam_registration_str == "unset" ? "" : recipient_dam_registration_str
    };

	func setRecipientDamAnimalTattoo(recipient_dam_animal_tattoo: String?) {
        self.recipient_dam_animal_tattoo = recipient_dam_animal_tattoo ?? ""
        self.recipient_dam_animal_tattoo_str = String(self.recipient_dam_animal_tattoo)
    }
    func getRecipientDamAnimalTattoo() -> String {
        return self.recipient_dam_animal_tattoo
    }
    func getRecipientDamAnimalTattooType() -> String {
        return "String"
    };
	func getRecipientDamAnimalTattooStr() -> String {
        return recipient_dam_animal_tattoo_str == "unset" ? "" : recipient_dam_animal_tattoo_str
    };
	func getRecipientDamAnimalTattooStrPG() -> String {
        return recipient_dam_animal_tattoo_str == "unset" ? "" : recipient_dam_animal_tattoo_str
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

	func setVersion(version: Int?) {
        self.version = version ?? 0
        let version2 = version ?? 0
        self.version_str = String(version2)
        self.version_str = (self.version_str == "0") ? "" : self.version_str
    }
    func getVersion() -> Int {
        return self.version
    }
    func getVersionType() -> String {
        return "Int"
    };
	func getVersionStr() -> String {
        return version_str
    };
	func getVersionStrPG() -> String {
        return version_str
    };

	func setBirthWeightAdj(birth_weight_adj: Double?) {
   	   self.birth_weight_adj = birth_weight_adj ?? 0.0
   	   self.birth_weight_adj_str = String(self.birth_weight_adj)
    }
    func getBirthWeightAdj() -> Double {
        return self.birth_weight_adj
    }
    func getBirthWeightAdjType() -> String {
        return "Double"
    };
	func getBirthWeightAdjStr() -> String {
        return birth_weight_adj_str
    };
	func getBirthWeightAdjStrPG() -> String {
        return birth_weight_adj_str
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

	func setHerdId(herd_id: String?) {
        self.herd_id = herd_id ?? ""
        self.herd_id_str = String(self.herd_id)
    }
    func getHerdId() -> String {
        return self.herd_id
    }
    func getHerdIdType() -> String {
        return "String"
    };
	func getHerdIdStr() -> String {
        return herd_id_str == "unset" ? "" : herd_id_str
    };
	func getHerdIdStrPG() -> String {
        return herd_id_str == "unset" ? "" : herd_id_str
    };

	func setInspectorName(inspector_name: String?) {
        self.inspector_name = inspector_name ?? ""
        self.inspector_name_str = String(self.inspector_name)
    }
    func getInspectorName() -> String {
        return self.inspector_name
    }
    func getInspectorNameType() -> String {
        return "String"
    };
	func getInspectorNameStr() -> String {
        return inspector_name_str == "unset" ? "" : inspector_name_str
    };
	func getInspectorNameStrPG() -> String {
        return inspector_name_str == "unset" ? "" : inspector_name_str
    };

	func setInspectorId(inspector_id: Int?) {
        self.inspector_id = inspector_id ?? 0
        let inspector_id2 = inspector_id ?? 0
        self.inspector_id_str = String(inspector_id2)
        self.inspector_id_str = (self.inspector_id_str == "0") ? "" : self.inspector_id_str
    }
    func getInspectorId() -> Int {
        return self.inspector_id
    }
    func getInspectorIdType() -> String {
        return "Int"
    };
	func getInspectorIdStr() -> String {
        return inspector_id_str
    };
	func getInspectorIdStrPG() -> String {
        return inspector_id_str
    };

	func setBwRatio(bw_ratio: Int?) {
        self.bw_ratio = bw_ratio ?? 0
        let bw_ratio2 = bw_ratio ?? 0
        self.bw_ratio_str = String(bw_ratio2)
        self.bw_ratio_str = (self.bw_ratio_str == "0") ? "" : self.bw_ratio_str
    }
    func getBwRatio() -> Int {
        return self.bw_ratio
    }
    func getBwRatioType() -> String {
        return "Int"
    };
	func getBwRatioStr() -> String {
        return bw_ratio_str
    };
	func getBwRatioStrPG() -> String {
        return bw_ratio_str
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

	func setCalvingSeason(calving_season: Int?) {
        self.calving_season = calving_season ?? 0
        let calving_season2 = calving_season ?? 0
        self.calving_season_str = String(calving_season2)
        self.calving_season_str = (self.calving_season_str == "0") ? "" : self.calving_season_str
    }
    func getCalvingSeason() -> Int {
        return self.calving_season
    }
    func getCalvingSeasonType() -> String {
        return "Int"
    };
	func getCalvingSeasonStr() -> String {
        return calving_season_str
    };
	func getCalvingSeasonStrPG() -> String {
        return calving_season_str
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

	func setAgeOfDam(age_of_dam: Int?) {
        self.age_of_dam = age_of_dam ?? 0
        let age_of_dam2 = age_of_dam ?? 0
        self.age_of_dam_str = String(age_of_dam2)
        self.age_of_dam_str = (self.age_of_dam_str == "0") ? "" : self.age_of_dam_str
    }
    func getAgeOfDam() -> Int {
        return self.age_of_dam
    }
    func getAgeOfDamType() -> String {
        return "Int"
    };
	func getAgeOfDamStr() -> String {
        return age_of_dam_str
    };
	func getAgeOfDamStrPG() -> String {
        return age_of_dam_str
    };

	func setInventorySeason(inventory_season: String?) {
        self.inventory_season = inventory_season ?? ""
        self.inventory_season_str = String(self.inventory_season)
    }
    func getInventorySeason() -> String {
        return self.inventory_season
    }
    func getInventorySeasonType() -> String {
        return "String"
    };
	func getInventorySeasonStr() -> String {
        return inventory_season_str == "unset" ? "" : inventory_season_str
    };
	func getInventorySeasonStrPG() -> String {
        return inventory_season_str == "unset" ? "" : inventory_season_str
    };

	func setEid(eid: String?) {
        self.eid = eid ?? ""
        self.eid_str = String(self.eid)
    }
    func getEid() -> String {
        return self.eid
    }
    func getEidType() -> String {
        return "String"
    };
	func getEidStr() -> String {
        return eid_str == "unset" ? "" : eid_str
    };
	func getEidStrPG() -> String {
        return eid_str == "unset" ? "" : eid_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "animal_registration":
				return "String"
			case "contemporary_group":
				return "String"
			case "management_group":
				return "String"
			case "animal_service_type":
				return "String"
			case "birth_date":
				return "NSDate"
			case "birth_weight":
				return "Double"
			case "animal_sex":
				return "String"
			case "twin_code":
				return "String"
			case "calving_ease":
				return "String"
			case "udder_score_suspension":
				return "String"
			case "udder_score_teat_size":
				return "String"
			case "natural_breeding_agreement":
				return "Int"
			case "breeding_agreement_location":
				return "String"
			case "et_flush_date":
				return "NSDate"
			case "et_transfer_date":
				return "NSDate"
			case "recipient_dam_registration":
				return "String"
			case "recipient_dam_animal_tattoo":
				return "String"
			case "create_user":
				return "String"
			case "create_stamp":
				return "NSDate"
			case "update_user":
				return "String"
			case "update_stamp":
				return "NSDate"
			case "version":
				return "Int"
			case "birth_weight_adj":
				return "Double"
			case "sub_contemporary_group":
				return "Int"
			case "herd_id":
				return "String"
			case "inspector_name":
				return "String"
			case "inspector_id":
				return "Int"
			case "bw_ratio":
				return "Int"
			case "premise_id":
				return "String"
			case "pasture_id":
				return "String"
			case "work_order":
				return "String"
			case "pre_contemporary_group":
				return "Int"
			case "calving_season":
				return "Int"
			case "commit_lock_id":
				return "Int"
			case "age_of_dam":
				return "Int"
			case "inventory_season":
				return "String"
			case "eid":
				return "String"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "animal_registration":
			return self.getAnimalRegistrationStr()
			case "contemporary_group":
			return self.getContemporaryGroupStr()
			case "management_group":
			return self.getManagementGroupStr()
			case "animal_service_type":
			return self.getAnimalServiceTypeStr()
			case "birth_date":
			return self.getBirthDateStr()
			case "birth_weight":
			return self.getBirthWeightStr()
			case "animal_sex":
			return self.getAnimalSexStr()
			case "twin_code":
			return self.getTwinCodeStr()
			case "calving_ease":
			return self.getCalvingEaseStr()
			case "udder_score_suspension":
			return self.getUdderScoreSuspensionStr()
			case "udder_score_teat_size":
			return self.getUdderScoreTeatSizeStr()
			case "natural_breeding_agreement":
			return self.getNaturalBreedingAgreementStr()
			case "breeding_agreement_location":
			return self.getBreedingAgreementLocationStr()
			case "et_flush_date":
			return self.getEtFlushDateStr()
			case "et_transfer_date":
			return self.getEtTransferDateStr()
			case "recipient_dam_registration":
			return self.getRecipientDamRegistrationStr()
			case "recipient_dam_animal_tattoo":
			return self.getRecipientDamAnimalTattooStr()
			case "create_user":
			return self.getCreateUserStr()
			case "create_stamp":
			return self.getCreateStampStr()
			case "update_user":
			return self.getUpdateUserStr()
			case "update_stamp":
			return self.getUpdateStampStr()
			case "version":
			return self.getVersionStr()
			case "birth_weight_adj":
			return self.getBirthWeightAdjStr()
			case "sub_contemporary_group":
			return self.getSubContemporaryGroupStr()
			case "herd_id":
			return self.getHerdIdStr()
			case "inspector_name":
			return self.getInspectorNameStr()
			case "inspector_id":
			return self.getInspectorIdStr()
			case "bw_ratio":
			return self.getBwRatioStr()
			case "premise_id":
			return self.getPremiseIdStr()
			case "pasture_id":
			return self.getPastureIdStr()
			case "work_order":
			return self.getWorkOrderStr()
			case "pre_contemporary_group":
			return self.getPreContemporaryGroupStr()
			case "calving_season":
			return self.getCalvingSeasonStr()
			case "commit_lock_id":
			return self.getCommitLockIdStr()
			case "age_of_dam":
			return self.getAgeOfDamStr()
			case "inventory_season":
			return self.getInventorySeasonStr()
			case "eid":
			return self.getEidStr()
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
        qb.selectFrom("tbl_animal_data_birth")
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
				self.setContemporaryGroup((row["contemporary_group"]?.asString()));
				self.setManagementGroup((row["management_group"]?.asString()));
				self.setAnimalServiceType((row["animal_service_type"]?.asString()));
				self.setBirthDate((row["birth_date"]?.asDate()));
				self.setBirthWeight((row["birth_weight"]?.asDouble()));
				self.setAnimalSex((row["animal_sex"]?.asString()));
				self.setTwinCode((row["twin_code"]?.asString()));
				self.setCalvingEase((row["calving_ease"]?.asString()));
				self.setUdderScoreSuspension((row["udder_score_suspension"]?.asString()));
				self.setUdderScoreTeatSize((row["udder_score_teat_size"]?.asString()));
				self.setNaturalBreedingAgreement((row["natural_breeding_agreement"]?.asMyBool()));
				self.setBreedingAgreementLocation((row["breeding_agreement_location"]?.asString()));
				self.setEtFlushDate((row["et_flush_date"]?.asDate()));
				self.setEtTransferDate((row["et_transfer_date"]?.asDate()));
				self.setRecipientDamRegistration((row["recipient_dam_registration"]?.asString()));
				self.setRecipientDamAnimalTattoo((row["recipient_dam_animal_tattoo"]?.asString()));
				self.setCreateUser((row["create_user"]?.asString()));
				self.setCreateStamp((row["create_stamp"]?.asDate()));
				self.setUpdateUser((row["update_user"]?.asString()));
				self.setUpdateStamp((row["update_stamp"]?.asDate()));
				self.setVersion((row["version"]?.asInt()));
				self.setBirthWeightAdj((row["birth_weight_adj"]?.asDouble()));
				self.setSubContemporaryGroup((row["sub_contemporary_group"]?.asInt()));
				self.setHerdId((row["herd_id"]?.asString()));
				self.setInspectorName((row["inspector_name"]?.asString()));
				self.setInspectorId((row["inspector_id"]?.asInt()));
				self.setBwRatio((row["bw_ratio"]?.asInt()));
				self.setPremiseId((row["premise_id"]?.asString()));
				self.setPastureId((row["pasture_id"]?.asString()));
				self.setWorkOrder((row["work_order"]?.asString()));
				self.setPreContemporaryGroup((row["pre_contemporary_group"]?.asInt()));
				self.setCalvingSeason((row["calving_season"]?.asInt()));
				self.setCommitLockId((row["commit_lock_id"]?.asInt()));
				self.setAgeOfDam((row["age_of_dam"]?.asInt()));
				self.setInventorySeason((row["inventory_season"]?.asString()));
				self.setEid((row["eid"]?.asString()));

				var fields = [String: String]()
				fields["animal_registration"] = self.getAnimalRegistrationStr()
				fields["contemporary_group"] = self.getContemporaryGroupStr()
				fields["management_group"] = self.getManagementGroupStr()
				fields["animal_service_type"] = self.getAnimalServiceTypeStr()
				fields["birth_date"] = self.getBirthDateStr()
				fields["birth_weight"] = self.getBirthWeightStr()
				fields["animal_sex"] = self.getAnimalSexStr()
				fields["twin_code"] = self.getTwinCodeStr()
				fields["calving_ease"] = self.getCalvingEaseStr()
				fields["udder_score_suspension"] = self.getUdderScoreSuspensionStr()
				fields["udder_score_teat_size"] = self.getUdderScoreTeatSizeStr()
				fields["natural_breeding_agreement"] = self.getNaturalBreedingAgreementStr()
				fields["breeding_agreement_location"] = self.getBreedingAgreementLocationStr()
				fields["et_flush_date"] = self.getEtFlushDateStr()
				fields["et_transfer_date"] = self.getEtTransferDateStr()
				fields["recipient_dam_registration"] = self.getRecipientDamRegistrationStr()
				fields["recipient_dam_animal_tattoo"] = self.getRecipientDamAnimalTattooStr()
				fields["create_user"] = self.getCreateUserStr()
				fields["create_stamp"] = self.getCreateStampStr()
				fields["update_user"] = self.getUpdateUserStr()
				fields["update_stamp"] = self.getUpdateStampStr()
				fields["version"] = self.getVersionStr()
				fields["birth_weight_adj"] = self.getBirthWeightAdjStr()
				fields["sub_contemporary_group"] = self.getSubContemporaryGroupStr()
				fields["herd_id"] = self.getHerdIdStr()
				fields["inspector_name"] = self.getInspectorNameStr()
				fields["inspector_id"] = self.getInspectorIdStr()
				fields["bw_ratio"] = self.getBwRatioStr()
				fields["premise_id"] = self.getPremiseIdStr()
				fields["pasture_id"] = self.getPastureIdStr()
				fields["work_order"] = self.getWorkOrderStr()
				fields["pre_contemporary_group"] = self.getPreContemporaryGroupStr()
				fields["calving_season"] = self.getCalvingSeasonStr()
				fields["commit_lock_id"] = self.getCommitLockIdStr()
				fields["age_of_dam"] = self.getAgeOfDamStr()
				fields["inventory_season"] = self.getInventorySeasonStr()
				fields["eid"] = self.getEidStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["animal_registration"] = self.getAnimalRegistrationStr()
		fields["contemporary_group"] = self.getContemporaryGroupStr()
		fields["management_group"] = self.getManagementGroupStr()
		fields["animal_service_type"] = self.getAnimalServiceTypeStr()
		fields["birth_date"] = self.getBirthDateStr()
		fields["birth_weight"] = self.getBirthWeightStr()
		fields["animal_sex"] = self.getAnimalSexStr()
		fields["twin_code"] = self.getTwinCodeStr()
		fields["calving_ease"] = self.getCalvingEaseStr()
		fields["udder_score_suspension"] = self.getUdderScoreSuspensionStr()
		fields["udder_score_teat_size"] = self.getUdderScoreTeatSizeStr()
		fields["natural_breeding_agreement"] = self.getNaturalBreedingAgreementStr()
		fields["breeding_agreement_location"] = self.getBreedingAgreementLocationStr()
		fields["et_flush_date"] = self.getEtFlushDateStr()
		fields["et_transfer_date"] = self.getEtTransferDateStr()
		fields["recipient_dam_registration"] = self.getRecipientDamRegistrationStr()
		fields["recipient_dam_animal_tattoo"] = self.getRecipientDamAnimalTattooStr()
		fields["create_user"] = self.getCreateUserStr()
		fields["create_stamp"] = self.getCreateStampStr()
		fields["update_user"] = self.getUpdateUserStr()
		fields["update_stamp"] = self.getUpdateStampStr()
		fields["version"] = self.getVersionStr()
		fields["birth_weight_adj"] = self.getBirthWeightAdjStr()
		fields["sub_contemporary_group"] = self.getSubContemporaryGroupStr()
		fields["herd_id"] = self.getHerdIdStr()
		fields["inspector_name"] = self.getInspectorNameStr()
		fields["inspector_id"] = self.getInspectorIdStr()
		fields["bw_ratio"] = self.getBwRatioStr()
		fields["premise_id"] = self.getPremiseIdStr()
		fields["pasture_id"] = self.getPastureIdStr()
		fields["work_order"] = self.getWorkOrderStr()
		fields["pre_contemporary_group"] = self.getPreContemporaryGroupStr()
		fields["calving_season"] = self.getCalvingSeasonStr()
		fields["commit_lock_id"] = self.getCommitLockIdStr()
		fields["age_of_dam"] = self.getAgeOfDamStr()
		fields["inventory_season"] = self.getInventorySeasonStr()
		fields["eid"] = self.getEidStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["animal_registration"] = self.getAnimalRegistrationStrPG()
		fields["contemporary_group"] = self.getContemporaryGroupStrPG()
		fields["management_group"] = self.getManagementGroupStrPG()
		fields["animal_service_type"] = self.getAnimalServiceTypeStrPG()
		fields["birth_date"] = self.getBirthDateStrPG()
		fields["birth_weight"] = self.getBirthWeightStrPG()
		fields["animal_sex"] = self.getAnimalSexStrPG()
		fields["twin_code"] = self.getTwinCodeStrPG()
		fields["calving_ease"] = self.getCalvingEaseStrPG()
		fields["udder_score_suspension"] = self.getUdderScoreSuspensionStrPG()
		fields["udder_score_teat_size"] = self.getUdderScoreTeatSizeStrPG()
		fields["natural_breeding_agreement"] = self.getNaturalBreedingAgreementStrPG()
		fields["breeding_agreement_location"] = self.getBreedingAgreementLocationStrPG()
		fields["et_flush_date"] = self.getEtFlushDateStrPG()
		fields["et_transfer_date"] = self.getEtTransferDateStrPG()
		fields["recipient_dam_registration"] = self.getRecipientDamRegistrationStrPG()
		fields["recipient_dam_animal_tattoo"] = self.getRecipientDamAnimalTattooStrPG()
		fields["create_user"] = self.getCreateUserStrPG()
		fields["create_stamp"] = self.getCreateStampStrPG()
		fields["update_user"] = self.getUpdateUserStrPG()
		fields["update_stamp"] = self.getUpdateStampStrPG()
		fields["version"] = self.getVersionStrPG()
		fields["birth_weight_adj"] = self.getBirthWeightAdjStrPG()
		fields["sub_contemporary_group"] = self.getSubContemporaryGroupStrPG()
		fields["herd_id"] = self.getHerdIdStrPG()
		fields["inspector_name"] = self.getInspectorNameStrPG()
		fields["inspector_id"] = self.getInspectorIdStrPG()
		fields["bw_ratio"] = self.getBwRatioStrPG()
		fields["premise_id"] = self.getPremiseIdStrPG()
		fields["pasture_id"] = self.getPastureIdStrPG()
		fields["work_order"] = self.getWorkOrderStrPG()
		fields["pre_contemporary_group"] = self.getPreContemporaryGroupStrPG()
		fields["calving_season"] = self.getCalvingSeasonStrPG()
		fields["commit_lock_id"] = self.getCommitLockIdStrPG()
		fields["age_of_dam"] = self.getAgeOfDamStrPG()
		fields["inventory_season"] = self.getInventorySeasonStrPG()
		fields["eid"] = self.getEidStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_animal_data_birth ("
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

        var statement = "INSERT INTO tbl_animal_data_birth ("
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

            var statement = "INSERT INTO tbl_animal_data_birth ("

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

        var statement = "UPDATE tbl_animal_data_birth "
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

        var statement = "UPDATE tbl_animal_data_birth "
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
        let query = "DELETE FROM tbl_animal_data_birth WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM tbl_animal_data_birth WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastanimalRegistration() -> String {
        let animal_registration: String = ""
        let query = "SELECT animal_registration from tbl_animal_data_birth ORDER BY _id DESC LIMIT 1 "
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
