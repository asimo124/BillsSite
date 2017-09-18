

//
//  Ownership.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class OwnershipData {

	var ownership_id: Int = -1
    var ownership_id_str: String = "unset"
	var registration: String = "unset"
    var registration_str: String = "unset"
	var member_id: String = "unset"
    var member_id_str: String = "unset"
	var amount: Int = -1
    var amount_str: String = "unset"
	var date_owned: NSDate = NSDate.distantFuture() as NSDate
    var date_owned_str: String = "unset"
	var superceded: Int = -1
    var superceded_str: String = "unset"
	var previous_owner: String = "unset"
    var previous_owner_str: String = "unset"
	
	func setOwnershipId(ownership_id: Int?) {
        self.ownership_id = ownership_id ?? 0
        let ownership_id2 = ownership_id ?? 0
        self.ownership_id_str = String(ownership_id2)
        self.ownership_id_str = (self.ownership_id_str == "0") ? "" : self.ownership_id_str
    }
    func getOwnershipId() -> Int {
        return self.ownership_id
    }
    func getOwnershipIdType() -> String {
        return "Int"
    };
	func getOwnershipIdStr() -> String {
        return ownership_id_str
    };
	func getOwnershipIdStrPG() -> String {
        return ownership_id_str
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

	func setAmount(amount: Int?) {
        self.amount = amount ?? 0
        let amount2 = amount ?? 0
        self.amount_str = String(amount2)
        self.amount_str = (self.amount_str == "0") ? "" : self.amount_str
    }
    func getAmount() -> Int {
        return self.amount
    }
    func getAmountType() -> String {
        return "Int"
    };
	func getAmountStr() -> String {
        return amount_str
    };
	func getAmountStrPG() -> String {
        return amount_str
    };

	func setDateOwned(date_owned: NSDate?) {
        self.date_owned = date_owned ?? NSDate.distantPast() as NSDate
        self.date_owned_str = Utils.dateToString(self.date_owned)
    }
    func getDateOwned() -> NSDate {
        return self.date_owned
    }
    func getDateOwnedType() -> String {
        return "NSDate"
    };
	func getDateOwnedStr() -> String {
        return date_owned_str == "unset" || date_owned_str == "0000-12-30 00:00:00 +0000" ? "" : date_owned_str
    };
	func getDateOwnedStrPG() -> String {
        return date_owned_str == "unset" || date_owned_str == "0000-12-30 00:00:00 +0000" ? "" : date_owned_str
    };

	func setSuperceded(superceded: Int?) {
        self.superceded = superceded ?? 0
        self.superceded_str = ((self.superceded) == 1) ? "t" : "f"
    }
    func getSuperceded() -> Int {
        return self.superceded
    }
    func getSupercededType() -> String {
        return "Int"
    };
	func getSupercededStr() -> String {
        return String(superceded)
    };
	func getSupercededStrPG() -> String {
        return superceded_str
    };

	func setPreviousOwner(previous_owner: String?) {
        self.previous_owner = previous_owner ?? ""
        self.previous_owner_str = String(self.previous_owner)
    }
    func getPreviousOwner() -> String {
        return self.previous_owner
    }
    func getPreviousOwnerType() -> String {
        return "String"
    };
	func getPreviousOwnerStr() -> String {
        return previous_owner_str == "unset" ? "" : previous_owner_str
    };
	func getPreviousOwnerStrPG() -> String {
        return previous_owner_str == "unset" ? "" : previous_owner_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "ownership_id":
				return "Int"
			case "registration":
				return "String"
			case "member_id":
				return "String"
			case "amount":
				return "Int"
			case "date_owned":
				return "NSDate"
			case "superceded":
				return "Int"
			case "previous_owner":
				return "String"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "ownership_id":
			return self.getOwnershipIdStr()
			case "registration":
			return self.getRegistrationStr()
			case "member_id":
			return self.getMemberIdStr()
			case "amount":
			return self.getAmountStr()
			case "date_owned":
			return self.getDateOwnedStr()
			case "superceded":
			return self.getSupercededStr()
			case "previous_owner":
			return self.getPreviousOwnerStr()
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
    func loadByID(member_id: String) -> [String: String] {
        let qb = QueryBuilder()
        qb.selectFrom("ownership")
            .Where("member_id = ?")

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(member_id)

        var fields = [String: String]()
        let (resultset, error) = SD.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SD.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setOwnershipId((row["ownership_id"]?.asInt()));
				self.setRegistration((row["registration"]?.asString()));
				self.setMemberId((row["member_id"]?.asString()));
				self.setAmount((row["amount"]?.asInt()));
				self.setDateOwned((row["date_owned"]?.asDate()));
				self.setSuperceded((row["superceded"]?.asMyBool()));
				self.setPreviousOwner((row["previous_owner"]?.asString()));

				fields["ownership_id"] = self.getOwnershipIdStr()
				fields["registration"] = self.getRegistrationStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["amount"] = self.getAmountStr()
				fields["date_owned"] = self.getDateOwnedStr()
				fields["superceded"] = self.getSupercededStr()
				fields["previous_owner"] = self.getPreviousOwnerStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["ownership_id"] = self.getOwnershipIdStr()
		fields["registration"] = self.getRegistrationStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["amount"] = self.getAmountStr()
		fields["date_owned"] = self.getDateOwnedStr()
		fields["superceded"] = self.getSupercededStr()
		fields["previous_owner"] = self.getPreviousOwnerStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["ownership_id"] = self.getOwnershipIdStrPG()
		fields["registration"] = self.getRegistrationStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["amount"] = self.getAmountStrPG()
		fields["date_owned"] = self.getDateOwnedStrPG()
		fields["superceded"] = self.getSupercededStrPG()
		fields["previous_owner"] = self.getPreviousOwnerStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO ownership ("
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

        var statement = "INSERT INTO ownership ("
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

            var statement = "INSERT INTO ownership ("

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

        var statement = "UPDATE ownership "
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

        var statement = "UPDATE ownership "
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
        let query = "DELETE FROM ownership WHERE member_id = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM ownership WHERE member_id = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastmemberId() -> String {
        let member_id: String = ""
        let query = "SELECT member_id from ownership ORDER BY _id DESC LIMIT 1 "
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
