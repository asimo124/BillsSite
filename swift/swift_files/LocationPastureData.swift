

//
//  LocationPasture.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class LocationPastureData {

	var _id: Int = -1
    var _id_str: String = "unset"
	var pasture_id: Int = -1
    var pasture_id_str: String = "unset"
	var pasture_name: String = "unset"
    var pasture_name_str: String = "unset"
	var pasture_description: String = "unset"
    var pasture_description_str: String = "unset"
	var member_id: String = "unset"
    var member_id_str: String = "unset"
	
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

	func setPastureId(pasture_id: Int?) {
        self.pasture_id = pasture_id ?? 0
        let pasture_id2 = pasture_id ?? 0
        self.pasture_id_str = String(pasture_id2)
        self.pasture_id_str = (self.pasture_id_str == "0") ? "" : self.pasture_id_str
    }
    func getPastureId() -> Int {
        return self.pasture_id
    }
    func getPastureIdType() -> String {
        return "Int"
    };
	func getPastureIdStr() -> String {
        return pasture_id_str
    };
	func getPastureIdStrPG() -> String {
        return pasture_id_str
    };

	func setPastureName(pasture_name: String?) {
        self.pasture_name = pasture_name ?? ""
        self.pasture_name_str = String(self.pasture_name)
    }
    func getPastureName() -> String {
        return self.pasture_name
    }
    func getPastureNameType() -> String {
        return "String"
    };
	func getPastureNameStr() -> String {
        return pasture_name_str == "unset" ? "" : pasture_name_str
    };
	func getPastureNameStrPG() -> String {
        return pasture_name_str == "unset" ? "" : pasture_name_str
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

	func getFieldType(field: String) -> String {
        switch field {
			case "_id":
				return "Int"
			case "pasture_id":
				return "Int"
			case "pasture_name":
				return "String"
			case "pasture_description":
				return "String"
			case "member_id":
				return "String"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "_id":
			return self.getIdStr()
			case "pasture_id":
			return self.getPastureIdStr()
			case "pasture_name":
			return self.getPastureNameStr()
			case "pasture_description":
			return self.getPastureDescriptionStr()
			case "member_id":
			return self.getMemberIdStr()
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
    func findByMemberID(member_id: String) -> [LocationPastureData] {
        
        let query =
        "SELECT * FROM pasture " +
        "WHERE member_id = ? "

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(member_id)

        var PasturesHolder = [LocationPastureData]()
        let (resultset, error) = SD.executeQuery(query, withArgs: fieldsArr)
        if (error != nil) {
            SD.printDie(error!)
        } else {
            if resultset.count > 0 {
                for row in resultset {

                    let Pasture = LocationPastureData()
                    Pasture.setId((row["_id"]?.asInt()));
                    Pasture.setPastureId((row["pasture_id"]?.asInt()));
                    Pasture.setPastureName((row["pasture_name"]?.asString()));
                    Pasture.setPastureDescription((row["pasture_description"]?.asString()));
                    Pasture.setMemberId((row["member_id"]?.asString()));
                    PasturesHolder.append(Pasture)
                }
            }
        }
        return PasturesHolder
    }
    
    func getAnimalCounts(pasture_id: Int) -> [String: String] {
        
        print("ccc 999")
        
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
        "FROM animal A " +
        "INNER JOIN animal_birth B " +
            "ON A.registration = B.registration " +
        "INNER JOIN animal_location C " +
            "ON A.registration = C.registration " +
        "WHERE A.status = 0 " +
        "AND A.sex = ? " +
        "AND julianday() - julianday(B.birth_date) >= ? " +
        "AND julianday() - julianday(B.birth_date) <= ? " +
        "AND A.is_deleted = 0 " +
        "AND C.pasture_id = ? " +
        "AND (ifnull(C.move_out, '') = '' OR ifnull(C.move_out, '') = '') " +
        "GROUP BY A.registration "
        
        var withArgs = [AnyObject]()
        withArgs.append(species.breeding_male_code)
        withArgs.append(species.male_breeding_min)
        withArgs.append(species.male_breeding_max)
        withArgs.append(pasture_id)
        
        retVal["BullsCount"] = DBUtils.selectCountFromQuery(query, withArgs: withArgs)
        
        
        // Cow Count
        query =
        "SELECT COUNT(*) AS count " +
            "FROM animal A " +
            "INNER JOIN animal_birth B " +
            "ON A.registration = B.registration " +
            "INNER JOIN animal_location C " +
            "ON A.registration = C.registration " +
        "WHERE A.status = 0 " +
        "AND A.sex = ? " +
        "AND julianday() - julianday(B.birth_date) >= ? " +
        "AND julianday() - julianday(B.birth_date) <= ? " +
        "AND A.is_deleted = 0 " +
        "AND C.pasture_id = ? " +
        "AND (ifnull(C.move_out, '') = '' OR ifnull(C.move_out, '') = '') " +
        "GROUP BY A.registration "
    
        withArgs = []
        withArgs.append(species.breeding_female_code)
        withArgs.append(species.female_breeding_min)
        withArgs.append(species.female_breeding_max)
        withArgs.append(pasture_id)
        
        retVal["CowsCount"] = DBUtils.selectCountFromQuery(query, withArgs: withArgs)

        
        // Calf Count
        query =
        "SELECT COUNT(*) AS count " +
        "FROM animal A " +
        "INNER JOIN animal_birth B " +
            "ON A.registration = B.registration " +
        "INNER JOIN animal_location C " +
            "ON A.registration = C.registration " +
        "WHERE A.status = 0 " +
        "AND julianday() - julianday(B.birth_date) >= ? " +
        "AND julianday() - julianday(B.birth_date) <= ? " +
        "AND A.is_deleted = 0 " +
        "AND C.pasture_id = ? " +
        "AND (ifnull(C.move_out, '') = '' OR ifnull(C.move_out, '') = '') " +
        "GROUP BY A.registration "
        
        withArgs = []
        withArgs.append(species.male_prewean_min)
        withArgs.append(species.male_prewean_max)
        withArgs.append(pasture_id)
        
        retVal["CalfCount"] = DBUtils.selectCountFromQuery(query, withArgs: withArgs)
        
        
        
        // Total Count
        query =
            "SELECT COUNT(*) AS count " +
            "FROM animal A " +
            "INNER JOIN animal_birth B " +
            "ON A.registration = B.registration " +
            "INNER JOIN animal_location C " +
            "ON A.registration = C.registration " +
            "WHERE A.status = 0 " +
            "AND A.is_deleted = 0 " +
            "AND C.pasture_id = ? " +
            "AND (ifnull(C.move_out, '') = '' OR ifnull(C.move_out, '') = '') " +
        "GROUP BY A.registration "
        
        withArgs = []
        withArgs.append(pasture_id)
        
        // Total Count
        retVal["TotalCount"] = DBUtils.selectCountFromQuery(query, withArgs: withArgs)
        
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
		fields["_id"] = self.getIdStr()
		fields["pasture_id"] = self.getPastureIdStr()
		fields["pasture_name"] = self.getPastureNameStr()
		fields["pasture_description"] = self.getPastureDescriptionStr()
		fields["member_id"] = self.getMemberIdStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["_id"] = self.getIdStrPG()
		fields["pasture_id"] = self.getPastureIdStrPG()
		fields["pasture_name"] = self.getPastureNameStrPG()
		fields["pasture_description"] = self.getPastureDescriptionStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO pasture ("
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

        var statement = "INSERT INTO pasture ("
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

            var statement = "INSERT INTO pasture ("

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

        var statement = "UPDATE pasture "
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
        statement += "WHERE member_id = " + String(forID)

        let dbn = Database()
        dbn.query(statement)
    }

    func updatePG(forID: String) {

        // get all field/values as string values
        var fields = self.getFieldsPG()

        var statement = "UPDATE pasture "
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
        statement += "WHERE member_id = " + String(forID)

        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    func delete(forID: Int) {
        let query = "DELETE FROM pasture WHERE member_id = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM pasture WHERE member_id = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastmemberId() -> String {
        let member_id: String = ""
        let query = "SELECT member_id from pasture ORDER BY _id DESC LIMIT 1 "
        let (resultset, err) = SD.executeQuery(query)
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
