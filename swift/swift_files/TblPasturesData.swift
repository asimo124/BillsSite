

//
//  TblPastures.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblPasturesData {

	var pk_id: Int = -1
    var pk_id_str: String = "unset"
	var member_id: Int = -1
    var member_id_str: String = "unset"
	var premise_id: String = "unset"
    var premise_id_str: String = "unset"
	var pasture_id: String = "unset"
    var pasture_id_str: String = "unset"
	var pasture_description: String = "unset"
    var pasture_description_str: String = "unset"
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

	func setMemberId(member_id: Int?) {
        self.member_id = member_id ?? 0
        let member_id2 = member_id ?? 0
        self.member_id_str = String(member_id2)
        self.member_id_str = (self.member_id_str == "0") ? "" : self.member_id_str
    }
    func getMemberId() -> Int {
        return self.member_id
    }
    func getMemberIdType() -> String {
        return "Int"
    };
	func getMemberIdStr() -> String {
        return member_id_str
    };
	func getMemberIdStrPG() -> String {
        return member_id_str
    };

	func setPremiseId(premise_id: String?) {
        self.premise_id = premise_id ?? ""
        self.premise_id_str = String(self.premise_id)
    }
    func getPremiseId() -> String {
        return self.premise_id
    }
    func getPremiseIdType() -> String {
        return "String"
    };
	func getPremiseIdStr() -> String {
        return premise_id_str == "unset" ? "" : premise_id_str
    };
	func getPremiseIdStrPG() -> String {
        return premise_id_str == "unset" ? "" : premise_id_str
    };

	func setPastureId(pasture_id: String?) {
        self.pasture_id = pasture_id ?? ""
        self.pasture_id_str = String(self.pasture_id)
    }
    func getPastureId() -> String {
        return self.pasture_id
    }
    func getPastureIdType() -> String {
        return "String"
    };
	func getPastureIdStr() -> String {
        return pasture_id_str == "unset" ? "" : pasture_id_str
    };
	func getPastureIdStrPG() -> String {
        return pasture_id_str == "unset" ? "" : pasture_id_str
    };

	func setPastureDescription(pasture_description: String?) {
        self.pasture_description = pasture_description ?? ""
        self.pasture_description_str = String(self.pasture_description)
    }
    func getPastureDescription() -> String {
        return self.pasture_description
    }
    func getPastureDescriptionType() -> String {
        return "String"
    };
	func getPastureDescriptionStr() -> String {
        return pasture_description_str == "unset" ? "" : pasture_description_str
    };
	func getPastureDescriptionStrPG() -> String {
        return pasture_description_str == "unset" ? "" : pasture_description_str
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
			case "member_id":
				return "Int"
			case "premise_id":
				return "String"
			case "pasture_id":
				return "String"
			case "pasture_description":
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
			case "member_id":
			return self.getMemberIdStr()
			case "premise_id":
			return self.getPremiseIdStr()
			case "pasture_id":
			return self.getPastureIdStr()
			case "pasture_description":
			return self.getPastureDescriptionStr()
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
    func findByMemberID(member_id: String) -> [TblPasturesData] {
        
        let query =
        "SELECT pk_id, pasture_id, pasture_description " +
        "FROM tbl_pastures " +
        "where member_id = ? ORDER BY pasture_id ASC "

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(member_id)

        var PasturesHolder = [TblPasturesData]()
        let (resultset, error) = SDOld.executeQuery(query, withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            if resultset.count > 0 {
                for row in resultset {

                    let Pasture = TblPasturesData()
                    Pasture.setPkId((row["pk_id"]?.asInt()));
                    Pasture.setMemberId((row["member_id"]?.asInt()));
                    Pasture.setPremiseId((row["premise_id"]?.asString()));
                    Pasture.setPastureId((row["pasture_id"]?.asString()));
                    Pasture.setPastureDescription((row["pasture_description"]?.asString()));
                    Pasture.setCreateUser((row["create_user"]?.asString()));
                    Pasture.setCreateStamp((row["create_stamp"]?.asDate()));
                    Pasture.setUpdateUser((row["update_user"]?.asString()));
                    Pasture.setUpdateStamp((row["update_stamp"]?.asDate()));
                    PasturesHolder.append(Pasture)
                }
            }
        }
        return PasturesHolder
    }
    
    func getAnimalCounts(pasture_id: Int) -> [String: String] {
        
        let utilVars = UtilVars()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let member_id = defaults.stringForKey("MemberID") ?? ""
        
        let association = defaults.stringForKey("db_name")
        let species = Species(species: defaults.stringForKey("species")!, association: association!, plural: false)
        let species_p = Species(species: defaults.stringForKey("species")!, association: association!, plural: true)
        
        var retVal = [String: Int]()
        retVal["TotalCount"] = 0
        retVal["BullsCount"] = 0
        retVal["CowsCount"] = 0
        retVal["CalfCount"] = 0
        retVal["OtherCount"] = 0
        
        
            
        // Bull Count
        var query =
            "SELECT COUNT(*) AS count " +
                "FROM tbl_animal A " +
                "INNER JOIN tbl_animal_data_birth B " +
                "ON A.animal_registration = B.animal_registration " +
                "INNER JOIN tbl_animal_location C " +
                "ON A.animal_registration = C.animal_registration " +
                "WHERE A.animal_record_status = 'A' " +
                "AND A.animal_sex = ? " +
                "AND julianday() - julianday(B.birth_date) >= ? " +
                "AND julianday() - julianday(B.birth_date) <= ? " +
                "AND C.pasture_id = ? " +
                "AND C.move_out_date = ? " +
        "GROUP BY A.animal_registration "
        
        var withArgs = [AnyObject]()
        withArgs.append(species.breeding_male_code)
        withArgs.append(species.male_breeding_min)
        withArgs.append(species.male_breeding_max)
        withArgs.append(pasture_id)
        withArgs.append(NSDate.distantPast() as NSDate)
        
        retVal["BullsCount"] = DBUtils.selectCountGroupsFromQuery(query, withArgs: withArgs)
        
        
        // Cow Count
        query =
            "SELECT COUNT(*) AS count " +
            "FROM tbl_animal A " +
            "INNER JOIN tbl_animal_data_birth B " +
            "ON A.animal_registration = B.animal_registration " +
            "INNER JOIN tbl_animal_location C " +
            "ON A.animal_registration = C.animal_registration " +
            "WHERE A.animal_record_status = 'A' " +
            "AND A.animal_sex = ? " +
            "AND julianday() - julianday(B.birth_date) >= ? " +
            "AND julianday() - julianday(B.birth_date) <= ? " +
            "AND C.pasture_id = ? " +
            "AND C.move_out_date = ? " +
        "GROUP BY A.animal_registration "
        
        withArgs = []
        withArgs.append(species.breeding_female_code)
        withArgs.append(species.female_breeding_min)
        withArgs.append(species.female_breeding_max)
        withArgs.append(pasture_id)
        withArgs.append(NSDate.distantPast() as NSDate)
        
        retVal["CowsCount"] = DBUtils.selectCountGroupsFromQuery(query, withArgs: withArgs)
        
        
        
        // Calf Count
        query =
            "SELECT COUNT(*) AS count " +
            "FROM tbl_animal A " +
            "INNER JOIN tbl_animal_data_birth B " +
            "ON A.animal_registration = B.animal_registration " +
            "INNER JOIN tbl_animal_location C " +
            "ON A.animal_registration = C.animal_registration " +
            "WHERE A.animal_record_status = 'A' " +
            "AND julianday() - julianday(B.birth_date) >= ? " +
            "AND julianday() - julianday(B.birth_date) <= ? " +
            "AND C.pasture_id = ? " +
            "AND C.move_out_date = ? " +
        "GROUP BY A.animal_registration "
        
        withArgs = []
        withArgs.append(species.male_prewean_min)
        withArgs.append(species.male_prewean_max)
        withArgs.append(pasture_id)
        withArgs.append(NSDate.distantPast() as NSDate)
        
        retVal["CalfCount"] = DBUtils.selectCountGroupsFromQuery(query, withArgs: withArgs)
        
        
        
        // Total Count
        query =
            "SELECT COUNT(*) AS count " +
            "FROM tbl_animal A " +
            "INNER JOIN tbl_animal_data_birth B " +
            "ON A.animal_registration = B.animal_registration " +
            "INNER JOIN tbl_animal_location C " +
            "ON A.animal_registration = C.animal_registration " +
            "WHERE A.animal_record_status = 'A' " +
            "AND C.pasture_id = ? " +
            "AND C.move_out_date = ? " +
        "GROUP BY A.animal_registration "
        
        withArgs = []
        withArgs.append(pasture_id)
        withArgs.append(NSDate.distantPast() as NSDate)
        
    
        // Total Count
        retVal["TotalCount"] = DBUtils.selectCountGroupsFromQuery(query, withArgs: withArgs)
        
        // Remaining Other Count
        retVal["OtherCount"] = retVal["TotalCount"]! - (retVal["BullsCount"]! + retVal["CowsCount"]! + retVal["CalfCount"]!)
        
        var retVal2 = [String: String]()
        for (key, value) in retVal {
            let tempVal = value ?? 0
            retVal2[key] = String(tempVal)
        }
        
        return retVal2
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["pk_id"] = self.getPkIdStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["premise_id"] = self.getPremiseIdStr()
		fields["pasture_id"] = self.getPastureIdStr()
		fields["pasture_description"] = self.getPastureDescriptionStr()
		fields["create_user"] = self.getCreateUserStr()
		fields["create_stamp"] = self.getCreateStampStr()
		fields["update_user"] = self.getUpdateUserStr()
		fields["update_stamp"] = self.getUpdateStampStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["pk_id"] = self.getPkIdStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["premise_id"] = self.getPremiseIdStrPG()
		fields["pasture_id"] = self.getPastureIdStrPG()
		fields["pasture_description"] = self.getPastureDescriptionStrPG()
		fields["create_user"] = self.getCreateUserStrPG()
		fields["create_stamp"] = self.getCreateStampStrPG()
		fields["update_user"] = self.getUpdateUserStrPG()
		fields["update_stamp"] = self.getUpdateStampStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_pastures ("
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

        var statement = "INSERT INTO tbl_pastures ("
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

            var statement = "INSERT INTO tbl_pastures ("

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

        var statement = "UPDATE tbl_pastures "
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
        statement += "WHERE member_id = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query(statement)
    }

    func updatePG(forID: String) {

        // get all field/values as string values
        var fields = self.getFieldsPG()

        var statement = "UPDATE tbl_pastures "
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
        statement += "WHERE member_id = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    func delete(forID: Int) {
        let query = "DELETE FROM tbl_pastures WHERE member_id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM tbl_pastures WHERE member_id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastmemberId() -> String {
        let member_id: String = ""
        let query = "SELECT member_id from tbl_pastures ORDER BY _id DESC LIMIT 1 "
        let (resultset, err) = SDOld.executeQuery(query)
        if (err == nil) {
            if resultset.count > 0 {
                let row = resultset[0]
                let member_id2 = row["member_id"]?.asString() ?? ""

                return member_id2

            }
        }
        return member_id
    }
}
