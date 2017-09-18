

//
//  AnimalsYear.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsYearData {

	var registration: String = "unset"
    var registration_str: String = "unset"
	var year_date: NSDate = NSDate.distantFuture() as NSDate
    var year_date_str: String = "unset"
	var weight: Int = -1
    var weight_str: String = "unset"
	var weight_adj: Int = -1
    var weight_adj_str: String = "unset"
	var weight_ratio: Double = -1.0
    var weight_ratio_str: String = "unset"
	var height: Double = -1.0
    var height_str: String = "unset"
	var scrotal_circumference: Int = -1
    var scrotal_circumference_str: String = "unset"
	var sheath_score: Int = -1
    var sheath_score_str: String = "unset"
	var navel_score: Int = -1
    var navel_score_str: String = "unset"
	var temper_score: Int = -1
    var temper_score_str: String = "unset"
	var management_code: Int = -1
    var management_code_str: String = "unset"
	var contemporary_group: Int = -1
    var contemporary_group_str: String = "unset"
	var frame_score: Double = -1.0
    var frame_score_str: String = "unset"
	
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

	func setYearDate(year_date: NSDate?) {
        self.year_date = year_date ?? NSDate.distantPast() as NSDate
        self.year_date_str = Utils.dateToString(self.year_date)
    }
    func getYearDate() -> NSDate {
        return self.year_date
    }
    func getYearDateType() -> String {
        return "NSDate"
    };
	func getYearDateStr() -> String {
        return year_date_str == "unset" || year_date_str == "0000-12-30 00:00:00 +0000" ? "" : year_date_str
    };
	func getYearDateStrPG() -> String {
        return year_date_str == "unset" || year_date_str == "0000-12-30 00:00:00 +0000" ? "" : year_date_str
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

	func setWeightAdj(weight_adj: Int?) {
        self.weight_adj = weight_adj ?? 0
        let weight_adj2 = weight_adj ?? 0
        self.weight_adj_str = String(weight_adj2)
        self.weight_adj_str = (self.weight_adj_str == "0") ? "" : self.weight_adj_str
    }
    func getWeightAdj() -> Int {
        return self.weight_adj
    }
    func getWeightAdjType() -> String {
        return "Int"
    };
	func getWeightAdjStr() -> String {
        return weight_adj_str
    };
	func getWeightAdjStrPG() -> String {
        return weight_adj_str
    };

	func setWeightRatio(weight_ratio: Double?) {
   	   self.weight_ratio = weight_ratio ?? 0.0
   	   self.weight_ratio_str = String(self.weight_ratio)
    }
    func getWeightRatio() -> Double {
        return self.weight_ratio
    }
    func getWeightRatioType() -> String {
        return "Double"
    };
	func getWeightRatioStr() -> String {
        return weight_ratio_str
    };
	func getWeightRatioStrPG() -> String {
        return weight_ratio_str
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

	func setScrotalCircumference(scrotal_circumference: Int?) {
        self.scrotal_circumference = scrotal_circumference ?? 0
        let scrotal_circumference2 = scrotal_circumference ?? 0
        self.scrotal_circumference_str = String(scrotal_circumference2)
        self.scrotal_circumference_str = (self.scrotal_circumference_str == "0") ? "" : self.scrotal_circumference_str
    }
    func getScrotalCircumference() -> Int {
        return self.scrotal_circumference
    }
    func getScrotalCircumferenceType() -> String {
        return "Int"
    };
	func getScrotalCircumferenceStr() -> String {
        return scrotal_circumference_str
    };
	func getScrotalCircumferenceStrPG() -> String {
        return scrotal_circumference_str
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

	func setManagementCode(management_code: Int?) {
        self.management_code = management_code ?? 0
        let management_code2 = management_code ?? 0
        self.management_code_str = String(management_code2)
        self.management_code_str = (self.management_code_str == "0") ? "" : self.management_code_str
    }
    func getManagementCode() -> Int {
        return self.management_code
    }
    func getManagementCodeType() -> String {
        return "Int"
    };
	func getManagementCodeStr() -> String {
        return management_code_str
    };
	func getManagementCodeStrPG() -> String {
        return management_code_str
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
			case "registration":
				return "String"
			case "year_date":
				return "NSDate"
			case "weight":
				return "Int"
			case "weight_adj":
				return "Int"
			case "weight_ratio":
				return "Double"
			case "height":
				return "Double"
			case "scrotal_circumference":
				return "Int"
			case "sheath_score":
				return "Int"
			case "navel_score":
				return "Int"
			case "temper_score":
				return "Int"
			case "management_code":
				return "Int"
			case "contemporary_group":
				return "Int"
			case "frame_score":
				return "Double"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "registration":
			return self.getRegistrationStr()
			case "year_date":
			return self.getYearDateStr()
			case "weight":
			return self.getWeightStr()
			case "weight_adj":
			return self.getWeightAdjStr()
			case "weight_ratio":
			return self.getWeightRatioStr()
			case "height":
			return self.getHeightStr()
			case "scrotal_circumference":
			return self.getScrotalCircumferenceStr()
			case "sheath_score":
			return self.getSheathScoreStr()
			case "navel_score":
			return self.getNavelScoreStr()
			case "temper_score":
			return self.getTemperScoreStr()
			case "management_code":
			return self.getManagementCodeStr()
			case "contemporary_group":
			return self.getContemporaryGroupStr()
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
        qb.selectFrom("animal_year")
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

				self.setRegistration((row["registration"]?.asString()));
				self.setYearDate((row["year_date"]?.asDate()));
				self.setWeight((row["weight"]?.asInt()));
				self.setWeightAdj((row["weight_adj"]?.asInt()));
				self.setWeightRatio((row["weight_ratio"]?.asDouble()));
				self.setHeight((row["height"]?.asDouble()));
				self.setScrotalCircumference((row["scrotal_circumference"]?.asInt()));
				self.setSheathScore((row["sheath_score"]?.asInt()));
				self.setNavelScore((row["navel_score"]?.asInt()));
				self.setTemperScore((row["temper_score"]?.asInt()));
				self.setManagementCode((row["management_code"]?.asInt()));
				self.setContemporaryGroup((row["contemporary_group"]?.asInt()));
				self.setFrameScore((row["frame_score"]?.asDouble()));

				
				fields["registration"] = self.getRegistrationStr()
				fields["year_date"] = self.getYearDateStr()
				fields["weight"] = self.getWeightStr()
				fields["weight_adj"] = self.getWeightAdjStr()
				fields["weight_ratio"] = self.getWeightRatioStr()
				fields["height"] = self.getHeightStr()
				fields["scrotal_circumference"] = self.getScrotalCircumferenceStr()
				fields["sheath_score"] = self.getSheathScoreStr()
				fields["navel_score"] = self.getNavelScoreStr()
				fields["temper_score"] = self.getTemperScoreStr()
				fields["management_code"] = self.getManagementCodeStr()
				fields["contemporary_group"] = self.getContemporaryGroupStr()
				fields["frame_score"] = self.getFrameScoreStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["registration"] = self.getRegistrationStr()
		fields["year_date"] = self.getYearDateStr()
		fields["weight"] = self.getWeightStr()
		fields["weight_adj"] = self.getWeightAdjStr()
		fields["weight_ratio"] = self.getWeightRatioStr()
		fields["height"] = self.getHeightStr()
		fields["scrotal_circumference"] = self.getScrotalCircumferenceStr()
		fields["sheath_score"] = self.getSheathScoreStr()
		fields["navel_score"] = self.getNavelScoreStr()
		fields["temper_score"] = self.getTemperScoreStr()
		fields["management_code"] = self.getManagementCodeStr()
		fields["contemporary_group"] = self.getContemporaryGroupStr()
		fields["frame_score"] = self.getFrameScoreStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["registration"] = self.getRegistrationStrPG()
		fields["year_date"] = self.getYearDateStrPG()
		fields["weight"] = self.getWeightStrPG()
		fields["weight_adj"] = self.getWeightAdjStrPG()
		fields["weight_ratio"] = self.getWeightRatioStrPG()
		fields["height"] = self.getHeightStrPG()
		fields["scrotal_circumference"] = self.getScrotalCircumferenceStrPG()
		fields["sheath_score"] = self.getSheathScoreStrPG()
		fields["navel_score"] = self.getNavelScoreStrPG()
		fields["temper_score"] = self.getTemperScoreStrPG()
		fields["management_code"] = self.getManagementCodeStrPG()
		fields["contemporary_group"] = self.getContemporaryGroupStrPG()
		fields["frame_score"] = self.getFrameScoreStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO animal_year ("
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

        var statement = "INSERT INTO animal_year ("
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

            var statement = "INSERT INTO animal_year ("

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

        var statement = "UPDATE animal_year "
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

        var statement = "UPDATE animal_year "
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
        let query = "DELETE FROM animal_year WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM animal_year WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastregistration() -> String {
        let registration: String = ""
        let query = "SELECT registration from animal_year ORDER BY _id DESC LIMIT 1 "
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
