

//
//  TblBreedingNs.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblBreedingNsData {

	var breeding_agreement_id: Int = -1
    var breeding_agreement_id_str: String = "unset"
	var cow_owner_id: Int = -1
    var cow_owner_id_str: String = "unset"
	var bull_owner_id: Int = -1
    var bull_owner_id_str: String = "unset"
	var bull_registration: String = "unset"
    var bull_registration_str: String = "unset"
	var begin_date: NSDate = NSDate.distantFuture() as NSDate
    var begin_date_str: String = "unset"
	var end_date: NSDate = NSDate.distantFuture() as NSDate
    var end_date_str: String = "unset"
	var create_user: String = "unset"
    var create_user_str: String = "unset"
	var create_stamp: NSDate = NSDate.distantFuture() as NSDate
    var create_stamp_str: String = "unset"
	var update_user: String = "unset"
    var update_user_str: String = "unset"
	var update_stamp: NSDate = NSDate.distantFuture() as NSDate
    var update_stamp_str: String = "unset"
	var cow_registration: String = "unset"
    var cow_registration_str: String = "unset"
	var work_order: String = "unset"
    var work_order_str: String = "unset"
	var calf: String = "unset"
    var calf_str: String = "unset"
	var non_calving_reason: String = "unset"
    var non_calving_reason_str: String = "unset"
	var palpation_result: String = "unset"
    var palpation_result_str: String = "unset"
	var palpation_date: NSDate = NSDate.distantFuture() as NSDate
    var palpation_date_str: String = "unset"
	var pasture_id: Int = -1
    var pasture_id_str: String = "unset"
	
	func setBreedingAgreementId(breeding_agreement_id: Int?) {
        self.breeding_agreement_id = breeding_agreement_id ?? 0
        let breeding_agreement_id2 = breeding_agreement_id ?? 0
        self.breeding_agreement_id_str = String(breeding_agreement_id2)
        self.breeding_agreement_id_str = (self.breeding_agreement_id_str == "0") ? "" : self.breeding_agreement_id_str
    }
    func getBreedingAgreementId() -> Int {
        return self.breeding_agreement_id
    }
    func getBreedingAgreementIdType() -> String {
        return "Int"
    };
	func getBreedingAgreementIdStr() -> String {
        return breeding_agreement_id_str
    };
	func getBreedingAgreementIdStrPG() -> String {
        return breeding_agreement_id_str
    };

	func setCowOwnerId(cow_owner_id: Int?) {
        self.cow_owner_id = cow_owner_id ?? 0
        let cow_owner_id2 = cow_owner_id ?? 0
        self.cow_owner_id_str = String(cow_owner_id2)
        self.cow_owner_id_str = (self.cow_owner_id_str == "0") ? "" : self.cow_owner_id_str
    }
    func getCowOwnerId() -> Int {
        return self.cow_owner_id
    }
    func getCowOwnerIdType() -> String {
        return "Int"
    };
	func getCowOwnerIdStr() -> String {
        return cow_owner_id_str
    };
	func getCowOwnerIdStrPG() -> String {
        return cow_owner_id_str
    };

	func setBullOwnerId(bull_owner_id: Int?) {
        self.bull_owner_id = bull_owner_id ?? 0
        let bull_owner_id2 = bull_owner_id ?? 0
        self.bull_owner_id_str = String(bull_owner_id2)
        self.bull_owner_id_str = (self.bull_owner_id_str == "0") ? "" : self.bull_owner_id_str
    }
    func getBullOwnerId() -> Int {
        return self.bull_owner_id
    }
    func getBullOwnerIdType() -> String {
        return "Int"
    };
	func getBullOwnerIdStr() -> String {
        return bull_owner_id_str
    };
	func getBullOwnerIdStrPG() -> String {
        return bull_owner_id_str
    };

	func setBullRegistration(bull_registration: String?) {
        self.bull_registration = bull_registration ?? ""
        self.bull_registration_str = String(self.bull_registration)
    }
    func getBullRegistration() -> String {
        return self.bull_registration
    }
    func getBullRegistrationType() -> String {
        return "String"
    };
	func getBullRegistrationStr() -> String {
        return bull_registration_str == "unset" ? "" : bull_registration_str
    };
	func getBullRegistrationStrPG() -> String {
        return bull_registration_str == "unset" ? "" : bull_registration_str
    };

	func setBeginDate(begin_date: NSDate?) {
        self.begin_date = begin_date ?? NSDate.distantPast() as NSDate
        self.begin_date_str = Utils.dateToString(self.begin_date)
    }
    func getBeginDate() -> NSDate {
        return self.begin_date
    }
    func getBeginDateType() -> String {
        return "NSDate"
    };
	func getBeginDateStr() -> String {
        return begin_date_str == "unset" || begin_date_str == "0000-12-30 00:00:00 +0000" ? "" : begin_date_str
    };
	func getBeginDateStrPG() -> String {
        return begin_date_str == "unset" || begin_date_str == "0000-12-30 00:00:00 +0000" ? "" : begin_date_str
    };

	func setEndDate(end_date: NSDate?) {
        self.end_date = end_date ?? NSDate.distantPast() as NSDate
        self.end_date_str = Utils.dateToString(self.end_date)
    }
    func getEndDate() -> NSDate {
        return self.end_date
    }
    func getEndDateType() -> String {
        return "NSDate"
    };
	func getEndDateStr() -> String {
        return end_date_str == "unset" || end_date_str == "0000-12-30 00:00:00 +0000" ? "" : end_date_str
    };
	func getEndDateStrPG() -> String {
        return end_date_str == "unset" || end_date_str == "0000-12-30 00:00:00 +0000" ? "" : end_date_str
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

	func setCowRegistration(cow_registration: String?) {
        self.cow_registration = cow_registration ?? ""
        self.cow_registration_str = String(self.cow_registration)
    }
    func getCowRegistration() -> String {
        return self.cow_registration
    }
    func getCowRegistrationType() -> String {
        return "String"
    };
	func getCowRegistrationStr() -> String {
        return cow_registration_str == "unset" ? "" : cow_registration_str
    };
	func getCowRegistrationStrPG() -> String {
        return cow_registration_str == "unset" ? "" : cow_registration_str
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

	func setCalf(calf: String?) {
        self.calf = calf ?? ""
        self.calf_str = String(self.calf)
    }
    func getCalf() -> String {
        return self.calf
    }
    func getCalfType() -> String {
        return "String"
    };
	func getCalfStr() -> String {
        return calf_str == "unset" ? "" : calf_str
    };
	func getCalfStrPG() -> String {
        return calf_str == "unset" ? "" : calf_str
    };

	func setNonCalvingReason(non_calving_reason: String?) {
        self.non_calving_reason = non_calving_reason ?? ""
        self.non_calving_reason_str = String(self.non_calving_reason)
    }
    func getNonCalvingReason() -> String {
        return self.non_calving_reason
    }
    func getNonCalvingReasonType() -> String {
        return "String"
    };
	func getNonCalvingReasonStr() -> String {
        return non_calving_reason_str == "unset" ? "" : non_calving_reason_str
    };
	func getNonCalvingReasonStrPG() -> String {
        return non_calving_reason_str == "unset" ? "" : non_calving_reason_str
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

	func setPalpationDate(palpation_date: NSDate?) {
        self.palpation_date = palpation_date ?? NSDate.distantPast() as NSDate
        self.palpation_date_str = Utils.dateToString(self.palpation_date)
    }
    func getPalpationDate() -> NSDate {
        return self.palpation_date
    }
    func getPalpationDateType() -> String {
        return "NSDate"
    };
	func getPalpationDateStr() -> String {
        return palpation_date_str == "unset" || palpation_date_str == "0000-12-30 00:00:00 +0000" ? "" : palpation_date_str
    };
	func getPalpationDateStrPG() -> String {
        return palpation_date_str == "unset" || palpation_date_str == "0000-12-30 00:00:00 +0000" ? "" : palpation_date_str
    };

	func setPastureId(pasture_id: Int?) {
        self.pasture_id = pasture_id ?? 0
        let pasture_id2 = pasture_id ?? 0
        self.pasture_id_str = String(pasture_id2)
        self.pasture_id_str = (self.pasture_id_str == "0") ? "" : self.pasture_id_str
    }
    func getPastureId() -> Int {
        return self.pasture_id
    }
    func getPastureIdType() -> String {
        return "Int"
    };
	func getPastureIdStr() -> String {
        return pasture_id_str
    };
	func getPastureIdStrPG() -> String {
        return pasture_id_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "breeding_agreement_id":
				return "Int"
			case "cow_owner_id":
				return "Int"
			case "bull_owner_id":
				return "Int"
			case "bull_registration":
				return "String"
			case "begin_date":
				return "NSDate"
			case "end_date":
				return "NSDate"
			case "create_user":
				return "String"
			case "create_stamp":
				return "NSDate"
			case "update_user":
				return "String"
			case "update_stamp":
				return "NSDate"
			case "cow_registration":
				return "String"
			case "work_order":
				return "String"
			case "calf":
				return "String"
			case "non_calving_reason":
				return "String"
			case "palpation_result":
				return "String"
			case "palpation_date":
				return "NSDate"
			case "pasture_id":
				return "Int"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "breeding_agreement_id":
			return self.getBreedingAgreementIdStr()
			case "cow_owner_id":
			return self.getCowOwnerIdStr()
			case "bull_owner_id":
			return self.getBullOwnerIdStr()
			case "bull_registration":
			return self.getBullRegistrationStr()
			case "begin_date":
			return self.getBeginDateStr()
			case "end_date":
			return self.getEndDateStr()
			case "create_user":
			return self.getCreateUserStr()
			case "create_stamp":
			return self.getCreateStampStr()
			case "update_user":
			return self.getUpdateUserStr()
			case "update_stamp":
			return self.getUpdateStampStr()
			case "cow_registration":
			return self.getCowRegistrationStr()
			case "work_order":
			return self.getWorkOrderStr()
			case "calf":
			return self.getCalfStr()
			case "non_calving_reason":
			return self.getNonCalvingReasonStr()
			case "palpation_result":
			return self.getPalpationResultStr()
			case "palpation_date":
			return self.getPalpationDateStr()
			case "pasture_id":
			return self.getPastureIdStr()
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
    func loadByID(bull_registration: String) -> [String: String] {
        let qb = QueryBuilder()
        qb.selectFrom("tbl_breeding_agreement")
            .Where("bull_registration = ?")

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(bull_registration)

        let fields = [String: String]()
        let (resultset, error) = SDOld.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setBreedingAgreementId((row["breeding_agreement_id"]?.asInt()));
				self.setCowOwnerId((row["cow_owner_id"]?.asInt()));
				self.setBullOwnerId((row["bull_owner_id"]?.asInt()));
				self.setBullRegistration((row["bull_registration"]?.asString()));
				self.setBeginDate((row["begin_date"]?.asDate()));
				self.setEndDate((row["end_date"]?.asDate()));
				self.setCreateUser((row["create_user"]?.asString()));
				self.setCreateStamp((row["create_stamp"]?.asDate()));
				self.setUpdateUser((row["update_user"]?.asString()));
				self.setUpdateStamp((row["update_stamp"]?.asDate()));
				self.setCowRegistration((row["cow_registration"]?.asString()));
				self.setWorkOrder((row["work_order"]?.asString()));
				self.setCalf((row["calf"]?.asString()));
				self.setNonCalvingReason((row["non_calving_reason"]?.asString()));
				self.setPalpationResult((row["palpation_result"]?.asString()));
				self.setPalpationDate((row["palpation_date"]?.asDate()));
				self.setPastureId((row["pasture_id"]?.asInt()));

				var fields = [String: String]()
				fields["breeding_agreement_id"] = self.getBreedingAgreementIdStr()
				fields["cow_owner_id"] = self.getCowOwnerIdStr()
				fields["bull_owner_id"] = self.getBullOwnerIdStr()
				fields["bull_registration"] = self.getBullRegistrationStr()
				fields["begin_date"] = self.getBeginDateStr()
				fields["end_date"] = self.getEndDateStr()
				fields["create_user"] = self.getCreateUserStr()
				fields["create_stamp"] = self.getCreateStampStr()
				fields["update_user"] = self.getUpdateUserStr()
				fields["update_stamp"] = self.getUpdateStampStr()
				fields["cow_registration"] = self.getCowRegistrationStr()
				fields["work_order"] = self.getWorkOrderStr()
				fields["calf"] = self.getCalfStr()
				fields["non_calving_reason"] = self.getNonCalvingReasonStr()
				fields["palpation_result"] = self.getPalpationResultStr()
				fields["palpation_date"] = self.getPalpationDateStr()
				fields["pasture_id"] = self.getPastureIdStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["breeding_agreement_id"] = self.getBreedingAgreementIdStr()
		fields["cow_owner_id"] = self.getCowOwnerIdStr()
		fields["bull_owner_id"] = self.getBullOwnerIdStr()
		fields["bull_registration"] = self.getBullRegistrationStr()
		fields["begin_date"] = self.getBeginDateStr()
		fields["end_date"] = self.getEndDateStr()
		fields["create_user"] = self.getCreateUserStr()
		fields["create_stamp"] = self.getCreateStampStr()
		fields["update_user"] = self.getUpdateUserStr()
		fields["update_stamp"] = self.getUpdateStampStr()
		fields["cow_registration"] = self.getCowRegistrationStr()
		fields["work_order"] = self.getWorkOrderStr()
		fields["calf"] = self.getCalfStr()
		fields["non_calving_reason"] = self.getNonCalvingReasonStr()
		fields["palpation_result"] = self.getPalpationResultStr()
		fields["palpation_date"] = self.getPalpationDateStr()
		fields["pasture_id"] = self.getPastureIdStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["breeding_agreement_id"] = self.getBreedingAgreementIdStrPG()
		fields["cow_owner_id"] = self.getCowOwnerIdStrPG()
		fields["bull_owner_id"] = self.getBullOwnerIdStrPG()
		fields["bull_registration"] = self.getBullRegistrationStrPG()
		fields["begin_date"] = self.getBeginDateStrPG()
		fields["end_date"] = self.getEndDateStrPG()
		fields["create_user"] = self.getCreateUserStrPG()
		fields["create_stamp"] = self.getCreateStampStrPG()
		fields["update_user"] = self.getUpdateUserStrPG()
		fields["update_stamp"] = self.getUpdateStampStrPG()
		fields["cow_registration"] = self.getCowRegistrationStrPG()
		fields["work_order"] = self.getWorkOrderStrPG()
		fields["calf"] = self.getCalfStrPG()
		fields["non_calving_reason"] = self.getNonCalvingReasonStrPG()
		fields["palpation_result"] = self.getPalpationResultStrPG()
		fields["palpation_date"] = self.getPalpationDateStrPG()
		fields["pasture_id"] = self.getPastureIdStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_breeding_agreement ("
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

        var statement = "INSERT INTO tbl_breeding_agreement ("
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

            var statement = "INSERT INTO tbl_breeding_agreement ("

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

        var statement = "UPDATE tbl_breeding_agreement "
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
        statement += "WHERE bull_registration = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query(statement)
    }

    func updatePG(forID: String) {

        // get all field/values as string values
        var fields = self.getFieldsPG()

        var statement = "UPDATE tbl_breeding_agreement "
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
        statement += "WHERE bull_registration = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    func delete(forID: Int) {
        let query = "DELETE FROM tbl_breeding_agreement WHERE bull_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM tbl_breeding_agreement WHERE bull_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastbullRegistration() -> String {
        let bull_registration: String = ""
        let query = "SELECT bull_registration from tbl_breeding_agreement ORDER BY _id DESC LIMIT 1 "
        let (resultset, err) = SDOld.executeQuery(query)
        if (err == nil) {
            if resultset.count > 0 {
                let row = resultset[0]
                let bull_registration2 = row["bull_registration"]?.asString() ?? ""

                return bull_registration2

            }
        }
        return bull_registration
    }
}