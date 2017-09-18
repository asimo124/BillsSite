

//
//  TblAnimalDataWean.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalDataWeanData {

	var animal_registration: String = "unset"
    var animal_registration_str: String = "unset"
	var wean_date: NSDate = NSDate.distantFuture() as NSDate
    var wean_date_str: String = "unset"
	var wean_weight: Double = -1.0
    var wean_weight_str: String = "unset"
	var contemporary_group: Int = -1
    var contemporary_group_str: String = "unset"
	var management_group: Int = -1
    var management_group_str: String = "unset"
	var feed_code: Int = -1
    var feed_code_str: String = "unset"
	var animal_sex: String = "unset"
    var animal_sex_str: String = "unset"
	var hip_height_old: Double = -1.0
    var hip_height_old_str: String = "unset"
	var conformation_score: Int = -1
    var conformation_score_str: String = "unset"
	var sheath_score: Int = -1
    var sheath_score_str: String = "unset"
	var navel_score: Int = -1
    var navel_score_str: String = "unset"
	var wean_weight_adj: Double = -1.0
    var wean_weight_adj_str: String = "unset"
	var herd_id: String = "unset"
    var herd_id_str: String = "unset"
	var sub_contemporary_group: Int = -1
    var sub_contemporary_group_str: String = "unset"
	var ww_ratio: Double = -1.0
    var ww_ratio_str: String = "unset"
	var premise_id: String = "unset"
    var premise_id_str: String = "unset"
	var pasture_id: String = "unset"
    var pasture_id_str: String = "unset"
	var temper_score: Int = -1
    var temper_score_str: String = "unset"
	var scrotal_circumference: Double = -1.0
    var scrotal_circumference_str: String = "unset"
	var create_user: String = "unset"
    var create_user_str: String = "unset"
	var create_stamp: NSDate = NSDate.distantFuture() as NSDate
    var create_stamp_str: String = "unset"
	var update_user: String = "unset"
    var update_user_str: String = "unset"
	var update_stamp: NSDate = NSDate.distantFuture() as NSDate
    var update_stamp_str: String = "unset"
	var frame_score: Double = -1.0
    var frame_score_str: String = "unset"
	var work_order: String = "unset"
    var work_order_str: String = "unset"
	var scrotal_circumference_adj: Double = -1.0
    var scrotal_circumference_adj_str: String = "unset"
	var pre_contemporary_group: Int = -1
    var pre_contemporary_group_str: String = "unset"
	var hip_height: Double = -1.0
    var hip_height_str: String = "unset"
	var commit_lock_id: Int = -1
    var commit_lock_id_str: String = "unset"
	var season: Int = -1
    var season_str: String = "unset"
	
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

	func setWeanDate(wean_date: NSDate?) {
        self.wean_date = wean_date ?? NSDate.distantPast() as NSDate
        self.wean_date_str = Utils.dateToString(self.wean_date)
    }
    func getWeanDate() -> NSDate {
        return self.wean_date
    }
    func getWeanDateType() -> String {
        return "NSDate"
    };
	func getWeanDateStr() -> String {
        return wean_date_str == "unset" || wean_date_str == "0000-12-30 00:00:00 +0000" ? "" : wean_date_str
    };
	func getWeanDateStrPG() -> String {
        return wean_date_str == "unset" || wean_date_str == "0000-12-30 00:00:00 +0000" ? "" : wean_date_str
    };

	func setWeanWeight(wean_weight: Double?) {
   	   self.wean_weight = wean_weight ?? 0.0
   	   self.wean_weight_str = String(self.wean_weight)
    }
    func getWeanWeight() -> Double {
        return self.wean_weight
    }
    func getWeanWeightType() -> String {
        return "Double"
    };
	func getWeanWeightStr() -> String {
        return wean_weight_str
    };
	func getWeanWeightStrPG() -> String {
        return wean_weight_str
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

	func setManagementGroup(management_group: Int?) {
        self.management_group = management_group ?? 0
        let management_group2 = management_group ?? 0
        self.management_group_str = String(management_group2)
        self.management_group_str = (self.management_group_str == "0") ? "" : self.management_group_str
    }
    func getManagementGroup() -> Int {
        return self.management_group
    }
    func getManagementGroupType() -> String {
        return "Int"
    };
	func getManagementGroupStr() -> String {
        return management_group_str
    };
	func getManagementGroupStrPG() -> String {
        return management_group_str
    };

	func setFeedCode(feed_code: Int?) {
        self.feed_code = feed_code ?? 0
        let feed_code2 = feed_code ?? 0
        self.feed_code_str = String(feed_code2)
        self.feed_code_str = (self.feed_code_str == "0") ? "" : self.feed_code_str
    }
    func getFeedCode() -> Int {
        return self.feed_code
    }
    func getFeedCodeType() -> String {
        return "Int"
    };
	func getFeedCodeStr() -> String {
        return feed_code_str
    };
	func getFeedCodeStrPG() -> String {
        return feed_code_str
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

	func setHipHeightOld(hip_height_old: Double?) {
   	   self.hip_height_old = hip_height_old ?? 0.0
   	   self.hip_height_old_str = String(self.hip_height_old)
    }
    func getHipHeightOld() -> Double {
        return self.hip_height_old
    }
    func getHipHeightOldType() -> String {
        return "Double"
    };
	func getHipHeightOldStr() -> String {
        return hip_height_old_str
    };
	func getHipHeightOldStrPG() -> String {
        return hip_height_old_str
    };

	func setConformationScore(conformation_score: Int?) {
        self.conformation_score = conformation_score ?? 0
        let conformation_score2 = conformation_score ?? 0
        self.conformation_score_str = String(conformation_score2)
        self.conformation_score_str = (self.conformation_score_str == "0") ? "" : self.conformation_score_str
    }
    func getConformationScore() -> Int {
        return self.conformation_score
    }
    func getConformationScoreType() -> String {
        return "Int"
    };
	func getConformationScoreStr() -> String {
        return conformation_score_str
    };
	func getConformationScoreStrPG() -> String {
        return conformation_score_str
    };

	func setSheathScore(sheath_score: Int?) {
        self.sheath_score = sheath_score ?? 0
        let sheath_score2 = sheath_score ?? 0
        self.sheath_score_str = String(sheath_score2)
        self.sheath_score_str = (self.sheath_score_str == "0") ? "" : self.sheath_score_str
    }
    func getSheathScore() -> Int {
        return self.sheath_score
    }
    func getSheathScoreType() -> String {
        return "Int"
    };
	func getSheathScoreStr() -> String {
        return sheath_score_str
    };
	func getSheathScoreStrPG() -> String {
        return sheath_score_str
    };

	func setNavelScore(navel_score: Int?) {
        self.navel_score = navel_score ?? 0
        let navel_score2 = navel_score ?? 0
        self.navel_score_str = String(navel_score2)
        self.navel_score_str = (self.navel_score_str == "0") ? "" : self.navel_score_str
    }
    func getNavelScore() -> Int {
        return self.navel_score
    }
    func getNavelScoreType() -> String {
        return "Int"
    };
	func getNavelScoreStr() -> String {
        return navel_score_str
    };
	func getNavelScoreStrPG() -> String {
        return navel_score_str
    };

	func setWeanWeightAdj(wean_weight_adj: Double?) {
   	   self.wean_weight_adj = wean_weight_adj ?? 0.0
   	   self.wean_weight_adj_str = String(self.wean_weight_adj)
    }
    func getWeanWeightAdj() -> Double {
        return self.wean_weight_adj
    }
    func getWeanWeightAdjType() -> String {
        return "Double"
    };
	func getWeanWeightAdjStr() -> String {
        return wean_weight_adj_str
    };
	func getWeanWeightAdjStrPG() -> String {
        return wean_weight_adj_str
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

	func setWwRatio(ww_ratio: Double?) {
   	   self.ww_ratio = ww_ratio ?? 0.0
   	   self.ww_ratio_str = String(self.ww_ratio)
    }
    func getWwRatio() -> Double {
        return self.ww_ratio
    }
    func getWwRatioType() -> String {
        return "Double"
    };
	func getWwRatioStr() -> String {
        return ww_ratio_str
    };
	func getWwRatioStrPG() -> String {
        return ww_ratio_str
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

	func setTemperScore(temper_score: Int?) {
        self.temper_score = temper_score ?? 0
        let temper_score2 = temper_score ?? 0
        self.temper_score_str = String(temper_score2)
        self.temper_score_str = (self.temper_score_str == "0") ? "" : self.temper_score_str
    }
    func getTemperScore() -> Int {
        return self.temper_score
    }
    func getTemperScoreType() -> String {
        return "Int"
    };
	func getTemperScoreStr() -> String {
        return temper_score_str
    };
	func getTemperScoreStrPG() -> String {
        return temper_score_str
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

	func getFieldType(field: String) -> String {
        switch field {
			case "animal_registration":
				return "String"
			case "wean_date":
				return "NSDate"
			case "wean_weight":
				return "Double"
			case "contemporary_group":
				return "Int"
			case "management_group":
				return "Int"
			case "feed_code":
				return "Int"
			case "animal_sex":
				return "String"
			case "hip_height_old":
				return "Double"
			case "conformation_score":
				return "Int"
			case "sheath_score":
				return "Int"
			case "navel_score":
				return "Int"
			case "wean_weight_adj":
				return "Double"
			case "herd_id":
				return "String"
			case "sub_contemporary_group":
				return "Int"
			case "ww_ratio":
				return "Double"
			case "premise_id":
				return "String"
			case "pasture_id":
				return "String"
			case "temper_score":
				return "Int"
			case "scrotal_circumference":
				return "Double"
			case "create_user":
				return "String"
			case "create_stamp":
				return "NSDate"
			case "update_user":
				return "String"
			case "update_stamp":
				return "NSDate"
			case "frame_score":
				return "Double"
			case "work_order":
				return "String"
			case "scrotal_circumference_adj":
				return "Double"
			case "pre_contemporary_group":
				return "Int"
			case "hip_height":
				return "Double"
			case "commit_lock_id":
				return "Int"
			case "season":
				return "Int"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "animal_registration":
			return self.getAnimalRegistrationStr()
			case "wean_date":
			return self.getWeanDateStr()
			case "wean_weight":
			return self.getWeanWeightStr()
			case "contemporary_group":
			return self.getContemporaryGroupStr()
			case "management_group":
			return self.getManagementGroupStr()
			case "feed_code":
			return self.getFeedCodeStr()
			case "animal_sex":
			return self.getAnimalSexStr()
			case "hip_height_old":
			return self.getHipHeightOldStr()
			case "conformation_score":
			return self.getConformationScoreStr()
			case "sheath_score":
			return self.getSheathScoreStr()
			case "navel_score":
			return self.getNavelScoreStr()
			case "wean_weight_adj":
			return self.getWeanWeightAdjStr()
			case "herd_id":
			return self.getHerdIdStr()
			case "sub_contemporary_group":
			return self.getSubContemporaryGroupStr()
			case "ww_ratio":
			return self.getWwRatioStr()
			case "premise_id":
			return self.getPremiseIdStr()
			case "pasture_id":
			return self.getPastureIdStr()
			case "temper_score":
			return self.getTemperScoreStr()
			case "scrotal_circumference":
			return self.getScrotalCircumferenceStr()
			case "create_user":
			return self.getCreateUserStr()
			case "create_stamp":
			return self.getCreateStampStr()
			case "update_user":
			return self.getUpdateUserStr()
			case "update_stamp":
			return self.getUpdateStampStr()
			case "frame_score":
			return self.getFrameScoreStr()
			case "work_order":
			return self.getWorkOrderStr()
			case "scrotal_circumference_adj":
			return self.getScrotalCircumferenceAdjStr()
			case "pre_contemporary_group":
			return self.getPreContemporaryGroupStr()
			case "hip_height":
			return self.getHipHeightStr()
			case "commit_lock_id":
			return self.getCommitLockIdStr()
			case "season":
			return self.getSeasonStr()
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
        qb.selectFrom("tbl_animal_data_wean")
            .Where("animal_registration = ?")

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(animal_registration)

        var fields = [String: String]()
        let (resultset, error) = SDOld.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setAnimalRegistration((row["animal_registration"]?.asString()));
				self.setWeanDate((row["wean_date"]?.asDate()));
				self.setWeanWeight((row["wean_weight"]?.asDouble()));
				self.setContemporaryGroup((row["contemporary_group"]?.asInt()));
				self.setManagementGroup((row["management_group"]?.asInt()));
				self.setFeedCode((row["feed_code"]?.asInt()));
				self.setAnimalSex((row["animal_sex"]?.asString()));
				self.setHipHeightOld((row["hip_height_old"]?.asDouble()));
				self.setConformationScore((row["conformation_score"]?.asInt()));
				self.setSheathScore((row["sheath_score"]?.asInt()));
				self.setNavelScore((row["navel_score"]?.asInt()));
				self.setWeanWeightAdj((row["wean_weight_adj"]?.asDouble()));
				self.setHerdId((row["herd_id"]?.asString()));
				self.setSubContemporaryGroup((row["sub_contemporary_group"]?.asInt()));
				self.setWwRatio((row["ww_ratio"]?.asDouble()));
				self.setPremiseId((row["premise_id"]?.asString()));
				self.setPastureId((row["pasture_id"]?.asString()));
				self.setTemperScore((row["temper_score"]?.asInt()));
				self.setScrotalCircumference((row["scrotal_circumference"]?.asDouble()));
				self.setCreateUser((row["create_user"]?.asString()));
				self.setCreateStamp((row["create_stamp"]?.asDate()));
				self.setUpdateUser((row["update_user"]?.asString()));
				self.setUpdateStamp((row["update_stamp"]?.asDate()));
				self.setFrameScore((row["frame_score"]?.asDouble()));
				self.setWorkOrder((row["work_order"]?.asString()));
				self.setScrotalCircumferenceAdj((row["scrotal_circumference_adj"]?.asDouble()));
				self.setPreContemporaryGroup((row["pre_contemporary_group"]?.asInt()));
				self.setHipHeight((row["hip_height"]?.asDouble()));
				self.setCommitLockId((row["commit_lock_id"]?.asInt()));
				self.setSeason((row["season"]?.asInt()));

				var fields = [String: String]()
				fields["animal_registration"] = self.getAnimalRegistrationStr()
				fields["wean_date"] = self.getWeanDateStr()
				fields["wean_weight"] = self.getWeanWeightStr()
				fields["contemporary_group"] = self.getContemporaryGroupStr()
				fields["management_group"] = self.getManagementGroupStr()
				fields["feed_code"] = self.getFeedCodeStr()
				fields["animal_sex"] = self.getAnimalSexStr()
				fields["hip_height_old"] = self.getHipHeightOldStr()
				fields["conformation_score"] = self.getConformationScoreStr()
				fields["sheath_score"] = self.getSheathScoreStr()
				fields["navel_score"] = self.getNavelScoreStr()
				fields["wean_weight_adj"] = self.getWeanWeightAdjStr()
				fields["herd_id"] = self.getHerdIdStr()
				fields["sub_contemporary_group"] = self.getSubContemporaryGroupStr()
				fields["ww_ratio"] = self.getWwRatioStr()
				fields["premise_id"] = self.getPremiseIdStr()
				fields["pasture_id"] = self.getPastureIdStr()
				fields["temper_score"] = self.getTemperScoreStr()
				fields["scrotal_circumference"] = self.getScrotalCircumferenceStr()
				fields["create_user"] = self.getCreateUserStr()
				fields["create_stamp"] = self.getCreateStampStr()
				fields["update_user"] = self.getUpdateUserStr()
				fields["update_stamp"] = self.getUpdateStampStr()
				fields["frame_score"] = self.getFrameScoreStr()
				fields["work_order"] = self.getWorkOrderStr()
				fields["scrotal_circumference_adj"] = self.getScrotalCircumferenceAdjStr()
				fields["pre_contemporary_group"] = self.getPreContemporaryGroupStr()
				fields["hip_height"] = self.getHipHeightStr()
				fields["commit_lock_id"] = self.getCommitLockIdStr()
				fields["season"] = self.getSeasonStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["animal_registration"] = self.getAnimalRegistrationStr()
		fields["wean_date"] = self.getWeanDateStr()
		fields["wean_weight"] = self.getWeanWeightStr()
		fields["contemporary_group"] = self.getContemporaryGroupStr()
		fields["management_group"] = self.getManagementGroupStr()
		fields["feed_code"] = self.getFeedCodeStr()
		fields["animal_sex"] = self.getAnimalSexStr()
		fields["hip_height_old"] = self.getHipHeightOldStr()
		fields["conformation_score"] = self.getConformationScoreStr()
		fields["sheath_score"] = self.getSheathScoreStr()
		fields["navel_score"] = self.getNavelScoreStr()
		fields["wean_weight_adj"] = self.getWeanWeightAdjStr()
		fields["herd_id"] = self.getHerdIdStr()
		fields["sub_contemporary_group"] = self.getSubContemporaryGroupStr()
		fields["ww_ratio"] = self.getWwRatioStr()
		fields["premise_id"] = self.getPremiseIdStr()
		fields["pasture_id"] = self.getPastureIdStr()
		fields["temper_score"] = self.getTemperScoreStr()
		fields["scrotal_circumference"] = self.getScrotalCircumferenceStr()
		fields["create_user"] = self.getCreateUserStr()
		fields["create_stamp"] = self.getCreateStampStr()
		fields["update_user"] = self.getUpdateUserStr()
		fields["update_stamp"] = self.getUpdateStampStr()
		fields["frame_score"] = self.getFrameScoreStr()
		fields["work_order"] = self.getWorkOrderStr()
		fields["scrotal_circumference_adj"] = self.getScrotalCircumferenceAdjStr()
		fields["pre_contemporary_group"] = self.getPreContemporaryGroupStr()
		fields["hip_height"] = self.getHipHeightStr()
		fields["commit_lock_id"] = self.getCommitLockIdStr()
		fields["season"] = self.getSeasonStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["animal_registration"] = self.getAnimalRegistrationStrPG()
		fields["wean_date"] = self.getWeanDateStrPG()
		fields["wean_weight"] = self.getWeanWeightStrPG()
		fields["contemporary_group"] = self.getContemporaryGroupStrPG()
		fields["management_group"] = self.getManagementGroupStrPG()
		fields["feed_code"] = self.getFeedCodeStrPG()
		fields["animal_sex"] = self.getAnimalSexStrPG()
		fields["hip_height_old"] = self.getHipHeightOldStrPG()
		fields["conformation_score"] = self.getConformationScoreStrPG()
		fields["sheath_score"] = self.getSheathScoreStrPG()
		fields["navel_score"] = self.getNavelScoreStrPG()
		fields["wean_weight_adj"] = self.getWeanWeightAdjStrPG()
		fields["herd_id"] = self.getHerdIdStrPG()
		fields["sub_contemporary_group"] = self.getSubContemporaryGroupStrPG()
		fields["ww_ratio"] = self.getWwRatioStrPG()
		fields["premise_id"] = self.getPremiseIdStrPG()
		fields["pasture_id"] = self.getPastureIdStrPG()
		fields["temper_score"] = self.getTemperScoreStrPG()
		fields["scrotal_circumference"] = self.getScrotalCircumferenceStrPG()
		fields["create_user"] = self.getCreateUserStrPG()
		fields["create_stamp"] = self.getCreateStampStrPG()
		fields["update_user"] = self.getUpdateUserStrPG()
		fields["update_stamp"] = self.getUpdateStampStrPG()
		fields["frame_score"] = self.getFrameScoreStrPG()
		fields["work_order"] = self.getWorkOrderStrPG()
		fields["scrotal_circumference_adj"] = self.getScrotalCircumferenceAdjStrPG()
		fields["pre_contemporary_group"] = self.getPreContemporaryGroupStrPG()
		fields["hip_height"] = self.getHipHeightStrPG()
		fields["commit_lock_id"] = self.getCommitLockIdStrPG()
		fields["season"] = self.getSeasonStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_animal_data_wean ("
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

        var statement = "INSERT INTO tbl_animal_data_wean ("
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

            var statement = "INSERT INTO tbl_animal_data_wean ("

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

        var statement = "UPDATE tbl_animal_data_wean "
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

        var statement = "UPDATE tbl_animal_data_wean "
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
        let query = "DELETE FROM tbl_animal_data_wean WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM tbl_animal_data_wean WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastanimalRegistration() -> String {
        let animal_registration: String = ""
        let query = "SELECT animal_registration from tbl_animal_data_wean ORDER BY _id DESC LIMIT 1 "
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
