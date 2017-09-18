//
//  AnimalsCarcass.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsCarcassData {
    
   	var _id: Int = -1
    var _id_str: String = "unset"
   	var registration: String = "unset"
    var registration_str: String = "unset"
   	var carcass_date: NSDate = NSDate.distantFuture() as NSDate
    var carcass_date_str: String = "unset"
   	var weight: Int = -1
    var weight_str: String = "unset"
   	var carcass_number: String = "unset"
    var carcass_number_str: String = "unset"
   	var grade_date: NSDate = NSDate.distantFuture() as NSDate
    var grade_date_str: String = "unset"
   	var fat_thickness: Double = -1.0
    var fat_thickness_str: String = "unset"
   	var ribeye_area: Double = -1.0
    var ribeye_area_str: String = "unset"
   	var kph_fat: Double = -1.0
    var kph_fat_str: String = "unset"
   	var marbling_score: Double = -1.0
    var marbling_score_str: String = "unset"
   	var quality_grade: String = "unset"
    var quality_grade_str: String = "unset"
   	var yield_grade: String = "unset"
    var yield_grade_str: String = "unset"
   	var muscle_depth: String = "unset"
    var muscle_depth_str: String = "unset"
   	var carcass_color: String = "unset"
    var carcass_color_str: String = "unset"
   	var group_pen: String = "unset"
    var group_pen_str: String = "unset"
   	var contemporary_group: Int = -1
    var contemporary_group_str: String = "unset"
    
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
        return _id_str == "unset" ? "" : _id_str
    };
   	func getIdStrPG() -> String {
        return _id_str == "unset" ? "" : _id_str
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
    
   	func setCarcassDate(carcass_date: NSDate?) {
        self.carcass_date = carcass_date ?? NSDate.distantPast() as NSDate
        self.carcass_date_str = Utils.dateToString(self.carcass_date)
    }
    func getCarcassDate() -> NSDate {
        return self.carcass_date
    }
    func getCarcassDateType() -> String {
        return "NSDate"
    };
   	func getCarcassDateStr() -> String {
        return carcass_date_str == "unset" || carcass_date_str == "0000-12-30 00:00:00 +0000" ? "" : carcass_date_str
    };
   	func getCarcassDateStrPG() -> String {
        return carcass_date_str == "unset" || carcass_date_str == "0000-12-30 00:00:00 +0000" ? "" : carcass_date_str
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
        return weight_str == "unset" ? "" : weight_str
    };
   	func getWeightStrPG() -> String {
        return weight_str == "unset" ? "" : weight_str
    };
    
   	func setCarcassNumber(carcass_number: String?) {
        self.carcass_number = carcass_number ?? ""
        self.carcass_number_str = String(self.carcass_number)
    }
    func getCarcassNumber() -> String {
        return self.carcass_number
    }
    func getCarcassNumberType() -> String {
        return "String"
    };
   	func getCarcassNumberStr() -> String {
        return carcass_number_str == "unset" ? "" : carcass_number_str
    };
   	func getCarcassNumberStrPG() -> String {
        return carcass_number_str == "unset" ? "" : carcass_number_str
    };
    
   	func setGradeDate(grade_date: NSDate?) {
        self.grade_date = grade_date ?? NSDate.distantPast() as NSDate
        self.grade_date_str = Utils.dateToString(self.grade_date)
    }
    func getGradeDate() -> NSDate {
        return self.grade_date
    }
    func getGradeDateType() -> String {
        return "NSDate"
    };
   	func getGradeDateStr() -> String {
        return grade_date_str == "unset" || grade_date_str == "0000-12-30 00:00:00 +0000" ? "" : grade_date_str
    };
   	func getGradeDateStrPG() -> String {
        return grade_date_str == "unset" || grade_date_str == "0000-12-30 00:00:00 +0000" ? "" : grade_date_str
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
        return fat_thickness_str == "unset" ? "" : fat_thickness_str
    };
   	func getFatThicknessStrPG() -> String {
        return fat_thickness_str == "unset" ? "" : fat_thickness_str
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
        return ribeye_area_str == "unset" ? "" : ribeye_area_str
    };
   	func getRibeyeAreaStrPG() -> String {
        return ribeye_area_str == "unset" ? "" : ribeye_area_str
    };
    
   	func setKphFat(kph_fat: Double?) {
        self.kph_fat = kph_fat ?? 0.0
        self.kph_fat_str = String(self.kph_fat)
    }
    func getKphFat() -> Double {
        return self.kph_fat
    }
    func getKphFatType() -> String {
        return "Double"
    };
   	func getKphFatStr() -> String {
        return kph_fat_str == "unset" ? "" : kph_fat_str
    };
   	func getKphFatStrPG() -> String {
        return kph_fat_str == "unset" ? "" : kph_fat_str
    };
    
   	func setMarblingScore(marbling_score: Double?) {
        self.marbling_score = marbling_score ?? 0.0
        self.marbling_score_str = String(self.marbling_score)
    }
    func getMarblingScore() -> Double {
        return self.marbling_score
    }
    func getMarblingScoreType() -> String {
        return "Double"
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
    
   	func setYieldGrade(yield_grade: String?) {
        self.yield_grade = yield_grade ?? ""
        self.yield_grade_str = String(self.yield_grade)
    }
    func getYieldGrade() -> String {
        return self.yield_grade
    }
    func getYieldGradeType() -> String {
        return "String"
    };
   	func getYieldGradeStr() -> String {
        return yield_grade_str == "unset" ? "" : yield_grade_str
    };
   	func getYieldGradeStrPG() -> String {
        return yield_grade_str == "unset" ? "" : yield_grade_str
    };
    
   	func setMuscleDepth(muscle_depth: String?) {
        self.muscle_depth = muscle_depth ?? ""
        self.muscle_depth_str = String(self.muscle_depth)
    }
    func getMuscleDepth() -> String {
        return self.muscle_depth
    }
    func getMuscleDepthType() -> String {
        return "String"
    };
   	func getMuscleDepthStr() -> String {
        return muscle_depth_str == "unset" ? "" : muscle_depth_str
    };
   	func getMuscleDepthStrPG() -> String {
        return muscle_depth_str == "unset" ? "" : muscle_depth_str
    };
    
   	func setCarcassColor(carcass_color: String?) {
        self.carcass_color = carcass_color ?? ""
        self.carcass_color_str = String(self.carcass_color)
    }
    func getCarcassColor() -> String {
        return self.carcass_color
    }
    func getCarcassColorType() -> String {
        return "String"
    };
   	func getCarcassColorStr() -> String {
        return carcass_color_str == "unset" ? "" : carcass_color_str
    };
   	func getCarcassColorStrPG() -> String {
        return carcass_color_str == "unset" ? "" : carcass_color_str
    };
    
   	func setGroupPen(group_pen: String?) {
        self.group_pen = group_pen ?? ""
        self.group_pen_str = String(self.group_pen)
    }
    func getGroupPen() -> String {
        return self.group_pen
    }
    func getGroupPenType() -> String {
        return "String"
    };
   	func getGroupPenStr() -> String {
        return group_pen_str == "unset" ? "" : group_pen_str
    };
   	func getGroupPenStrPG() -> String {
        return group_pen_str == "unset" ? "" : group_pen_str
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
        return contemporary_group_str == "unset" ? "" : contemporary_group_str
    };
   	func getContemporaryGroupStrPG() -> String {
        return contemporary_group_str == "unset" ? "" : contemporary_group_str
    };
    
   	func getFieldType(field: String) -> String {
        switch field {
        case "_id":
            return "Int"
        case "registration":
            return "String"
        case "carcass_date":
            return "NSDate"
        case "weight":
            return "Int"
        case "carcass_number":
            return "String"
        case "grade_date":
            return "NSDate"
        case "fat_thickness":
            return "Double"
        case "ribeye_area":
            return "Double"
        case "kph_fat":
            return "Double"
        case "marbling_score":
            return "Double"
        case "quality_grade":
            return "String"
        case "yield_grade":
            return "String"
        case "muscle_depth":
            return "String"
        case "carcass_color":
            return "String"
        case "group_pen":
            return "String"
        case "contemporary_group":
            return "Int"
        default:
            return "String"
            break;
        }
        return "String"
   	}
    
   	func getFieldString(field: String) -> String {
        switch field {
        case "_id":
            return self.getIdStr()
        case "registration":
            return self.getRegistrationStr()
        case "carcass_date":
            return self.getCarcassDateStr()
        case "weight":
            return self.getWeightStr()
        case "carcass_number":
            return self.getCarcassNumberStr()
        case "grade_date":
            return self.getGradeDateStr()
        case "fat_thickness":
            return self.getFatThicknessStr()
        case "ribeye_area":
            return self.getRibeyeAreaStr()
        case "kph_fat":
            return self.getKphFatStr()
        case "marbling_score":
            return self.getMarblingScoreStr()
        case "quality_grade":
            return self.getQualityGradeStr()
        case "yield_grade":
            return self.getYieldGradeStr()
        case "muscle_depth":
            return self.getMuscleDepthStr()
        case "carcass_color":
            return self.getCarcassColorStr()
        case "group_pen":
            return self.getGroupPenStr()
        case "contemporary_group":
            return self.getContemporaryGroupStr()
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
        qb.selectFrom("animal_carcass")
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
                self.setRegistration((row["registration"]?.asString()));
                self.setCarcassDate((row["carcass_date"]?.asDate()));
                self.setWeight((row["weight"]?.asInt()));
                self.setCarcassNumber((row["carcass_number"]?.asString()));
                self.setGradeDate((row["grade_date"]?.asDate()));
                self.setFatThickness((row["fat_thickness"]?.asDouble()));
                self.setRibeyeArea((row["ribeye_area"]?.asDouble()));
                self.setKphFat((row["kph_fat"]?.asDouble()));
                self.setMarblingScore((row["marbling_score"]?.asDouble()));
                self.setQualityGrade((row["quality_grade"]?.asString()));
                self.setYieldGrade((row["yield_grade"]?.asString()));
                self.setMuscleDepth((row["muscle_depth"]?.asString()));
                self.setCarcassColor((row["carcass_color"]?.asString()));
                self.setGroupPen((row["group_pen"]?.asString()));
                self.setContemporaryGroup((row["contemporary_group"]?.asInt()));
                
                
                fields["_id"] = self.getIdStr()
                fields["registration"] = self.getRegistrationStr()
                fields["carcass_date"] = self.getCarcassDateStr()
                fields["weight"] = self.getWeightStr()
                fields["carcass_number"] = self.getCarcassNumberStr()
                fields["grade_date"] = self.getGradeDateStr()
                fields["fat_thickness"] = self.getFatThicknessStr()
                fields["ribeye_area"] = self.getRibeyeAreaStr()
                fields["kph_fat"] = self.getKphFatStr()
                fields["marbling_score"] = self.getMarblingScoreStr()
                fields["quality_grade"] = self.getQualityGradeStr()
                fields["yield_grade"] = self.getYieldGradeStr()
                fields["muscle_depth"] = self.getMuscleDepthStr()
                fields["carcass_color"] = self.getCarcassColorStr()
                fields["group_pen"] = self.getGroupPenStr()
                fields["contemporary_group"] = self.getContemporaryGroupStr()
                
                return fields
            }
        }
        return fields
    }
    
    func getFields() -> [String: String] {
        
        var fields = [String: String]()
        fields["_id"] = self.getIdStr()
        fields["registration"] = self.getRegistrationStr()
        fields["carcass_date"] = self.getCarcassDateStr()
        fields["weight"] = self.getWeightStr()
        fields["carcass_number"] = self.getCarcassNumberStr()
        fields["grade_date"] = self.getGradeDateStr()
        fields["fat_thickness"] = self.getFatThicknessStr()
        fields["ribeye_area"] = self.getRibeyeAreaStr()
        fields["kph_fat"] = self.getKphFatStr()
        fields["marbling_score"] = self.getMarblingScoreStr()
        fields["quality_grade"] = self.getQualityGradeStr()
        fields["yield_grade"] = self.getYieldGradeStr()
        fields["muscle_depth"] = self.getMuscleDepthStr()
        fields["carcass_color"] = self.getCarcassColorStr()
        fields["group_pen"] = self.getGroupPenStr()
        fields["contemporary_group"] = self.getContemporaryGroupStr()
        return fields
    }
    
    func getFieldsPG() -> [String: String] {
        
        var fields = [String: String]()
        
        
        fields["_id"] = self.getIdStrPG()
        fields["registration"] = self.getRegistrationStrPG()
        fields["carcass_date"] = self.getCarcassDateStrPG()
        fields["weight"] = self.getWeightStrPG()
        fields["carcass_number"] = self.getCarcassNumberStrPG()
        fields["grade_date"] = self.getGradeDateStrPG()
        fields["fat_thickness"] = self.getFatThicknessStrPG()
        fields["ribeye_area"] = self.getRibeyeAreaStrPG()
        fields["kph_fat"] = self.getKphFatStrPG()
        fields["marbling_score"] = self.getMarblingScoreStrPG()
        fields["quality_grade"] = self.getQualityGradeStrPG()
        fields["yield_grade"] = self.getYieldGradeStrPG()
        fields["muscle_depth"] = self.getMuscleDepthStrPG()
        fields["carcass_color"] = self.getCarcassColorStrPG()
        fields["group_pen"] = self.getGroupPenStrPG()
        fields["contemporary_group"] = self.getContemporaryGroupStrPG()
        return fields    }
    
    func addNew() {
        
        var statement = "INSERT INTO animal_carcass ("
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
        
        var statement = "INSERT INTO animal_carcass ("
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
            
            var statement = "INSERT INTO animal_carcass ("
            
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
        return ret_str == "unset" ? "" : ret_str
    }
    
    func update(forID: String) {
        
        // get all field/values as string values
        var fields = self.getFields()
        
        var statement = "UPDATE animal_carcass "
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
        
        var statement = "UPDATE animal_carcass "
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
        let query = "DELETE FROM animal_carcass WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }
    
    
    func deletePG(forID: String) {
        
        let statement = "DELETE FROM animal_carcass WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    class func getLastregistration() -> String {
        let registration: String = ""
        let query = "SELECT registration from animal_carcass ORDER BY _id DESC LIMIT 1 "
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
