

//
//  AnimalsHealth.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsHealthData {
    
    var _id: Int = -1
    var _id_str: String = "unset"
    var health_id: Int = -1
    var health_id_str: String = "unset"
    var registration: String = "unset"
    var registration_str: String = "unset"
    var date_administered: NSDate = NSDate.distantFuture() as NSDate
    var date_administered_str: String = "unset"
    var product_name: String = "unset"
    var product_name_str: String = "unset"
    var serial_number: String = "unset"
    var serial_number_str: String = "unset"
    var dosage: String = "unset"
    var dosage_str: String = "unset"
    var location: String = "unset"
    var location_str: String = "unset"
    var withdrawal_period: String = "unset"
    var withdrawal_period_str: String = "unset"
    var administered_by: String = "unset"
    var administered_by_str: String = "unset"
    var lot_number: String = "unset"
    var lot_number_str: String = "unset"
    var method: String = "unset"
    var method_str: String = "unset"
    var expiration_date: NSDate = NSDate.distantFuture() as NSDate
    var expiration_date_str: String = "unset"
    
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
    
    func setHealthId(health_id: Int?) {
        self.health_id = health_id ?? 0
        let health_id2 = health_id ?? 0
        self.health_id_str = String(health_id2)
        self.health_id_str = (self.health_id_str == "0") ? "" : self.health_id_str
    }
    func getHealthId() -> Int {
        return self.health_id
    }
    func getHealthIdType() -> String {
        return "Int"
    };
    func getHealthIdStr() -> String {
        return health_id_str
    };
    func getHealthIdStrPG() -> String {
        return health_id_str
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
    
    func setDateAdministered(date_administered: NSDate?) {
        self.date_administered = date_administered ?? NSDate.distantPast() as NSDate
        self.date_administered_str = Utils.dateToString(self.date_administered)
    }
    func getDateAdministered() -> NSDate {
        return self.date_administered
    }
    func getDateAdministeredType() -> String {
        return "NSDate"
    };
    func getDateAdministeredStr() -> String {
        return date_administered_str == "unset" || date_administered_str == "0000-12-30 00:00:00 +0000" ? "" : date_administered_str
    };
    func getDateAdministeredStrPG() -> String {
        return date_administered_str == "unset" || date_administered_str == "0000-12-30 00:00:00 +0000" ? "" : date_administered_str
    };
    
    func setProductName(product_name: String?) {
        self.product_name = product_name ?? ""
        self.product_name_str = String(self.product_name)
    }
    func getProductName() -> String {
        return self.product_name
    }
    func getProductNameType() -> String {
        return "String"
    };
    func getProductNameStr() -> String {
        return product_name_str == "unset" ? "" : product_name_str
    };
    func getProductNameStrPG() -> String {
        return product_name_str == "unset" ? "" : product_name_str
    };
    
    func setSerialNumber(serial_number: String?) {
        self.serial_number = serial_number ?? ""
        self.serial_number_str = String(self.serial_number)
    }
    func getSerialNumber() -> String {
        return self.serial_number
    }
    func getSerialNumberType() -> String {
        return "String"
    };
    func getSerialNumberStr() -> String {
        return serial_number_str == "unset" ? "" : serial_number_str
    };
    func getSerialNumberStrPG() -> String {
        return serial_number_str == "unset" ? "" : serial_number_str
    };
    
    func setDosage(dosage: String?) {
        self.dosage = dosage ?? ""
        self.dosage_str = String(self.dosage)
    }
    func getDosage() -> String {
        return self.dosage
    }
    func getDosageType() -> String {
        return "String"
    };
    func getDosageStr() -> String {
        return dosage_str == "unset" ? "" : dosage_str
    };
    func getDosageStrPG() -> String {
        return dosage_str == "unset" ? "" : dosage_str
    };
    
    func setLocation(location: String?) {
        self.location = location ?? ""
        self.location_str = String(self.location)
    }
    func getLocation() -> String {
        return self.location
    }
    func getLocationType() -> String {
        return "String"
    };
    func getLocationStr() -> String {
        return location_str == "unset" ? "" : location_str
    };
    func getLocationStrPG() -> String {
        return location_str == "unset" ? "" : location_str
    };
    
    func setWithdrawalPeriod(withdrawal_period: String?) {
        self.withdrawal_period = withdrawal_period ?? ""
        self.withdrawal_period_str = String(self.withdrawal_period)
    }
    func getWithdrawalPeriod() -> String {
        return self.withdrawal_period
    }
    func getWithdrawalPeriodType() -> String {
        return "String"
    };
    func getWithdrawalPeriodStr() -> String {
        return withdrawal_period_str == "unset" ? "" : withdrawal_period_str
    };
    func getWithdrawalPeriodStrPG() -> String {
        return withdrawal_period_str == "unset" ? "" : withdrawal_period_str
    };
    
    func setAdministeredBy(administered_by: String?) {
        self.administered_by = administered_by ?? ""
        self.administered_by_str = String(self.administered_by)
    }
    func getAdministeredBy() -> String {
        return self.administered_by
    }
    func getAdministeredByType() -> String {
        return "String"
    };
    func getAdministeredByStr() -> String {
        return administered_by_str == "unset" ? "" : administered_by_str
    };
    func getAdministeredByStrPG() -> String {
        return administered_by_str == "unset" ? "" : administered_by_str
    };
    
    func setLotNumber(lot_number: String?) {
        self.lot_number = lot_number ?? ""
        self.lot_number_str = String(self.lot_number)
    }
    func getLotNumber() -> String {
        return self.lot_number
    }
    func getLotNumberType() -> String {
        return "String"
    };
    func getLotNumberStr() -> String {
        return lot_number_str == "unset" ? "" : lot_number_str
    };
    func getLotNumberStrPG() -> String {
        return lot_number_str == "unset" ? "" : lot_number_str
    };
    
    func setMethod(method: String?) {
        self.method = method ?? ""
        self.method_str = String(self.method)
    }
    func getMethod() -> String {
        return self.method
    }
    func getMethodType() -> String {
        return "String"
    };
    func getMethodStr() -> String {
        return method_str == "unset" ? "" : method_str
    };
    func getMethodStrPG() -> String {
        return method_str == "unset" ? "" : method_str
    };
    
    func setExpirationDate(expiration_date: NSDate?) {
        self.expiration_date = expiration_date ?? NSDate.distantPast() as NSDate
        self.expiration_date_str = Utils.dateToString(self.expiration_date)
    }
    func getExpirationDate() -> NSDate {
        return self.expiration_date
    }
    func getExpirationDateType() -> String {
        return "NSDate"
    };
    func getExpirationDateStr() -> String {
        return expiration_date_str == "unset" || expiration_date_str == "0000-12-30 00:00:00 +0000" ? "" : expiration_date_str
    };
    func getExpirationDateStrPG() -> String {
        return expiration_date_str == "unset" || expiration_date_str == "0000-12-30 00:00:00 +0000" ? "" : expiration_date_str
    };
    
    func getFieldType(field: String) -> String {
        switch field {
        case "_id":
            return "Int"
        case "health_id":
            return "Int"
        case "registration":
            return "String"
        case "date_administered":
            return "NSDate"
        case "product_name":
            return "String"
        case "serial_number":
            return "String"
        case "dosage":
            return "String"
        case "location":
            return "String"
        case "withdrawal_period":
            return "String"
        case "administered_by":
            return "String"
        case "lot_number":
            return "String"
        case "method":
            return "String"
        case "expiration_date":
            return "NSDate"
        default:
            return "String"
            
        }
    }
    
    func getFieldString(field: String) -> String {
        switch field {
        case "_id":
            return self.getIdStr()
        case "health_id":
            return self.getHealthIdStr()
        case "registration":
            return self.getRegistrationStr()
        case "date_administered":
            return self.getDateAdministeredStr()
        case "product_name":
            return self.getProductNameStr()
        case "serial_number":
            return self.getSerialNumberStr()
        case "dosage":
            return self.getDosageStr()
        case "location":
            return self.getLocationStr()
        case "withdrawal_period":
            return self.getWithdrawalPeriodStr()
        case "administered_by":
            return self.getAdministeredByStr()
        case "lot_number":
            return self.getLotNumberStr()
        case "method":
            return self.getMethodStr()
        case "expiration_date":
            return self.getExpirationDateStr()
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
        qb.selectFrom("animal_health")
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
                self.setHealthId((row["health_id"]?.asInt()));
                self.setRegistration((row["registration"]?.asString()));
                self.setDateAdministered((row["date_administered"]?.asDate()));
                self.setProductName((row["product_name"]?.asString()));
                self.setSerialNumber((row["serial_number"]?.asString()));
                self.setDosage((row["dosage"]?.asString()));
                self.setLocation((row["location"]?.asString()));
                self.setWithdrawalPeriod((row["withdrawal_period"]?.asString()));
                self.setAdministeredBy((row["administered_by"]?.asString()));
                self.setLotNumber((row["lot_number"]?.asString()));
                self.setMethod((row["method"]?.asString()));
                self.setExpirationDate((row["expiration_date"]?.asDate()));
                
                var fields = [String: String]()
                fields["_id"] = self.getIdStr()
                fields["health_id"] = self.getHealthIdStr()
                fields["registration"] = self.getRegistrationStr()
                fields["date_administered"] = self.getDateAdministeredStr()
                fields["product_name"] = self.getProductNameStr()
                fields["serial_number"] = self.getSerialNumberStr()
                fields["dosage"] = self.getDosageStr()
                fields["location"] = self.getLocationStr()
                fields["withdrawal_period"] = self.getWithdrawalPeriodStr()
                fields["administered_by"] = self.getAdministeredByStr()
                fields["lot_number"] = self.getLotNumberStr()
                fields["method"] = self.getMethodStr()
                fields["expiration_date"] = self.getExpirationDateStr()
                
                return fields
            }
        }
        return fields
    }
    
    func getFields() -> [String: String] {
        
        var fields = [String: String]()
        fields["_id"] = self.getIdStr()
        fields["health_id"] = self.getHealthIdStr()
        fields["registration"] = self.getRegistrationStr()
        fields["date_administered"] = self.getDateAdministeredStr()
        fields["product_name"] = self.getProductNameStr()
        fields["serial_number"] = self.getSerialNumberStr()
        fields["dosage"] = self.getDosageStr()
        fields["location"] = self.getLocationStr()
        fields["withdrawal_period"] = self.getWithdrawalPeriodStr()
        fields["administered_by"] = self.getAdministeredByStr()
        fields["lot_number"] = self.getLotNumberStr()
        fields["method"] = self.getMethodStr()
        fields["expiration_date"] = self.getExpirationDateStr()
        return fields
    }
    
    func getFieldsPG() -> [String: String] {
        
        var fields = [String: String]()
        
        
        fields["_id"] = self.getIdStrPG()
        fields["health_id"] = self.getHealthIdStrPG()
        fields["registration"] = self.getRegistrationStrPG()
        fields["date_administered"] = self.getDateAdministeredStrPG()
        fields["product_name"] = self.getProductNameStrPG()
        fields["serial_number"] = self.getSerialNumberStrPG()
        fields["dosage"] = self.getDosageStrPG()
        fields["location"] = self.getLocationStrPG()
        fields["withdrawal_period"] = self.getWithdrawalPeriodStrPG()
        fields["administered_by"] = self.getAdministeredByStrPG()
        fields["lot_number"] = self.getLotNumberStrPG()
        fields["method"] = self.getMethodStrPG()
        fields["expiration_date"] = self.getExpirationDateStrPG()
        return fields    }
    
    func addNew() {
        
        var statement = "INSERT INTO animal_health ("
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
        
        var statement = "INSERT INTO animal_health ("
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
            
            var statement = "INSERT INTO animal_health ("
            
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
        
        var statement = "UPDATE animal_health "
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
        
        var statement = "UPDATE animal_health "
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
        let query = "DELETE FROM animal_health WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }
    
    
    func deletePG(forID: String) {
        
        let statement = "DELETE FROM animal_health WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    class func getLastregistration() -> String {
        let registration: String = ""
        let query = "SELECT registration from animal_health ORDER BY _id DESC LIMIT 1 "
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
