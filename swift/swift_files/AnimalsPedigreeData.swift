

//
//  AnimalsPedigree.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsPedigreeData {

	var pedigree_id: Int = -1
    var pedigree_id_str: String = "unset"
	var registration: String = "unset"
    var registration_str: String = "unset"
	var member_id: String = "unset"
    var member_id_str: String = "unset"
	var is_validated: Int = -1
    var is_validated_str: String = "unset"
	var sire: String = "unset"
    var sire_str: String = "unset"
	var dam: String = "unset"
    var dam_str: String = "unset"
	var sire_sire: String = "unset"
    var sire_sire_str: String = "unset"
	var sire_sire_sire: String = "unset"
    var sire_sire_sire_str: String = "unset"
	var sire_sire_dam: String = "unset"
    var sire_sire_dam_str: String = "unset"
	var sire_dam: String = "unset"
    var sire_dam_str: String = "unset"
	var sire_dam_sire: String = "unset"
    var sire_dam_sire_str: String = "unset"
	var sire_dam_dam: String = "unset"
    var sire_dam_dam_str: String = "unset"
	var dam_sire_sire: String = "unset"
    var dam_sire_sire_str: String = "unset"
	var dam_sire_dam: String = "unset"
    var dam_sire_dam_str: String = "unset"
	var dam_sire: String = "unset"
    var dam_sire_str: String = "unset"
	var dam_dam: String = "unset"
    var dam_dam_str: String = "unset"
	var dam_dam_sire: String = "unset"
    var dam_dam_sire_str: String = "unset"
	var dam_dam_dam: String = "unset"
    var dam_dam_dam_str: String = "unset"
	
	func setPedigreeId(pedigree_id: Int?) {
        self.pedigree_id = pedigree_id ?? 0
        let pedigree_id2 = pedigree_id ?? 0
        self.pedigree_id_str = String(pedigree_id2)
        self.pedigree_id_str = (self.pedigree_id_str == "0") ? "" : self.pedigree_id_str
    }
    func getPedigreeId() -> Int {
        return self.pedigree_id
    }
    func getPedigreeIdType() -> String {
        return "Int"
    };
	func getPedigreeIdStr() -> String {
        return pedigree_id_str
    };
	func getPedigreeIdStrPG() -> String {
        return pedigree_id_str
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

	func setIsValidated(is_validated: Int?) {
        self.is_validated = is_validated ?? 0
        self.is_validated_str = ((self.is_validated) == 1) ? "t" : "f"
    }
    func getIsValidated() -> Int {
        return self.is_validated
    }
    func getIsValidatedType() -> String {
        return "Int"
    };
	func getIsValidatedStr() -> String {
        return String(is_validated)
    };
	func getIsValidatedStrPG() -> String {
        return is_validated_str
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

	func setSireSire(sire_sire: String?) {
        self.sire_sire = sire_sire ?? ""
        self.sire_sire_str = String(self.sire_sire)
    }
    func getSireSire() -> String {
        return self.sire_sire
    }
    func getSireSireType() -> String {
        return "String"
    };
	func getSireSireStr() -> String {
        return sire_sire_str == "unset" ? "" : sire_sire_str
    };
	func getSireSireStrPG() -> String {
        return sire_sire_str == "unset" ? "" : sire_sire_str
    };

	func setSireSireSire(sire_sire_sire: String?) {
        self.sire_sire_sire = sire_sire_sire ?? ""
        self.sire_sire_sire_str = String(self.sire_sire_sire)
    }
    func getSireSireSire() -> String {
        return self.sire_sire_sire
    }
    func getSireSireSireType() -> String {
        return "String"
    };
	func getSireSireSireStr() -> String {
        return sire_sire_sire_str == "unset" ? "" : sire_sire_sire_str
    };
	func getSireSireSireStrPG() -> String {
        return sire_sire_sire_str == "unset" ? "" : sire_sire_sire_str
    };

	func setSireSireDam(sire_sire_dam: String?) {
        self.sire_sire_dam = sire_sire_dam ?? ""
        self.sire_sire_dam_str = String(self.sire_sire_dam)
    }
    func getSireSireDam() -> String {
        return self.sire_sire_dam
    }
    func getSireSireDamType() -> String {
        return "String"
    };
	func getSireSireDamStr() -> String {
        return sire_sire_dam_str == "unset" ? "" : sire_sire_dam_str
    };
	func getSireSireDamStrPG() -> String {
        return sire_sire_dam_str == "unset" ? "" : sire_sire_dam_str
    };

	func setSireDam(sire_dam: String?) {
        self.sire_dam = sire_dam ?? ""
        self.sire_dam_str = String(self.sire_dam)
    }
    func getSireDam() -> String {
        return self.sire_dam
    }
    func getSireDamType() -> String {
        return "String"
    };
	func getSireDamStr() -> String {
        return sire_dam_str == "unset" ? "" : sire_dam_str
    };
	func getSireDamStrPG() -> String {
        return sire_dam_str == "unset" ? "" : sire_dam_str
    };

	func setSireDamSire(sire_dam_sire: String?) {
        self.sire_dam_sire = sire_dam_sire ?? ""
        self.sire_dam_sire_str = String(self.sire_dam_sire)
    }
    func getSireDamSire() -> String {
        return self.sire_dam_sire
    }
    func getSireDamSireType() -> String {
        return "String"
    };
	func getSireDamSireStr() -> String {
        return sire_dam_sire_str == "unset" ? "" : sire_dam_sire_str
    };
	func getSireDamSireStrPG() -> String {
        return sire_dam_sire_str == "unset" ? "" : sire_dam_sire_str
    };

	func setSireDamDam(sire_dam_dam: String?) {
        self.sire_dam_dam = sire_dam_dam ?? ""
        self.sire_dam_dam_str = String(self.sire_dam_dam)
    }
    func getSireDamDam() -> String {
        return self.sire_dam_dam
    }
    func getSireDamDamType() -> String {
        return "String"
    };
	func getSireDamDamStr() -> String {
        return sire_dam_dam_str == "unset" ? "" : sire_dam_dam_str
    };
	func getSireDamDamStrPG() -> String {
        return sire_dam_dam_str == "unset" ? "" : sire_dam_dam_str
    };

	func setDamSireSire(dam_sire_sire: String?) {
        self.dam_sire_sire = dam_sire_sire ?? ""
        self.dam_sire_sire_str = String(self.dam_sire_sire)
    }
    func getDamSireSire() -> String {
        return self.dam_sire_sire
    }
    func getDamSireSireType() -> String {
        return "String"
    };
	func getDamSireSireStr() -> String {
        return dam_sire_sire_str == "unset" ? "" : dam_sire_sire_str
    };
	func getDamSireSireStrPG() -> String {
        return dam_sire_sire_str == "unset" ? "" : dam_sire_sire_str
    };

	func setDamSireDam(dam_sire_dam: String?) {
        self.dam_sire_dam = dam_sire_dam ?? ""
        self.dam_sire_dam_str = String(self.dam_sire_dam)
    }
    func getDamSireDam() -> String {
        return self.dam_sire_dam
    }
    func getDamSireDamType() -> String {
        return "String"
    };
	func getDamSireDamStr() -> String {
        return dam_sire_dam_str == "unset" ? "" : dam_sire_dam_str
    };
	func getDamSireDamStrPG() -> String {
        return dam_sire_dam_str == "unset" ? "" : dam_sire_dam_str
    };

	func setDamSire(dam_sire: String?) {
        self.dam_sire = dam_sire ?? ""
        self.dam_sire_str = String(self.dam_sire)
    }
    func getDamSire() -> String {
        return self.dam_sire
    }
    func getDamSireType() -> String {
        return "String"
    };
	func getDamSireStr() -> String {
        return dam_sire_str == "unset" ? "" : dam_sire_str
    };
	func getDamSireStrPG() -> String {
        return dam_sire_str == "unset" ? "" : dam_sire_str
    };

	func setDamDam(dam_dam: String?) {
        self.dam_dam = dam_dam ?? ""
        self.dam_dam_str = String(self.dam_dam)
    }
    func getDamDam() -> String {
        return self.dam_dam
    }
    func getDamDamType() -> String {
        return "String"
    };
	func getDamDamStr() -> String {
        return dam_dam_str == "unset" ? "" : dam_dam_str
    };
	func getDamDamStrPG() -> String {
        return dam_dam_str == "unset" ? "" : dam_dam_str
    };

	func setDamDamSire(dam_dam_sire: String?) {
        self.dam_dam_sire = dam_dam_sire ?? ""
        self.dam_dam_sire_str = String(self.dam_dam_sire)
    }
    func getDamDamSire() -> String {
        return self.dam_dam_sire
    }
    func getDamDamSireType() -> String {
        return "String"
    };
	func getDamDamSireStr() -> String {
        return dam_dam_sire_str == "unset" ? "" : dam_dam_sire_str
    };
	func getDamDamSireStrPG() -> String {
        return dam_dam_sire_str == "unset" ? "" : dam_dam_sire_str
    };

	func setDamDamDam(dam_dam_dam: String?) {
        self.dam_dam_dam = dam_dam_dam ?? ""
        self.dam_dam_dam_str = String(self.dam_dam_dam)
    }
    func getDamDamDam() -> String {
        return self.dam_dam_dam
    }
    func getDamDamDamType() -> String {
        return "String"
    };
	func getDamDamDamStr() -> String {
        return dam_dam_dam_str == "unset" ? "" : dam_dam_dam_str
    };
	func getDamDamDamStrPG() -> String {
        return dam_dam_dam_str == "unset" ? "" : dam_dam_dam_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "pedigree_id":
				return "Int"
			case "registration":
				return "String"
			case "member_id":
				return "String"
			case "is_validated":
				return "Int"
			case "sire":
				return "String"
			case "dam":
				return "String"
			case "sire_sire":
				return "String"
			case "sire_sire_sire":
				return "String"
			case "sire_sire_dam":
				return "String"
			case "sire_dam":
				return "String"
			case "sire_dam_sire":
				return "String"
			case "sire_dam_dam":
				return "String"
			case "dam_sire_sire":
				return "String"
			case "dam_sire_dam":
				return "String"
			case "dam_sire":
				return "String"
			case "dam_dam":
				return "String"
			case "dam_dam_sire":
				return "String"
			case "dam_dam_dam":
				return "String"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "pedigree_id":
			return self.getPedigreeIdStr()
			case "registration":
			return self.getRegistrationStr()
			case "member_id":
			return self.getMemberIdStr()
			case "is_validated":
			return self.getIsValidatedStr()
			case "sire":
			return self.getSireStr()
			case "dam":
			return self.getDamStr()
			case "sire_sire":
			return self.getSireSireStr()
			case "sire_sire_sire":
			return self.getSireSireSireStr()
			case "sire_sire_dam":
			return self.getSireSireDamStr()
			case "sire_dam":
			return self.getSireDamStr()
			case "sire_dam_sire":
			return self.getSireDamSireStr()
			case "sire_dam_dam":
			return self.getSireDamDamStr()
			case "dam_sire_sire":
			return self.getDamSireSireStr()
			case "dam_sire_dam":
			return self.getDamSireDamStr()
			case "dam_sire":
			return self.getDamSireStr()
			case "dam_dam":
			return self.getDamDamStr()
			case "dam_dam_sire":
			return self.getDamDamSireStr()
			case "dam_dam_dam":
			return self.getDamDamDamStr()
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
        qb.selectFrom("animal_pedigree")
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

				self.setPedigreeId((row["pedigree_id"]?.asInt()));
				self.setRegistration((row["registration"]?.asString()));
				self.setMemberId((row["member_id"]?.asString()));
				self.setIsValidated((row["is_validated"]?.asMyBool()));
				self.setSire((row["sire"]?.asString()));
				self.setDam((row["dam"]?.asString()));
				self.setSireSire((row["sire_sire"]?.asString()));
				self.setSireSireSire((row["sire_sire_sire"]?.asString()));
				self.setSireSireDam((row["sire_sire_dam"]?.asString()));
				self.setSireDam((row["sire_dam"]?.asString()));
				self.setSireDamSire((row["sire_dam_sire"]?.asString()));
				self.setSireDamDam((row["sire_dam_dam"]?.asString()));
				self.setDamSireSire((row["dam_sire_sire"]?.asString()));
				self.setDamSireDam((row["dam_sire_dam"]?.asString()));
				self.setDamSire((row["dam_sire"]?.asString()));
				self.setDamDam((row["dam_dam"]?.asString()));
				self.setDamDamSire((row["dam_dam_sire"]?.asString()));
				self.setDamDamDam((row["dam_dam_dam"]?.asString()));

				
				fields["pedigree_id"] = self.getPedigreeIdStr()
				fields["registration"] = self.getRegistrationStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["is_validated"] = self.getIsValidatedStr()
				fields["sire"] = self.getSireStr()
				fields["dam"] = self.getDamStr()
				fields["sire_sire"] = self.getSireSireStr()
				fields["sire_sire_sire"] = self.getSireSireSireStr()
				fields["sire_sire_dam"] = self.getSireSireDamStr()
				fields["sire_dam"] = self.getSireDamStr()
				fields["sire_dam_sire"] = self.getSireDamSireStr()
				fields["sire_dam_dam"] = self.getSireDamDamStr()
				fields["dam_sire_sire"] = self.getDamSireSireStr()
				fields["dam_sire_dam"] = self.getDamSireDamStr()
				fields["dam_sire"] = self.getDamSireStr()
				fields["dam_dam"] = self.getDamDamStr()
				fields["dam_dam_sire"] = self.getDamDamSireStr()
				fields["dam_dam_dam"] = self.getDamDamDamStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["pedigree_id"] = self.getPedigreeIdStr()
		fields["registration"] = self.getRegistrationStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["is_validated"] = self.getIsValidatedStr()
		fields["sire"] = self.getSireStr()
		fields["dam"] = self.getDamStr()
		fields["sire_sire"] = self.getSireSireStr()
		fields["sire_sire_sire"] = self.getSireSireSireStr()
		fields["sire_sire_dam"] = self.getSireSireDamStr()
		fields["sire_dam"] = self.getSireDamStr()
		fields["sire_dam_sire"] = self.getSireDamSireStr()
		fields["sire_dam_dam"] = self.getSireDamDamStr()
		fields["dam_sire_sire"] = self.getDamSireSireStr()
		fields["dam_sire_dam"] = self.getDamSireDamStr()
		fields["dam_sire"] = self.getDamSireStr()
		fields["dam_dam"] = self.getDamDamStr()
		fields["dam_dam_sire"] = self.getDamDamSireStr()
		fields["dam_dam_dam"] = self.getDamDamDamStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["pedigree_id"] = self.getPedigreeIdStrPG()
		fields["registration"] = self.getRegistrationStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["is_validated"] = self.getIsValidatedStrPG()
		fields["sire"] = self.getSireStrPG()
		fields["dam"] = self.getDamStrPG()
		fields["sire_sire"] = self.getSireSireStrPG()
		fields["sire_sire_sire"] = self.getSireSireSireStrPG()
		fields["sire_sire_dam"] = self.getSireSireDamStrPG()
		fields["sire_dam"] = self.getSireDamStrPG()
		fields["sire_dam_sire"] = self.getSireDamSireStrPG()
		fields["sire_dam_dam"] = self.getSireDamDamStrPG()
		fields["dam_sire_sire"] = self.getDamSireSireStrPG()
		fields["dam_sire_dam"] = self.getDamSireDamStrPG()
		fields["dam_sire"] = self.getDamSireStrPG()
		fields["dam_dam"] = self.getDamDamStrPG()
		fields["dam_dam_sire"] = self.getDamDamSireStrPG()
		fields["dam_dam_dam"] = self.getDamDamDamStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO animal_pedigree ("
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

        var statement = "INSERT INTO animal_pedigree ("
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

            var statement = "INSERT INTO animal_pedigree ("

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

        var statement = "UPDATE animal_pedigree "
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

        var statement = "UPDATE animal_pedigree "
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
        let query = "DELETE FROM animal_pedigree WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM animal_pedigree WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastregistration() -> String {
        let registration: String = ""
        let query = "SELECT registration from animal_pedigree ORDER BY _id DESC LIMIT 1 "
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
