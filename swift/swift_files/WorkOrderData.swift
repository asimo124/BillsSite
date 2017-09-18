

//
//  WorkOrder.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class WorkOrderData {

	var work_order: Int = -1
    var work_order_str: String = "unset"
	var member_id: String = "unset"
    var member_id_str: String = "unset"
	var date_received: NSDate = NSDate.distantFuture() as NSDate
    var date_received_str: String = "unset"
	var date_closed: NSDate = NSDate.distantFuture() as NSDate
    var date_closed_str: String = "unset"
	var description: String = "unset"
    var description_str: String = "unset"
	var is_closed: Int = -1
    var is_closed_str: String = "unset"
	var notes: String = "unset"
    var notes_str: String = "unset"
	
	func setWorkOrder(work_order: Int?) {
        self.work_order = work_order ?? 0
        let work_order2 = work_order ?? 0
        self.work_order_str = String(work_order2)
        self.work_order_str = (self.work_order_str == "0") ? "" : self.work_order_str
    }
    func getWorkOrder() -> Int {
        return self.work_order
    }
    func getWorkOrderType() -> String {
        return "Int"
    };
	func getWorkOrderStr() -> String {
        return work_order_str
    };
	func getWorkOrderStrPG() -> String {
        return work_order_str
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

	func setDateClosed(date_closed: NSDate?) {
        self.date_closed = date_closed ?? NSDate.distantPast() as NSDate
        self.date_closed_str = Utils.dateToString(self.date_closed)
    }
    func getDateClosed() -> NSDate {
        return self.date_closed
    }
    func getDateClosedType() -> String {
        return "NSDate"
    };
	func getDateClosedStr() -> String {
        return date_closed_str == "unset" || date_closed_str == "0000-12-30 00:00:00 +0000" ? "" : date_closed_str
    };
	func getDateClosedStrPG() -> String {
        return date_closed_str == "unset" || date_closed_str == "0000-12-30 00:00:00 +0000" ? "" : date_closed_str
    };

	func setDescription(description: String?) {
        self.description = description ?? ""
        self.description_str = String(self.description)
    }
    func getDescription() -> String {
        return self.description
    }
    func getDescriptionType() -> String {
        return "String"
    };
	func getDescriptionStr() -> String {
        return description_str == "unset" ? "" : description_str
    };
	func getDescriptionStrPG() -> String {
        return description_str == "unset" ? "" : description_str
    };

	func setIsClosed(is_closed: Int?) {
        self.is_closed = is_closed ?? 0
        self.is_closed_str = ((self.is_closed) == 1) ? "t" : "f"
    }
    func getIsClosed() -> Int {
        return self.is_closed
    }
    func getIsClosedType() -> String {
        return "Int"
    };
	func getIsClosedStr() -> String {
        return String(is_closed)
    };
	func getIsClosedStrPG() -> String {
        return is_closed_str
    };

	func setNotes(notes: String?) {
        self.notes = notes ?? ""
        self.notes_str = String(self.notes)
    }
    func getNotes() -> String {
        return self.notes
    }
    func getNotesType() -> String {
        return "String"
    };
	func getNotesStr() -> String {
        return notes_str == "unset" ? "" : notes_str
    };
	func getNotesStrPG() -> String {
        return notes_str == "unset" ? "" : notes_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "work_order":
				return "Int"
			case "member_id":
				return "String"
			case "date_received":
				return "NSDate"
			case "date_closed":
				return "NSDate"
			case "description":
				return "String"
			case "is_closed":
				return "Int"
			case "notes":
				return "String"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "work_order":
			return self.getWorkOrderStr()
			case "member_id":
			return self.getMemberIdStr()
			case "date_received":
			return self.getDateReceivedStr()
			case "date_closed":
			return self.getDateClosedStr()
			case "description":
			return self.getDescriptionStr()
			case "is_closed":
			return self.getIsClosedStr()
			case "notes":
			return self.getNotesStr()
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
        qb.selectFrom("work_order")
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

				self.setWorkOrder((row["work_order"]?.asInt()));
				self.setMemberId((row["member_id"]?.asString()));
				self.setDateReceived((row["date_received"]?.asDate()));
				self.setDateClosed((row["date_closed"]?.asDate()));
				self.setDescription((row["description"]?.asString()));
				self.setIsClosed((row["is_closed"]?.asMyBool()));
				self.setNotes((row["notes"]?.asString()));

				
				fields["work_order"] = self.getWorkOrderStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["date_received"] = self.getDateReceivedStr()
				fields["date_closed"] = self.getDateClosedStr()
				fields["description"] = self.getDescriptionStr()
				fields["is_closed"] = self.getIsClosedStr()
				fields["notes"] = self.getNotesStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["work_order"] = self.getWorkOrderStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["date_received"] = self.getDateReceivedStr()
		fields["date_closed"] = self.getDateClosedStr()
		fields["description"] = self.getDescriptionStr()
		fields["is_closed"] = self.getIsClosedStr()
		fields["notes"] = self.getNotesStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["work_order"] = self.getWorkOrderStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["date_received"] = self.getDateReceivedStrPG()
		fields["date_closed"] = self.getDateClosedStrPG()
		fields["description"] = self.getDescriptionStrPG()
		fields["is_closed"] = self.getIsClosedStrPG()
		fields["notes"] = self.getNotesStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO work_order ("
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

        var statement = "INSERT INTO work_order ("
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

            var statement = "INSERT INTO work_order ("

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

        var statement = "UPDATE work_order "
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

        var statement = "UPDATE work_order "
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
        let query = "DELETE FROM work_order WHERE member_id = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM work_order WHERE member_id = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastmemberId() -> String {
        let member_id: String = ""
        let query = "SELECT member_id from work_order ORDER BY _id DESC LIMIT 1 "
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
