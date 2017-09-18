//
//  CertificateAi.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class CertificateAiData {
    
   	var certificate_id: Int = -1
    var certificate_id_str: String = "unset"
   	var certificate_number: String = "unset"
    var certificate_number_str: String = "unset"
   	var stud_number: String = "unset"
    var stud_number_str: String = "unset"
   	var sire_owner: String = "unset"
    var sire_owner_str: String = "unset"
   	var sire_registration: String = "unset"
    var sire_registration_str: String = "unset"
   	var date_collected: NSDate = NSDate.distantFuture() as NSDate
    var date_collected_str: String = "unset"
   	var semen_id: String = "unset"
    var semen_id_str: String = "unset"
   	var date_sold: NSDate = NSDate.distantFuture() as NSDate
    var date_sold_str: String = "unset"
   	var dam_owner: String = "unset"
    var dam_owner_str: String = "unset"
   	var dam_registration: String = "unset"
    var dam_registration_str: String = "unset"
   	var date_inseminated: NSDate = NSDate.distantFuture() as NSDate
    var date_inseminated_str: String = "unset"
   	var is_completed: Int = -1
    var is_completed_str: String = "unset"
   	var unit_qty: Int = -1
    var unit_qty_str: String = "unset"
   	var is_void: Int = -1
    var is_void_str: String = "unset"
    
   	func setCertificateId(certificate_id: Int?) {
        self.certificate_id = certificate_id ?? 0
        let certificate_id2 = certificate_id ?? 0
        self.certificate_id_str = String(certificate_id2)
        self.certificate_id_str = (self.certificate_id_str == "0") ? "" : self.certificate_id_str
    }
    func getCertificateId() -> Int {
        return self.certificate_id
    }
    func getCertificateIdType() -> String {
        return "Int"
    };
   	func getCertificateIdStr() -> String {
        return certificate_id_str == "unset" ? "" : certificate_id_str
    };
   	func getCertificateIdStrPG() -> String {
        return certificate_id_str == "unset" ? "" : certificate_id_str
    };
    
   	func setCertificateNumber(certificate_number: String?) {
        self.certificate_number = certificate_number ?? ""
        self.certificate_number_str = String(self.certificate_number)
    }
    func getCertificateNumber() -> String {
        return self.certificate_number
    }
    func getCertificateNumberType() -> String {
        return "String"
    };
   	func getCertificateNumberStr() -> String {
        return certificate_number_str == "unset" ? "" : certificate_number_str
    };
   	func getCertificateNumberStrPG() -> String {
        return certificate_number_str == "unset" ? "" : certificate_number_str
    };
    
   	func setStudNumber(stud_number: String?) {
        self.stud_number = stud_number ?? ""
        self.stud_number_str = String(self.stud_number)
    }
    func getStudNumber() -> String {
        return self.stud_number
    }
    func getStudNumberType() -> String {
        return "String"
    };
   	func getStudNumberStr() -> String {
        return stud_number_str == "unset" ? "" : stud_number_str
    };
   	func getStudNumberStrPG() -> String {
        return stud_number_str == "unset" ? "" : stud_number_str
    };
    
   	func setSireOwner(sire_owner: String?) {
        self.sire_owner = sire_owner ?? ""
        self.sire_owner_str = String(self.sire_owner)
    }
    func getSireOwner() -> String {
        return self.sire_owner
    }
    func getSireOwnerType() -> String {
        return "String"
    };
   	func getSireOwnerStr() -> String {
        return sire_owner_str == "unset" ? "" : sire_owner_str
    };
   	func getSireOwnerStrPG() -> String {
        return sire_owner_str == "unset" ? "" : sire_owner_str
    };
    
   	func setSireRegistration(sire_registration: String?) {
        self.sire_registration = sire_registration ?? ""
        self.sire_registration_str = String(self.sire_registration)
    }
    func getSireRegistration() -> String {
        return self.sire_registration
    }
    func getSireRegistrationType() -> String {
        return "String"
    };
   	func getSireRegistrationStr() -> String {
        return sire_registration_str == "unset" ? "" : sire_registration_str
    };
   	func getSireRegistrationStrPG() -> String {
        return sire_registration_str == "unset" ? "" : sire_registration_str
    };
    
   	func setDateCollected(date_collected: NSDate?) {
        self.date_collected = date_collected ?? NSDate.distantPast() as NSDate
        self.date_collected_str = Utils.dateToString(self.date_collected)
    }
    func getDateCollected() -> NSDate {
        return self.date_collected
    }
    func getDateCollectedType() -> String {
        return "NSDate"
    };
   	func getDateCollectedStr() -> String {
        return date_collected_str == "unset" || date_collected_str == "0000-12-30 00:00:00 +0000" ? "" : date_collected_str
    };
   	func getDateCollectedStrPG() -> String {
        return date_collected_str == "unset" || date_collected_str == "0000-12-30 00:00:00 +0000" ? "" : date_collected_str
    };
    
   	func setSemenId(semen_id: String?) {
        self.semen_id = semen_id ?? ""
        self.semen_id_str = String(self.semen_id)
    }
    func getSemenId() -> String {
        return self.semen_id
    }
    func getSemenIdType() -> String {
        return "String"
    };
   	func getSemenIdStr() -> String {
        return semen_id_str == "unset" ? "" : semen_id_str
    };
   	func getSemenIdStrPG() -> String {
        return semen_id_str == "unset" ? "" : semen_id_str
    };
    
   	func setDateSold(date_sold: NSDate?) {
        self.date_sold = date_sold ?? NSDate.distantPast() as NSDate
        self.date_sold_str = Utils.dateToString(self.date_sold)
    }
    func getDateSold() -> NSDate {
        return self.date_sold
    }
    func getDateSoldType() -> String {
        return "NSDate"
    };
   	func getDateSoldStr() -> String {
        return date_sold_str == "unset" || date_sold_str == "0000-12-30 00:00:00 +0000" ? "" : date_sold_str
    };
   	func getDateSoldStrPG() -> String {
        return date_sold_str == "unset" || date_sold_str == "0000-12-30 00:00:00 +0000" ? "" : date_sold_str
    };
    
   	func setDamOwner(dam_owner: String?) {
        self.dam_owner = dam_owner ?? ""
        self.dam_owner_str = String(self.dam_owner)
    }
    func getDamOwner() -> String {
        return self.dam_owner
    }
    func getDamOwnerType() -> String {
        return "String"
    };
   	func getDamOwnerStr() -> String {
        return dam_owner_str == "unset" ? "" : dam_owner_str
    };
   	func getDamOwnerStrPG() -> String {
        return dam_owner_str == "unset" ? "" : dam_owner_str
    };
    
   	func setDamRegistration(dam_registration: String?) {
        self.dam_registration = dam_registration ?? ""
        self.dam_registration_str = String(self.dam_registration)
    }
    func getDamRegistration() -> String {
        return self.dam_registration
    }
    func getDamRegistrationType() -> String {
        return "String"
    };
   	func getDamRegistrationStr() -> String {
        return dam_registration_str == "unset" ? "" : dam_registration_str
    };
   	func getDamRegistrationStrPG() -> String {
        return dam_registration_str == "unset" ? "" : dam_registration_str
    };
    
   	func setDateInseminated(date_inseminated: NSDate?) {
        self.date_inseminated = date_inseminated ?? NSDate.distantPast() as NSDate
        self.date_inseminated_str = Utils.dateToString(self.date_inseminated)
    }
    func getDateInseminated() -> NSDate {
        return self.date_inseminated
    }
    func getDateInseminatedType() -> String {
        return "NSDate"
    };
   	func getDateInseminatedStr() -> String {
        return date_inseminated_str == "unset" || date_inseminated_str == "0000-12-30 00:00:00 +0000" ? "" : date_inseminated_str
    };
   	func getDateInseminatedStrPG() -> String {
        return date_inseminated_str == "unset" || date_inseminated_str == "0000-12-30 00:00:00 +0000" ? "" : date_inseminated_str
    };
    
   	func setIsCompleted(is_completed: Int?) {
        self.is_completed = is_completed ?? 0
        self.is_completed_str = ((self.is_completed) == 1) ? "t" : "f"
    }
    func getIsCompleted() -> Int {
        return self.is_completed
    }
    func getIsCompletedType() -> String {
        return "Int"
    };
   	func getIsCompletedStr() -> String {
        return String(is_completed)
    };
   	func getIsCompletedStrPG() -> String {
        return is_completed_str == "unset" ? "" : is_completed_str
    };
    
   	func setUnitQty(unit_qty: Int?) {
        self.unit_qty = unit_qty ?? 0
        let unit_qty2 = unit_qty ?? 0
        self.unit_qty_str = String(unit_qty2)
        self.unit_qty_str = (self.unit_qty_str == "0") ? "" : self.unit_qty_str
    }
    func getUnitQty() -> Int {
        return self.unit_qty
    }
    func getUnitQtyType() -> String {
        return "Int"
    };
   	func getUnitQtyStr() -> String {
        return unit_qty_str == "unset" ? "" : unit_qty_str
    };
   	func getUnitQtyStrPG() -> String {
        return unit_qty_str == "unset" ? "" : unit_qty_str
    };
    
   	func setIsVoid(is_void: Int?) {
        self.is_void = is_void ?? 0
        self.is_void_str = ((self.is_void) == 1) ? "t" : "f"
    }
    func getIsVoid() -> Int {
        return self.is_void
    }
    func getIsVoidType() -> String {
        return "Int"
    };
   	func getIsVoidStr() -> String {
        return String(is_void)
    };
   	func getIsVoidStrPG() -> String {
        return is_void_str == "unset" ? "" : is_void_str
    };
    
   	func getFieldType(field: String) -> String {
        switch field {
        case "certificate_id":
            return "Int"
        case "certificate_number":
            return "String"
        case "stud_number":
            return "String"
        case "sire_owner":
            return "String"
        case "sire_registration":
            return "String"
        case "date_collected":
            return "NSDate"
        case "semen_id":
            return "String"
        case "date_sold":
            return "NSDate"
        case "dam_owner":
            return "String"
        case "dam_registration":
            return "String"
        case "date_inseminated":
            return "NSDate"
        case "is_completed":
            return "Int"
        case "unit_qty":
            return "Int"
        case "is_void":
            return "Int"
        default:
            return "String"
            break;
        }
        return "String"
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
    
    func getFieldString(field: String) -> String {
        
        switch field {
            case "certificate_number":
                return self.getCertificateNumberStr()
            case "stud_number":
                return self.getStudNumberStr()
            case "sire_owner":
                return self.getSireOwnerStr()
            case "sire_registration":
                return self.getSireRegistrationStr()
            case "date_collected":
                return self.getDateCollectedStr()
            case "semen_id":
                return self.getSemenIdStr()
            case "date_sold":
                return getDateSoldStr()
            case "dam_owner":
                return self.getDamOwnerStr()
            case "dam_registration":
                return self.getDamRegistrationStr()
            case "date_inseminated":
                return self.getDateInseminatedStr()
            case "is_completed":
                return self.getIsCompletedStr()
            case "unit_qty":
                return self.getUnitQtyStr()
            case "is_void":
                return self.getUnitQtyStr()
            default:
                return self.getCertificateNumberStr()
            break;
        }
    }
    func loadByID(sire_registration: String) -> [String: String] {
        let qb = QueryBuilder()
        qb.selectFrom("ai_certificates")
            .Where("sire_registration = ?")
        
        var fieldsArr: [AnyObject] = []
        fieldsArr.append(sire_registration)
        
        var fields = [String: String]()
        let (resultset, error) = SD.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SD.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]
                
                self.setCertificateId((row["certificate_id"]?.asInt()));
                self.setCertificateNumber((row["certificate_number"]?.asString()));
                self.setStudNumber((row["stud_number"]?.asString()));
                self.setSireOwner((row["sire_owner"]?.asString()));
                self.setSireRegistration((row["sire_registration"]?.asString()));
                self.setDateCollected((row["date_collected"]?.asDate()));
                self.setSemenId((row["semen_id"]?.asString()));
                self.setDateSold((row["date_sold"]?.asDate()));
                self.setDamOwner((row["dam_owner"]?.asString()));
                self.setDamRegistration((row["dam_registration"]?.asString()));
                self.setDateInseminated((row["date_inseminated"]?.asDate()));
                self.setIsCompleted((row["is_completed"]?.asMyBool()));
                self.setUnitQty((row["unit_qty"]?.asInt()));
                self.setIsVoid((row["is_void"]?.asMyBool()));
                
                
                fields["certificate_id"] = self.getCertificateIdStr()
                fields["certificate_number"] = self.getCertificateNumberStr()
                fields["stud_number"] = self.getStudNumberStr()
                fields["sire_owner"] = self.getSireOwnerStr()
                fields["sire_registration"] = self.getSireRegistrationStr()
                fields["date_collected"] = self.getDateCollectedStr()
                fields["semen_id"] = self.getSemenIdStr()
                fields["date_sold"] = self.getDateSoldStr()
                fields["dam_owner"] = self.getDamOwnerStr()
                fields["dam_registration"] = self.getDamRegistrationStr()
                fields["date_inseminated"] = self.getDateInseminatedStr()
                fields["is_completed"] = self.getIsCompletedStr()
                fields["unit_qty"] = self.getUnitQtyStr()
                fields["is_void"] = self.getIsVoidStr()
                
                return fields
            }
        }
        return fields
    }
    
    func getFields() -> [String: String] {
        
        var fields = [String: String]()
        fields["certificate_id"] = self.getCertificateIdStr()
        fields["certificate_number"] = self.getCertificateNumberStr()
        fields["stud_number"] = self.getStudNumberStr()
        fields["sire_owner"] = self.getSireOwnerStr()
        fields["sire_registration"] = self.getSireRegistrationStr()
        fields["date_collected"] = self.getDateCollectedStr()
        fields["semen_id"] = self.getSemenIdStr()
        fields["date_sold"] = self.getDateSoldStr()
        fields["dam_owner"] = self.getDamOwnerStr()
        fields["dam_registration"] = self.getDamRegistrationStr()
        fields["date_inseminated"] = self.getDateInseminatedStr()
        fields["is_completed"] = self.getIsCompletedStr()
        fields["unit_qty"] = self.getUnitQtyStr()
        fields["is_void"] = self.getIsVoidStr()
        return fields
    }
    
    func getFieldsPG() -> [String: String] {
        
        var fields = [String: String]()
        
        
        fields["certificate_id"] = self.getCertificateIdStrPG()
        fields["certificate_number"] = self.getCertificateNumberStrPG()
        fields["stud_number"] = self.getStudNumberStrPG()
        fields["sire_owner"] = self.getSireOwnerStrPG()
        fields["sire_registration"] = self.getSireRegistrationStrPG()
        fields["date_collected"] = self.getDateCollectedStrPG()
        fields["semen_id"] = self.getSemenIdStrPG()
        fields["date_sold"] = self.getDateSoldStrPG()
        fields["dam_owner"] = self.getDamOwnerStrPG()
        fields["dam_registration"] = self.getDamRegistrationStrPG()
        fields["date_inseminated"] = self.getDateInseminatedStrPG()
        fields["is_completed"] = self.getIsCompletedStrPG()
        fields["unit_qty"] = self.getUnitQtyStrPG()
        fields["is_void"] = self.getIsVoidStrPG()
        return fields    }
    
    func addNew() {
        
        var statement = "INSERT INTO ai_certificates ("
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
        
        var statement = "INSERT INTO ai_certificates ("
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
            
            var statement = "INSERT INTO ai_certificates ("
            
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
    
    func update(forID: Int) {
        
        // get all field/values as string values
        var fields = self.getFields()
        
        var statement = "UPDATE ai_certificates "
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
        statement += "WHERE sire_registration = " + String(forID)
        
        let dbn = Database()
        dbn.query(statement)
    }
    
    func updatePG(forID: Int) {
        
        // get all field/values as string values
        var fields = self.getFieldsPG()
        
        var statement = "UPDATE ai_certificates "
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
        statement += "WHERE sire_registration = " + String(forID)
        
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    func delete(forID: Int) {
        let query = "DELETE FROM ai_certificates WHERE sire_registration = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }
    
    
    func deletePG(forID: Int) {
        
        let statement = "DELETE FROM ai_certificates WHERE sire_registration = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    class func getLastSireRegistration() -> String {
        var sire_registration: String = ""
        let query = "SELECT sire_registration from ai_certificates ORDER BY _id DESC LIMIT 1 "
        let (resultset, err) = SD.executeQuery(query)
        if (err == nil) {
            if resultset.count > 0 {
                let row = resultset[0]
                let sire_registration2 = row["sire_registration"]?.asString() ?? ""
                
                return sire_registration2
                
            }
        }
        return sire_registration
    }
}
