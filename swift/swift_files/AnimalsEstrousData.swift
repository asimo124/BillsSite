

//
//  AnimalsEstrous.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsEstrousData {
    
    var _id: Int = -1
    var _id_str: String = "unset"
    var estrous_id: Int = -1
    var estrous_id_str: String = "unset"
    var registration: String = "unset"
    var registration_str: String = "unset"
    var estrous_date: NSDate = NSDate.distantFuture() as NSDate
    var estrous_date_str: String = "unset"
    var time_period: String = "unset"
    var time_period_str: String = "unset"
    var is_deleted: Int = -1
    var is_deleted_str: String = "unset"
    
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
    
    func setEstrousId(estrous_id: Int?) {
        self.estrous_id = estrous_id ?? 0
        let estrous_id2 = estrous_id ?? 0
        self.estrous_id_str = String(estrous_id2)
        self.estrous_id_str = (self.estrous_id_str == "0") ? "" : self.estrous_id_str
    }
    func getEstrousId() -> Int {
        return self.estrous_id
    }
    func getEstrousIdType() -> String {
        return "Int"
    };
    func getEstrousIdStr() -> String {
        return estrous_id_str
    };
    func getEstrousIdStrPG() -> String {
        return estrous_id_str
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
    
    func setEstrousDate(estrous_date: NSDate?) {
        self.estrous_date = estrous_date ?? NSDate.distantPast() as NSDate
        self.estrous_date_str = Utils.dateToString(self.estrous_date)
    }
    func getEstrousDate() -> NSDate {
        return self.estrous_date
    }
    func getEstrousDateType() -> String {
        return "NSDate"
    };
    func getEstrousDateStr() -> String {
        return estrous_date_str == "unset" || estrous_date_str == "0000-12-30 00:00:00 +0000" ? "" : estrous_date_str
    };
    func getEstrousDateStrPG() -> String {
        return estrous_date_str == "unset" || estrous_date_str == "0000-12-30 00:00:00 +0000" ? "" : estrous_date_str
    };
    
    func setTimePeriod(time_period: String?) {
        self.time_period = time_period ?? ""
        self.time_period_str = String(self.time_period)
    }
    func getTimePeriod() -> String {
        return self.time_period
    }
    func getTimePeriodType() -> String {
        return "String"
    };
    func getTimePeriodStr() -> String {
        return time_period_str == "unset" ? "" : time_period_str
    };
    func getTimePeriodStrPG() -> String {
        return time_period_str == "unset" ? "" : time_period_str
    };
    
    func setIsDeleted(is_deleted: Int?) {
        self.is_deleted = is_deleted ?? 0
        self.is_deleted_str = ((self.is_deleted) == 1) ? "t" : "f"
    }
    func getIsDeleted() -> Int {
        return self.is_deleted
    }
    func getIsDeletedType() -> String {
        return "Int"
    };
    func getIsDeletedStr() -> String {
        return String(is_deleted)
    };
    func getIsDeletedStrPG() -> String {
        return is_deleted_str
    };
    
    func getFieldType(field: String) -> String {
        switch field {
        case "_id":
            return "Int"
        case "estrous_id":
            return "Int"
        case "registration":
            return "String"
        case "estrous_date":
            return "NSDate"
        case "time_period":
            return "String"
        case "is_deleted":
            return "Int"
        default:
            return "String"
            
        }
    }
    
    func getFieldString(field: String) -> String {
        switch field {
        case "_id":
            return self.getIdStr()
        case "estrous_id":
            return self.getEstrousIdStr()
        case "registration":
            return self.getRegistrationStr()
        case "estrous_date":
            return self.getEstrousDateStr()
        case "time_period":
            return self.getTimePeriodStr()
        case "is_deleted":
            return self.getIsDeletedStr()
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
    func loadByID(registration: String) -> [String: String] {
        let qb = QueryBuilder()
        qb.selectFrom("animal_estrous")
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
                self.setEstrousId((row["estrous_id"]?.asInt()));
                self.setRegistration((row["registration"]?.asString()));
                self.setEstrousDate((row["estrous_date"]?.asDate()));
                self.setTimePeriod((row["time_period"]?.asString()));
                self.setIsDeleted((row["is_deleted"]?.asMyBool()));
                
                var fields = [String: String]()
                fields["_id"] = self.getIdStr()
                fields["estrous_id"] = self.getEstrousIdStr()
                fields["registration"] = self.getRegistrationStr()
                fields["estrous_date"] = self.getEstrousDateStr()
                fields["time_period"] = self.getTimePeriodStr()
                fields["is_deleted"] = self.getIsDeletedStr()
                
                return fields
            }
        }
        return fields
    }
    
    func getFields() -> [String: String] {
        
        var fields = [String: String]()
        fields["_id"] = self.getIdStr()
        fields["estrous_id"] = self.getEstrousIdStr()
        fields["registration"] = self.getRegistrationStr()
        fields["estrous_date"] = self.getEstrousDateStr()
        fields["time_period"] = self.getTimePeriodStr()
        fields["is_deleted"] = self.getIsDeletedStr()
        return fields
    }
    
    func getFieldsPG() -> [String: String] {
        
        var fields = [String: String]()
        
        
        fields["_id"] = self.getIdStrPG()
        fields["estrous_id"] = self.getEstrousIdStrPG()
        fields["registration"] = self.getRegistrationStrPG()
        fields["estrous_date"] = self.getEstrousDateStrPG()
        fields["time_period"] = self.getTimePeriodStrPG()
        fields["is_deleted"] = self.getIsDeletedStrPG()
        return fields    }
    
    func addNew() {
        
        var statement = "INSERT INTO animal_estrous ("
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
        
        let dbn = Database()
        dbn.query(statement)
    }
    
    func addNewPG() {
        
        var statement = "INSERT INTO animal_estrous ("
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
            
            var statement = "INSERT INTO animal_estrous ("
            
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
        
        var statement = "UPDATE animal_estrous "
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
        statement += "WHERE registration = " + String(forID)
        
        let dbn = Database()
        dbn.query(statement)
    }
    
    func updatePG(forID: String) {
        
        // get all field/values as string values
        var fields = self.getFieldsPG()
        
        var statement = "UPDATE animal_estrous "
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
        statement += "WHERE registration = " + String(forID)
        
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    func delete(forID: Int) {
        let query = "DELETE FROM animal_estrous WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }
    
    
    func deletePG(forID: String) {
        
        let statement = "DELETE FROM animal_estrous WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    class func getLastregistration() -> String {
        let registration: String = ""
        let query = "SELECT registration from animal_estrous ORDER BY _id DESC LIMIT 1 "
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
