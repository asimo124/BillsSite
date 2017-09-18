

//
//  PartnershipMembers.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class PartnershipMembersData {

	var partnership_member_id: Int = -1
    var partnership_member_id_str: String = "unset"
	var partnership_id: Int = -1
    var partnership_id_str: String = "unset"
	var member_id: String = "unset"
    var member_id_str: String = "unset"
	var begin_date: NSDate = NSDate.distantFuture() as NSDate
    var begin_date_str: String = "unset"
	var end_date: NSDate = NSDate.distantFuture() as NSDate
    var end_date_str: String = "unset"
	var is_primary: Int = -1
    var is_primary_str: String = "unset"
	var is_accepted: Int = -1
    var is_accepted_str: String = "unset"
	
	func setPartnershipMemberId(partnership_member_id: Int?) {
        self.partnership_member_id = partnership_member_id ?? 0
        let partnership_member_id2 = partnership_member_id ?? 0
        self.partnership_member_id_str = String(partnership_member_id2)
        self.partnership_member_id_str = (self.partnership_member_id_str == "0") ? "" : self.partnership_member_id_str
    }
    func getPartnershipMemberId() -> Int {
        return self.partnership_member_id
    }
    func getPartnershipMemberIdType() -> String {
        return "Int"
    };
	func getPartnershipMemberIdStr() -> String {
        return partnership_member_id_str
    };
	func getPartnershipMemberIdStrPG() -> String {
        return partnership_member_id_str
    };

	func setPartnershipId(partnership_id: Int?) {
        self.partnership_id = partnership_id ?? 0
        let partnership_id2 = partnership_id ?? 0
        self.partnership_id_str = String(partnership_id2)
        self.partnership_id_str = (self.partnership_id_str == "0") ? "" : self.partnership_id_str
    }
    func getPartnershipId() -> Int {
        return self.partnership_id
    }
    func getPartnershipIdType() -> String {
        return "Int"
    };
	func getPartnershipIdStr() -> String {
        return partnership_id_str
    };
	func getPartnershipIdStrPG() -> String {
        return partnership_id_str
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

	func setBeginDate(begin_date: NSDate?) {
        self.begin_date = begin_date ?? NSDate.distantPast() as NSDate
        self.begin_date_str = Utils.dateToString(self.begin_date)
    }
    func getBeginDate() -> NSDate {
        return self.begin_date
    }
    func getBeginDateType() -> String {
        return "NSDate"
    };
	func getBeginDateStr() -> String {
        return begin_date_str == "unset" || begin_date_str == "0000-12-30 00:00:00 +0000" ? "" : begin_date_str
    };
	func getBeginDateStrPG() -> String {
        return begin_date_str == "unset" || begin_date_str == "0000-12-30 00:00:00 +0000" ? "" : begin_date_str
    };

	func setEndDate(end_date: NSDate?) {
        self.end_date = end_date ?? NSDate.distantPast() as NSDate
        self.end_date_str = Utils.dateToString(self.end_date)
    }
    func getEndDate() -> NSDate {
        return self.end_date
    }
    func getEndDateType() -> String {
        return "NSDate"
    };
	func getEndDateStr() -> String {
        return end_date_str == "unset" || end_date_str == "0000-12-30 00:00:00 +0000" ? "" : end_date_str
    };
	func getEndDateStrPG() -> String {
        return end_date_str == "unset" || end_date_str == "0000-12-30 00:00:00 +0000" ? "" : end_date_str
    };

	func setIsPrimary(is_primary: Int?) {
        self.is_primary = is_primary ?? 0
        self.is_primary_str = ((self.is_primary) == 1) ? "t" : "f"
    }
    func getIsPrimary() -> Int {
        return self.is_primary
    }
    func getIsPrimaryType() -> String {
        return "Int"
    };
	func getIsPrimaryStr() -> String {
        return String(is_primary)
    };
	func getIsPrimaryStrPG() -> String {
        return is_primary_str
    };

	func setIsAccepted(is_accepted: Int?) {
        self.is_accepted = is_accepted ?? 0
        self.is_accepted_str = ((self.is_accepted) == 1) ? "t" : "f"
    }
    func getIsAccepted() -> Int {
        return self.is_accepted
    }
    func getIsAcceptedType() -> String {
        return "Int"
    };
	func getIsAcceptedStr() -> String {
        return String(is_accepted)
    };
	func getIsAcceptedStrPG() -> String {
        return is_accepted_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "partnership_member_id":
				return "Int"
			case "partnership_id":
				return "Int"
			case "member_id":
				return "String"
			case "begin_date":
				return "NSDate"
			case "end_date":
				return "NSDate"
			case "is_primary":
				return "Int"
			case "is_accepted":
				return "Int"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "partnership_member_id":
			return self.getPartnershipMemberIdStr()
			case "partnership_id":
			return self.getPartnershipIdStr()
			case "member_id":
			return self.getMemberIdStr()
			case "begin_date":
			return self.getBeginDateStr()
			case "end_date":
			return self.getEndDateStr()
			case "is_primary":
			return self.getIsPrimaryStr()
			case "is_accepted":
			return self.getIsAcceptedStr()
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
        qb.selectFrom("partnership_members")
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

				self.setPartnershipMemberId((row["partnership_member_id"]?.asInt()));
				self.setPartnershipId((row["partnership_id"]?.asInt()));
				self.setMemberId((row["member_id"]?.asString()));
				self.setBeginDate((row["begin_date"]?.asDate()));
				self.setEndDate((row["end_date"]?.asDate()));
				self.setIsPrimary((row["is_primary"]?.asMyBool()));
				self.setIsAccepted((row["is_accepted"]?.asMyBool()));

				
				fields["partnership_member_id"] = self.getPartnershipMemberIdStr()
				fields["partnership_id"] = self.getPartnershipIdStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["begin_date"] = self.getBeginDateStr()
				fields["end_date"] = self.getEndDateStr()
				fields["is_primary"] = self.getIsPrimaryStr()
				fields["is_accepted"] = self.getIsAcceptedStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["partnership_member_id"] = self.getPartnershipMemberIdStr()
		fields["partnership_id"] = self.getPartnershipIdStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["begin_date"] = self.getBeginDateStr()
		fields["end_date"] = self.getEndDateStr()
		fields["is_primary"] = self.getIsPrimaryStr()
		fields["is_accepted"] = self.getIsAcceptedStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["partnership_member_id"] = self.getPartnershipMemberIdStrPG()
		fields["partnership_id"] = self.getPartnershipIdStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["begin_date"] = self.getBeginDateStrPG()
		fields["end_date"] = self.getEndDateStrPG()
		fields["is_primary"] = self.getIsPrimaryStrPG()
		fields["is_accepted"] = self.getIsAcceptedStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO partnership_members ("
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

        var statement = "INSERT INTO partnership_members ("
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

            var statement = "INSERT INTO partnership_members ("

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

        var statement = "UPDATE partnership_members "
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

        var statement = "UPDATE partnership_members "
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
        let query = "DELETE FROM partnership_members WHERE member_id = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM partnership_members WHERE member_id = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastmemberId() -> String {
        let member_id: String = ""
        let query = "SELECT member_id from partnership_members ORDER BY _id DESC LIMIT 1 "
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
