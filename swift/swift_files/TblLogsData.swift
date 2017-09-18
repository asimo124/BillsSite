

//
//  TblLogs.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblLogsData {

	var log_id: Int = -1
    var log_id_str: String = "unset"
	var profile_id: String = "unset"
    var profile_id_str: String = "unset"
	var flag_new_calf: String = "unset"
    var flag_new_calf_str: String = "unset"
	var flag_new_wean: String = "unset"
    var flag_new_wean_str: String = "unset"
	var flag_new_year: String = "unset"
    var flag_new_year_str: String = "unset"
	var flag_new_eid: String = "unset"
    var flag_new_eid_str: String = "unset"
	var flag_new_vacc: String = "unset"
    var flag_new_vacc_str: String = "unset"
	var flag_new_bang: String = "unset"
    var flag_new_bang_str: String = "unset"
	var flag_new_weight: String = "unset"
    var flag_new_weight_str: String = "unset"
	var flag_new_pasture: String = "unset"
    var flag_new_pasture_str: String = "unset"
	var flag_new_escaped: String = "unset"
    var flag_new_escaped_str: String = "unset"
	var flag_new_brand: String = "unset"
    var flag_new_brand_str: String = "unset"
	var flag_new_pregnancy: String = "unset"
    var flag_new_pregnancy_str: String = "unset"
	var flag_new_breed_ai: String = "unset"
    var flag_new_breed_ai_str: String = "unset"
	var flag_new_animal: String = "unset"
    var flag_new_animal_str: String = "unset"
	var flag_new_comment: String = "unset"
    var flag_new_comment_str: String = "unset"
	var flag_new_sync: String = "unset"
    var flag_new_sync_str: String = "unset"
	var flag_new_breed_et: String = "unset"
    var flag_new_breed_et_str: String = "unset"
	var phn: String = "unset"
    var phn_str: String = "unset"
	var reg_no: String = "unset"
    var reg_no_str: String = "unset"
	var eid: String = "unset"
    var eid_str: String = "unset"
	var date_worked: String = "unset"
    var date_worked_str: String = "unset"
	var pasture_id: String = "unset"
    var pasture_id_str: String = "unset"
	var weight: String = "unset"
    var weight_str: String = "unset"
	var sex: String = "unset"
    var sex_str: String = "unset"
	var dob: String = "unset"
    var dob_str: String = "unset"
	var dam: String = "unset"
    var dam_str: String = "unset"
	var sire: String = "unset"
    var sire_str: String = "unset"
	var bangs_id: String = "unset"
    var bangs_id_str: String = "unset"
	var brand: String = "unset"
    var brand_str: String = "unset"
	var brand_location: String = "unset"
    var brand_location_str: String = "unset"
	var prev_pasture_id: String = "unset"
    var prev_pasture_id_str: String = "unset"
	var breed_type: String = "unset"
    var breed_type_str: String = "unset"
	var palpation_result: String = "unset"
    var palpation_result_str: String = "unset"
	var estimated_birthing: String = "unset"
    var estimated_birthing_str: String = "unset"
	var comment: String = "unset"
    var comment_str: String = "unset"
	var working_pasture_id: String = "unset"
    var working_pasture_id_str: String = "unset"
	var create_user: String = "unset"
    var create_user_str: String = "unset"
	var create_stamp: NSDate = NSDate.distantFuture() as NSDate
    var create_stamp_str: String = "unset"
	var update_user: String = "unset"
    var update_user_str: String = "unset"
	var update_stamp: NSDate = NSDate.distantFuture() as NSDate
    var update_stamp_str: String = "unset"
	
	func setLogId(log_id: Int?) {
        self.log_id = log_id ?? 0
        let log_id2 = log_id ?? 0
        self.log_id_str = String(log_id2)
        self.log_id_str = (self.log_id_str == "0") ? "" : self.log_id_str
    }
    func getLogId() -> Int {
        return self.log_id
    }
    func getLogIdType() -> String {
        return "Int"
    };
	func getLogIdStr() -> String {
        return log_id_str
    };
	func getLogIdStrPG() -> String {
        return log_id_str
    };

	func setProfileId(profile_id: String?) {
        self.profile_id = profile_id ?? ""
        self.profile_id_str = String(self.profile_id)
    }
    func getProfileId() -> String {
        return self.profile_id
    }
    func getProfileIdType() -> String {
        return "String"
    };
	func getProfileIdStr() -> String {
        return profile_id_str == "unset" ? "" : profile_id_str
    };
	func getProfileIdStrPG() -> String {
        return profile_id_str == "unset" ? "" : profile_id_str
    };

	func setFlagNewCalf(flag_new_calf: String?) {
        self.flag_new_calf = flag_new_calf ?? ""
        self.flag_new_calf_str = String(self.flag_new_calf)
    }
    func getFlagNewCalf() -> String {
        return self.flag_new_calf
    }
    func getFlagNewCalfType() -> String {
        return "String"
    };
	func getFlagNewCalfStr() -> String {
        return flag_new_calf_str == "unset" ? "" : flag_new_calf_str
    };
	func getFlagNewCalfStrPG() -> String {
        return flag_new_calf_str == "unset" ? "" : flag_new_calf_str
    };

	func setFlagNewWean(flag_new_wean: String?) {
        self.flag_new_wean = flag_new_wean ?? ""
        self.flag_new_wean_str = String(self.flag_new_wean)
    }
    func getFlagNewWean() -> String {
        return self.flag_new_wean
    }
    func getFlagNewWeanType() -> String {
        return "String"
    };
	func getFlagNewWeanStr() -> String {
        return flag_new_wean_str == "unset" ? "" : flag_new_wean_str
    };
	func getFlagNewWeanStrPG() -> String {
        return flag_new_wean_str == "unset" ? "" : flag_new_wean_str
    };

	func setFlagNewYear(flag_new_year: String?) {
        self.flag_new_year = flag_new_year ?? ""
        self.flag_new_year_str = String(self.flag_new_year)
    }
    func getFlagNewYear() -> String {
        return self.flag_new_year
    }
    func getFlagNewYearType() -> String {
        return "String"
    };
	func getFlagNewYearStr() -> String {
        return flag_new_year_str == "unset" ? "" : flag_new_year_str
    };
	func getFlagNewYearStrPG() -> String {
        return flag_new_year_str == "unset" ? "" : flag_new_year_str
    };

	func setFlagNewEid(flag_new_eid: String?) {
        self.flag_new_eid = flag_new_eid ?? ""
        self.flag_new_eid_str = String(self.flag_new_eid)
    }
    func getFlagNewEid() -> String {
        return self.flag_new_eid
    }
    func getFlagNewEidType() -> String {
        return "String"
    };
	func getFlagNewEidStr() -> String {
        return flag_new_eid_str == "unset" ? "" : flag_new_eid_str
    };
	func getFlagNewEidStrPG() -> String {
        return flag_new_eid_str == "unset" ? "" : flag_new_eid_str
    };

	func setFlagNewVacc(flag_new_vacc: String?) {
        self.flag_new_vacc = flag_new_vacc ?? ""
        self.flag_new_vacc_str = String(self.flag_new_vacc)
    }
    func getFlagNewVacc() -> String {
        return self.flag_new_vacc
    }
    func getFlagNewVaccType() -> String {
        return "String"
    };
	func getFlagNewVaccStr() -> String {
        return flag_new_vacc_str == "unset" ? "" : flag_new_vacc_str
    };
	func getFlagNewVaccStrPG() -> String {
        return flag_new_vacc_str == "unset" ? "" : flag_new_vacc_str
    };

	func setFlagNewBang(flag_new_bang: String?) {
        self.flag_new_bang = flag_new_bang ?? ""
        self.flag_new_bang_str = String(self.flag_new_bang)
    }
    func getFlagNewBang() -> String {
        return self.flag_new_bang
    }
    func getFlagNewBangType() -> String {
        return "String"
    };
	func getFlagNewBangStr() -> String {
        return flag_new_bang_str == "unset" ? "" : flag_new_bang_str
    };
	func getFlagNewBangStrPG() -> String {
        return flag_new_bang_str == "unset" ? "" : flag_new_bang_str
    };

	func setFlagNewWeight(flag_new_weight: String?) {
        self.flag_new_weight = flag_new_weight ?? ""
        self.flag_new_weight_str = String(self.flag_new_weight)
    }
    func getFlagNewWeight() -> String {
        return self.flag_new_weight
    }
    func getFlagNewWeightType() -> String {
        return "String"
    };
	func getFlagNewWeightStr() -> String {
        return flag_new_weight_str == "unset" ? "" : flag_new_weight_str
    };
	func getFlagNewWeightStrPG() -> String {
        return flag_new_weight_str == "unset" ? "" : flag_new_weight_str
    };

	func setFlagNewPasture(flag_new_pasture: String?) {
        self.flag_new_pasture = flag_new_pasture ?? ""
        self.flag_new_pasture_str = String(self.flag_new_pasture)
    }
    func getFlagNewPasture() -> String {
        return self.flag_new_pasture
    }
    func getFlagNewPastureType() -> String {
        return "String"
    };
	func getFlagNewPastureStr() -> String {
        return flag_new_pasture_str == "unset" ? "" : flag_new_pasture_str
    };
	func getFlagNewPastureStrPG() -> String {
        return flag_new_pasture_str == "unset" ? "" : flag_new_pasture_str
    };

	func setFlagNewEscaped(flag_new_escaped: String?) {
        self.flag_new_escaped = flag_new_escaped ?? ""
        self.flag_new_escaped_str = String(self.flag_new_escaped)
    }
    func getFlagNewEscaped() -> String {
        return self.flag_new_escaped
    }
    func getFlagNewEscapedType() -> String {
        return "String"
    };
	func getFlagNewEscapedStr() -> String {
        return flag_new_escaped_str == "unset" ? "" : flag_new_escaped_str
    };
	func getFlagNewEscapedStrPG() -> String {
        return flag_new_escaped_str == "unset" ? "" : flag_new_escaped_str
    };

	func setFlagNewBrand(flag_new_brand: String?) {
        self.flag_new_brand = flag_new_brand ?? ""
        self.flag_new_brand_str = String(self.flag_new_brand)
    }
    func getFlagNewBrand() -> String {
        return self.flag_new_brand
    }
    func getFlagNewBrandType() -> String {
        return "String"
    };
	func getFlagNewBrandStr() -> String {
        return flag_new_brand_str == "unset" ? "" : flag_new_brand_str
    };
	func getFlagNewBrandStrPG() -> String {
        return flag_new_brand_str == "unset" ? "" : flag_new_brand_str
    };

	func setFlagNewPregnancy(flag_new_pregnancy: String?) {
        self.flag_new_pregnancy = flag_new_pregnancy ?? ""
        self.flag_new_pregnancy_str = String(self.flag_new_pregnancy)
    }
    func getFlagNewPregnancy() -> String {
        return self.flag_new_pregnancy
    }
    func getFlagNewPregnancyType() -> String {
        return "String"
    };
	func getFlagNewPregnancyStr() -> String {
        return flag_new_pregnancy_str == "unset" ? "" : flag_new_pregnancy_str
    };
	func getFlagNewPregnancyStrPG() -> String {
        return flag_new_pregnancy_str == "unset" ? "" : flag_new_pregnancy_str
    };

	func setFlagNewBreedAi(flag_new_breed_ai: String?) {
        self.flag_new_breed_ai = flag_new_breed_ai ?? ""
        self.flag_new_breed_ai_str = String(self.flag_new_breed_ai)
    }
    func getFlagNewBreedAi() -> String {
        return self.flag_new_breed_ai
    }
    func getFlagNewBreedAiType() -> String {
        return "String"
    };
	func getFlagNewBreedAiStr() -> String {
        return flag_new_breed_ai_str == "unset" ? "" : flag_new_breed_ai_str
    };
	func getFlagNewBreedAiStrPG() -> String {
        return flag_new_breed_ai_str == "unset" ? "" : flag_new_breed_ai_str
    };

	func setFlagNewAnimal(flag_new_animal: String?) {
        self.flag_new_animal = flag_new_animal ?? ""
        self.flag_new_animal_str = String(self.flag_new_animal)
    }
    func getFlagNewAnimal() -> String {
        return self.flag_new_animal
    }
    func getFlagNewAnimalType() -> String {
        return "String"
    };
	func getFlagNewAnimalStr() -> String {
        return flag_new_animal_str == "unset" ? "" : flag_new_animal_str
    };
	func getFlagNewAnimalStrPG() -> String {
        return flag_new_animal_str == "unset" ? "" : flag_new_animal_str
    };

	func setFlagNewComment(flag_new_comment: String?) {
        self.flag_new_comment = flag_new_comment ?? ""
        self.flag_new_comment_str = String(self.flag_new_comment)
    }
    func getFlagNewComment() -> String {
        return self.flag_new_comment
    }
    func getFlagNewCommentType() -> String {
        return "String"
    };
	func getFlagNewCommentStr() -> String {
        return flag_new_comment_str == "unset" ? "" : flag_new_comment_str
    };
	func getFlagNewCommentStrPG() -> String {
        return flag_new_comment_str == "unset" ? "" : flag_new_comment_str
    };

	func setFlagNewSync(flag_new_sync: String?) {
        self.flag_new_sync = flag_new_sync ?? ""
        self.flag_new_sync_str = String(self.flag_new_sync)
    }
    func getFlagNewSync() -> String {
        return self.flag_new_sync
    }
    func getFlagNewSyncType() -> String {
        return "String"
    };
	func getFlagNewSyncStr() -> String {
        return flag_new_sync_str == "unset" ? "" : flag_new_sync_str
    };
	func getFlagNewSyncStrPG() -> String {
        return flag_new_sync_str == "unset" ? "" : flag_new_sync_str
    };

	func setFlagNewBreedEt(flag_new_breed_et: String?) {
        self.flag_new_breed_et = flag_new_breed_et ?? ""
        self.flag_new_breed_et_str = String(self.flag_new_breed_et)
    }
    func getFlagNewBreedEt() -> String {
        return self.flag_new_breed_et
    }
    func getFlagNewBreedEtType() -> String {
        return "String"
    };
	func getFlagNewBreedEtStr() -> String {
        return flag_new_breed_et_str == "unset" ? "" : flag_new_breed_et_str
    };
	func getFlagNewBreedEtStrPG() -> String {
        return flag_new_breed_et_str == "unset" ? "" : flag_new_breed_et_str
    };

	func setPhn(phn: String?) {
        self.phn = phn ?? ""
        self.phn_str = String(self.phn)
    }
    func getPhn() -> String {
        return self.phn
    }
    func getPhnType() -> String {
        return "String"
    };
	func getPhnStr() -> String {
        return phn_str == "unset" ? "" : phn_str
    };
	func getPhnStrPG() -> String {
        return phn_str == "unset" ? "" : phn_str
    };

	func setRegNo(reg_no: String?) {
        self.reg_no = reg_no ?? ""
        self.reg_no_str = String(self.reg_no)
    }
    func getRegNo() -> String {
        return self.reg_no
    }
    func getRegNoType() -> String {
        return "String"
    };
	func getRegNoStr() -> String {
        return reg_no_str == "unset" ? "" : reg_no_str
    };
	func getRegNoStrPG() -> String {
        return reg_no_str == "unset" ? "" : reg_no_str
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

	func setDateWorked(date_worked: String?) {
        self.date_worked = date_worked ?? ""
        self.date_worked_str = String(self.date_worked)
    }
    func getDateWorked() -> String {
        return self.date_worked
    }
    func getDateWorkedType() -> String {
        return "String"
    };
	func getDateWorkedStr() -> String {
        return date_worked_str == "unset" ? "" : date_worked_str
    };
	func getDateWorkedStrPG() -> String {
        return date_worked_str == "unset" ? "" : date_worked_str
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

	func setWeight(weight: String?) {
        self.weight = weight ?? ""
        self.weight_str = String(self.weight)
    }
    func getWeight() -> String {
        return self.weight
    }
    func getWeightType() -> String {
        return "String"
    };
	func getWeightStr() -> String {
        return weight_str == "unset" ? "" : weight_str
    };
	func getWeightStrPG() -> String {
        return weight_str == "unset" ? "" : weight_str
    };

	func setSex(sex: String?) {
        self.sex = sex ?? ""
        self.sex_str = String(self.sex)
    }
    func getSex() -> String {
        return self.sex
    }
    func getSexType() -> String {
        return "String"
    };
	func getSexStr() -> String {
        return sex_str == "unset" ? "" : sex_str
    };
	func getSexStrPG() -> String {
        return sex_str == "unset" ? "" : sex_str
    };

	func setDob(dob: String?) {
        self.dob = dob ?? ""
        self.dob_str = String(self.dob)
    }
    func getDob() -> String {
        return self.dob
    }
    func getDobType() -> String {
        return "String"
    };
	func getDobStr() -> String {
        return dob_str == "unset" ? "" : dob_str
    };
	func getDobStrPG() -> String {
        return dob_str == "unset" ? "" : dob_str
    };

	func setDam(dam: String?) {
        self.dam = dam ?? ""
        self.dam_str = String(self.dam)
    }
    func getDam() -> String {
        return self.dam
    }
    func getDamType() -> String {
        return "String"
    };
	func getDamStr() -> String {
        return dam_str == "unset" ? "" : dam_str
    };
	func getDamStrPG() -> String {
        return dam_str == "unset" ? "" : dam_str
    };

	func setSire(sire: String?) {
        self.sire = sire ?? ""
        self.sire_str = String(self.sire)
    }
    func getSire() -> String {
        return self.sire
    }
    func getSireType() -> String {
        return "String"
    };
	func getSireStr() -> String {
        return sire_str == "unset" ? "" : sire_str
    };
	func getSireStrPG() -> String {
        return sire_str == "unset" ? "" : sire_str
    };

	func setBangsId(bangs_id: String?) {
        self.bangs_id = bangs_id ?? ""
        self.bangs_id_str = String(self.bangs_id)
    }
    func getBangsId() -> String {
        return self.bangs_id
    }
    func getBangsIdType() -> String {
        return "String"
    };
	func getBangsIdStr() -> String {
        return bangs_id_str == "unset" ? "" : bangs_id_str
    };
	func getBangsIdStrPG() -> String {
        return bangs_id_str == "unset" ? "" : bangs_id_str
    };

	func setBrand(brand: String?) {
        self.brand = brand ?? ""
        self.brand_str = String(self.brand)
    }
    func getBrand() -> String {
        return self.brand
    }
    func getBrandType() -> String {
        return "String"
    };
	func getBrandStr() -> String {
        return brand_str == "unset" ? "" : brand_str
    };
	func getBrandStrPG() -> String {
        return brand_str == "unset" ? "" : brand_str
    };

	func setBrandLoc(brand_location: String?) {
        self.brand_location = brand_location ?? ""
        self.brand_location_str = String(self.brand_location)
    }
    func getBrandLoc() -> String {
        return self.brand_location
    }
    func getBrandLocType() -> String {
        return "String"
    };
	func getBrandLocStr() -> String {
        return brand_location_str == "unset" ? "" : brand_location_str
    };
	func getBrandLocStrPG() -> String {
        return brand_location_str == "unset" ? "" : brand_location_str
    };

	func setPrevPastureId(prev_pasture_id: String?) {
        self.prev_pasture_id = prev_pasture_id ?? ""
        self.prev_pasture_id_str = String(self.prev_pasture_id)
    }
    func getPrevPastureId() -> String {
        return self.prev_pasture_id
    }
    func getPrevPastureIdType() -> String {
        return "String"
    };
	func getPrevPastureIdStr() -> String {
        return prev_pasture_id_str == "unset" ? "" : prev_pasture_id_str
    };
	func getPrevPastureIdStrPG() -> String {
        return prev_pasture_id_str == "unset" ? "" : prev_pasture_id_str
    };

	func setBreedType(breed_type: String?) {
        self.breed_type = breed_type ?? ""
        self.breed_type_str = String(self.breed_type)
    }
    func getBreedType() -> String {
        return self.breed_type
    }
    func getBreedTypeType() -> String {
        return "String"
    };
	func getBreedTypeStr() -> String {
        return breed_type_str == "unset" ? "" : breed_type_str
    };
	func getBreedTypeStrPG() -> String {
        return breed_type_str == "unset" ? "" : breed_type_str
    };

	func setPalpationResult(palpation_result: String?) {
        self.palpation_result = palpation_result ?? ""
        self.palpation_result_str = String(self.palpation_result)
    }
    func getPalpationResult() -> String {
        return self.palpation_result
    }
    func getPalpationResultType() -> String {
        return "String"
    };
	func getPalpationResultStr() -> String {
        return palpation_result_str == "unset" ? "" : palpation_result_str
    };
	func getPalpationResultStrPG() -> String {
        return palpation_result_str == "unset" ? "" : palpation_result_str
    };

	func setEstimatedBirthing(estimated_birthing: String?) {
        self.estimated_birthing = estimated_birthing ?? ""
        self.estimated_birthing_str = String(self.estimated_birthing)
    }
    func getEstimatedBirthing() -> String {
        return self.estimated_birthing
    }
    func getEstimatedBirthingType() -> String {
        return "String"
    };
	func getEstimatedBirthingStr() -> String {
        return estimated_birthing_str == "unset" ? "" : estimated_birthing_str
    };
	func getEstimatedBirthingStrPG() -> String {
        return estimated_birthing_str == "unset" ? "" : estimated_birthing_str
    };

	func setComment(comment: String?) {
        self.comment = comment ?? ""
        self.comment_str = String(self.comment)
    }
    func getComment() -> String {
        return self.comment
    }
    func getCommentType() -> String {
        return "String"
    };
	func getCommentStr() -> String {
        return comment_str == "unset" ? "" : comment_str
    };
	func getCommentStrPG() -> String {
        return comment_str == "unset" ? "" : comment_str
    };

	func setWorkingPastureId(working_pasture_id: String?) {
        self.working_pasture_id = working_pasture_id ?? ""
        self.working_pasture_id_str = String(self.working_pasture_id)
    }
    func getWorkingPastureId() -> String {
        return self.working_pasture_id
    }
    func getWorkingPastureIdType() -> String {
        return "String"
    };
	func getWorkingPastureIdStr() -> String {
        return working_pasture_id_str == "unset" ? "" : working_pasture_id_str
    };
	func getWorkingPastureIdStrPG() -> String {
        return working_pasture_id_str == "unset" ? "" : working_pasture_id_str
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

	func getFieldType(field: String) -> String {
        switch field {
			case "log_id":
				return "Int"
			case "profile_id":
				return "String"
			case "flag_new_calf":
				return "String"
			case "flag_new_wean":
				return "String"
			case "flag_new_year":
				return "String"
			case "flag_new_eid":
				return "String"
			case "flag_new_vacc":
				return "String"
			case "flag_new_bang":
				return "String"
			case "flag_new_weight":
				return "String"
			case "flag_new_pasture":
				return "String"
			case "flag_new_escaped":
				return "String"
			case "flag_new_brand":
				return "String"
			case "flag_new_pregnancy":
				return "String"
			case "flag_new_breed_ai":
				return "String"
			case "flag_new_animal":
				return "String"
			case "flag_new_comment":
				return "String"
			case "flag_new_sync":
				return "String"
			case "flag_new_breed_et":
				return "String"
			case "phn":
				return "String"
			case "reg_no":
				return "String"
			case "eid":
				return "String"
			case "date_worked":
				return "String"
			case "pasture_id":
				return "String"
			case "weight":
				return "String"
			case "sex":
				return "String"
			case "dob":
				return "String"
			case "dam":
				return "String"
			case "sire":
				return "String"
			case "bangs_id":
				return "String"
			case "brand":
				return "String"
			case "brand_location":
				return "String"
			case "prev_pasture_id":
				return "String"
			case "breed_type":
				return "String"
			case "palpation_result":
				return "String"
			case "estimated_birthing":
				return "String"
			case "comment":
				return "String"
			case "working_pasture_id":
				return "String"
			case "create_user":
				return "String"
			case "create_stamp":
				return "NSDate"
			case "update_user":
				return "String"
			case "update_stamp":
				return "NSDate"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "log_id":
			return self.getLogIdStr()
			case "profile_id":
			return self.getProfileIdStr()
			case "flag_new_calf":
			return self.getFlagNewCalfStr()
			case "flag_new_wean":
			return self.getFlagNewWeanStr()
			case "flag_new_year":
			return self.getFlagNewYearStr()
			case "flag_new_eid":
			return self.getFlagNewEidStr()
			case "flag_new_vacc":
			return self.getFlagNewVaccStr()
			case "flag_new_bang":
			return self.getFlagNewBangStr()
			case "flag_new_weight":
			return self.getFlagNewWeightStr()
			case "flag_new_pasture":
			return self.getFlagNewPastureStr()
			case "flag_new_escaped":
			return self.getFlagNewEscapedStr()
			case "flag_new_brand":
			return self.getFlagNewBrandStr()
			case "flag_new_pregnancy":
			return self.getFlagNewPregnancyStr()
			case "flag_new_breed_ai":
			return self.getFlagNewBreedAiStr()
			case "flag_new_animal":
			return self.getFlagNewAnimalStr()
			case "flag_new_comment":
			return self.getFlagNewCommentStr()
			case "flag_new_sync":
			return self.getFlagNewSyncStr()
			case "flag_new_breed_et":
			return self.getFlagNewBreedEtStr()
			case "phn":
			return self.getPhnStr()
			case "reg_no":
			return self.getRegNoStr()
			case "eid":
			return self.getEidStr()
			case "date_worked":
			return self.getDateWorkedStr()
			case "pasture_id":
			return self.getPastureIdStr()
			case "weight":
			return self.getWeightStr()
			case "sex":
			return self.getSexStr()
			case "dob":
			return self.getDobStr()
			case "dam":
			return self.getDamStr()
			case "sire":
			return self.getSireStr()
			case "bangs_id":
			return self.getBangsIdStr()
			case "brand":
			return self.getBrandStr()
			case "brand_location":
			return self.getBrandLocStr()
			case "prev_pasture_id":
			return self.getPrevPastureIdStr()
			case "breed_type":
			return self.getBreedTypeStr()
			case "palpation_result":
			return self.getPalpationResultStr()
			case "estimated_birthing":
			return self.getEstimatedBirthingStr()
			case "comment":
			return self.getCommentStr()
			case "working_pasture_id":
			return self.getWorkingPastureIdStr()
			case "create_user":
			return self.getCreateUserStr()
			case "create_stamp":
			return self.getCreateStampStr()
			case "update_user":
			return self.getUpdateUserStr()
			case "update_stamp":
			return self.getUpdateStampStr()
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
    func loadByID(_id: String) -> [String: String] {
        let qb = QueryBuilder()
        qb.selectFrom("tbl_tablet_logs")
            .Where("_id = ?")

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(_id)

        var fields = [String: String]()
        let (resultset, error) = SDOld.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setLogId((row["log_id"]?.asInt()));
				self.setProfileId((row["profile_id"]?.asString()));
				self.setFlagNewCalf((row["flag_new_calf"]?.asString()));
				self.setFlagNewWean((row["flag_new_wean"]?.asString()));
				self.setFlagNewYear((row["flag_new_year"]?.asString()));
				self.setFlagNewEid((row["flag_new_eid"]?.asString()));
				self.setFlagNewVacc((row["flag_new_vacc"]?.asString()));
				self.setFlagNewBang((row["flag_new_bang"]?.asString()));
				self.setFlagNewWeight((row["flag_new_weight"]?.asString()));
				self.setFlagNewPasture((row["flag_new_pasture"]?.asString()));
				self.setFlagNewEscaped((row["flag_new_escaped"]?.asString()));
				self.setFlagNewBrand((row["flag_new_brand"]?.asString()));
				self.setFlagNewPregnancy((row["flag_new_pregnancy"]?.asString()));
				self.setFlagNewBreedAi((row["flag_new_breed_ai"]?.asString()));
				self.setFlagNewAnimal((row["flag_new_animal"]?.asString()));
				self.setFlagNewComment((row["flag_new_comment"]?.asString()));
				self.setFlagNewSync((row["flag_new_sync"]?.asString()));
				self.setFlagNewBreedEt((row["flag_new_breed_et"]?.asString()));
				self.setPhn((row["phn"]?.asString()));
				self.setRegNo((row["reg_no"]?.asString()));
				self.setEid((row["eid"]?.asString()));
				self.setDateWorked((row["date_worked"]?.asString()));
				self.setPastureId((row["pasture_id"]?.asString()));
				self.setWeight((row["weight"]?.asString()));
				self.setSex((row["sex"]?.asString()));
				self.setDob((row["dob"]?.asString()));
				self.setDam((row["dam"]?.asString()));
				self.setSire((row["sire"]?.asString()));
				self.setBangsId((row["bangs_id"]?.asString()));
				self.setBrand((row["brand"]?.asString()));
				self.setBrandLoc((row["brand_location"]?.asString()));
				self.setPrevPastureId((row["prev_pasture_id"]?.asString()));
				self.setBreedType((row["breed_type"]?.asString()));
				self.setPalpationResult((row["palpation_result"]?.asString()));
				self.setEstimatedBirthing((row["estimated_birthing"]?.asString()));
				self.setComment((row["comment"]?.asString()));
				self.setWorkingPastureId((row["working_pasture_id"]?.asString()));
				self.setCreateUser((row["create_user"]?.asString()));
				self.setCreateStamp((row["create_stamp"]?.asDate()));
				self.setUpdateUser((row["update_user"]?.asString()));
				self.setUpdateStamp((row["update_stamp"]?.asDate()));

				var fields = [String: String]()
				fields["log_id"] = self.getLogIdStr()
				fields["profile_id"] = self.getProfileIdStr()
				fields["flag_new_calf"] = self.getFlagNewCalfStr()
				fields["flag_new_wean"] = self.getFlagNewWeanStr()
				fields["flag_new_year"] = self.getFlagNewYearStr()
				fields["flag_new_eid"] = self.getFlagNewEidStr()
				fields["flag_new_vacc"] = self.getFlagNewVaccStr()
				fields["flag_new_bang"] = self.getFlagNewBangStr()
				fields["flag_new_weight"] = self.getFlagNewWeightStr()
				fields["flag_new_pasture"] = self.getFlagNewPastureStr()
				fields["flag_new_escaped"] = self.getFlagNewEscapedStr()
				fields["flag_new_brand"] = self.getFlagNewBrandStr()
				fields["flag_new_pregnancy"] = self.getFlagNewPregnancyStr()
				fields["flag_new_breed_ai"] = self.getFlagNewBreedAiStr()
				fields["flag_new_animal"] = self.getFlagNewAnimalStr()
				fields["flag_new_comment"] = self.getFlagNewCommentStr()
				fields["flag_new_sync"] = self.getFlagNewSyncStr()
				fields["flag_new_breed_et"] = self.getFlagNewBreedEtStr()
				fields["phn"] = self.getPhnStr()
				fields["reg_no"] = self.getRegNoStr()
				fields["eid"] = self.getEidStr()
				fields["date_worked"] = self.getDateWorkedStr()
				fields["pasture_id"] = self.getPastureIdStr()
				fields["weight"] = self.getWeightStr()
				fields["sex"] = self.getSexStr()
				fields["dob"] = self.getDobStr()
				fields["dam"] = self.getDamStr()
				fields["sire"] = self.getSireStr()
				fields["bangs_id"] = self.getBangsIdStr()
				fields["brand"] = self.getBrandStr()
				fields["brand_location"] = self.getBrandLocStr()
				fields["prev_pasture_id"] = self.getPrevPastureIdStr()
				fields["breed_type"] = self.getBreedTypeStr()
				fields["palpation_result"] = self.getPalpationResultStr()
				fields["estimated_birthing"] = self.getEstimatedBirthingStr()
				fields["comment"] = self.getCommentStr()
				fields["working_pasture_id"] = self.getWorkingPastureIdStr()
				fields["create_user"] = self.getCreateUserStr()
				fields["create_stamp"] = self.getCreateStampStr()
				fields["update_user"] = self.getUpdateUserStr()
				fields["update_stamp"] = self.getUpdateStampStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["log_id"] = self.getLogIdStr()
		fields["profile_id"] = self.getProfileIdStr()
		fields["flag_new_calf"] = self.getFlagNewCalfStr()
		fields["flag_new_wean"] = self.getFlagNewWeanStr()
		fields["flag_new_year"] = self.getFlagNewYearStr()
		fields["flag_new_eid"] = self.getFlagNewEidStr()
		fields["flag_new_vacc"] = self.getFlagNewVaccStr()
		fields["flag_new_bang"] = self.getFlagNewBangStr()
		fields["flag_new_weight"] = self.getFlagNewWeightStr()
		fields["flag_new_pasture"] = self.getFlagNewPastureStr()
		fields["flag_new_escaped"] = self.getFlagNewEscapedStr()
		fields["flag_new_brand"] = self.getFlagNewBrandStr()
		fields["flag_new_pregnancy"] = self.getFlagNewPregnancyStr()
		fields["flag_new_breed_ai"] = self.getFlagNewBreedAiStr()
		fields["flag_new_animal"] = self.getFlagNewAnimalStr()
		fields["flag_new_comment"] = self.getFlagNewCommentStr()
		fields["flag_new_sync"] = self.getFlagNewSyncStr()
		fields["flag_new_breed_et"] = self.getFlagNewBreedEtStr()
		fields["phn"] = self.getPhnStr()
		fields["reg_no"] = self.getRegNoStr()
		fields["eid"] = self.getEidStr()
		fields["date_worked"] = self.getDateWorkedStr()
		fields["pasture_id"] = self.getPastureIdStr()
		fields["weight"] = self.getWeightStr()
		fields["sex"] = self.getSexStr()
		fields["dob"] = self.getDobStr()
		fields["dam"] = self.getDamStr()
		fields["sire"] = self.getSireStr()
		fields["bangs_id"] = self.getBangsIdStr()
		fields["brand"] = self.getBrandStr()
		fields["brand_location"] = self.getBrandLocStr()
		fields["prev_pasture_id"] = self.getPrevPastureIdStr()
		fields["breed_type"] = self.getBreedTypeStr()
		fields["palpation_result"] = self.getPalpationResultStr()
		fields["estimated_birthing"] = self.getEstimatedBirthingStr()
		fields["comment"] = self.getCommentStr()
		fields["working_pasture_id"] = self.getWorkingPastureIdStr()
		fields["create_user"] = self.getCreateUserStr()
		fields["create_stamp"] = self.getCreateStampStr()
		fields["update_user"] = self.getUpdateUserStr()
		fields["update_stamp"] = self.getUpdateStampStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["log_id"] = self.getLogIdStrPG()
		fields["profile_id"] = self.getProfileIdStrPG()
		fields["flag_new_calf"] = self.getFlagNewCalfStrPG()
		fields["flag_new_wean"] = self.getFlagNewWeanStrPG()
		fields["flag_new_year"] = self.getFlagNewYearStrPG()
		fields["flag_new_eid"] = self.getFlagNewEidStrPG()
		fields["flag_new_vacc"] = self.getFlagNewVaccStrPG()
		fields["flag_new_bang"] = self.getFlagNewBangStrPG()
		fields["flag_new_weight"] = self.getFlagNewWeightStrPG()
		fields["flag_new_pasture"] = self.getFlagNewPastureStrPG()
		fields["flag_new_escaped"] = self.getFlagNewEscapedStrPG()
		fields["flag_new_brand"] = self.getFlagNewBrandStrPG()
		fields["flag_new_pregnancy"] = self.getFlagNewPregnancyStrPG()
		fields["flag_new_breed_ai"] = self.getFlagNewBreedAiStrPG()
		fields["flag_new_animal"] = self.getFlagNewAnimalStrPG()
		fields["flag_new_comment"] = self.getFlagNewCommentStrPG()
		fields["flag_new_sync"] = self.getFlagNewSyncStrPG()
		fields["flag_new_breed_et"] = self.getFlagNewBreedEtStrPG()
		fields["phn"] = self.getPhnStrPG()
		fields["reg_no"] = self.getRegNoStrPG()
		fields["eid"] = self.getEidStrPG()
		fields["date_worked"] = self.getDateWorkedStrPG()
		fields["pasture_id"] = self.getPastureIdStrPG()
		fields["weight"] = self.getWeightStrPG()
		fields["sex"] = self.getSexStrPG()
		fields["dob"] = self.getDobStrPG()
		fields["dam"] = self.getDamStrPG()
		fields["sire"] = self.getSireStrPG()
		fields["bangs_id"] = self.getBangsIdStrPG()
		fields["brand"] = self.getBrandStrPG()
		fields["brand_location"] = self.getBrandLocStrPG()
		fields["prev_pasture_id"] = self.getPrevPastureIdStrPG()
		fields["breed_type"] = self.getBreedTypeStrPG()
		fields["palpation_result"] = self.getPalpationResultStrPG()
		fields["estimated_birthing"] = self.getEstimatedBirthingStrPG()
		fields["comment"] = self.getCommentStrPG()
		fields["working_pasture_id"] = self.getWorkingPastureIdStrPG()
		fields["create_user"] = self.getCreateUserStrPG()
		fields["create_stamp"] = self.getCreateStampStrPG()
		fields["update_user"] = self.getUpdateUserStrPG()
		fields["update_stamp"] = self.getUpdateStampStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_tablet_logs ("
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

        var statement = "INSERT INTO tbl_tablet_logs ("
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

            var statement = "INSERT INTO tbl_tablet_logs ("

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

    func update(forID: Int) {

        // get all field/values as string values
        var fields = self.getFields()

        var statement = "UPDATE tbl_tablet_logs "
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
        statement += "WHERE _id = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query(statement)
    }

    func updatePG(forID: Int) {

        // get all field/values as string values
        var fields = self.getFieldsPG()

        var statement = "UPDATE tbl_tablet_logs "
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
        statement += "WHERE _id = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    func delete(forID: Int) {
        let query = "DELETE FROM tbl_tablet_logs WHERE _id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: Int) {

        let statement = "DELETE FROM tbl_tablet_logs WHERE _id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastId() -> String {
        let _id: String = ""
        let query = "SELECT _id from tbl_tablet_logs ORDER BY _id DESC LIMIT 1 "
        let (resultset, err) = SDOld.executeQuery(query)
        if (err == nil) {
            if resultset.count > 0 {
                let row = resultset[0]
                let _id2 = row["_id"]?.asString() ?? ""

                return _id2

            }
        }
        return _id
    }
}
