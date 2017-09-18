//
//  AnimalsData.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsDataData {
    
   	var _id: Int = -1
    var _id_str: String = "unset"
   	var registration: String = "unset"
    var registration_str: String = "unset"
   	var left_teat_count: Int = -1
    var left_teat_count_str: String = "unset"
   	var right_teat_count: Int = -1
    var right_teat_count_str: String = "unset"
   	var day_weight_250: String = "unset"
    var day_weight_250_str: String = "unset"
   	var spi: Double = -1.0
    var spi_str: String = "unset"
   	var mli: Double = -1.0
    var mli_str: String = "unset"
   	var tsi: Double = -1.0
    var tsi_str: String = "unset"
    
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
    
   	func setLeftTeatCount(left_teat_count: Int?) {
        self.left_teat_count = left_teat_count ?? 0
        let left_teat_count2 = left_teat_count ?? 0
        self.left_teat_count_str = String(left_teat_count2)
        self.left_teat_count_str = (self.left_teat_count_str == "0") ? "" : self.left_teat_count_str
    }
    func getLeftTeatCount() -> Int {
        return self.left_teat_count
    }
    func getLeftTeatCountType() -> String {
        return "Int"
    };
   	func getLeftTeatCountStr() -> String {
        return left_teat_count_str == "unset" ? "" : left_teat_count_str
    };
   	func getLeftTeatCountStrPG() -> String {
        return left_teat_count_str == "unset" ? "" : left_teat_count_str
    };
    
   	func setRightTeatCount(right_teat_count: Int?) {
        self.right_teat_count = right_teat_count ?? 0
        let right_teat_count2 = right_teat_count ?? 0
        self.right_teat_count_str = String(right_teat_count2)
        self.right_teat_count_str = (self.right_teat_count_str == "0") ? "" : self.right_teat_count_str
    }
    func getRightTeatCount() -> Int {
        return self.right_teat_count
    }
    func getRightTeatCountType() -> String {
        return "Int"
    };
   	func getRightTeatCountStr() -> String {
        return right_teat_count_str == "unset" ? "" : right_teat_count_str
    };
   	func getRightTeatCountStrPG() -> String {
        return right_teat_count_str == "unset" ? "" : right_teat_count_str
    };
    
   	func setDayWeight250(day_weight_250: String?) {
        self.day_weight_250 = day_weight_250 ?? ""
        self.day_weight_250_str = String(self.day_weight_250)
    }
    func getDayWeight250() -> String {
        return self.day_weight_250
    }
    func getDayWeight250Type() -> String {
        return "String"
    };
   	func getDayWeight250Str() -> String {
        return day_weight_250_str
    };
   	func getDayWeight250StrPG() -> String {
        return day_weight_250_str
    };
    
   	func setSpi(spi: Double?) {
        self.spi = spi ?? 0.0
        self.spi_str = String(self.spi)
    }
    func getSpi() -> Double {
        return self.spi
    }
    func getSpiType() -> String {
        return "Double"
    };
   	func getSpiStr() -> String {
        return spi_str == "unset" ? "" : spi_str
    };
   	func getSpiStrPG() -> String {
        return spi_str == "unset" ? "" : spi_str
    };
    
   	func setMli(mli: Double?) {
        self.mli = mli ?? 0.0
        self.mli_str = String(self.mli)
    }
    func getMli() -> Double {
        return self.mli
    }
    func getMliType() -> String {
        return "Double"
    };
   	func getMliStr() -> String {
        return mli_str == "unset" ? "" : mli_str
    };
   	func getMliStrPG() -> String {
        return mli_str == "unset" ? "" : mli_str
    };
    
   	func setTsi(tsi: Double?) {
        self.tsi = tsi ?? 0.0
        self.tsi_str = String(self.tsi)
    }
    func getTsi() -> Double {
        return self.tsi
    }
    func getTsiType() -> String {
        return "Double"
    };
   	func getTsiStr() -> String {
        return tsi_str == "unset" ? "" : tsi_str
    };
   	func getTsiStrPG() -> String {
        return tsi_str == "unset" ? "" : tsi_str
    };
    
   	func getFieldType(field: String) -> String {
        switch field {
        case "_id":
            return "Int"
        case "registration":
            return "String"
        case "left_teat_count":
            return "Int"
        case "right_teat_count":
            return "Int"
        case "day_weight_250":
            return "String"
        case "spi":
            return "Double"
        case "mli":
            return "Double"
        case "tsi":
            return "Double"
        default:
            return "String"
            break;
        }
   	}
    
   	func getFieldString(field: String) -> String {
        switch field {
        case "_id":
            return self.getIdStr()
        case "registration":
            return self.getRegistrationStr()
        case "left_teat_count":
            return self.getLeftTeatCountStr()
        case "right_teat_count":
            return self.getRightTeatCountStr()
        case "day_weight_250":
            return self.getDayWeight250Str()
        case "spi":
            return self.getSpiStr()
        case "mli":
            return self.getMliStr()
        case "tsi":
            return self.getTsiStr()
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
        qb.selectFrom("animal_data")
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
                self.setLeftTeatCount((row["left_teat_count"]?.asInt()));
                self.setRightTeatCount((row["right_teat_count"]?.asInt()));
                self.setDayWeight250((row["day_weight_250"]?.asString()));
                self.setSpi((row["spi"]?.asDouble()));
                self.setMli((row["mli"]?.asDouble()));
                self.setTsi((row["tsi"]?.asDouble()));
                
                
                fields["_id"] = self.getIdStr()
                fields["registration"] = self.getRegistrationStr()
                fields["left_teat_count"] = self.getLeftTeatCountStr()
                fields["right_teat_count"] = self.getRightTeatCountStr()
                fields["day_weight_250"] = self.getDayWeight250Str()
                fields["spi"] = self.getSpiStr()
                fields["mli"] = self.getMliStr()
                fields["tsi"] = self.getTsiStr()
                
                return fields
            }
        }
        return fields
    }
    
    func getFields() -> [String: String] {
        
        var fields = [String: String]()
        fields["_id"] = self.getIdStr()
        fields["registration"] = self.getRegistrationStr()
        fields["left_teat_count"] = self.getLeftTeatCountStr()
        fields["right_teat_count"] = self.getRightTeatCountStr()
        fields["day_weight_250"] = self.getDayWeight250Str()
        fields["spi"] = self.getSpiStr()
        fields["mli"] = self.getMliStr()
        fields["tsi"] = self.getTsiStr()
        return fields
    }
    
    func getFieldsPG() -> [String: String] {
        
        var fields = [String: String]()
        
        
        fields["_id"] = self.getIdStrPG()
        fields["registration"] = self.getRegistrationStrPG()
        fields["left_teat_count"] = self.getLeftTeatCountStrPG()
        fields["right_teat_count"] = self.getRightTeatCountStrPG()
        fields["day_weight_250"] = self.getDayWeight250StrPG()
        fields["spi"] = self.getSpiStrPG()
        fields["mli"] = self.getMliStrPG()
        fields["tsi"] = self.getTsiStrPG()
        return fields    }
    
    func addNew() {
        
        var statement = "INSERT INTO animal_data ("
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
        
        var statement = "INSERT INTO animal_data ("
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
            
            var statement = "INSERT INTO animal_data ("
            
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
        
        var statement = "UPDATE animal_data "
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
        
        var statement = "UPDATE animal_data "
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
        let query = "DELETE FROM animal_data WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }
    
    
    func deletePG(forID: String) {
        
        let statement = "DELETE FROM animal_data WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    class func getLastregistration() -> String {
        var registration: String = ""
        let query = "SELECT registration from animal_data ORDER BY _id DESC LIMIT 1 "
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
