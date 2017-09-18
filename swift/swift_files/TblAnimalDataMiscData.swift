

//
//  TblAnimalDataMisc.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalDataMiscData {

	var _id: Int = -1
    var _id_str: String = "unset"
	var animal_registration: String = "unset"
    var animal_registration_str: String = "unset"
	var weight: Int = -1
    var weight_str: String = "unset"
	var measurement_date: NSDate = NSDate.distantFuture() as NSDate
    var measurement_date_str: String = "unset"
	var rump_fat: Double = -1.0
    var rump_fat_str: String = "unset"
	var body_condition_score: Int = -1
    var body_condition_score_str: String = "unset"
	var measurement_type: String = "unset"
    var measurement_type_str: String = "unset"
	var measurement_diameter: Double = -1.0
    var measurement_diameter_str: String = "unset"
	var days_bred: String = "unset"
    var days_bred_str: String = "unset"
	
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

	func setMeasurementType(measurement_type: String?) {
        self.measurement_type = measurement_type ?? ""
        self.measurement_type_str = String(self.measurement_type)
    }
    func getMeasurementType() -> String {
        return self.measurement_type
    }
    func getMeasurementTypeType() -> String {
        return "String"
    };
	func getMeasurementTypeStr() -> String {
        return measurement_type_str == "unset" ? "" : measurement_type_str
    };
	func getMeasurementTypeStrPG() -> String {
        return measurement_type_str == "unset" ? "" : measurement_type_str
    };

	func setMeasurementDiameter(measurement_diameter: Double?) {
   	   self.measurement_diameter = measurement_diameter ?? 0.0
   	   self.measurement_diameter_str = String(self.measurement_diameter)
    }
    func getMeasurementDiameter() -> Double {
        return self.measurement_diameter
    }
    func getMeasurementDiameterType() -> String {
        return "Double"
    };
	func getMeasurementDiameterStr() -> String {
        return measurement_diameter_str
    };
	func getMeasurementDiameterStrPG() -> String {
        return measurement_diameter_str
    };

	func setDaysBred(days_bred: String?) {
        self.days_bred = days_bred ?? ""
        self.days_bred_str = String(self.days_bred)
    }
    func getDaysBred() -> String {
        return self.days_bred
    }
    func getDaysBredType() -> String {
        return "String"
    };
	func getDaysBredStr() -> String {
        return days_bred_str == "unset" ? "" : days_bred_str
    };
	func getDaysBredStrPG() -> String {
        return days_bred_str == "unset" ? "" : days_bred_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "_id":
				return "Int"
			case "animal_registration":
				return "String"
			case "weight":
				return "Int"
			case "measurement_date":
				return "NSDate"
			case "rump_fat":
				return "Double"
			case "body_condition_score":
				return "Int"
			case "measurement_type":
				return "String"
			case "measurement_diameter":
				return "Double"
			case "days_bred":
				return "String"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "_id":
			return self.getIdStr()
			case "animal_registration":
			return self.getAnimalRegistrationStr()
			case "weight":
			return self.getWeightStr()
			case "measurement_date":
			return self.getMeasurementDateStr()
			case "rump_fat":
			return self.getRumpFatStr()
			case "body_condition_score":
			return self.getBodyConditionScoreStr()
			case "measurement_type":
			return self.getMeasurementTypeStr()
			case "measurement_diameter":
			return self.getMeasurementDiameterStr()
			case "days_bred":
			return self.getDaysBredStr()
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
        qb.selectFrom("tbl_animal_data_misc")
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

				self.setId((row["_id"]?.asInt()));
				self.setAnimalRegistration((row["animal_registration"]?.asString()));
				self.setWeight((row["weight"]?.asInt()));
				self.setMeasurementDate((row["measurement_date"]?.asDate()));
				self.setRumpFat((row["rump_fat"]?.asDouble()));
				self.setBodyConditionScore((row["body_condition_score"]?.asInt()));
				self.setMeasurementType((row["measurement_type"]?.asString()));
				self.setMeasurementDiameter((row["measurement_diameter"]?.asDouble()));
				self.setDaysBred((row["days_bred"]?.asString()));

				var fields = [String: String]()
				fields["_id"] = self.getIdStr()
				fields["animal_registration"] = self.getAnimalRegistrationStr()
				fields["weight"] = self.getWeightStr()
				fields["measurement_date"] = self.getMeasurementDateStr()
				fields["rump_fat"] = self.getRumpFatStr()
				fields["body_condition_score"] = self.getBodyConditionScoreStr()
				fields["measurement_type"] = self.getMeasurementTypeStr()
				fields["measurement_diameter"] = self.getMeasurementDiameterStr()
				fields["days_bred"] = self.getDaysBredStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["_id"] = self.getIdStr()
		fields["animal_registration"] = self.getAnimalRegistrationStr()
		fields["weight"] = self.getWeightStr()
		fields["measurement_date"] = self.getMeasurementDateStr()
		fields["rump_fat"] = self.getRumpFatStr()
		fields["body_condition_score"] = self.getBodyConditionScoreStr()
		fields["measurement_type"] = self.getMeasurementTypeStr()
		fields["measurement_diameter"] = self.getMeasurementDiameterStr()
		fields["days_bred"] = self.getDaysBredStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["_id"] = self.getIdStrPG()
		fields["animal_registration"] = self.getAnimalRegistrationStrPG()
		fields["weight"] = self.getWeightStrPG()
		fields["measurement_date"] = self.getMeasurementDateStrPG()
		fields["rump_fat"] = self.getRumpFatStrPG()
		fields["body_condition_score"] = self.getBodyConditionScoreStrPG()
		fields["measurement_type"] = self.getMeasurementTypeStrPG()
		fields["measurement_diameter"] = self.getMeasurementDiameterStrPG()
		fields["days_bred"] = self.getDaysBredStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_animal_data_misc ("
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

        var statement = "INSERT INTO tbl_animal_data_misc ("
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

            var statement = "INSERT INTO tbl_animal_data_misc ("

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

        var statement = "UPDATE tbl_animal_data_misc "
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

        var statement = "UPDATE tbl_animal_data_misc "
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
        let query = "DELETE FROM tbl_animal_data_misc WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM tbl_animal_data_misc WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastanimalRegistration() -> String {
        let animal_registration: String = ""
        let query = "SELECT animal_registration from tbl_animal_data_misc ORDER BY _id DESC LIMIT 1 "
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
