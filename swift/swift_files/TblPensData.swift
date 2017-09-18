

//
//  TblPens.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblPensData {

	var pen_id: Int = -1
    var pen_id_str: String = "unset"
	var member_id: String = "unset"
    var member_id_str: String = "unset"
	var pen_name: String = "unset"
    var pen_name_str: String = "unset"
	var pen_description: String = "unset"
    var pen_description_str: String = "unset"
	var premise_id: String = "unset"
    var premise_id_str: String = "unset"
	var create_user: String = "unset"
    var create_user_str: String = "unset"
	var create_stamp: NSDate = NSDate.distantFuture() as NSDate
    var create_stamp_str: String = "unset"
	var update_user: String = "unset"
    var update_user_str: String = "unset"
	var update_stamp: NSDate = NSDate.distantFuture() as NSDate
    var update_stamp_str: String = "unset"
	
	func setPenId(pen_id: Int?) {
        self.pen_id = pen_id ?? 0
        let pen_id2 = pen_id ?? 0
        self.pen_id_str = String(pen_id2)
        self.pen_id_str = (self.pen_id_str == "0") ? "" : self.pen_id_str
    }
    func getPenId() -> Int {
        return self.pen_id
    }
    func getPenIdType() -> String {
        return "Int"
    };
	func getPenIdStr() -> String {
        return pen_id_str
    };
	func getPenIdStrPG() -> String {
        return pen_id_str
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

	func setPenName(pen_name: String?) {
        self.pen_name = pen_name ?? ""
        self.pen_name_str = String(self.pen_name)
    }
    func getPenName() -> String {
        return self.pen_name
    }
    func getPenNameType() -> String {
        return "String"
    };
	func getPenNameStr() -> String {
        return pen_name_str == "unset" ? "" : pen_name_str
    };
	func getPenNameStrPG() -> String {
        return pen_name_str == "unset" ? "" : pen_name_str
    };

	func setPenDescription(pen_description: String?) {
        self.pen_description = pen_description ?? ""
        self.pen_description_str = String(self.pen_description)
    }
    func getPenDescription() -> String {
        return self.pen_description
    }
    func getPenDescriptionType() -> String {
        return "String"
    };
	func getPenDescriptionStr() -> String {
        return pen_description_str == "unset" ? "" : pen_description_str
    };
	func getPenDescriptionStrPG() -> String {
        return pen_description_str == "unset" ? "" : pen_description_str
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
			case "pen_id":
				return "Int"
			case "member_id":
				return "String"
			case "pen_name":
				return "String"
			case "pen_description":
				return "String"
			case "premise_id":
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
			case "pen_id":
			return self.getPenIdStr()
			case "member_id":
			return self.getMemberIdStr()
			case "pen_name":
			return self.getPenNameStr()
			case "pen_description":
			return self.getPenDescriptionStr()
			case "premise_id":
			return self.getPremiseIdStr()
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
    func loadByID(member_id: String) -> [String: String] {
        let qb = QueryBuilder()
        qb.selectFrom("tbl_pens")
            .Where("member_id = ?")

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(member_id)

        let fields = [String: String]()
        let (resultset, error) = SDOld.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setPenId((row["pen_id"]?.asInt()));
				self.setMemberId((row["member_id"]?.asString()));
				self.setPenName((row["pen_name"]?.asString()));
				self.setPenDescription((row["pen_description"]?.asString()));
				self.setPremiseId((row["premise_id"]?.asString()));
				self.setCreateUser((row["create_user"]?.asString()));
				self.setCreateStamp((row["create_stamp"]?.asDate()));
				self.setUpdateUser((row["update_user"]?.asString()));
				self.setUpdateStamp((row["update_stamp"]?.asDate()));

				var fields = [String: String]()
				fields["pen_id"] = self.getPenIdStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["pen_name"] = self.getPenNameStr()
				fields["pen_description"] = self.getPenDescriptionStr()
				fields["premise_id"] = self.getPremiseIdStr()
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
		fields["pen_id"] = self.getPenIdStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["pen_name"] = self.getPenNameStr()
		fields["pen_description"] = self.getPenDescriptionStr()
		fields["premise_id"] = self.getPremiseIdStr()
		fields["create_user"] = self.getCreateUserStr()
		fields["create_stamp"] = self.getCreateStampStr()
		fields["update_user"] = self.getUpdateUserStr()
		fields["update_stamp"] = self.getUpdateStampStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["pen_id"] = self.getPenIdStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["pen_name"] = self.getPenNameStrPG()
		fields["pen_description"] = self.getPenDescriptionStrPG()
		fields["premise_id"] = self.getPremiseIdStrPG()
		fields["create_user"] = self.getCreateUserStrPG()
		fields["create_stamp"] = self.getCreateStampStrPG()
		fields["update_user"] = self.getUpdateUserStrPG()
		fields["update_stamp"] = self.getUpdateStampStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_pens ("
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

        var statement = "INSERT INTO tbl_pens ("
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

            var statement = "INSERT INTO tbl_pens ("

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

        var statement = "UPDATE tbl_pens "
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

        var statement = "UPDATE tbl_pens "
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
        let query = "DELETE FROM tbl_pens WHERE member_id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM tbl_pens WHERE member_id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastmemberId() -> String {
        let member_id: String = ""
        let query = "SELECT member_id from tbl_pens ORDER BY _id DESC LIMIT 1 "
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
