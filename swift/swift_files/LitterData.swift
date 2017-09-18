

//
//  Litter.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class LitterData {

	var litter_id: Int = -1
    var litter_id_str: String = "unset"
	var member_id: String = "unset"
    var member_id_str: String = "unset"
	var birth_date: NSDate = NSDate.distantFuture() as NSDate
    var birth_date_str: String = "unset"
	var litter_group: String = "unset"
    var litter_group_str: String = "unset"
	var mother: String = "unset"
    var mother_str: String = "unset"
	var father: String = "unset"
    var father_str: String = "unset"
	var registration: String = "unset"
    var registration_str: String = "unset"
	var total_born: Int = -1
    var total_born_str: String = "unset"
	var born_alive: Int = -1
    var born_alive_str: String = "unset"
	var litter_number: String = "unset"
    var litter_number_str: String = "unset"
	var number_weaned: Int = -1
    var number_weaned_str: String = "unset"
	var date_received: NSDate = NSDate.distantFuture() as NSDate
    var date_received_str: String = "unset"
	
	func setLitterId(litter_id: Int?) {
        self.litter_id = litter_id ?? 0
        let litter_id2 = litter_id ?? 0
        self.litter_id_str = String(litter_id2)
        self.litter_id_str = (self.litter_id_str == "0") ? "" : self.litter_id_str
    }
    func getLitterId() -> Int {
        return self.litter_id
    }
    func getLitterIdType() -> String {
        return "Int"
    };
	func getLitterIdStr() -> String {
        return litter_id_str
    };
	func getLitterIdStrPG() -> String {
        return litter_id_str
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

	func setBirthDate(birth_date: NSDate?) {
        self.birth_date = birth_date ?? NSDate.distantPast() as NSDate
        self.birth_date_str = Utils.dateToString(self.birth_date)
    }
    func getBirthDate() -> NSDate {
        return self.birth_date
    }
    func getBirthDateType() -> String {
        return "NSDate"
    };
	func getBirthDateStr() -> String {
        return birth_date_str == "unset" || birth_date_str == "0000-12-30 00:00:00 +0000" ? "" : birth_date_str
    };
	func getBirthDateStrPG() -> String {
        return birth_date_str == "unset" || birth_date_str == "0000-12-30 00:00:00 +0000" ? "" : birth_date_str
    };

	func setLitterGroup(litter_group: String?) {
        self.litter_group = litter_group ?? ""
        self.litter_group_str = String(self.litter_group)
    }
    func getLitterGroup() -> String {
        return self.litter_group
    }
    func getLitterGroupType() -> String {
        return "String"
    };
	func getLitterGroupStr() -> String {
        return litter_group_str == "unset" ? "" : litter_group_str
    };
	func getLitterGroupStrPG() -> String {
        return litter_group_str == "unset" ? "" : litter_group_str
    };

	func setMother(mother: String?) {
        self.mother = mother ?? ""
        self.mother_str = String(self.mother)
    }
    func getMother() -> String {
        return self.mother
    }
    func getMotherType() -> String {
        return "String"
    };
	func getMotherStr() -> String {
        return mother_str == "unset" ? "" : mother_str
    };
	func getMotherStrPG() -> String {
        return mother_str == "unset" ? "" : mother_str
    };

	func setFather(father: String?) {
        self.father = father ?? ""
        self.father_str = String(self.father)
    }
    func getFather() -> String {
        return self.father
    }
    func getFatherType() -> String {
        return "String"
    };
	func getFatherStr() -> String {
        return father_str == "unset" ? "" : father_str
    };
	func getFatherStrPG() -> String {
        return father_str == "unset" ? "" : father_str
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

	func setTotalBorn(total_born: Int?) {
        self.total_born = total_born ?? 0
        let total_born2 = total_born ?? 0
        self.total_born_str = String(total_born2)
        self.total_born_str = (self.total_born_str == "0") ? "" : self.total_born_str
    }
    func getTotalBorn() -> Int {
        return self.total_born
    }
    func getTotalBornType() -> String {
        return "Int"
    };
	func getTotalBornStr() -> String {
        return total_born_str
    };
	func getTotalBornStrPG() -> String {
        return total_born_str
    };

	func setBornAlive(born_alive: Int?) {
        self.born_alive = born_alive ?? 0
        let born_alive2 = born_alive ?? 0
        self.born_alive_str = String(born_alive2)
        self.born_alive_str = (self.born_alive_str == "0") ? "" : self.born_alive_str
    }
    func getBornAlive() -> Int {
        return self.born_alive
    }
    func getBornAliveType() -> String {
        return "Int"
    };
	func getBornAliveStr() -> String {
        return born_alive_str
    };
	func getBornAliveStrPG() -> String {
        return born_alive_str
    };

	func setLitterNumber(litter_number: String?) {
        self.litter_number = litter_number ?? ""
        self.litter_number_str = String(self.litter_number)
    }
    func getLitterNumber() -> String {
        return self.litter_number
    }
    func getLitterNumberType() -> String {
        return "String"
    };
	func getLitterNumberStr() -> String {
        return litter_number_str == "unset" ? "" : litter_number_str
    };
	func getLitterNumberStrPG() -> String {
        return litter_number_str == "unset" ? "" : litter_number_str
    };

	func setNumberWeaned(number_weaned: Int?) {
        self.number_weaned = number_weaned ?? 0
        let number_weaned2 = number_weaned ?? 0
        self.number_weaned_str = String(number_weaned2)
        self.number_weaned_str = (self.number_weaned_str == "0") ? "" : self.number_weaned_str
    }
    func getNumberWeaned() -> Int {
        return self.number_weaned
    }
    func getNumberWeanedType() -> String {
        return "Int"
    };
	func getNumberWeanedStr() -> String {
        return number_weaned_str
    };
	func getNumberWeanedStrPG() -> String {
        return number_weaned_str
    };

	func setDateReceived(date_received: NSDate?) {
        self.date_received = date_received ?? NSDate.distantPast() as NSDate
        self.date_received_str = Utils.dateToString(self.date_received)
    }
    func getDateReceived() -> NSDate {
        return self.date_received
    }
    func getDateReceivedType() -> String {
        return "NSDate"
    };
	func getDateReceivedStr() -> String {
        return date_received_str == "unset" || date_received_str == "0000-12-30 00:00:00 +0000" ? "" : date_received_str
    };
	func getDateReceivedStrPG() -> String {
        return date_received_str == "unset" || date_received_str == "0000-12-30 00:00:00 +0000" ? "" : date_received_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "litter_id":
				return "Int"
			case "member_id":
				return "String"
			case "birth_date":
				return "NSDate"
			case "litter_group":
				return "String"
			case "mother":
				return "String"
			case "father":
				return "String"
			case "registration":
				return "String"
			case "total_born":
				return "Int"
			case "born_alive":
				return "Int"
			case "litter_number":
				return "String"
			case "number_weaned":
				return "Int"
			case "date_received":
				return "NSDate"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "litter_id":
			return self.getLitterIdStr()
			case "member_id":
			return self.getMemberIdStr()
			case "birth_date":
			return self.getBirthDateStr()
			case "litter_group":
			return self.getLitterGroupStr()
			case "mother":
			return self.getMotherStr()
			case "father":
			return self.getFatherStr()
			case "registration":
			return self.getRegistrationStr()
			case "total_born":
			return self.getTotalBornStr()
			case "born_alive":
			return self.getBornAliveStr()
			case "litter_number":
			return self.getLitterNumberStr()
			case "number_weaned":
			return self.getNumberWeanedStr()
			case "date_received":
			return self.getDateReceivedStr()
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
        qb.selectFrom("litter")
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

				self.setLitterId((row["litter_id"]?.asInt()));
				self.setMemberId((row["member_id"]?.asString()));
				self.setBirthDate((row["birth_date"]?.asDate()));
				self.setLitterGroup((row["litter_group"]?.asString()));
				self.setMother((row["mother"]?.asString()));
				self.setFather((row["father"]?.asString()));
				self.setRegistration((row["registration"]?.asString()));
				self.setTotalBorn((row["total_born"]?.asInt()));
				self.setBornAlive((row["born_alive"]?.asInt()));
				self.setLitterNumber((row["litter_number"]?.asString()));
				self.setNumberWeaned((row["number_weaned"]?.asInt()));
				self.setDateReceived((row["date_received"]?.asDate()));

				
				fields["litter_id"] = self.getLitterIdStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["birth_date"] = self.getBirthDateStr()
				fields["litter_group"] = self.getLitterGroupStr()
				fields["mother"] = self.getMotherStr()
				fields["father"] = self.getFatherStr()
				fields["registration"] = self.getRegistrationStr()
				fields["total_born"] = self.getTotalBornStr()
				fields["born_alive"] = self.getBornAliveStr()
				fields["litter_number"] = self.getLitterNumberStr()
				fields["number_weaned"] = self.getNumberWeanedStr()
				fields["date_received"] = self.getDateReceivedStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["litter_id"] = self.getLitterIdStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["birth_date"] = self.getBirthDateStr()
		fields["litter_group"] = self.getLitterGroupStr()
		fields["mother"] = self.getMotherStr()
		fields["father"] = self.getFatherStr()
		fields["registration"] = self.getRegistrationStr()
		fields["total_born"] = self.getTotalBornStr()
		fields["born_alive"] = self.getBornAliveStr()
		fields["litter_number"] = self.getLitterNumberStr()
		fields["number_weaned"] = self.getNumberWeanedStr()
		fields["date_received"] = self.getDateReceivedStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["litter_id"] = self.getLitterIdStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["birth_date"] = self.getBirthDateStrPG()
		fields["litter_group"] = self.getLitterGroupStrPG()
		fields["mother"] = self.getMotherStrPG()
		fields["father"] = self.getFatherStrPG()
		fields["registration"] = self.getRegistrationStrPG()
		fields["total_born"] = self.getTotalBornStrPG()
		fields["born_alive"] = self.getBornAliveStrPG()
		fields["litter_number"] = self.getLitterNumberStrPG()
		fields["number_weaned"] = self.getNumberWeanedStrPG()
		fields["date_received"] = self.getDateReceivedStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO litter ("
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
        
        print("statement:", statement)

        let dbn = Database()
        dbn.query(statement)
    }

    func addNewPG() {

        var statement = "INSERT INTO litter ("
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

            var statement = "INSERT INTO litter ("

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

        var statement = "UPDATE litter "
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

        var statement = "UPDATE litter "
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
        let query = "DELETE FROM litter WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM litter WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastregistration() -> String {
        let registration: String = ""
        let query = "SELECT registration from litter ORDER BY _id DESC LIMIT 1 "
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
