

//
//  AnimalsBreeding.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsBreedingData {

	var breeding_id: Int = -1
    var breeding_id_str: String = "unset"
	var type: String = "unset"
    var type_str: String = "unset"
	var work_order: Int = -1
    var work_order_str: String = "unset"
	var dam: String = "unset"
    var dam_str: String = "unset"
	var sire: String = "unset"
    var sire_str: String = "unset"
	var calf: String = "unset"
    var calf_str: String = "unset"
	var begin_date: NSDate = NSDate.distantFuture() as NSDate
    var begin_date_str: String = "unset"
	var end_date: NSDate = NSDate.distantFuture() as NSDate
    var end_date_str: String = "unset"
	var ai_date: NSDate = NSDate.distantFuture() as NSDate
    var ai_date_str: String = "unset"
	var recipient_dam: String = "unset"
    var recipient_dam_str: String = "unset"
	var transfer_date: NSDate = NSDate.distantFuture() as NSDate
    var transfer_date_str: String = "unset"
	var flush_date: NSDate = NSDate.distantFuture() as NSDate
    var flush_date_str: String = "unset"
	var palpation_result: String = "unset"
    var palpation_result_str: String = "unset"
	var palpation_date: NSDate = NSDate.distantFuture() as NSDate
    var palpation_date_str: String = "unset"
	var ai_cert: Int = -1
    var ai_cert_str: String = "unset"
	
	func setBreedingId(breeding_id: Int?) {
        self.breeding_id = breeding_id ?? 0
        let breeding_id2 = breeding_id ?? 0
        self.breeding_id_str = String(breeding_id2)
        self.breeding_id_str = (self.breeding_id_str == "0") ? "" : self.breeding_id_str
    }
    func getBreedingId() -> Int {
        return self.breeding_id
    }
    func getBreedingIdType() -> String {
        return "Int"
    };
	func getBreedingIdStr() -> String {
        return breeding_id_str
    };
	func getBreedingIdStrPG() -> String {
        return breeding_id_str
    };

	func setType(type: String?) {
        self.type = type ?? ""
        self.type_str = String(self.type)
    }
    func getType() -> String {
        return self.type
    }
    func getTypeType() -> String {
        return "String"
    };
	func getTypeStr() -> String {
        return type_str == "unset" ? "" : type_str
    };
	func getTypeStrPG() -> String {
        return type_str == "unset" ? "" : type_str
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

	func setAiDate(ai_date: NSDate?) {
        self.ai_date = ai_date ?? NSDate.distantPast() as NSDate
        self.ai_date_str = Utils.dateToString(self.ai_date)
    }
    func getAiDate() -> NSDate {
        return self.ai_date
    }
    func getAiDateType() -> String {
        return "NSDate"
    };
	func getAiDateStr() -> String {
        return ai_date_str == "unset" || ai_date_str == "0000-12-30 00:00:00 +0000" ? "" : ai_date_str
    };
	func getAiDateStrPG() -> String {
        return ai_date_str == "unset" || ai_date_str == "0000-12-30 00:00:00 +0000" ? "" : ai_date_str
    };

	func setRecipientDam(recipient_dam: String?) {
        self.recipient_dam = recipient_dam ?? ""
        self.recipient_dam_str = String(self.recipient_dam)
    }
    func getRecipientDam() -> String {
        return self.recipient_dam
    }
    func getRecipientDamType() -> String {
        return "String"
    };
	func getRecipientDamStr() -> String {
        return recipient_dam_str == "unset" ? "" : recipient_dam_str
    };
	func getRecipientDamStrPG() -> String {
        return recipient_dam_str == "unset" ? "" : recipient_dam_str
    };

	func setTransferDate(transfer_date: NSDate?) {
        self.transfer_date = transfer_date ?? NSDate.distantPast() as NSDate
        self.transfer_date_str = Utils.dateToString(self.transfer_date)
    }
    func getTransferDate() -> NSDate {
        return self.transfer_date
    }
    func getTransferDateType() -> String {
        return "NSDate"
    };
	func getTransferDateStr() -> String {
        return transfer_date_str == "unset" || transfer_date_str == "0000-12-30 00:00:00 +0000" ? "" : transfer_date_str
    };
	func getTransferDateStrPG() -> String {
        return transfer_date_str == "unset" || transfer_date_str == "0000-12-30 00:00:00 +0000" ? "" : transfer_date_str
    };

	func setFlushDate(flush_date: NSDate?) {
        self.flush_date = flush_date ?? NSDate.distantPast() as NSDate
        self.flush_date_str = Utils.dateToString(self.flush_date)
    }
    func getFlushDate() -> NSDate {
        return self.flush_date
    }
    func getFlushDateType() -> String {
        return "NSDate"
    };
	func getFlushDateStr() -> String {
        return flush_date_str == "unset" || flush_date_str == "0000-12-30 00:00:00 +0000" ? "" : flush_date_str
    };
	func getFlushDateStrPG() -> String {
        return flush_date_str == "unset" || flush_date_str == "0000-12-30 00:00:00 +0000" ? "" : flush_date_str
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

	func setAiCert(ai_cert: Int?) {
        self.ai_cert = ai_cert ?? 0
        self.ai_cert_str = ((self.ai_cert) == 1) ? "t" : "f"
    }
    func getAiCert() -> Int {
        return self.ai_cert
    }
    func getAiCertType() -> String {
        return "Int"
    };
	func getAiCertStr() -> String {
        return String(ai_cert)
    };
	func getAiCertStrPG() -> String {
        return ai_cert_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "breeding_id":
				return "Int"
			case "type":
				return "String"
			case "work_order":
				return "Int"
			case "dam":
				return "String"
			case "sire":
				return "String"
			case "calf":
				return "String"
			case "begin_date":
				return "NSDate"
			case "end_date":
				return "NSDate"
			case "ai_date":
				return "NSDate"
			case "recipient_dam":
				return "String"
			case "transfer_date":
				return "NSDate"
			case "flush_date":
				return "NSDate"
			case "palpation_result":
				return "String"
			case "palpation_date":
				return "NSDate"
			case "ai_cert":
				return "Int"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "breeding_id":
			return self.getBreedingIdStr()
			case "type":
			return self.getTypeStr()
			case "work_order":
			return self.getWorkOrderStr()
			case "dam":
			return self.getDamStr()
			case "sire":
			return self.getSireStr()
			case "calf":
			return self.getCalfStr()
			case "begin_date":
			return self.getBeginDateStr()
			case "end_date":
			return self.getEndDateStr()
			case "ai_date":
			return self.getAiDateStr()
			case "recipient_dam":
			return self.getRecipientDamStr()
			case "transfer_date":
			return self.getTransferDateStr()
			case "flush_date":
			return self.getFlushDateStr()
			case "palpation_result":
			return self.getPalpationResultStr()
			case "palpation_date":
			return self.getPalpationDateStr()
			case "ai_cert":
			return self.getAiCertStr()
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
    func loadByID(work_order: String) -> [String: String] {
        let qb = QueryBuilder()
        qb.selectFrom("animal_breeding")
            .Where("work_order = ?")

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(work_order)

        var fields = [String: String]()
        let (resultset, error) = SD.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SD.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setBreedingId((row["breeding_id"]?.asInt()));
				self.setType((row["type"]?.asString()));
				self.setWorkOrder((row["work_order"]?.asInt()));
				self.setDam((row["dam"]?.asString()));
				self.setSire((row["sire"]?.asString()));
				self.setCalf((row["calf"]?.asString()));
				self.setBeginDate((row["begin_date"]?.asDate()));
				self.setEndDate((row["end_date"]?.asDate()));
				self.setAiDate((row["ai_date"]?.asDate()));
				self.setRecipientDam((row["recipient_dam"]?.asString()));
				self.setTransferDate((row["transfer_date"]?.asDate()));
				self.setFlushDate((row["flush_date"]?.asDate()));
				self.setPalpationResult((row["palpation_result"]?.asString()));
				self.setPalpationDate((row["palpation_date"]?.asDate()));
				self.setAiCert((row["ai_cert"]?.asMyBool()));

				
				fields["breeding_id"] = self.getBreedingIdStr()
				fields["type"] = self.getTypeStr()
				fields["work_order"] = self.getWorkOrderStr()
				fields["dam"] = self.getDamStr()
				fields["sire"] = self.getSireStr()
				fields["calf"] = self.getCalfStr()
				fields["begin_date"] = self.getBeginDateStr()
				fields["end_date"] = self.getEndDateStr()
				fields["ai_date"] = self.getAiDateStr()
				fields["recipient_dam"] = self.getRecipientDamStr()
				fields["transfer_date"] = self.getTransferDateStr()
				fields["flush_date"] = self.getFlushDateStr()
				fields["palpation_result"] = self.getPalpationResultStr()
				fields["palpation_date"] = self.getPalpationDateStr()
				fields["ai_cert"] = self.getAiCertStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["breeding_id"] = self.getBreedingIdStr()
		fields["type"] = self.getTypeStr()
		fields["work_order"] = self.getWorkOrderStr()
		fields["dam"] = self.getDamStr()
		fields["sire"] = self.getSireStr()
		fields["calf"] = self.getCalfStr()
		fields["begin_date"] = self.getBeginDateStr()
		fields["end_date"] = self.getEndDateStr()
		fields["ai_date"] = self.getAiDateStr()
		fields["recipient_dam"] = self.getRecipientDamStr()
		fields["transfer_date"] = self.getTransferDateStr()
		fields["flush_date"] = self.getFlushDateStr()
		fields["palpation_result"] = self.getPalpationResultStr()
		fields["palpation_date"] = self.getPalpationDateStr()
		fields["ai_cert"] = self.getAiCertStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["breeding_id"] = self.getBreedingIdStrPG()
		fields["type"] = self.getTypeStrPG()
		fields["work_order"] = self.getWorkOrderStrPG()
		fields["dam"] = self.getDamStrPG()
		fields["sire"] = self.getSireStrPG()
		fields["calf"] = self.getCalfStrPG()
		fields["begin_date"] = self.getBeginDateStrPG()
		fields["end_date"] = self.getEndDateStrPG()
		fields["ai_date"] = self.getAiDateStrPG()
		fields["recipient_dam"] = self.getRecipientDamStrPG()
		fields["transfer_date"] = self.getTransferDateStrPG()
		fields["flush_date"] = self.getFlushDateStrPG()
		fields["palpation_result"] = self.getPalpationResultStrPG()
		fields["palpation_date"] = self.getPalpationDateStrPG()
		fields["ai_cert"] = self.getAiCertStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO animal_breeding ("
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

        var statement = "INSERT INTO animal_breeding ("
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

            var statement = "INSERT INTO animal_breeding ("

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

        var statement = "UPDATE animal_breeding "
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
        statement += "WHERE work_order = " + String(forID)

        let dbn = Database()
        dbn.query(statement)
    }

    func updatePG(forID: String) {

        // get all field/values as string values
        var fields = self.getFieldsPG()

        var statement = "UPDATE animal_breeding "
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
        statement += "WHERE work_order = " + String(forID)

        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    func delete(forID: Int) {
        let query = "DELETE FROM animal_breeding WHERE work_order = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM animal_breeding WHERE work_order = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastworkOrder() -> String {
        let work_order: String = ""
        let query = "SELECT work_order from animal_breeding ORDER BY _id DESC LIMIT 1 "
        let (resultset, err) = SD.executeQuery(query)
        if (err == nil) {
            if resultset.count > 0 {
                let row = resultset[0]
                let work_order2 = row["work_order"]?.asString() ?? ""

                return work_order2

            }
        }
        return work_order
    }
}
