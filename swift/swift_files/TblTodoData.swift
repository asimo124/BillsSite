

//
//  TblTodo.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblTodoData {

	var todo_id: Int = -1
    var todo_id_str: String = "unset"
	var member_id: String = "unset"
    var member_id_str: String = "unset"
	var header: String = "unset"
    var header_str: String = "unset"
	var details: String = "unset"
    var details_str: String = "unset"
	var date_due: NSDate = NSDate.distantFuture() as NSDate
    var date_due_str: String = "unset"
	var date_completed: NSDate = NSDate.distantFuture() as NSDate
    var date_completed_str: String = "unset"
	var flag_completed: Int = -1
    var flag_completed_str: String = "unset"
	var create_user: String = "unset"
    var create_user_str: String = "unset"
	var create_stamp: NSDate = NSDate.distantFuture() as NSDate
    var create_stamp_str: String = "unset"
	var update_user: String = "unset"
    var update_user_str: String = "unset"
	var update_stamp: NSDate = NSDate.distantFuture() as NSDate
    var update_stamp_str: String = "unset"
	var flag_deleted: Int = -1
    var flag_deleted_str: String = "unset"
	
	func setTodoId(todo_id: Int?) {
        self.todo_id = todo_id ?? 0
        let todo_id2 = todo_id ?? 0
        self.todo_id_str = String(todo_id2)
        self.todo_id_str = (self.todo_id_str == "0") ? "" : self.todo_id_str
    }
    func getTodoId() -> Int {
        return self.todo_id
    }
    func getTodoIdType() -> String {
        return "Int"
    };
	func getTodoIdStr() -> String {
        return todo_id_str
    };
	func getTodoIdStrPG() -> String {
        return todo_id_str
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

	func setHeader(header: String?) {
        self.header = header ?? ""
        self.header_str = String(self.header)
    }
    func getHeader() -> String {
        return self.header
    }
    func getHeaderType() -> String {
        return "String"
    };
	func getHeaderStr() -> String {
        return header_str == "unset" ? "" : header_str
    };
	func getHeaderStrPG() -> String {
        return header_str == "unset" ? "" : header_str
    };

	func setDetails(details: String?) {
        self.details = details ?? ""
        self.details_str = String(self.details)
    }
    func getDetails() -> String {
        return self.details
    }
    func getDetailsType() -> String {
        return "String"
    };
	func getDetailsStr() -> String {
        return details_str == "unset" ? "" : details_str
    };
	func getDetailsStrPG() -> String {
        return details_str == "unset" ? "" : details_str
    };

	func setDateDue(date_due: NSDate?) {
        self.date_due = date_due ?? NSDate.distantPast() as NSDate
        self.date_due_str = Utils.dateToString(self.date_due)
    }
    func getDateDue() -> NSDate {
        return self.date_due
    }
    func getDateDueType() -> String {
        return "NSDate"
    };
	func getDateDueStr() -> String {
        return date_due_str == "unset" || date_due_str == "0000-12-30 00:00:00 +0000" ? "" : date_due_str
    };
	func getDateDueStrPG() -> String {
        return date_due_str == "unset" || date_due_str == "0000-12-30 00:00:00 +0000" ? "" : date_due_str
    };

	func setDateCompleted(date_completed: NSDate?) {
        self.date_completed = date_completed ?? NSDate.distantPast() as NSDate
        self.date_completed_str = Utils.dateToString(self.date_completed)
    }
    func getDateCompleted() -> NSDate {
        return self.date_completed
    }
    func getDateCompletedType() -> String {
        return "NSDate"
    };
	func getDateCompletedStr() -> String {
        return date_completed_str == "unset" || date_completed_str == "0000-12-30 00:00:00 +0000" ? "" : date_completed_str
    };
	func getDateCompletedStrPG() -> String {
        return date_completed_str == "unset" || date_completed_str == "0000-12-30 00:00:00 +0000" ? "" : date_completed_str
    };

	func setFlagCompleted(flag_completed: Int?) {
        self.flag_completed = flag_completed ?? 0
        self.flag_completed_str = ((self.flag_completed) == 1) ? "t" : "f"
    }
    func getFlagCompleted() -> Int {
        return self.flag_completed
    }
    func getFlagCompletedType() -> String {
        return "Int"
    };
	func getFlagCompletedStr() -> String {
        return String(flag_completed)
    };
	func getFlagCompletedStrPG() -> String {
        return flag_completed_str
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

	func setFlagDeleted(flag_deleted: Int?) {
        self.flag_deleted = flag_deleted ?? 0
        self.flag_deleted_str = ((self.flag_deleted) == 1) ? "t" : "f"
    }
    func getFlagDeleted() -> Int {
        return self.flag_deleted
    }
    func getFlagDeletedType() -> String {
        return "Int"
    };
	func getFlagDeletedStr() -> String {
        return String(flag_deleted)
    };
	func getFlagDeletedStrPG() -> String {
        return flag_deleted_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "todo_id":
				return "Int"
			case "member_id":
				return "String"
			case "header":
				return "String"
			case "details":
				return "String"
			case "date_due":
				return "NSDate"
			case "date_completed":
				return "NSDate"
			case "flag_completed":
				return "Int"
			case "create_user":
				return "String"
			case "create_stamp":
				return "NSDate"
			case "update_user":
				return "String"
			case "update_stamp":
				return "NSDate"
			case "flag_deleted":
				return "Int"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "todo_id":
			return self.getTodoIdStr()
			case "member_id":
			return self.getMemberIdStr()
			case "header":
			return self.getHeaderStr()
			case "details":
			return self.getDetailsStr()
			case "date_due":
			return self.getDateDueStr()
			case "date_completed":
			return self.getDateCompletedStr()
			case "flag_completed":
			return self.getFlagCompletedStr()
			case "create_user":
			return self.getCreateUserStr()
			case "create_stamp":
			return self.getCreateStampStr()
			case "update_user":
			return self.getUpdateUserStr()
			case "update_stamp":
			return self.getUpdateStampStr()
			case "flag_deleted":
			return self.getFlagDeletedStr()
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
        qb.selectFrom("tbl_todo")
            .Where("member_id = ?")

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(member_id)

        var fields = [String: String]()
        let (resultset, error) = SDOld.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setTodoId((row["todo_id"]?.asInt()));
				self.setMemberId((row["member_id"]?.asString()));
				self.setHeader((row["header"]?.asString()));
				self.setDetails((row["details"]?.asString()));
				self.setDateDue((row["date_due"]?.asDate()));
				self.setDateCompleted((row["date_completed"]?.asDate()));
				self.setFlagCompleted((row["flag_completed"]?.asMyBool()));
				self.setCreateUser((row["create_user"]?.asString()));
				self.setCreateStamp((row["create_stamp"]?.asDate()));
				self.setUpdateUser((row["update_user"]?.asString()));
				self.setUpdateStamp((row["update_stamp"]?.asDate()));
				self.setFlagDeleted((row["flag_deleted"]?.asMyBool()));

				var fields = [String: String]()
				fields["todo_id"] = self.getTodoIdStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["header"] = self.getHeaderStr()
				fields["details"] = self.getDetailsStr()
				fields["date_due"] = self.getDateDueStr()
				fields["date_completed"] = self.getDateCompletedStr()
				fields["flag_completed"] = self.getFlagCompletedStr()
				fields["create_user"] = self.getCreateUserStr()
				fields["create_stamp"] = self.getCreateStampStr()
				fields["update_user"] = self.getUpdateUserStr()
				fields["update_stamp"] = self.getUpdateStampStr()
				fields["flag_deleted"] = self.getFlagDeletedStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["todo_id"] = self.getTodoIdStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["header"] = self.getHeaderStr()
		fields["details"] = self.getDetailsStr()
		fields["date_due"] = self.getDateDueStr()
		fields["date_completed"] = self.getDateCompletedStr()
		fields["flag_completed"] = self.getFlagCompletedStr()
		fields["create_user"] = self.getCreateUserStr()
		fields["create_stamp"] = self.getCreateStampStr()
		fields["update_user"] = self.getUpdateUserStr()
		fields["update_stamp"] = self.getUpdateStampStr()
		fields["flag_deleted"] = self.getFlagDeletedStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["todo_id"] = self.getTodoIdStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["header"] = self.getHeaderStrPG()
		fields["details"] = self.getDetailsStrPG()
		fields["date_due"] = self.getDateDueStrPG()
		fields["date_completed"] = self.getDateCompletedStrPG()
		fields["flag_completed"] = self.getFlagCompletedStrPG()
		fields["create_user"] = self.getCreateUserStrPG()
		fields["create_stamp"] = self.getCreateStampStrPG()
		fields["update_user"] = self.getUpdateUserStrPG()
		fields["update_stamp"] = self.getUpdateStampStrPG()
		fields["flag_deleted"] = self.getFlagDeletedStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_todo ("
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

        var statement = "INSERT INTO tbl_todo ("
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

            var statement = "INSERT INTO tbl_todo ("

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

        var statement = "UPDATE tbl_todo "
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

        var statement = "UPDATE tbl_todo "
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
        let query = "DELETE FROM tbl_todo WHERE member_id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM tbl_todo WHERE member_id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastmemberId() -> String {
        let member_id: String = ""
        let query = "SELECT member_id from tbl_todo ORDER BY _id DESC LIMIT 1 "
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
