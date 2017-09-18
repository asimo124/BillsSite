

//
//  TblAnimalDataMature.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalDataMatureData {

	var animal_registration: String = "unset"
    var animal_registration_str: String = "unset"
	var measurement_date: NSDate = NSDate.distantFuture() as NSDate
    var measurement_date_str: String = "unset"
	var weight: Int = -1
    var weight_str: String = "unset"
	var height: Double = -1.0
    var height_str: String = "unset"
	var body_condition_score: Int = -1
    var body_condition_score_str: String = "unset"
	var create_user: String = "unset"
    var create_user_str: String = "unset"
	var create_stamp: NSDate = NSDate.distantFuture() as NSDate
    var create_stamp_str: String = "unset"
	var update_user: String = "unset"
    var update_user_str: String = "unset"
	var update_date: NSDate = NSDate.distantFuture() as NSDate
    var update_date_str: String = "unset"
	var work_order: String = "unset"
    var work_order_str: String = "unset"
	var commit_lock_id: Int = -1
    var commit_lock_id_str: String = "unset"
	var contemporary_group: Int = -1
    var contemporary_group_str: String = "unset"
	var sub_contemporary_group: Int = -1
    var sub_contemporary_group_str: String = "unset"
	var premise_id: String = "unset"
    var premise_id_str: String = "unset"
	var pasture_id: String = "unset"
    var pasture_id_str: String = "unset"
	var management_group: Int = -1
    var management_group_str: String = "unset"
	var feed_code: Int = -1
    var feed_code_str: String = "unset"
	
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

	func setWeight(weight: Int?) {
        self.weight = weight ?? 0
        let weight2 = weight ?? 0
        self.weight_str = String(weight2)
        self.weight_str = (self.weight_str == "0") ? "" : self.weight_str
    }
    func getWeight() -> Int {
        return self.weight
    }
    func getWeightType() -> String {
        return "Int"
    };
	func getWeightStr() -> String {
        return weight_str
    };
	func getWeightStrPG() -> String {
        return weight_str
    };

	func setHeight(height: Double?) {
   	   self.height = height ?? 0.0
   	   self.height_str = String(self.height)
    }
    func getHeight() -> Double {
        return self.height
    }
    func getHeightType() -> String {
        return "Double"
    };
	func getHeightStr() -> String {
        return height_str
    };
	func getHeightStrPG() -> String {
        return height_str
    };

	func setBodyConditionScore(body_condition_score: Int?) {
        self.body_condition_score = body_condition_score ?? 0
        let body_condition_score2 = body_condition_score ?? 0
        self.body_condition_score_str = String(body_condition_score2)
        self.body_condition_score_str = (self.body_condition_score_str == "0") ? "" : self.body_condition_score_str
    }
    func getBodyConditionScore() -> Int {
        return self.body_condition_score
    }
    func getBodyConditionScoreType() -> String {
        return "Int"
    };
	func getBodyConditionScoreStr() -> String {
        return body_condition_score_str
    };
	func getBodyConditionScoreStrPG() -> String {
        return body_condition_score_str
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

	func setUpdateDate(update_date: NSDate?) {
        self.update_date = update_date ?? NSDate.distantPast() as NSDate
        self.update_date_str = Utils.dateToString(self.update_date)
    }
    func getUpdateDate() -> NSDate {
        return self.update_date
    }
    func getUpdateDateType() -> String {
        return "NSDate"
    };
	func getUpdateDateStr() -> String {
        return update_date_str == "unset" || update_date_str == "0000-12-30 00:00:00 +0000" ? "" : update_date_str
    };
	func getUpdateDateStrPG() -> String {
        return update_date_str == "unset" || update_date_str == "0000-12-30 00:00:00 +0000" ? "" : update_date_str
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

	func getFieldType(field: String) -> String {
        switch field {
			case "animal_registration":
				return "String"
			case "measurement_date":
				return "NSDate"
			case "weight":
				return "Int"
			case "height":
				return "Double"
			case "body_condition_score":
				return "Int"
			case "create_user":
				return "String"
			case "create_stamp":
				return "NSDate"
			case "update_user":
				return "String"
			case "update_date":
				return "NSDate"
			case "work_order":
				return "String"
			case "commit_lock_id":
				return "Int"
			case "contemporary_group":
				return "Int"
			case "sub_contemporary_group":
				return "Int"
			case "premise_id":
				return "String"
			case "pasture_id":
				return "String"
			case "management_group":
				return "Int"
			case "feed_code":
				return "Int"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "animal_registration":
			return self.getAnimalRegistrationStr()
			case "measurement_date":
			return self.getMeasurementDateStr()
			case "weight":
			return self.getWeightStr()
			case "height":
			return self.getHeightStr()
			case "body_condition_score":
			return self.getBodyConditionScoreStr()
			case "create_user":
			return self.getCreateUserStr()
			case "create_stamp":
			return self.getCreateStampStr()
			case "update_user":
			return self.getUpdateUserStr()
			case "update_date":
			return self.getUpdateDateStr()
			case "work_order":
			return self.getWorkOrderStr()
			case "commit_lock_id":
			return self.getCommitLockIdStr()
			case "contemporary_group":
			return self.getContemporaryGroupStr()
			case "sub_contemporary_group":
			return self.getSubContemporaryGroupStr()
			case "premise_id":
			return self.getPremiseIdStr()
			case "pasture_id":
			return self.getPastureIdStr()
			case "management_group":
			return self.getManagementGroupStr()
			case "feed_code":
			return self.getFeedCodeStr()
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
        qb.selectFrom("tbl_animal_data_mature")
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
				self.setMeasurementDate((row["measurement_date"]?.asDate()));
				self.setWeight((row["weight"]?.asInt()));
				self.setHeight((row["height"]?.asDouble()));
				self.setBodyConditionScore((row["body_condition_score"]?.asInt()));
				self.setCreateUser((row["create_user"]?.asString()));
				self.setCreateStamp((row["create_stamp"]?.asDate()));
				self.setUpdateUser((row["update_user"]?.asString()));
				self.setUpdateDate((row["update_date"]?.asDate()));
				self.setWorkOrder((row["work_order"]?.asString()));
				self.setCommitLockId((row["commit_lock_id"]?.asInt()));
				self.setContemporaryGroup((row["contemporary_group"]?.asInt()));
				self.setSubContemporaryGroup((row["sub_contemporary_group"]?.asInt()));
				self.setPremiseId((row["premise_id"]?.asString()));
				self.setPastureId((row["pasture_id"]?.asString()));
				self.setManagementGroup((row["management_group"]?.asInt()));
				self.setFeedCode((row["feed_code"]?.asInt()));

				var fields = [String: String]()
				fields["animal_registration"] = self.getAnimalRegistrationStr()
				fields["measurement_date"] = self.getMeasurementDateStr()
				fields["weight"] = self.getWeightStr()
				fields["height"] = self.getHeightStr()
				fields["body_condition_score"] = self.getBodyConditionScoreStr()
				fields["create_user"] = self.getCreateUserStr()
				fields["create_stamp"] = self.getCreateStampStr()
				fields["update_user"] = self.getUpdateUserStr()
				fields["update_date"] = self.getUpdateDateStr()
				fields["work_order"] = self.getWorkOrderStr()
				fields["commit_lock_id"] = self.getCommitLockIdStr()
				fields["contemporary_group"] = self.getContemporaryGroupStr()
				fields["sub_contemporary_group"] = self.getSubContemporaryGroupStr()
				fields["premise_id"] = self.getPremiseIdStr()
				fields["pasture_id"] = self.getPastureIdStr()
				fields["management_group"] = self.getManagementGroupStr()
				fields["feed_code"] = self.getFeedCodeStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["animal_registration"] = self.getAnimalRegistrationStr()
		fields["measurement_date"] = self.getMeasurementDateStr()
		fields["weight"] = self.getWeightStr()
		fields["height"] = self.getHeightStr()
		fields["body_condition_score"] = self.getBodyConditionScoreStr()
		fields["create_user"] = self.getCreateUserStr()
		fields["create_stamp"] = self.getCreateStampStr()
		fields["update_user"] = self.getUpdateUserStr()
		fields["update_date"] = self.getUpdateDateStr()
		fields["work_order"] = self.getWorkOrderStr()
		fields["commit_lock_id"] = self.getCommitLockIdStr()
		fields["contemporary_group"] = self.getContemporaryGroupStr()
		fields["sub_contemporary_group"] = self.getSubContemporaryGroupStr()
		fields["premise_id"] = self.getPremiseIdStr()
		fields["pasture_id"] = self.getPastureIdStr()
		fields["management_group"] = self.getManagementGroupStr()
		fields["feed_code"] = self.getFeedCodeStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["animal_registration"] = self.getAnimalRegistrationStrPG()
		fields["measurement_date"] = self.getMeasurementDateStrPG()
		fields["weight"] = self.getWeightStrPG()
		fields["height"] = self.getHeightStrPG()
		fields["body_condition_score"] = self.getBodyConditionScoreStrPG()
		fields["create_user"] = self.getCreateUserStrPG()
		fields["create_stamp"] = self.getCreateStampStrPG()
		fields["update_user"] = self.getUpdateUserStrPG()
		fields["update_date"] = self.getUpdateDateStrPG()
		fields["work_order"] = self.getWorkOrderStrPG()
		fields["commit_lock_id"] = self.getCommitLockIdStrPG()
		fields["contemporary_group"] = self.getContemporaryGroupStrPG()
		fields["sub_contemporary_group"] = self.getSubContemporaryGroupStrPG()
		fields["premise_id"] = self.getPremiseIdStrPG()
		fields["pasture_id"] = self.getPastureIdStrPG()
		fields["management_group"] = self.getManagementGroupStrPG()
		fields["feed_code"] = self.getFeedCodeStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_animal_data_mature ("
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

        var statement = "INSERT INTO tbl_animal_data_mature ("
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

            var statement = "INSERT INTO tbl_animal_data_mature ("

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

        var statement = "UPDATE tbl_animal_data_mature "
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

        var statement = "UPDATE tbl_animal_data_mature "
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
        let query = "DELETE FROM tbl_animal_data_mature WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM tbl_animal_data_mature WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastanimalRegistration() -> String {
        let animal_registration: String = ""
        let query = "SELECT animal_registration from tbl_animal_data_mature ORDER BY _id DESC LIMIT 1 "
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
