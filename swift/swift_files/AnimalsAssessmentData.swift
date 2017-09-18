//
//  AnimalsAssessment.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsAssessmentData {
    
   	var _id: Int = -1
    var _id_str: String = "unset"
   	var registration: String = "unset"
    var registration_str: String = "unset"
   	var member_id: String = "unset"
    var member_id_str: String = "unset"
   	var assessment_date: NSDate = NSDate.distantFuture() as NSDate
    var assessment_date_str: String = "unset"
   	var assessment_year: Int = -1
    var assessment_year_str: String = "unset"
   	var assessment_season: String = "unset"
    var assessment_season_str: String = "unset"
   	var work_order: Int = -1
    var work_order_str: String = "unset"
   	var sex: String = "unset"
    var sex_str: String = "unset"
   	var calf: String = "unset"
    var calf_str: String = "unset"
   	var calf_birth_date: NSDate = NSDate.distantFuture() as NSDate
    var calf_birth_date_str: String = "unset"
   	var is_canceled: Int = -1
    var is_canceled_str: String = "unset"
    
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
    
   	func setAssessmentDate(assessment_date: NSDate?) {
        self.assessment_date = assessment_date ?? NSDate.distantPast() as NSDate
        self.assessment_date_str = Utils.dateToString(self.assessment_date)
    }
    func getAssessmentDate() -> NSDate {
        return self.assessment_date
    }
    func getAssessmentDateType() -> String {
        return "NSDate"
    };
   	func getAssessmentDateStr() -> String {
        return assessment_date_str == "unset" || assessment_date_str == "0000-12-30 00:00:00 +0000" ? "" : assessment_date_str
    };
   	func getAssessmentDateStrPG() -> String {
        return assessment_date_str == "unset" || assessment_date_str == "0000-12-30 00:00:00 +0000" ? "" : assessment_date_str
    };
    
   	func setAssessmentYear(assessment_year: Int?) {
        self.assessment_year = assessment_year ?? 0
        let assessment_year2 = assessment_year ?? 0
        self.assessment_year_str = String(assessment_year2)
        self.assessment_year_str = (self.assessment_year_str == "0") ? "" : self.assessment_year_str
    }
    func getAssessmentYear() -> Int {
        return self.assessment_year
    }
    func getAssessmentYearType() -> String {
        return "Int"
    };
   	func getAssessmentYearStr() -> String {
        return assessment_year_str == "unset" ? "" : assessment_year_str
    };
   	func getAssessmentYearStrPG() -> String {
        return assessment_year_str == "unset" ? "" : assessment_year_str
    };
    
   	func setAssessmentSeason(assessment_season: String?) {
        self.assessment_season = assessment_season ?? ""
        self.assessment_season_str = String(self.assessment_season)
    }
    func getAssessmentSeason() -> String {
        return self.assessment_season
    }
    func getAssessmentSeasonType() -> String {
        return "String"
    };
   	func getAssessmentSeasonStr() -> String {
        return assessment_season_str == "unset" ? "" : assessment_season_str
    };
   	func getAssessmentSeasonStrPG() -> String {
        return assessment_season_str == "unset" ? "" : assessment_season_str
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
        return work_order_str == "unset" ? "" : work_order_str
    };
   	func getWorkOrderStrPG() -> String {
        return work_order_str == "unset" ? "" : work_order_str
    };
    
   	func setSex(sex: String?) {
        self.sex = sex ?? ""
        self.sex_str = String(self.sex)
    }
    func getSex() -> String {
        return self.sex
    }
    func getSexType() -> String {
        return "String"
    };
   	func getSexStr() -> String {
        return sex_str == "unset" ? "" : sex_str
    };
   	func getSexStrPG() -> String {
        return sex_str == "unset" ? "" : sex_str
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
    
   	func setCalfBirthDate(calf_birth_date: NSDate?) {
        self.calf_birth_date = calf_birth_date ?? NSDate.distantPast() as NSDate
        self.calf_birth_date_str = Utils.dateToString(self.calf_birth_date)
    }
    func getCalfBirthDate() -> NSDate {
        return self.calf_birth_date
    }
    func getCalfBirthDateType() -> String {
        return "NSDate"
    };
   	func getCalfBirthDateStr() -> String {
        return calf_birth_date_str == "unset" || calf_birth_date_str == "0000-12-30 00:00:00 +0000" ? "" : calf_birth_date_str
    };
   	func getCalfBirthDateStrPG() -> String {
        return calf_birth_date_str == "unset" || calf_birth_date_str == "0000-12-30 00:00:00 +0000" ? "" : calf_birth_date_str
    };
    
   	func setIsCanceled(is_canceled: Int?) {
        self.is_canceled = is_canceled ?? 0
        self.is_canceled_str = ((self.is_canceled) == 1) ? "t" : "f"
    }
    func getIsCanceled() -> Int {
        return self.is_canceled
    }
    func getIsCanceledType() -> String {
        return "Int"
    };
   	func getIsCanceledStr() -> String {
        return String(is_canceled)
    };
   	func getIsCanceledStrPG() -> String {
        return is_canceled_str == "unset" ? "" : is_canceled_str
    };
    
   	func getFieldType(field: String) -> String {
        switch field {
        case "_id":
            return "Int"
        case "registration":
            return "String"
        case "member_id":
            return "String"
        case "assessment_date":
            return "NSDate"
        case "assessment_year":
            return "Int"
        case "assessment_season":
            return "String"
        case "work_order":
            return "Int"
        case "sex":
            return "String"
        case "calf":
            return "String"
        case "calf_birth_date":
            return "NSDate"
        case "is_canceled":
            return "Int"
        default:
            return "String"
            break;
        }
        return "String"
   	}
    
   	func getFieldString(field: String) -> String {
        switch field {
        case "assessment_id":
            return self.getIdStr()
        case "registration":
            return self.getRegistrationStr()
        case "member_id":
            return self.getMemberIdStr()
        case "assessment_date":
            return self.getAssessmentDateStr()
        case "assessment_year":
            return self.getAssessmentYearStr()
        case "assessment_season":
            return self.getAssessmentSeasonStr()
        case "work_order":
            return self.getWorkOrderStr()
        case "sex":
            return self.getSexStr()
        case "calf":
            return self.getCalfStr()
        case "calf_birth_date":
            return self.getCalfBirthDateStr()
        case "is_canceled":
            return self.getIsCanceledStr()
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
        qb.selectFrom("animal_assessment")
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
                self.setMemberId((row["member_id"]?.asString()));
                self.setAssessmentDate((row["assessment_date"]?.asDate()));
                self.setAssessmentYear((row["assessment_year"]?.asInt()));
                self.setAssessmentSeason((row["assessment_season"]?.asString()));
                self.setWorkOrder((row["work_order"]?.asInt()));
                self.setSex((row["sex"]?.asString()));
                self.setCalf((row["calf"]?.asString()));
                self.setCalfBirthDate((row["calf_birth_date"]?.asDate()));
                self.setIsCanceled((row["is_canceled"]?.asMyBool()));
                
                
                fields["_id"] = self.getIdStr()
                fields["registration"] = self.getRegistrationStr()
                fields["member_id"] = self.getMemberIdStr()
                fields["assessment_date"] = self.getAssessmentDateStr()
                fields["assessment_year"] = self.getAssessmentYearStr()
                fields["assessment_season"] = self.getAssessmentSeasonStr()
                fields["work_order"] = self.getWorkOrderStr()
                fields["sex"] = self.getSexStr()
                fields["calf"] = self.getCalfStr()
                fields["calf_birth_date"] = self.getCalfBirthDateStr()
                fields["is_canceled"] = self.getIsCanceledStr()
                
                return fields
            }
        }
        return fields
    }
    
    func getFields() -> [String: String] {
        
        var fields = [String: String]()
        fields["_id"] = self.getIdStr()
        fields["registration"] = self.getRegistrationStr()
        fields["member_id"] = self.getMemberIdStr()
        fields["assessment_date"] = self.getAssessmentDateStr()
        fields["assessment_year"] = self.getAssessmentYearStr()
        fields["assessment_season"] = self.getAssessmentSeasonStr()
        fields["work_order"] = self.getWorkOrderStr()
        fields["sex"] = self.getSexStr()
        fields["calf"] = self.getCalfStr()
        fields["calf_birth_date"] = self.getCalfBirthDateStr()
        fields["is_canceled"] = self.getIsCanceledStr()
        return fields
    }
    
    func getFieldsPG() -> [String: String] {
        
        var fields = [String: String]()
        
        
        fields["_id"] = self.getIdStrPG()
        fields["registration"] = self.getRegistrationStrPG()
        fields["member_id"] = self.getMemberIdStrPG()
        fields["assessment_date"] = self.getAssessmentDateStrPG()
        fields["assessment_year"] = self.getAssessmentYearStrPG()
        fields["assessment_season"] = self.getAssessmentSeasonStrPG()
        fields["work_order"] = self.getWorkOrderStrPG()
        fields["sex"] = self.getSexStrPG()
        fields["calf"] = self.getCalfStrPG()
        fields["calf_birth_date"] = self.getCalfBirthDateStrPG()
        fields["is_canceled"] = self.getIsCanceledStrPG()
        return fields    }
    
    func addNew() {
        
        var statement = "INSERT INTO animal_assessment ("
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
        
        var statement = "INSERT INTO animal_assessment ("
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
            
            var statement = "INSERT INTO animal_assessment ("
            
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
        
        var statement = "UPDATE animal_assessment "
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
        
        var statement = "UPDATE animal_assessment "
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
        let query = "DELETE FROM animal_assessment WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }
    
    
    func deletePG(forID: String) {
        
        let statement = "DELETE FROM animal_assessment WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    class func getLastregistration() -> String {
        let registration: String = ""
        let query = "SELECT registration from animal_assessment ORDER BY _id DESC LIMIT 1 "
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
