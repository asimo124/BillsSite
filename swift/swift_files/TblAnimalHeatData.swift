

//
//  TblAnimalHeat.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalHeatData {

	var pk_id: Int = -1
    var pk_id_str: String = "unset"
	var owner_id: Int = -1
    var owner_id_str: String = "unset"
	var animal_registration: String = "unset"
    var animal_registration_str: String = "unset"
	var animal_phn: String = "unset"
    var animal_phn_str: String = "unset"
	var heat_date: NSDate = NSDate.distantFuture() as NSDate
    var heat_date_str: String = "unset"
	var am_pm: String = "unset"
    var am_pm_str: String = "unset"
	var create_user: String = "unset"
    var create_user_str: String = "unset"
	var create_stamp: NSDate = NSDate.distantFuture() as NSDate
    var create_stamp_str: String = "unset"
	var update_user: String = "unset"
    var update_user_str: String = "unset"
	var update_stamp: NSDate = NSDate.distantFuture() as NSDate
    var update_stamp_str: String = "unset"
	
	func setPkId(pk_id: Int?) {
        self.pk_id = pk_id ?? 0
        let pk_id2 = pk_id ?? 0
        self.pk_id_str = String(pk_id2)
        self.pk_id_str = (self.pk_id_str == "0") ? "" : self.pk_id_str
    }
    func getPkId() -> Int {
        return self.pk_id
    }
    func getPkIdType() -> String {
        return "Int"
    };
	func getPkIdStr() -> String {
        return pk_id_str
    };
	func getPkIdStrPG() -> String {
        return pk_id_str
    };

	func setOwnerId(owner_id: Int?) {
        self.owner_id = owner_id ?? 0
        let owner_id2 = owner_id ?? 0
        self.owner_id_str = String(owner_id2)
        self.owner_id_str = (self.owner_id_str == "0") ? "" : self.owner_id_str
    }
    func getOwnerId() -> Int {
        return self.owner_id
    }
    func getOwnerIdType() -> String {
        return "Int"
    };
	func getOwnerIdStr() -> String {
        return owner_id_str
    };
	func getOwnerIdStrPG() -> String {
        return owner_id_str
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

	func setAnimalPhn(animal_phn: String?) {
        self.animal_phn = animal_phn ?? ""
        self.animal_phn_str = String(self.animal_phn)
    }
    func getAnimalPhn() -> String {
        return self.animal_phn
    }
    func getAnimalPhnType() -> String {
        return "String"
    };
	func getAnimalPhnStr() -> String {
        return animal_phn_str == "unset" ? "" : animal_phn_str
    };
	func getAnimalPhnStrPG() -> String {
        return animal_phn_str == "unset" ? "" : animal_phn_str
    };

	func setHeatDate(heat_date: NSDate?) {
        self.heat_date = heat_date ?? NSDate.distantPast() as NSDate
        self.heat_date_str = Utils.dateToString(self.heat_date)
    }
    func getHeatDate() -> NSDate {
        return self.heat_date
    }
    func getHeatDateType() -> String {
        return "NSDate"
    };
	func getHeatDateStr() -> String {
        return heat_date_str == "unset" || heat_date_str == "0000-12-30 00:00:00 +0000" ? "" : heat_date_str
    };
	func getHeatDateStrPG() -> String {
        return heat_date_str == "unset" || heat_date_str == "0000-12-30 00:00:00 +0000" ? "" : heat_date_str
    };

	func setAmPm(am_pm: String?) {
        self.am_pm = am_pm ?? ""
        self.am_pm_str = String(self.am_pm)
    }
    func getAmPm() -> String {
        return self.am_pm
    }
    func getAmPmType() -> String {
        return "String"
    };
	func getAmPmStr() -> String {
        return am_pm_str == "unset" ? "" : am_pm_str
    };
	func getAmPmStrPG() -> String {
        return am_pm_str == "unset" ? "" : am_pm_str
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

	func setCreateStamp(create_stamp: NSDate?) {
        self.create_stamp = create_stamp ?? NSDate.distantPast() as NSDate
        self.create_stamp_str = Utils.dateToString(self.create_stamp)
    }
    func getCreateStamp() -> NSDate {
        return self.create_stamp
    }
    func getCreateStampType() -> String {
        return "NSDate"
    };
	func getCreateStampStr() -> String {
        return create_stamp_str == "unset" || create_stamp_str == "0000-12-30 00:00:00 +0000" ? "" : create_stamp_str
    };
	func getCreateStampStrPG() -> String {
        return create_stamp_str == "unset" || create_stamp_str == "0000-12-30 00:00:00 +0000" ? "" : create_stamp_str
    };

	func setUpdateUser(update_user: String?) {
        self.update_user = update_user ?? ""
        self.update_user_str = String(self.update_user)
    }
    func getUpdateUser() -> String {
        return self.update_user
    }
    func getUpdateUserType() -> String {
        return "String"
    };
	func getUpdateUserStr() -> String {
        return update_user_str == "unset" ? "" : update_user_str
    };
	func getUpdateUserStrPG() -> String {
        return update_user_str == "unset" ? "" : update_user_str
    };

	func setUpdateStamp(update_stamp: NSDate?) {
        self.update_stamp = update_stamp ?? NSDate.distantPast() as NSDate
        self.update_stamp_str = Utils.dateToString(self.update_stamp)
    }
    func getUpdateStamp() -> NSDate {
        return self.update_stamp
    }
    func getUpdateStampType() -> String {
        return "NSDate"
    };
	func getUpdateStampStr() -> String {
        return update_stamp_str == "unset" || update_stamp_str == "0000-12-30 00:00:00 +0000" ? "" : update_stamp_str
    };
	func getUpdateStampStrPG() -> String {
        return update_stamp_str == "unset" || update_stamp_str == "0000-12-30 00:00:00 +0000" ? "" : update_stamp_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "pk_id":
				return "Int"
			case "owner_id":
				return "Int"
			case "animal_registration":
				return "String"
			case "animal_phn":
				return "String"
			case "heat_date":
				return "NSDate"
			case "am_pm":
				return "String"
			case "create_user":
				return "String"
			case "create_stamp":
				return "NSDate"
			case "update_user":
				return "String"
			case "update_stamp":
				return "NSDate"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "pk_id":
			return self.getPkIdStr()
			case "owner_id":
			return self.getOwnerIdStr()
			case "animal_registration":
			return self.getAnimalRegistrationStr()
			case "animal_phn":
			return self.getAnimalPhnStr()
			case "heat_date":
			return self.getHeatDateStr()
			case "am_pm":
			return self.getAmPmStr()
			case "create_user":
			return self.getCreateUserStr()
			case "create_stamp":
			return self.getCreateStampStr()
			case "update_user":
			return self.getUpdateUserStr()
			case "update_stamp":
			return self.getUpdateStampStr()
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
        qb.selectFrom("tbl_animal_heat")
            .Where("animal_registration = ?")

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(animal_registration)

        var fields = [String: String]()
        let (resultset, error) = SDOld.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setPkId((row["pk_id"]?.asInt()));
				self.setOwnerId((row["owner_id"]?.asInt()));
				self.setAnimalRegistration((row["animal_registration"]?.asString()));
				self.setAnimalPhn((row["animal_phn"]?.asString()));
				self.setHeatDate((row["heat_date"]?.asDate()));
				self.setAmPm((row["am_pm"]?.asString()));
				self.setCreateUser((row["create_user"]?.asString()));
				self.setCreateStamp((row["create_stamp"]?.asDate()));
				self.setUpdateUser((row["update_user"]?.asString()));
				self.setUpdateStamp((row["update_stamp"]?.asDate()));

				var fields = [String: String]()
				fields["pk_id"] = self.getPkIdStr()
				fields["owner_id"] = self.getOwnerIdStr()
				fields["animal_registration"] = self.getAnimalRegistrationStr()
				fields["animal_phn"] = self.getAnimalPhnStr()
				fields["heat_date"] = self.getHeatDateStr()
				fields["am_pm"] = self.getAmPmStr()
				fields["create_user"] = self.getCreateUserStr()
				fields["create_stamp"] = self.getCreateStampStr()
				fields["update_user"] = self.getUpdateUserStr()
				fields["update_stamp"] = self.getUpdateStampStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["pk_id"] = self.getPkIdStr()
		fields["owner_id"] = self.getOwnerIdStr()
		fields["animal_registration"] = self.getAnimalRegistrationStr()
		fields["animal_phn"] = self.getAnimalPhnStr()
		fields["heat_date"] = self.getHeatDateStr()
		fields["am_pm"] = self.getAmPmStr()
		fields["create_user"] = self.getCreateUserStr()
		fields["create_stamp"] = self.getCreateStampStr()
		fields["update_user"] = self.getUpdateUserStr()
		fields["update_stamp"] = self.getUpdateStampStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["pk_id"] = self.getPkIdStrPG()
		fields["owner_id"] = self.getOwnerIdStrPG()
		fields["animal_registration"] = self.getAnimalRegistrationStrPG()
		fields["animal_phn"] = self.getAnimalPhnStrPG()
		fields["heat_date"] = self.getHeatDateStrPG()
		fields["am_pm"] = self.getAmPmStrPG()
		fields["create_user"] = self.getCreateUserStrPG()
		fields["create_stamp"] = self.getCreateStampStrPG()
		fields["update_user"] = self.getUpdateUserStrPG()
		fields["update_stamp"] = self.getUpdateStampStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_animal_heat ("
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

        var statement = "INSERT INTO tbl_animal_heat ("
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

            var statement = "INSERT INTO tbl_animal_heat ("

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

        var statement = "UPDATE tbl_animal_heat "
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

        var statement = "UPDATE tbl_animal_heat "
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
        let query = "DELETE FROM tbl_animal_heat WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM tbl_animal_heat WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastanimalRegistration() -> String {
        let animal_registration: String = ""
        let query = "SELECT animal_registration from tbl_animal_heat ORDER BY _id DESC LIMIT 1 "
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