

//
//  TblAnimalDataCarcass.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalDataCarcassData {

	var carcass_id: Int = -1
    var carcass_id_str: String = "unset"
	var animal_registration: String = "unset"
    var animal_registration_str: String = "unset"
	var carcass_tag: String = "unset"
    var carcass_tag_str: String = "unset"
	var animal_sire: String = "unset"
    var animal_sire_str: String = "unset"
	var birth_date: NSDate = NSDate.distantFuture() as NSDate
    var birth_date_str: String = "unset"
	var kill_date: NSDate = NSDate.distantFuture() as NSDate
    var kill_date_str: String = "unset"
	var contemporary_group: String = "unset"
    var contemporary_group_str: String = "unset"
	var animal_sex: String = "unset"
    var animal_sex_str: String = "unset"
	var cohort_group: String = "unset"
    var cohort_group_str: String = "unset"
	var hot_carcass_weight: Int = -1
    var hot_carcass_weight_str: String = "unset"
	var marbling_score: String = "unset"
    var marbling_score_str: String = "unset"
	var quality_grade: String = "unset"
    var quality_grade_str: String = "unset"
	var pyg: Double = -1.0
    var pyg_str: String = "unset"
	var fat_thickness: Double = -1.0
    var fat_thickness_str: String = "unset"
	var ribeye_area: Double = -1.0
    var ribeye_area_str: String = "unset"
	var kph: Int = -1
    var kph_str: String = "unset"
	var internal_fat: Double = -1.0
    var internal_fat_str: String = "unset"
	var yield_grade: Double = -1.0
    var yield_grade_str: String = "unset"
	var days_on_feed: Int = -1
    var days_on_feed_str: String = "unset"
	var create_user: String = "unset"
    var create_user_str: String = "unset"
	var create_date: NSDate = NSDate.distantFuture() as NSDate
    var create_date_str: String = "unset"
	
	func setCarcassId(carcass_id: Int?) {
        self.carcass_id = carcass_id ?? 0
        let carcass_id2 = carcass_id ?? 0
        self.carcass_id_str = String(carcass_id2)
        self.carcass_id_str = (self.carcass_id_str == "0") ? "" : self.carcass_id_str
    }
    func getCarcassId() -> Int {
        return self.carcass_id
    }
    func getCarcassIdType() -> String {
        return "Int"
    };
	func getCarcassIdStr() -> String {
        return carcass_id_str
    };
	func getCarcassIdStrPG() -> String {
        return carcass_id_str
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

	func setCarcassTag(carcass_tag: String?) {
        self.carcass_tag = carcass_tag ?? ""
        self.carcass_tag_str = String(self.carcass_tag)
    }
    func getCarcassTag() -> String {
        return self.carcass_tag
    }
    func getCarcassTagType() -> String {
        return "String"
    };
	func getCarcassTagStr() -> String {
        return carcass_tag_str == "unset" ? "" : carcass_tag_str
    };
	func getCarcassTagStrPG() -> String {
        return carcass_tag_str == "unset" ? "" : carcass_tag_str
    };

	func setAnimalSire(animal_sire: String?) {
        self.animal_sire = animal_sire ?? ""
        self.animal_sire_str = String(self.animal_sire)
    }
    func getAnimalSire() -> String {
        return self.animal_sire
    }
    func getAnimalSireType() -> String {
        return "String"
    };
	func getAnimalSireStr() -> String {
        return animal_sire_str == "unset" ? "" : animal_sire_str
    };
	func getAnimalSireStrPG() -> String {
        return animal_sire_str == "unset" ? "" : animal_sire_str
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

	func setKillDate(kill_date: NSDate?) {
        self.kill_date = kill_date ?? NSDate.distantPast() as NSDate
        self.kill_date_str = Utils.dateToString(self.kill_date)
    }
    func getKillDate() -> NSDate {
        return self.kill_date
    }
    func getKillDateType() -> String {
        return "NSDate"
    };
	func getKillDateStr() -> String {
        return kill_date_str == "unset" || kill_date_str == "0000-12-30 00:00:00 +0000" ? "" : kill_date_str
    };
	func getKillDateStrPG() -> String {
        return kill_date_str == "unset" || kill_date_str == "0000-12-30 00:00:00 +0000" ? "" : kill_date_str
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

	func setCohortGroup(cohort_group: String?) {
        self.cohort_group = cohort_group ?? ""
        self.cohort_group_str = String(self.cohort_group)
    }
    func getCohortGroup() -> String {
        return self.cohort_group
    }
    func getCohortGroupType() -> String {
        return "String"
    };
	func getCohortGroupStr() -> String {
        return cohort_group_str == "unset" ? "" : cohort_group_str
    };
	func getCohortGroupStrPG() -> String {
        return cohort_group_str == "unset" ? "" : cohort_group_str
    };

	func setHotCarcassWeight(hot_carcass_weight: Int?) {
        self.hot_carcass_weight = hot_carcass_weight ?? 0
        let hot_carcass_weight2 = hot_carcass_weight ?? 0
        self.hot_carcass_weight_str = String(hot_carcass_weight2)
        self.hot_carcass_weight_str = (self.hot_carcass_weight_str == "0") ? "" : self.hot_carcass_weight_str
    }
    func getHotCarcassWeight() -> Int {
        return self.hot_carcass_weight
    }
    func getHotCarcassWeightType() -> String {
        return "Int"
    };
	func getHotCarcassWeightStr() -> String {
        return hot_carcass_weight_str
    };
	func getHotCarcassWeightStrPG() -> String {
        return hot_carcass_weight_str
    };

	func setMarblingScore(marbling_score: String?) {
        self.marbling_score = marbling_score ?? ""
        self.marbling_score_str = String(self.marbling_score)
    }
    func getMarblingScore() -> String {
        return self.marbling_score
    }
    func getMarblingScoreType() -> String {
        return "String"
    };
	func getMarblingScoreStr() -> String {
        return marbling_score_str == "unset" ? "" : marbling_score_str
    };
	func getMarblingScoreStrPG() -> String {
        return marbling_score_str == "unset" ? "" : marbling_score_str
    };

	func setQualityGrade(quality_grade: String?) {
        self.quality_grade = quality_grade ?? ""
        self.quality_grade_str = String(self.quality_grade)
    }
    func getQualityGrade() -> String {
        return self.quality_grade
    }
    func getQualityGradeType() -> String {
        return "String"
    };
	func getQualityGradeStr() -> String {
        return quality_grade_str == "unset" ? "" : quality_grade_str
    };
	func getQualityGradeStrPG() -> String {
        return quality_grade_str == "unset" ? "" : quality_grade_str
    };

	func setPyg(pyg: Double?) {
   	   self.pyg = pyg ?? 0.0
   	   self.pyg_str = String(self.pyg)
    }
    func getPyg() -> Double {
        return self.pyg
    }
    func getPygType() -> String {
        return "Double"
    };
	func getPygStr() -> String {
        return pyg_str
    };
	func getPygStrPG() -> String {
        return pyg_str
    };

	func setFatThickness(fat_thickness: Double?) {
   	   self.fat_thickness = fat_thickness ?? 0.0
   	   self.fat_thickness_str = String(self.fat_thickness)
    }
    func getFatThickness() -> Double {
        return self.fat_thickness
    }
    func getFatThicknessType() -> String {
        return "Double"
    };
	func getFatThicknessStr() -> String {
        return fat_thickness_str
    };
	func getFatThicknessStrPG() -> String {
        return fat_thickness_str
    };

	func setRibeyeArea(ribeye_area: Double?) {
   	   self.ribeye_area = ribeye_area ?? 0.0
   	   self.ribeye_area_str = String(self.ribeye_area)
    }
    func getRibeyeArea() -> Double {
        return self.ribeye_area
    }
    func getRibeyeAreaType() -> String {
        return "Double"
    };
	func getRibeyeAreaStr() -> String {
        return ribeye_area_str
    };
	func getRibeyeAreaStrPG() -> String {
        return ribeye_area_str
    };

	func setKph(kph: Int?) {
        self.kph = kph ?? 0
        let kph2 = kph ?? 0
        self.kph_str = String(kph2)
        self.kph_str = (self.kph_str == "0") ? "" : self.kph_str
    }
    func getKph() -> Int {
        return self.kph
    }
    func getKphType() -> String {
        return "Int"
    };
	func getKphStr() -> String {
        return kph_str
    };
	func getKphStrPG() -> String {
        return kph_str
    };

	func setInternalFat(internal_fat: Double?) {
   	   self.internal_fat = internal_fat ?? 0.0
   	   self.internal_fat_str = String(self.internal_fat)
    }
    func getInternalFat() -> Double {
        return self.internal_fat
    }
    func getInternalFatType() -> String {
        return "Double"
    };
	func getInternalFatStr() -> String {
        return internal_fat_str
    };
	func getInternalFatStrPG() -> String {
        return internal_fat_str
    };

	func setYieldGrade(yield_grade: Double?) {
   	   self.yield_grade = yield_grade ?? 0.0
   	   self.yield_grade_str = String(self.yield_grade)
    }
    func getYieldGrade() -> Double {
        return self.yield_grade
    }
    func getYieldGradeType() -> String {
        return "Double"
    };
	func getYieldGradeStr() -> String {
        return yield_grade_str
    };
	func getYieldGradeStrPG() -> String {
        return yield_grade_str
    };

	func setDaysOnFeed(days_on_feed: Int?) {
        self.days_on_feed = days_on_feed ?? 0
        let days_on_feed2 = days_on_feed ?? 0
        self.days_on_feed_str = String(days_on_feed2)
        self.days_on_feed_str = (self.days_on_feed_str == "0") ? "" : self.days_on_feed_str
    }
    func getDaysOnFeed() -> Int {
        return self.days_on_feed
    }
    func getDaysOnFeedType() -> String {
        return "Int"
    };
	func getDaysOnFeedStr() -> String {
        return days_on_feed_str
    };
	func getDaysOnFeedStrPG() -> String {
        return days_on_feed_str
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

	func setCreateDate(create_date: NSDate?) {
        self.create_date = create_date ?? NSDate.distantPast() as NSDate
        self.create_date_str = Utils.dateToString(self.create_date)
    }
    func getCreateDate() -> NSDate {
        return self.create_date
    }
    func getCreateDateType() -> String {
        return "NSDate"
    };
	func getCreateDateStr() -> String {
        return create_date_str == "unset" || create_date_str == "0000-12-30 00:00:00 +0000" ? "" : create_date_str
    };
	func getCreateDateStrPG() -> String {
        return create_date_str == "unset" || create_date_str == "0000-12-30 00:00:00 +0000" ? "" : create_date_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "carcass_id":
				return "Int"
			case "animal_registration":
				return "String"
			case "carcass_tag":
				return "String"
			case "animal_sire":
				return "String"
			case "birth_date":
				return "NSDate"
			case "kill_date":
				return "NSDate"
			case "contemporary_group":
				return "String"
			case "animal_sex":
				return "String"
			case "cohort_group":
				return "String"
			case "hot_carcass_weight":
				return "Int"
			case "marbling_score":
				return "String"
			case "quality_grade":
				return "String"
			case "pyg":
				return "Double"
			case "fat_thickness":
				return "Double"
			case "ribeye_area":
				return "Double"
			case "kph":
				return "Int"
			case "internal_fat":
				return "Double"
			case "yield_grade":
				return "Double"
			case "days_on_feed":
				return "Int"
			case "create_user":
				return "String"
			case "create_date":
				return "NSDate"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "carcass_id":
			return self.getCarcassIdStr()
			case "animal_registration":
			return self.getAnimalRegistrationStr()
			case "carcass_tag":
			return self.getCarcassTagStr()
			case "animal_sire":
			return self.getAnimalSireStr()
			case "birth_date":
			return self.getBirthDateStr()
			case "kill_date":
			return self.getKillDateStr()
			case "contemporary_group":
			return self.getContemporaryGroupStr()
			case "animal_sex":
			return self.getAnimalSexStr()
			case "cohort_group":
			return self.getCohortGroupStr()
			case "hot_carcass_weight":
			return self.getHotCarcassWeightStr()
			case "marbling_score":
			return self.getMarblingScoreStr()
			case "quality_grade":
			return self.getQualityGradeStr()
			case "pyg":
			return self.getPygStr()
			case "fat_thickness":
			return self.getFatThicknessStr()
			case "ribeye_area":
			return self.getRibeyeAreaStr()
			case "kph":
			return self.getKphStr()
			case "internal_fat":
			return self.getInternalFatStr()
			case "yield_grade":
			return self.getYieldGradeStr()
			case "days_on_feed":
			return self.getDaysOnFeedStr()
			case "create_user":
			return self.getCreateUserStr()
			case "create_date":
			return self.getCreateDateStr()
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
        qb.selectFrom("tbl_animal_data_carcass")
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

				self.setCarcassId((row["carcass_id"]?.asInt()));
				self.setAnimalRegistration((row["animal_registration"]?.asString()));
				self.setCarcassTag((row["carcass_tag"]?.asString()));
				self.setAnimalSire((row["animal_sire"]?.asString()));
				self.setBirthDate((row["birth_date"]?.asDate()));
				self.setKillDate((row["kill_date"]?.asDate()));
				self.setContemporaryGroup((row["contemporary_group"]?.asString()));
				self.setAnimalSex((row["animal_sex"]?.asString()));
				self.setCohortGroup((row["cohort_group"]?.asString()));
				self.setHotCarcassWeight((row["hot_carcass_weight"]?.asInt()));
				self.setMarblingScore((row["marbling_score"]?.asString()));
				self.setQualityGrade((row["quality_grade"]?.asString()));
				self.setPyg((row["pyg"]?.asDouble()));
				self.setFatThickness((row["fat_thickness"]?.asDouble()));
				self.setRibeyeArea((row["ribeye_area"]?.asDouble()));
				self.setKph((row["kph"]?.asInt()));
				self.setInternalFat((row["internal_fat"]?.asDouble()));
				self.setYieldGrade((row["yield_grade"]?.asDouble()));
				self.setDaysOnFeed((row["days_on_feed"]?.asInt()));
				self.setCreateUser((row["create_user"]?.asString()));
				self.setCreateDate((row["create_date"]?.asDate()));

				var fields = [String: String]()
				fields["carcass_id"] = self.getCarcassIdStr()
				fields["animal_registration"] = self.getAnimalRegistrationStr()
				fields["carcass_tag"] = self.getCarcassTagStr()
				fields["animal_sire"] = self.getAnimalSireStr()
				fields["birth_date"] = self.getBirthDateStr()
				fields["kill_date"] = self.getKillDateStr()
				fields["contemporary_group"] = self.getContemporaryGroupStr()
				fields["animal_sex"] = self.getAnimalSexStr()
				fields["cohort_group"] = self.getCohortGroupStr()
				fields["hot_carcass_weight"] = self.getHotCarcassWeightStr()
				fields["marbling_score"] = self.getMarblingScoreStr()
				fields["quality_grade"] = self.getQualityGradeStr()
				fields["pyg"] = self.getPygStr()
				fields["fat_thickness"] = self.getFatThicknessStr()
				fields["ribeye_area"] = self.getRibeyeAreaStr()
				fields["kph"] = self.getKphStr()
				fields["internal_fat"] = self.getInternalFatStr()
				fields["yield_grade"] = self.getYieldGradeStr()
				fields["days_on_feed"] = self.getDaysOnFeedStr()
				fields["create_user"] = self.getCreateUserStr()
				fields["create_date"] = self.getCreateDateStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["carcass_id"] = self.getCarcassIdStr()
		fields["animal_registration"] = self.getAnimalRegistrationStr()
		fields["carcass_tag"] = self.getCarcassTagStr()
		fields["animal_sire"] = self.getAnimalSireStr()
		fields["birth_date"] = self.getBirthDateStr()
		fields["kill_date"] = self.getKillDateStr()
		fields["contemporary_group"] = self.getContemporaryGroupStr()
		fields["animal_sex"] = self.getAnimalSexStr()
		fields["cohort_group"] = self.getCohortGroupStr()
		fields["hot_carcass_weight"] = self.getHotCarcassWeightStr()
		fields["marbling_score"] = self.getMarblingScoreStr()
		fields["quality_grade"] = self.getQualityGradeStr()
		fields["pyg"] = self.getPygStr()
		fields["fat_thickness"] = self.getFatThicknessStr()
		fields["ribeye_area"] = self.getRibeyeAreaStr()
		fields["kph"] = self.getKphStr()
		fields["internal_fat"] = self.getInternalFatStr()
		fields["yield_grade"] = self.getYieldGradeStr()
		fields["days_on_feed"] = self.getDaysOnFeedStr()
		fields["create_user"] = self.getCreateUserStr()
		fields["create_date"] = self.getCreateDateStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["carcass_id"] = self.getCarcassIdStrPG()
		fields["animal_registration"] = self.getAnimalRegistrationStrPG()
		fields["carcass_tag"] = self.getCarcassTagStrPG()
		fields["animal_sire"] = self.getAnimalSireStrPG()
		fields["birth_date"] = self.getBirthDateStrPG()
		fields["kill_date"] = self.getKillDateStrPG()
		fields["contemporary_group"] = self.getContemporaryGroupStrPG()
		fields["animal_sex"] = self.getAnimalSexStrPG()
		fields["cohort_group"] = self.getCohortGroupStrPG()
		fields["hot_carcass_weight"] = self.getHotCarcassWeightStrPG()
		fields["marbling_score"] = self.getMarblingScoreStrPG()
		fields["quality_grade"] = self.getQualityGradeStrPG()
		fields["pyg"] = self.getPygStrPG()
		fields["fat_thickness"] = self.getFatThicknessStrPG()
		fields["ribeye_area"] = self.getRibeyeAreaStrPG()
		fields["kph"] = self.getKphStrPG()
		fields["internal_fat"] = self.getInternalFatStrPG()
		fields["yield_grade"] = self.getYieldGradeStrPG()
		fields["days_on_feed"] = self.getDaysOnFeedStrPG()
		fields["create_user"] = self.getCreateUserStrPG()
		fields["create_date"] = self.getCreateDateStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_animal_data_carcass ("
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

        var statement = "INSERT INTO tbl_animal_data_carcass ("
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

            var statement = "INSERT INTO tbl_animal_data_carcass ("

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

        var statement = "UPDATE tbl_animal_data_carcass "
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

        var statement = "UPDATE tbl_animal_data_carcass "
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
        let query = "DELETE FROM tbl_animal_data_carcass WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM tbl_animal_data_carcass WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastanimalRegistration() -> String {
        let animal_registration: String = ""
        let query = "SELECT animal_registration from tbl_animal_data_carcass ORDER BY _id DESC LIMIT 1 "
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
