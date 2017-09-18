//
//  AnimalsLegacy.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsLegacyData {
    
   	var _id: Int = -1
    var _id_str: String = "unset"
   	var registration: String = "unset"
    var registration_str: String = "unset"
   	var member_id: String = "unset"
    var member_id_str: String = "unset"
   	var legacy_date: NSDate = NSDate.distantFuture() as NSDate
    var legacy_date_str: String = "unset"
   	var reason: String = "unset"
    var reason_str: String = "unset"
    
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
        return registration_str == "unset" || registration_str == "0000-12-30 00:00:00 +0000" ? "" : registration_str
    };
   	func getRegistrationStrPG() -> String {
        return registration_str == "unset" || registration_str == "0000-12-30 00:00:00 +0000" ? "" : registration_str
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
        return member_id_str == "unset" || member_id_str == "0000-12-30 00:00:00 +0000" ? "" : member_id_str
    };
   	func getMemberIdStrPG() -> String {
        return member_id_str == "unset" || member_id_str == "0000-12-30 00:00:00 +0000" ? "" : member_id_str
    };
    
   	func setLegacyDate(legacy_date: NSDate?) {
        self.legacy_date = legacy_date ?? NSDate.distantPast() as NSDate
        self.legacy_date_str = Utils.dateToString(self.legacy_date)
    }
    func getLegacyDate() -> NSDate {
        return self.legacy_date
    }
    func getLegacyDateType() -> String {
        return "NSDate"
    };
   	func getLegacyDateStr() -> String {
        return legacy_date_str == "unset" || legacy_date_str == "0000-12-30 00:00:00 +0000" ? "" : legacy_date_str
    };
   	func getLegacyDateStrPG() -> String {
        return legacy_date_str == "unset" || legacy_date_str == "0000-12-30 00:00:00 +0000" ? "" : legacy_date_str
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
        return reason_str == "unset" || reason_str == "0000-12-30 00:00:00 +0000" ? "" : reason_str
    };
   	func getReasonStrPG() -> String {
        return reason_str == "unset" || reason_str == "0000-12-30 00:00:00 +0000" ? "" : reason_str
    };
    
   	func getFieldType(field: String) -> String {
        switch field {
        case "_id":
            return "Int"
        case "registration":
            return "String"
        case "member_id":
            return "String"
        case "legacy_date":
            return "NSDate"
        case "reason":
            return "String"
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
        case "member_id":
            return self.getMemberIdStr()
        case "legacy_date":
            return self.getLegacyDateStr()
        case "reason":
            return self.getReasonStr()
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
        qb.selectFrom("animal_legacy")
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
                self.setLegacyDate((row["legacy_date"]?.asDate()));
                self.setReason((row["reason"]?.asString()));
                
                
                fields["_id"] = self.getIdStr()
                fields["registration"] = self.getRegistrationStr()
                fields["member_id"] = self.getMemberIdStr()
                fields["legacy_date"] = self.getLegacyDateStr()
                fields["reason"] = self.getReasonStr()
                
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
        fields["legacy_date"] = self.getLegacyDateStr()
        fields["reason"] = self.getReasonStr()
        return fields
    }
    
    func getFieldsPG() -> [String: String] {
        
        var fields = [String: String]()
        
        
        fields["_id"] = self.getIdStrPG()
        fields["registration"] = self.getRegistrationStrPG()
        fields["member_id"] = self.getMemberIdStrPG()
        fields["legacy_date"] = self.getLegacyDateStrPG()
        fields["reason"] = self.getReasonStrPG()
        return fields    }
    
    func addNew() {
        
        var statement = "INSERT INTO animal_legacy ("
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
        
        var statement = "INSERT INTO animal_legacy ("
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
            
            var statement = "INSERT INTO animal_legacy ("
            
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
        
        var statement = "UPDATE animal_legacy "
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
        
        var statement = "UPDATE animal_legacy "
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
        let query = "DELETE FROM animal_legacy WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }
    
    
    func deletePG(forID: String) {
        
        let statement = "DELETE FROM animal_legacy WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    class func getLastregistration() -> String {
        let registration: String = ""
        let query = "SELECT registration from animal_legacy ORDER BY _id DESC LIMIT 1 "
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
