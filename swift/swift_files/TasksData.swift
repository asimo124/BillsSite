

//
//  Tasks.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TasksData {

	var _id: Int = -1
    var _id_str: String = "unset"
	var task_id: Int = -1
    var task_id_str: String = "unset"
	var member_id: String = "unset"
    var member_id_str: String = "unset"
	var header: String = "unset"
    var header_str: String = "unset"
	var details: String = "unset"
    var details_str: String = "unset"
	var due_date: NSDate = NSDate.distantFuture() as NSDate
    var due_date_str: String = "unset"
	var date_completed: NSDate = NSDate.distantFuture() as NSDate
    var date_completed_str: String = "unset"
	var is_completed: Int = -1
    var is_completed_str: String = "unset"
	
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

	func setTaskId(task_id: Int?) {
        self.task_id = task_id ?? 0
        let task_id2 = task_id ?? 0
        self.task_id_str = String(task_id2)
        self.task_id_str = (self.task_id_str == "0") ? "" : self.task_id_str
    }
    func getTaskId() -> Int {
        return self.task_id
    }
    func getTaskIdType() -> String {
        return "Int"
    };
	func getTaskIdStr() -> String {
        return task_id_str
    };
	func getTaskIdStrPG() -> String {
        return task_id_str
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

	func setDueDate(due_date: NSDate?) {
        self.due_date = due_date ?? NSDate.distantPast() as NSDate
        self.due_date_str = Utils.dateToString(self.due_date)
    }
    func getDueDate() -> NSDate {
        return self.due_date
    }
    func getDueDateType() -> String {
        return "NSDate"
    };
	func getDueDateStr() -> String {
        return due_date_str == "unset" || due_date_str == "0000-12-30 00:00:00 +0000" ? "" : due_date_str
    };
	func getDueDateStrPG() -> String {
        return due_date_str == "unset" || due_date_str == "0000-12-30 00:00:00 +0000" ? "" : due_date_str
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

	func setIsCompleted(is_completed: Int?) {
        self.is_completed = is_completed ?? 0
        self.is_completed_str = ((self.is_completed) == 1) ? "t" : "f"
    }
    func getIsCompleted() -> Int {
        return self.is_completed
    }
    func getIsCompletedType() -> String {
        return "Int"
    };
	func getIsCompletedStr() -> String {
        return String(is_completed)
    };
	func getIsCompletedStrPG() -> String {
        return is_completed_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "_id":
				return "Int"
			case "task_id":
				return "Int"
			case "member_id":
				return "String"
			case "header":
				return "String"
			case "details":
				return "String"
			case "due_date":
				return "NSDate"
			case "date_completed":
				return "NSDate"
			case "is_completed":
				return "Int"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "_id":
			return self.getIdStr()
			case "task_id":
			return self.getTaskIdStr()
			case "member_id":
			return self.getMemberIdStr()
			case "header":
			return self.getHeaderStr()
			case "details":
			return self.getDetailsStr()
			case "due_date":
			return self.getDueDateStr()
			case "date_completed":
			return self.getDateCompletedStr()
			case "is_completed":
			return self.getIsCompletedStr()
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
        qb.selectFrom("tasks")
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

				self.setId((row["_id"]?.asInt()));
				self.setTaskId((row["task_id"]?.asInt()));
				self.setMemberId((row["member_id"]?.asString()));
				self.setHeader((row["header"]?.asString()));
				self.setDetails((row["details"]?.asString()));
				self.setDueDate((row["due_date"]?.asDate()));
				self.setDateCompleted((row["date_completed"]?.asDate()));
				self.setIsCompleted((row["is_completed"]?.asMyBool()));

				var fields = [String: String]()
				fields["_id"] = self.getIdStr()
				fields["task_id"] = self.getTaskIdStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["header"] = self.getHeaderStr()
				fields["details"] = self.getDetailsStr()
				fields["due_date"] = self.getDueDateStr()
				fields["date_completed"] = self.getDateCompletedStr()
				fields["is_completed"] = self.getIsCompletedStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["_id"] = self.getIdStr()
		fields["task_id"] = self.getTaskIdStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["header"] = self.getHeaderStr()
		fields["details"] = self.getDetailsStr()
		fields["due_date"] = self.getDueDateStr()
		fields["date_completed"] = self.getDateCompletedStr()
		fields["is_completed"] = self.getIsCompletedStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["_id"] = self.getIdStrPG()
		fields["task_id"] = self.getTaskIdStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["header"] = self.getHeaderStrPG()
		fields["details"] = self.getDetailsStrPG()
		fields["due_date"] = self.getDueDateStrPG()
		fields["date_completed"] = self.getDateCompletedStrPG()
		fields["is_completed"] = self.getIsCompletedStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tasks ("
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

        let dbn = Database()
        dbn.query(statement)
    }

    func addNewPG() {

        var statement = "INSERT INTO tasks ("
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

            var statement = "INSERT INTO tasks ("

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

        var statement = "UPDATE tasks "
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

        let dbn = Database()
        dbn.query(statement)
    }

    func updatePG(forID: String) {

        // get all field/values as string values
        var fields = self.getFieldsPG()

        var statement = "UPDATE tasks "
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

        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    func delete(forID: Int) {
        let query = "DELETE FROM tasks WHERE member_id = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM tasks WHERE member_id = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastmemberId() -> String {
        let member_id: String = ""
        let query = "SELECT member_id from tasks ORDER BY _id DESC LIMIT 1 "
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
