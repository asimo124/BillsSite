

//
//  DnaParentage.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class DnaParentageData {

	var _id: Int = -1
    var _id_str: String = "unset"
	var sample_id: Int = -1
    var sample_id_str: String = "unset"
	var animal_id: String = "unset"
    var animal_id_str: String = "unset"
	var barcode: String = "unset"
    var barcode_str: String = "unset"
	var registration: String = "unset"
    var registration_str: String = "unset"
	var sample_status: String = "unset"
    var sample_status_str: String = "unset"
	var sire_1: String = "unset"
    var sire_1_str: String = "unset"
	var sire_2: String = "unset"
    var sire_2_str: String = "unset"
	var dam: String = "unset"
    var dam_str: String = "unset"
	var sire_1_result: String = "unset"
    var sire_1_result_str: String = "unset"
	var sire_2_result: String = "unset"
    var sire_2_result_str: String = "unset"
	var dam_result: String = "unset"
    var dam_result_str: String = "unset"
	var sire_1_dam_result: String = "unset"
    var sire_1_dam_result_str: String = "unset"
	var sire_2_dam_result: String = "unset"
    var sire_2_dam_result_str: String = "unset"
	
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

	func setSampleId(sample_id: Int?) {
        self.sample_id = sample_id ?? 0
        let sample_id2 = sample_id ?? 0
        self.sample_id_str = String(sample_id2)
        self.sample_id_str = (self.sample_id_str == "0") ? "" : self.sample_id_str
    }
    func getSampleId() -> Int {
        return self.sample_id
    }
    func getSampleIdType() -> String {
        return "Int"
    };
	func getSampleIdStr() -> String {
        return sample_id_str
    };
	func getSampleIdStrPG() -> String {
        return sample_id_str
    };

	func setAnimalId(animal_id: String?) {
        self.animal_id = animal_id ?? ""
        self.animal_id_str = String(self.animal_id)
    }
    func getAnimalId() -> String {
        return self.animal_id
    }
    func getAnimalIdType() -> String {
        return "String"
    };
	func getAnimalIdStr() -> String {
        return animal_id_str == "unset" ? "" : animal_id_str
    };
	func getAnimalIdStrPG() -> String {
        return animal_id_str == "unset" ? "" : animal_id_str
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

	func setSampleStatus(sample_status: String?) {
        self.sample_status = sample_status ?? ""
        self.sample_status_str = String(self.sample_status)
    }
    func getSampleStatus() -> String {
        return self.sample_status
    }
    func getSampleStatusType() -> String {
        return "String"
    };
	func getSampleStatusStr() -> String {
        return sample_status_str == "unset" ? "" : sample_status_str
    };
	func getSampleStatusStrPG() -> String {
        return sample_status_str == "unset" ? "" : sample_status_str
    };

	func setSire1(sire_1: String?) {
        self.sire_1 = sire_1 ?? ""
        self.sire_1_str = String(self.sire_1)
    }
    func getSire1() -> String {
        return self.sire_1
    }
    func getSire1Type() -> String {
        return "String"
    };
	func getSire1Str() -> String {
        return sire_1_str == "unset" ? "" : sire_1_str
    };
	func getSire1StrPG() -> String {
        return sire_1_str == "unset" ? "" : sire_1_str
    };

	func setSire2(sire_2: String?) {
        self.sire_2 = sire_2 ?? ""
        self.sire_2_str = String(self.sire_2)
    }
    func getSire2() -> String {
        return self.sire_2
    }
    func getSire2Type() -> String {
        return "String"
    };
	func getSire2Str() -> String {
        return sire_2_str == "unset" ? "" : sire_2_str
    };
	func getSire2StrPG() -> String {
        return sire_2_str == "unset" ? "" : sire_2_str
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

	func setSire1Result(sire_1_result: String?) {
        self.sire_1_result = sire_1_result ?? ""
        self.sire_1_result_str = String(self.sire_1_result)
    }
    func getSire1Result() -> String {
        return self.sire_1_result
    }
    func getSire1ResultType() -> String {
        return "String"
    };
	func getSire1ResultStr() -> String {
        return sire_1_result_str == "unset" ? "" : sire_1_result_str
    };
	func getSire1ResultStrPG() -> String {
        return sire_1_result_str == "unset" ? "" : sire_1_result_str
    };

	func setSire2Result(sire_2_result: String?) {
        self.sire_2_result = sire_2_result ?? ""
        self.sire_2_result_str = String(self.sire_2_result)
    }
    func getSire2Result() -> String {
        return self.sire_2_result
    }
    func getSire2ResultType() -> String {
        return "String"
    };
	func getSire2ResultStr() -> String {
        return sire_2_result_str == "unset" ? "" : sire_2_result_str
    };
	func getSire2ResultStrPG() -> String {
        return sire_2_result_str == "unset" ? "" : sire_2_result_str
    };

	func setDamResult(dam_result: String?) {
        self.dam_result = dam_result ?? ""
        self.dam_result_str = String(self.dam_result)
    }
    func getDamResult() -> String {
        return self.dam_result
    }
    func getDamResultType() -> String {
        return "String"
    };
	func getDamResultStr() -> String {
        return dam_result_str == "unset" ? "" : dam_result_str
    };
	func getDamResultStrPG() -> String {
        return dam_result_str == "unset" ? "" : dam_result_str
    };

	func setSire1DamResult(sire_1_dam_result: String?) {
        self.sire_1_dam_result = sire_1_dam_result ?? ""
        self.sire_1_dam_result_str = String(self.sire_1_dam_result)
    }
    func getSire1DamResult() -> String {
        return self.sire_1_dam_result
    }
    func getSire1DamResultType() -> String {
        return "String"
    };
	func getSire1DamResultStr() -> String {
        return sire_1_dam_result_str == "unset" ? "" : sire_1_dam_result_str
    };
	func getSire1DamResultStrPG() -> String {
        return sire_1_dam_result_str == "unset" ? "" : sire_1_dam_result_str
    };

	func setSire2DamResult(sire_2_dam_result: String?) {
        self.sire_2_dam_result = sire_2_dam_result ?? ""
        self.sire_2_dam_result_str = String(self.sire_2_dam_result)
    }
    func getSire2DamResult() -> String {
        return self.sire_2_dam_result
    }
    func getSire2DamResultType() -> String {
        return "String"
    };
	func getSire2DamResultStr() -> String {
        return sire_2_dam_result_str == "unset" ? "" : sire_2_dam_result_str
    };
	func getSire2DamResultStrPG() -> String {
        return sire_2_dam_result_str == "unset" ? "" : sire_2_dam_result_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "_id":
				return "Int"
			case "sample_id":
				return "Int"
			case "animal_id":
				return "String"
			case "barcode":
				return "String"
			case "registration":
				return "String"
			case "sample_status":
				return "String"
			case "sire_1":
				return "String"
			case "sire_2":
				return "String"
			case "dam":
				return "String"
			case "sire_1_result":
				return "String"
			case "sire_2_result":
				return "String"
			case "dam_result":
				return "String"
			case "sire_1_dam_result":
				return "String"
			case "sire_2_dam_result":
				return "String"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "_id":
			return self.getIdStr()
			case "sample_id":
			return self.getSampleIdStr()
			case "animal_id":
			return self.getAnimalIdStr()
			case "barcode":
			return self.getBarcodeStr()
			case "registration":
			return self.getRegistrationStr()
			case "sample_status":
			return self.getSampleStatusStr()
			case "sire_1":
			return self.getSire1Str()
			case "sire_2":
			return self.getSire2Str()
			case "dam":
			return self.getDamStr()
			case "sire_1_result":
			return self.getSire1ResultStr()
			case "sire_2_result":
			return self.getSire2ResultStr()
			case "dam_result":
			return self.getDamResultStr()
			case "sire_1_dam_result":
			return self.getSire1DamResultStr()
			case "sire_2_dam_result":
			return self.getSire2DamResultStr()
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
        qb.selectFrom("dna_parentage")
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

				self.setId((row["_id"]?.asInt()));
				self.setSampleId((row["sample_id"]?.asInt()));
				self.setAnimalId((row["animal_id"]?.asString()));
				self.setBarcode((row["barcode"]?.asString()));
				self.setRegistration((row["registration"]?.asString()));
				self.setSampleStatus((row["sample_status"]?.asString()));
				self.setSire1((row["sire_1"]?.asString()));
				self.setSire2((row["sire_2"]?.asString()));
				self.setDam((row["dam"]?.asString()));
				self.setSire1Result((row["sire_1_result"]?.asString()));
				self.setSire2Result((row["sire_2_result"]?.asString()));
				self.setDamResult((row["dam_result"]?.asString()));
				self.setSire1DamResult((row["sire_1_dam_result"]?.asString()));
				self.setSire2DamResult((row["sire_2_dam_result"]?.asString()));

				
				fields["_id"] = self.getIdStr()
				fields["sample_id"] = self.getSampleIdStr()
				fields["animal_id"] = self.getAnimalIdStr()
				fields["barcode"] = self.getBarcodeStr()
				fields["registration"] = self.getRegistrationStr()
				fields["sample_status"] = self.getSampleStatusStr()
				fields["sire_1"] = self.getSire1Str()
				fields["sire_2"] = self.getSire2Str()
				fields["dam"] = self.getDamStr()
				fields["sire_1_result"] = self.getSire1ResultStr()
				fields["sire_2_result"] = self.getSire2ResultStr()
				fields["dam_result"] = self.getDamResultStr()
				fields["sire_1_dam_result"] = self.getSire1DamResultStr()
				fields["sire_2_dam_result"] = self.getSire2DamResultStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["_id"] = self.getIdStr()
		fields["sample_id"] = self.getSampleIdStr()
		fields["animal_id"] = self.getAnimalIdStr()
		fields["barcode"] = self.getBarcodeStr()
		fields["registration"] = self.getRegistrationStr()
		fields["sample_status"] = self.getSampleStatusStr()
		fields["sire_1"] = self.getSire1Str()
		fields["sire_2"] = self.getSire2Str()
		fields["dam"] = self.getDamStr()
		fields["sire_1_result"] = self.getSire1ResultStr()
		fields["sire_2_result"] = self.getSire2ResultStr()
		fields["dam_result"] = self.getDamResultStr()
		fields["sire_1_dam_result"] = self.getSire1DamResultStr()
		fields["sire_2_dam_result"] = self.getSire2DamResultStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["_id"] = self.getIdStrPG()
		fields["sample_id"] = self.getSampleIdStrPG()
		fields["animal_id"] = self.getAnimalIdStrPG()
		fields["barcode"] = self.getBarcodeStrPG()
		fields["registration"] = self.getRegistrationStrPG()
		fields["sample_status"] = self.getSampleStatusStrPG()
		fields["sire_1"] = self.getSire1StrPG()
		fields["sire_2"] = self.getSire2StrPG()
		fields["dam"] = self.getDamStrPG()
		fields["sire_1_result"] = self.getSire1ResultStrPG()
		fields["sire_2_result"] = self.getSire2ResultStrPG()
		fields["dam_result"] = self.getDamResultStrPG()
		fields["sire_1_dam_result"] = self.getSire1DamResultStrPG()
		fields["sire_2_dam_result"] = self.getSire2DamResultStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO dna_parentage ("
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

        var statement = "INSERT INTO dna_parentage ("
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

            var statement = "INSERT INTO dna_parentage ("

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

        var statement = "UPDATE dna_parentage "
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

        var statement = "UPDATE dna_parentage "
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
        let query = "DELETE FROM dna_parentage WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM dna_parentage WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastregistration() -> String {
        let registration: String = ""
        let query = "SELECT registration from dna_parentage ORDER BY _id DESC LIMIT 1 "
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
