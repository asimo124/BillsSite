

//
//  DnaRequests.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class DnaRequestsData {

	var dna_request_id: Int = -1
    var dna_request_id_str: String = "unset"
	var registration: String = "unset"
    var registration_str: String = "unset"
	var member_id: String = "unset"
    var member_id_str: String = "unset"
	var barcode: String = "unset"
    var barcode_str: String = "unset"
	var sample_type: String = "unset"
    var sample_type_str: String = "unset"
	var work_order: Int = -1
    var work_order_str: String = "unset"
	var reason: String = "unset"
    var reason_str: String = "unset"
	var alternate_fathers: String = "unset"
    var alternate_fathers_str: String = "unset"
	var alternate_mothers: String = "unset"
    var alternate_mothers_str: String = "unset"
	var in_progress: Int = -1
    var in_progress_str: String = "unset"
	var is_completed: Int = -1
    var is_completed_str: String = "unset"
	var is_redo: Int = -1
    var is_redo_str: String = "unset"
	
	func setDnaRequestId(dna_request_id: Int?) {
        self.dna_request_id = dna_request_id ?? 0
        let dna_request_id2 = dna_request_id ?? 0
        self.dna_request_id_str = String(dna_request_id2)
        self.dna_request_id_str = (self.dna_request_id_str == "0") ? "" : self.dna_request_id_str
    }
    func getDnaRequestId() -> Int {
        return self.dna_request_id
    }
    func getDnaRequestIdType() -> String {
        return "Int"
    };
	func getDnaRequestIdStr() -> String {
        return dna_request_id_str
    };
	func getDnaRequestIdStrPG() -> String {
        return dna_request_id_str
    };

	func setRegistration(registration: String?) {
        self.registration = registration ?? ""
        self.registration_str = String(self.registration)
    }
    func getRegistration() -> String {
        return self.registration
    }
    func getRegistrationType() -> String {
        return "String"
    };
	func getRegistrationStr() -> String {
        return registration_str == "unset" ? "" : registration_str
    };
	func getRegistrationStrPG() -> String {
        return registration_str == "unset" ? "" : registration_str
    };

	func setMemberId(member_id: String?) {
        self.member_id = member_id ?? ""
        self.member_id_str = String(self.member_id)
    }
    func getMemberId() -> String {
        return self.member_id
    }
    func getMemberIdType() -> String {
        return "String"
    };
	func getMemberIdStr() -> String {
        return member_id_str == "unset" ? "" : member_id_str
    };
	func getMemberIdStrPG() -> String {
        return member_id_str == "unset" ? "" : member_id_str
    };

	func setBarcode(barcode: String?) {
        self.barcode = barcode ?? ""
        self.barcode_str = String(self.barcode)
    }
    func getBarcode() -> String {
        return self.barcode
    }
    func getBarcodeType() -> String {
        return "String"
    };
	func getBarcodeStr() -> String {
        return barcode_str == "unset" ? "" : barcode_str
    };
	func getBarcodeStrPG() -> String {
        return barcode_str == "unset" ? "" : barcode_str
    };

	func setSampleType(sample_type: String?) {
        self.sample_type = sample_type ?? ""
        self.sample_type_str = String(self.sample_type)
    }
    func getSampleType() -> String {
        return self.sample_type
    }
    func getSampleTypeType() -> String {
        return "String"
    };
	func getSampleTypeStr() -> String {
        return sample_type_str == "unset" ? "" : sample_type_str
    };
	func getSampleTypeStrPG() -> String {
        return sample_type_str == "unset" ? "" : sample_type_str
    };

	func setWorkOrder(work_order: Int?) {
        self.work_order = work_order ?? 0
        let work_order2 = work_order ?? 0
        self.work_order_str = String(work_order2)
        self.work_order_str = (self.work_order_str == "0") ? "" : self.work_order_str
    }
    func getWorkOrder() -> Int {
        return self.work_order
    }
    func getWorkOrderType() -> String {
        return "Int"
    };
	func getWorkOrderStr() -> String {
        return work_order_str
    };
	func getWorkOrderStrPG() -> String {
        return work_order_str
    };

	func setReason(reason: String?) {
        self.reason = reason ?? ""
        self.reason_str = String(self.reason)
    }
    func getReason() -> String {
        return self.reason
    }
    func getReasonType() -> String {
        return "String"
    };
	func getReasonStr() -> String {
        return reason_str == "unset" ? "" : reason_str
    };
	func getReasonStrPG() -> String {
        return reason_str == "unset" ? "" : reason_str
    };

	func setAlternateFathers(alternate_fathers: String?) {
        self.alternate_fathers = alternate_fathers ?? ""
        self.alternate_fathers_str = String(self.alternate_fathers)
    }
    func getAlternateFathers() -> String {
        return self.alternate_fathers
    }
    func getAlternateFathersType() -> String {
        return "String"
    };
	func getAlternateFathersStr() -> String {
        return alternate_fathers_str == "unset" ? "" : alternate_fathers_str
    };
	func getAlternateFathersStrPG() -> String {
        return alternate_fathers_str == "unset" ? "" : alternate_fathers_str
    };

	func setAlternateMothers(alternate_mothers: String?) {
        self.alternate_mothers = alternate_mothers ?? ""
        self.alternate_mothers_str = String(self.alternate_mothers)
    }
    func getAlternateMothers() -> String {
        return self.alternate_mothers
    }
    func getAlternateMothersType() -> String {
        return "String"
    };
	func getAlternateMothersStr() -> String {
        return alternate_mothers_str == "unset" ? "" : alternate_mothers_str
    };
	func getAlternateMothersStrPG() -> String {
        return alternate_mothers_str == "unset" ? "" : alternate_mothers_str
    };

	func setInProgress(in_progress: Int?) {
        self.in_progress = in_progress ?? 0
        self.in_progress_str = ((self.in_progress) == 1) ? "t" : "f"
    }
    func getInProgress() -> Int {
        return self.in_progress
    }
    func getInProgressType() -> String {
        return "Int"
    };
	func getInProgressStr() -> String {
        return String(in_progress)
    };
	func getInProgressStrPG() -> String {
        return in_progress_str
    };

	func setIsCompleted(is_completed: Int?) {
        self.is_completed = is_completed ?? 0
        self.is_completed_str = ((self.is_completed) == 1) ? "t" : "f"
    }
    func getIsCompleted() -> Int {
        return self.is_completed
    }
    func getIsCompletedType() -> String {
        return "Int"
    };
	func getIsCompletedStr() -> String {
        return String(is_completed)
    };
	func getIsCompletedStrPG() -> String {
        return is_completed_str
    };

	func setIsRedo(is_redo: Int?) {
        self.is_redo = is_redo ?? 0
        self.is_redo_str = ((self.is_redo) == 1) ? "t" : "f"
    }
    func getIsRedo() -> Int {
        return self.is_redo
    }
    func getIsRedoType() -> String {
        return "Int"
    };
	func getIsRedoStr() -> String {
        return String(is_redo)
    };
	func getIsRedoStrPG() -> String {
        return is_redo_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "dna_request_id":
				return "Int"
			case "registration":
				return "String"
			case "member_id":
				return "String"
			case "barcode":
				return "String"
			case "sample_type":
				return "String"
			case "work_order":
				return "Int"
			case "reason":
				return "String"
			case "alternate_fathers":
				return "String"
			case "alternate_mothers":
				return "String"
			case "in_progress":
				return "Int"
			case "is_completed":
				return "Int"
			case "is_redo":
				return "Int"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "dna_request_id":
			return self.getDnaRequestIdStr()
			case "registration":
			return self.getRegistrationStr()
			case "member_id":
			return self.getMemberIdStr()
			case "barcode":
			return self.getBarcodeStr()
			case "sample_type":
			return self.getSampleTypeStr()
			case "work_order":
			return self.getWorkOrderStr()
			case "reason":
			return self.getReasonStr()
			case "alternate_fathers":
			return self.getAlternateFathersStr()
			case "alternate_mothers":
			return self.getAlternateMothersStr()
			case "in_progress":
			return self.getInProgressStr()
			case "is_completed":
			return self.getIsCompletedStr()
			case "is_redo":
			return self.getIsRedoStr()
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
            let value = child.value
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
    func loadByID(registration: String) -> [String: String] {
        let qb = QueryBuilder()
        qb.selectFrom("dna_requests")
            .Where("registration = ?")

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(registration)

        var fields = [String: String]()
        let (resultset, error) = SD.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SD.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setDnaRequestId((row["dna_request_id"]?.asInt()));
				self.setRegistration((row["registration"]?.asString()));
				self.setMemberId((row["member_id"]?.asString()));
				self.setBarcode((row["barcode"]?.asString()));
				self.setSampleType((row["sample_type"]?.asString()));
				self.setWorkOrder((row["work_order"]?.asInt()));
				self.setReason((row["reason"]?.asString()));
				self.setAlternateFathers((row["alternate_fathers"]?.asString()));
				self.setAlternateMothers((row["alternate_mothers"]?.asString()));
				self.setInProgress((row["in_progress"]?.asMyBool()));
				self.setIsCompleted((row["is_completed"]?.asMyBool()));
				self.setIsRedo((row["is_redo"]?.asMyBool()));

				var fields = [String: String]()
				fields["dna_request_id"] = self.getDnaRequestIdStr()
				fields["registration"] = self.getRegistrationStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["barcode"] = self.getBarcodeStr()
				fields["sample_type"] = self.getSampleTypeStr()
				fields["work_order"] = self.getWorkOrderStr()
				fields["reason"] = self.getReasonStr()
				fields["alternate_fathers"] = self.getAlternateFathersStr()
				fields["alternate_mothers"] = self.getAlternateMothersStr()
				fields["in_progress"] = self.getInProgressStr()
				fields["is_completed"] = self.getIsCompletedStr()
				fields["is_redo"] = self.getIsRedoStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["dna_request_id"] = self.getDnaRequestIdStr()
		fields["registration"] = self.getRegistrationStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["barcode"] = self.getBarcodeStr()
		fields["sample_type"] = self.getSampleTypeStr()
		fields["work_order"] = self.getWorkOrderStr()
		fields["reason"] = self.getReasonStr()
		fields["alternate_fathers"] = self.getAlternateFathersStr()
		fields["alternate_mothers"] = self.getAlternateMothersStr()
		fields["in_progress"] = self.getInProgressStr()
		fields["is_completed"] = self.getIsCompletedStr()
		fields["is_redo"] = self.getIsRedoStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["dna_request_id"] = self.getDnaRequestIdStrPG()
		fields["registration"] = self.getRegistrationStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["barcode"] = self.getBarcodeStrPG()
		fields["sample_type"] = self.getSampleTypeStrPG()
		fields["work_order"] = self.getWorkOrderStrPG()
		fields["reason"] = self.getReasonStrPG()
		fields["alternate_fathers"] = self.getAlternateFathersStrPG()
		fields["alternate_mothers"] = self.getAlternateMothersStrPG()
		fields["in_progress"] = self.getInProgressStrPG()
		fields["is_completed"] = self.getIsCompletedStrPG()
		fields["is_redo"] = self.getIsRedoStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO dna_requests ("
        var i = 0
        let obj = self
        let reflected = Mirror(reflecting: obj)
        for child in reflected.children {
            guard let key = child.label else { continue }
            let _ = child.value
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
            let _ = child.value
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

        let dbn = Database()
        dbn.query(statement)
    }

    func addNewPG() {

        var statement = "INSERT INTO dna_requests ("
        var i = 0
        let obj = self
        let reflected = Mirror(reflecting: obj)
        for child in reflected.children {
            guard let key = child.label else { continue }
            let _ = child.value
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
            let _ = child.value
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

        let dbn = Database()
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

            var statement = "INSERT INTO dna_requests ("

            let reflected = Mirror(reflecting: obj)
            for child in reflected.children {
                guard let key = child.label else { continue }
                let _ = child.value
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
            let _ = child.value
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

        var statement = "UPDATE dna_requests "
        var i = 0
        let obj = self
        let reflected = Mirror(reflecting: obj)
        for child in reflected.children {
            guard let key = child.label else { continue }
            let _ = child.value
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

        let dbn = Database()
        dbn.query(statement)
    }

    func updatePG(forID: String) {

        // get all field/values as string values
        var fields = self.getFieldsPG()

        var statement = "UPDATE dna_requests "
        var i = 0
        let obj = self
        let reflected = Mirror(reflecting: obj)
        for child in reflected.children {
            guard let key = child.label else { continue }
            let _ = child.value
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

        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    func delete(forID: Int) {
        let query = "DELETE FROM dna_requests WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM dna_requests WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastregistration() -> String {
        let registration: String = ""
        let query = "SELECT registration from dna_requests ORDER BY _id DESC LIMIT 1 "
        let (resultset, err) = SD.executeQuery(query)
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
