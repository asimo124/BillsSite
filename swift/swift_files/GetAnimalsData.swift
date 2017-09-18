//
//  GetAnimals.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class GetAnimalsData {
    
   	/*var digitalbeef_id: Int = -1
    var digitalbeef_id_str: String = "unset"*/
    var _id: Int = -1
    var _id_str: String = "unset"
   	var registration: String = "unset"
    var registration_str: String = "unset"
   	var private_herd_number: String = "unset"
    var private_herd_number_str: String = "unset"
   	var eid: String = "unset"
    var eid_str: String = "unset"
   	var animal_name: String = "unset"
    var animal_name_str: String = "unset"
   	var international_id: String = "unset"
    var international_id_str: String = "unset"
   	var sire: String = "unset"
    var sire_str: String = "unset"
   	var dam: String = "unset"
    var dam_str: String = "unset"
   	var status: Int = -1
    var status_str: String = "unset"
   	var sex: String = "unset"
    var sex_str: String = "unset"
   	var metal_ear_tag: String = "unset"
    var metal_ear_tag_str: String = "unset"
   	var other_id: String = "unset"
    var other_id_str: String = "unset"
   	var breeder_id: String = "unset"
    var breeder_id_str: String = "unset"
   	var is_deleted: Int = -1
    var is_deleted_str: String = "unset"
    
   	/*func setDigitalBeefId(digitalbeef_id: Int?) {
        self.digitalbeef_id = digitalbeef_id ?? 0
        let digitalbeef_id2 = digitalbeef_id ?? 0
        self.digitalbeef_id_str = String(digitalbeef_id2)
        self.digitalbeef_id_str = (self.digitalbeef_id_str == "0") ? "" : self.digitalbeef_id_str
    }
    func getDigitalBeefId() -> Int {
        return self.digitalbeef_id
    }
    func getDigitalBeefIdType() -> String {
        return "Int"
    };
   	func getDigitalBeefIdStr() -> String {
        return digitalbeef_id_str == "unset" ? "" : digitalbeef_id_str
    };
   	func getDigitalBeefIdStrPG() -> String {
        return digitalbeef_id_str == "unset" ? "" : digitalbeef_id_str
    };*/
    
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
    
   	func setPrivateHerdNumber(private_herd_number: String?) {
        self.private_herd_number = private_herd_number ?? ""
        self.private_herd_number_str = String(self.private_herd_number)
    }
    func getPrivateHerdNumber() -> String {
        return self.private_herd_number
    }
    func getPrivateHerdNumberType() -> String {
        return "String"
    };
   	func getPrivateHerdNumberStr() -> String {
        return private_herd_number_str == "unset" ? "" : private_herd_number_str
    };
   	func getPrivateHerdNumberStrPG() -> String {
        return private_herd_number_str == "unset" ? "" : private_herd_number_str
    };
    
   	func setEid(eid: String?) {
        self.eid = eid ?? ""
        self.eid_str = String(self.eid)
    }
    func getEid() -> String {
        return self.eid
    }
    func getEidType() -> String {
        return "String"
    };
   	func getEidStr() -> String {
        return eid_str == "unset" ? "" : eid_str
    };
   	func getEidStrPG() -> String {
        return eid_str == "unset" ? "" : eid_str
    };
    
   	func setAnimalName(animal_name: String?) {
        self.animal_name = animal_name ?? ""
        self.animal_name_str = String(self.animal_name)
    }
    func getAnimalName() -> String {
        return self.animal_name
    }
    func getAnimalNameType() -> String {
        return "String"
    };
   	func getAnimalNameStr() -> String {
        return animal_name_str == "unset" ? "" : animal_name_str
    };
   	func getAnimalNameStrPG() -> String {
        return animal_name_str == "unset" ? "" : animal_name_str
    };
    
   	func setInternationalId(international_id: String?) {
        self.international_id = international_id ?? ""
        self.international_id_str = String(self.international_id)
    }
    func getInternationalId() -> String {
        return self.international_id
    }
    func getInternationalIdType() -> String {
        return "String"
    };
   	func getInternationalIdStr() -> String {
        return international_id_str == "unset" ? "" : international_id_str
    };
   	func getInternationalIdStrPG() -> String {
        return international_id_str == "unset" ? "" : international_id_str
    };
    
   	func setSire(sire: String?) {
        self.sire = sire ?? ""
        self.sire_str = String(self.sire)
    }
    func getSire() -> String {
        return self.sire
    }
    func getSireType() -> String {
        return "String"
    };
   	func getSireStr() -> String {
        return sire_str == "unset" ? "" : sire_str
    };
   	func getSireStrPG() -> String {
        return sire_str == "unset" ? "" : sire_str
    };
    
   	func setDam(dam: String?) {
        self.dam = dam ?? ""
        self.dam_str = String(self.dam)
    }
    func getDam() -> String {
        return self.dam
    }
    func getDamType() -> String {
        return "String"
    };
   	func getDamStr() -> String {
        return dam_str == "unset" ? "" : dam_str
    };
   	func getDamStrPG() -> String {
        return dam_str == "unset" ? "" : dam_str
    };
    
   	func setStatus(status: Int?) {
        self.status = status ?? 0
        let status2 = status ?? 0
        self.status_str = String(status2)
        self.status_str = (self.status_str == "0") ? "" : self.status_str
    }
    func getStatus() -> Int {
        return self.status
    }
    func getStatusType() -> String {
        return "Int"
    };
   	func getStatusStr() -> String {
        return status_str == "unset" ? "" : status_str
    };
   	func getStatusStrPG() -> String {
        return status_str == "unset" ? "" : status_str
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
    
   	func setMetalEarTag(metal_ear_tag: String?) {
        self.metal_ear_tag = metal_ear_tag ?? ""
        self.metal_ear_tag_str = String(self.metal_ear_tag)
    }
    func getMetalEarTag() -> String {
        return self.metal_ear_tag
    }
    func getMetalEarTagType() -> String {
        return "String"
    };
   	func getMetalEarTagStr() -> String {
        return metal_ear_tag_str == "unset" ? "" : metal_ear_tag_str
    };
   	func getMetalEarTagStrPG() -> String {
        return metal_ear_tag_str == "unset" ? "" : metal_ear_tag_str
    };
    
   	func setOtherId(other_id: String?) {
        self.other_id = other_id ?? ""
        self.other_id_str = String(self.other_id)
    }
    func getOtherId() -> String {
        return self.other_id
    }
    func getOtherIdType() -> String {
        return "String"
    };
   	func getOtherIdStr() -> String {
        return other_id_str == "unset" ? "" : other_id_str
    };
   	func getOtherIdStrPG() -> String {
        return other_id_str == "unset" ? "" : other_id_str
    };
    
   	func setBreederId(breeder_id: String?) {
        self.breeder_id = breeder_id ?? ""
        self.breeder_id_str = String(self.breeder_id)
    }
    func getBreederId() -> String {
        return self.breeder_id
    }
    func getBreederIdType() -> String {
        return "String"
    };
   	func getBreederIdStr() -> String {
        return breeder_id_str == "unset" ? "" : breeder_id_str
    };
   	func getBreederIdStrPG() -> String {
        return breeder_id_str == "unset" ? "" : breeder_id_str
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
        return is_deleted_str == "unset" ? "" : is_deleted_str
    };
    
   	func getFieldType(field: String) -> String {
        switch field {
        case "_id":
            return "Int"
        case "registration":
            return "String"
        case "private_herd_number":
            return "String"
        case "eid":
            return "String"
        case "animal_name":
            return "String"
        case "international_id":
            return "String"
        case "sire":
            return "String"
        case "dam":
            return "String"
        case "status":
            return "Int"
        case "sex":
            return "String"
        case "metal_ear_tag":
            return "String"
        case "other_id":
            return "String"
        case "breeder_id":
            return "String"
        case "is_deleted":
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
        case "private_herd_number":
            return self.getPrivateHerdNumberStr()
        case "eid":
            return self.getEidStr()
        case "animal_name":
            return self.getAnimalNameStr()
        case "international_id":
            return self.getInternationalIdStr()
        case "sire":
            return self.getSireStr()
        case "dam":
            return self.getDamStr()
        case "status":
            return self.getStatusStr()
        case "sex":
            return self.getSexStr()
        case "metal_ear_tag":
            return self.getMetalEarTagStr()
        case "other_id":
            return self.getOtherIdStr()
        case "breeder_id":
            return self.getBreederIdStr()
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
    func loadByRegistration(registration: String) -> [String: String] {
        
        let query =
            "SELECT * FROM animal " +
        "Where registration = ? "
        
        var fieldsArr: [AnyObject] = []
        fieldsArr.append(registration)
        
        var fields = [String: String]()
        
        SD.printQuery(query, withArgs: fieldsArr)
        let (resultset, error) = SD.executeQuery(query, withArgs: fieldsArr)
        if (error != nil) {
            SD.printDie(error!)
        } else {
            
            if resultset.count > 0 {
                let row = resultset[0]
                
                self.setId((row["_id"]?.asInt()));
                self.setRegistration((row["registration"]?.asString()));
                self.setPrivateHerdNumber((row["private_herd_number"]?.asString()));
                self.setEid((row["eid"]?.asString()));
                self.setAnimalName((row["animal_name"]?.asString()));
                self.setInternationalId((row["international_id"]?.asString()));
                self.setSire((row["sire"]?.asString()));
                self.setDam((row["dam"]?.asString()));
                self.setStatus((row["status"]?.asInt()));
                self.setSex((row["sex"]?.asString()));
                self.setMetalEarTag((row["metal_ear_tag"]?.asString()));
                self.setOtherId((row["other_id"]?.asString()));
                self.setBreederId((row["breeder_id"]?.asString()));
                self.setIsDeleted((row["is_deleted"]?.asMyBool()));
                
                
                fields["_id"] = self.getIdStr()
                fields["registration"] = self.getRegistrationStr()
                fields["private_herd_number"] = self.getPrivateHerdNumberStr()
                fields["eid"] = self.getEidStr()
                fields["animal_name"] = self.getAnimalNameStr()
                fields["international_id"] = self.getInternationalIdStr()
                fields["sire"] = self.getSireStr()
                fields["dam"] = self.getDamStr()
                fields["status"] = self.getStatusStr()
                fields["sex"] = self.getSexStr()
                fields["metal_ear_tag"] = self.getMetalEarTagStr()
                fields["other_id"] = self.getOtherIdStr()
                fields["breeder_id"] = self.getBreederIdStr()
                fields["is_deleted"] = self.getIsDeletedStr()
                
                return fields
            }
        }
        return fields
        
    }

    
    func loadByRegistration(registration: String, or_private_herd_number: String) -> [String: String] {
        
        let query =
        "SELECT * FROM animal " +
        "Where registration = ? or private_herd_number = ? "
        
        var fieldsArr: [AnyObject] = []
        fieldsArr.append(registration)
        fieldsArr.append(or_private_herd_number)
        
        var fields = [String: String]()
        
        SD.printQuery(query, withArgs: fieldsArr)
        let (resultset, error) = SD.executeQuery(query, withArgs: fieldsArr)
        if (error != nil) {
            SD.printDie(error!)
        } else {
            
            if resultset.count > 0 {
                let row = resultset[0]
                
                self.setId((row["_id"]?.asInt()));
                self.setRegistration((row["registration"]?.asString()));
                self.setPrivateHerdNumber((row["private_herd_number"]?.asString()));
                self.setEid((row["eid"]?.asString()));
                self.setAnimalName((row["animal_name"]?.asString()));
                self.setInternationalId((row["international_id"]?.asString()));
                self.setSire((row["sire"]?.asString()));
                self.setDam((row["dam"]?.asString()));
                self.setStatus((row["status"]?.asInt()));
                self.setSex((row["sex"]?.asString()));
                self.setMetalEarTag((row["metal_ear_tag"]?.asString()));
                self.setOtherId((row["other_id"]?.asString()));
                self.setBreederId((row["breeder_id"]?.asString()));
                self.setIsDeleted((row["is_deleted"]?.asMyBool()));
                
                
                fields["_id"] = self.getIdStr()
                fields["registration"] = self.getRegistrationStr()
                fields["private_herd_number"] = self.getPrivateHerdNumberStr()
                fields["eid"] = self.getEidStr()
                fields["animal_name"] = self.getAnimalNameStr()
                fields["international_id"] = self.getInternationalIdStr()
                fields["sire"] = self.getSireStr()
                fields["dam"] = self.getDamStr()
                fields["status"] = self.getStatusStr()
                fields["sex"] = self.getSexStr()
                fields["metal_ear_tag"] = self.getMetalEarTagStr()
                fields["other_id"] = self.getOtherIdStr()
                fields["breeder_id"] = self.getBreederIdStr()
                fields["is_deleted"] = self.getIsDeletedStr()

                return fields
            }
        }
        return fields

    }
    
    func getFields() -> [String: String] {
        
        var fields = [String: String]()
        fields["_id"] = self.getIdStr()
        fields["registration"] = self.getRegistrationStr()
        fields["private_herd_number"] = self.getPrivateHerdNumberStr()
        fields["eid"] = self.getEidStr()
        fields["animal_name"] = self.getAnimalNameStr()
        fields["international_id"] = self.getInternationalIdStr()
        fields["sire"] = self.getSireStr()
        fields["dam"] = self.getDamStr()
        fields["status"] = self.getStatusStr()
        fields["sex"] = self.getSexStr()
        fields["metal_ear_tag"] = self.getMetalEarTagStr()
        fields["other_id"] = self.getOtherIdStr()
        fields["breeder_id"] = self.getBreederIdStr()
        fields["is_deleted"] = self.getIsDeletedStr()
        return fields
    }
    
    func getFieldsPG() -> [String: String] {
        
        var fields = [String: String]()
        
        
        fields["_id"] = self.getIdStrPG()
        fields["registration"] = self.getRegistrationStrPG()
        fields["private_herd_number"] = self.getPrivateHerdNumberStrPG()
        fields["eid"] = self.getEidStrPG()
        fields["animal_name"] = self.getAnimalNameStrPG()
        fields["international_id"] = self.getInternationalIdStrPG()
        fields["sire"] = self.getSireStrPG()
        fields["dam"] = self.getDamStrPG()
        fields["status"] = self.getStatusStrPG()
        fields["sex"] = self.getSexStrPG()
        fields["metal_ear_tag"] = self.getMetalEarTagStrPG()
        fields["other_id"] = self.getOtherIdStrPG()
        fields["breeder_id"] = self.getBreederIdStrPG()
        fields["is_deleted"] = self.getIsDeletedStrPG()
        return fields    }
    
    func addNew() {
        
        var statement = "INSERT INTO animal ("
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
        
        var statement = "INSERT INTO animal ("
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
            
            var statement = "INSERT INTO animal ("
            
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
        
        var statement = "UPDATE animal "
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
        statement += "WHERE registration = " + (forID)
        
        let dbn = Database()
        dbn.query(statement)
    }
    
    func updatePG(forID: String) {
        
        // get all field/values as string values
        var fields = self.getFieldsPG()
        
        var statement = "UPDATE animal "
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
        statement += "WHERE registration = " + (forID)
        
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    func delete(forID: String) {
        let query = "DELETE FROM animal WHERE registration = " + (forID)
        let dbn = Database()
        dbn.query(query)
    }
    
    
    func deletePG(forID: String) {
        
        let statement = "DELETE FROM animal WHERE registration = " + (forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    class func getLastID() -> String {
        let _id: String = ""
        let query = "SELECT _id from animal ORDER BY _id DESC LIMIT 1 "
        let (resultset, err) = SD.executeQuery(query)
        if (err == nil) {
            if resultset.count > 0 {
                let row = resultset[0]
                let _id2 = row["_id"]?.asString() ?? ""
                
                return _id2
                
            }
        }
        return _id
    }
}
