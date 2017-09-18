

//
//  TblWorkOrder.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblWorkOrderData {

	var work_received_id: Int = -1
    var work_received_id_str: String = "unset"
	var member_id: Int = -1
    var member_id_str: String = "unset"
	var date_received: NSDate = NSDate.distantFuture() as NSDate
    var date_received_str: String = "unset"
	var received_by: String = "unset"
    var received_by_str: String = "unset"
	var work_description: String = "unset"
    var work_description_str: String = "unset"
	var date_worked: NSDate = NSDate.distantFuture() as NSDate
    var date_worked_str: String = "unset"
	var worked_by: String = "unset"
    var worked_by_str: String = "unset"
	var date_printed: NSDate = NSDate.distantFuture() as NSDate
    var date_printed_str: String = "unset"
	var printed_by: String = "unset"
    var printed_by_str: String = "unset"
	var date_mailed: NSDate = NSDate.distantFuture() as NSDate
    var date_mailed_str: String = "unset"
	var mailed_by: String = "unset"
    var mailed_by_str: String = "unset"
	var started_by: String = "unset"
    var started_by_str: String = "unset"
	var start_date: NSDate = NSDate.distantFuture() as NSDate
    var start_date_str: String = "unset"
	var time_stamp: NSDate = NSDate.distantFuture() as NSDate
    var time_stamp_str: String = "unset"
	var close_flag: Int = -1
    var close_flag_str: String = "unset"
	var closed_by: String = "unset"
    var closed_by_str: String = "unset"
	var paypal_id: String = "unset"
    var paypal_id_str: String = "unset"
	
	func setWorkReceivedId(work_received_id: Int?) {
        self.work_received_id = work_received_id ?? 0
        let work_received_id2 = work_received_id ?? 0
        self.work_received_id_str = String(work_received_id2)
        self.work_received_id_str = (self.work_received_id_str == "0") ? "" : self.work_received_id_str
    }
    func getWorkReceivedId() -> Int {
        return self.work_received_id
    }
    func getWorkReceivedIdType() -> String {
        return "Int"
    };
	func getWorkReceivedIdStr() -> String {
        return work_received_id_str
    };
	func getWorkReceivedIdStrPG() -> String {
        return work_received_id_str
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

	func setReceivedBy(received_by: String?) {
        self.received_by = received_by ?? ""
        self.received_by_str = String(self.received_by)
    }
    func getReceivedBy() -> String {
        return self.received_by
    }
    func getReceivedByType() -> String {
        return "String"
    };
	func getReceivedByStr() -> String {
        return received_by_str == "unset" ? "" : received_by_str
    };
	func getReceivedByStrPG() -> String {
        return received_by_str == "unset" ? "" : received_by_str
    };

	func setWorkDescription(work_description: String?) {
        self.work_description = work_description ?? ""
        self.work_description_str = String(self.work_description)
    }
    func getWorkDescription() -> String {
        return self.work_description
    }
    func getWorkDescriptionType() -> String {
        return "String"
    };
	func getWorkDescriptionStr() -> String {
        return work_description_str == "unset" ? "" : work_description_str
    };
	func getWorkDescriptionStrPG() -> String {
        return work_description_str == "unset" ? "" : work_description_str
    };

	func setDateWorked(date_worked: NSDate?) {
        self.date_worked = date_worked ?? NSDate.distantPast() as NSDate
        self.date_worked_str = Utils.dateToString(self.date_worked)
    }
    func getDateWorked() -> NSDate {
        return self.date_worked
    }
    func getDateWorkedType() -> String {
        return "NSDate"
    };
	func getDateWorkedStr() -> String {
        return date_worked_str == "unset" || date_worked_str == "0000-12-30 00:00:00 +0000" ? "" : date_worked_str
    };
	func getDateWorkedStrPG() -> String {
        return date_worked_str == "unset" || date_worked_str == "0000-12-30 00:00:00 +0000" ? "" : date_worked_str
    };

	func setWorkedBy(worked_by: String?) {
        self.worked_by = worked_by ?? ""
        self.worked_by_str = String(self.worked_by)
    }
    func getWorkedBy() -> String {
        return self.worked_by
    }
    func getWorkedByType() -> String {
        return "String"
    };
	func getWorkedByStr() -> String {
        return worked_by_str == "unset" ? "" : worked_by_str
    };
	func getWorkedByStrPG() -> String {
        return worked_by_str == "unset" ? "" : worked_by_str
    };

	func setDatePrinted(date_printed: NSDate?) {
        self.date_printed = date_printed ?? NSDate.distantPast() as NSDate
        self.date_printed_str = Utils.dateToString(self.date_printed)
    }
    func getDatePrinted() -> NSDate {
        return self.date_printed
    }
    func getDatePrintedType() -> String {
        return "NSDate"
    };
	func getDatePrintedStr() -> String {
        return date_printed_str == "unset" || date_printed_str == "0000-12-30 00:00:00 +0000" ? "" : date_printed_str
    };
	func getDatePrintedStrPG() -> String {
        return date_printed_str == "unset" || date_printed_str == "0000-12-30 00:00:00 +0000" ? "" : date_printed_str
    };

	func setPrintedBy(printed_by: String?) {
        self.printed_by = printed_by ?? ""
        self.printed_by_str = String(self.printed_by)
    }
    func getPrintedBy() -> String {
        return self.printed_by
    }
    func getPrintedByType() -> String {
        return "String"
    };
	func getPrintedByStr() -> String {
        return printed_by_str == "unset" ? "" : printed_by_str
    };
	func getPrintedByStrPG() -> String {
        return printed_by_str == "unset" ? "" : printed_by_str
    };

	func setDateMailed(date_mailed: NSDate?) {
        self.date_mailed = date_mailed ?? NSDate.distantPast() as NSDate
        self.date_mailed_str = Utils.dateToString(self.date_mailed)
    }
    func getDateMailed() -> NSDate {
        return self.date_mailed
    }
    func getDateMailedType() -> String {
        return "NSDate"
    };
	func getDateMailedStr() -> String {
        return date_mailed_str == "unset" || date_mailed_str == "0000-12-30 00:00:00 +0000" ? "" : date_mailed_str
    };
	func getDateMailedStrPG() -> String {
        return date_mailed_str == "unset" || date_mailed_str == "0000-12-30 00:00:00 +0000" ? "" : date_mailed_str
    };

	func setMailedBy(mailed_by: String?) {
        self.mailed_by = mailed_by ?? ""
        self.mailed_by_str = String(self.mailed_by)
    }
    func getMailedBy() -> String {
        return self.mailed_by
    }
    func getMailedByType() -> String {
        return "String"
    };
	func getMailedByStr() -> String {
        return mailed_by_str == "unset" ? "" : mailed_by_str
    };
	func getMailedByStrPG() -> String {
        return mailed_by_str == "unset" ? "" : mailed_by_str
    };

	func setStartedBy(started_by: String?) {
        self.started_by = started_by ?? ""
        self.started_by_str = String(self.started_by)
    }
    func getStartedBy() -> String {
        return self.started_by
    }
    func getStartedByType() -> String {
        return "String"
    };
	func getStartedByStr() -> String {
        return started_by_str == "unset" ? "" : started_by_str
    };
	func getStartedByStrPG() -> String {
        return started_by_str == "unset" ? "" : started_by_str
    };

	func setStartDate(start_date: NSDate?) {
        self.start_date = start_date ?? NSDate.distantPast() as NSDate
        self.start_date_str = Utils.dateToString(self.start_date)
    }
    func getStartDate() -> NSDate {
        return self.start_date
    }
    func getStartDateType() -> String {
        return "NSDate"
    };
	func getStartDateStr() -> String {
        return start_date_str == "unset" || start_date_str == "0000-12-30 00:00:00 +0000" ? "" : start_date_str
    };
	func getStartDateStrPG() -> String {
        return start_date_str == "unset" || start_date_str == "0000-12-30 00:00:00 +0000" ? "" : start_date_str
    };

	func setTimeStamp(time_stamp: NSDate?) {
        self.time_stamp = time_stamp ?? NSDate.distantPast() as NSDate
        self.time_stamp_str = Utils.dateToString(self.time_stamp)
    }
    func getTimeStamp() -> NSDate {
        return self.time_stamp
    }
    func getTimeStampType() -> String {
        return "NSDate"
    };
	func getTimeStampStr() -> String {
        return time_stamp_str == "unset" || time_stamp_str == "0000-12-30 00:00:00 +0000" ? "" : time_stamp_str
    };
	func getTimeStampStrPG() -> String {
        return time_stamp_str == "unset" || time_stamp_str == "0000-12-30 00:00:00 +0000" ? "" : time_stamp_str
    };

	func setCloseFlag(close_flag: Int?) {
        self.close_flag = close_flag ?? 0
        self.close_flag_str = ((self.close_flag) == 1) ? "t" : "f"
    }
    func getCloseFlag() -> Int {
        return self.close_flag
    }
    func getCloseFlagType() -> String {
        return "Int"
    };
	func getCloseFlagStr() -> String {
        return String(close_flag)
    };
	func getCloseFlagStrPG() -> String {
        return close_flag_str
    };

	func setClosedBy(closed_by: String?) {
        self.closed_by = closed_by ?? ""
        self.closed_by_str = String(self.closed_by)
    }
    func getClosedBy() -> String {
        return self.closed_by
    }
    func getClosedByType() -> String {
        return "String"
    };
	func getClosedByStr() -> String {
        return closed_by_str == "unset" ? "" : closed_by_str
    };
	func getClosedByStrPG() -> String {
        return closed_by_str == "unset" ? "" : closed_by_str
    };

	func setPaypalId(paypal_id: String?) {
        self.paypal_id = paypal_id ?? ""
        self.paypal_id_str = String(self.paypal_id)
    }
    func getPaypalId() -> String {
        return self.paypal_id
    }
    func getPaypalIdType() -> String {
        return "String"
    };
	func getPaypalIdStr() -> String {
        return paypal_id_str == "unset" ? "" : paypal_id_str
    };
	func getPaypalIdStrPG() -> String {
        return paypal_id_str == "unset" ? "" : paypal_id_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "work_received_id":
				return "Int"
			case "member_id":
				return "Int"
			case "date_received":
				return "NSDate"
			case "received_by":
				return "String"
			case "work_description":
				return "String"
			case "date_worked":
				return "NSDate"
			case "worked_by":
				return "String"
			case "date_printed":
				return "NSDate"
			case "printed_by":
				return "String"
			case "date_mailed":
				return "NSDate"
			case "mailed_by":
				return "String"
			case "started_by":
				return "String"
			case "start_date":
				return "NSDate"
			case "time_stamp":
				return "NSDate"
			case "close_flag":
				return "Int"
			case "closed_by":
				return "String"
			case "paypal_id":
				return "String"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "work_received_id":
			return self.getWorkReceivedIdStr()
			case "member_id":
			return self.getMemberIdStr()
			case "date_received":
			return self.getDateReceivedStr()
			case "received_by":
			return self.getReceivedByStr()
			case "work_description":
			return self.getWorkDescriptionStr()
			case "date_worked":
			return self.getDateWorkedStr()
			case "worked_by":
			return self.getWorkedByStr()
			case "date_printed":
			return self.getDatePrintedStr()
			case "printed_by":
			return self.getPrintedByStr()
			case "date_mailed":
			return self.getDateMailedStr()
			case "mailed_by":
			return self.getMailedByStr()
			case "started_by":
			return self.getStartedByStr()
			case "start_date":
			return self.getStartDateStr()
			case "time_stamp":
			return self.getTimeStampStr()
			case "close_flag":
			return self.getCloseFlagStr()
			case "closed_by":
			return self.getClosedByStr()
			case "paypal_id":
			return self.getPaypalIdStr()
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
        qb.selectFrom("tbl_work_recieved")
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

				self.setWorkReceivedId((row["work_received_id"]?.asInt()));
				self.setMemberId((row["member_id"]?.asInt()));
				self.setDateReceived((row["date_received"]?.asDate()));
				self.setReceivedBy((row["received_by"]?.asString()));
				self.setWorkDescription((row["work_description"]?.asString()));
				self.setDateWorked((row["date_worked"]?.asDate()));
				self.setWorkedBy((row["worked_by"]?.asString()));
				self.setDatePrinted((row["date_printed"]?.asDate()));
				self.setPrintedBy((row["printed_by"]?.asString()));
				self.setDateMailed((row["date_mailed"]?.asDate()));
				self.setMailedBy((row["mailed_by"]?.asString()));
				self.setStartedBy((row["started_by"]?.asString()));
				self.setStartDate((row["start_date"]?.asDate()));
				self.setTimeStamp((row["time_stamp"]?.asDate()));
				self.setCloseFlag((row["close_flag"]?.asMyBool()));
				self.setClosedBy((row["closed_by"]?.asString()));
				self.setPaypalId((row["paypal_id"]?.asString()));

				var fields = [String: String]()
				fields["work_received_id"] = self.getWorkReceivedIdStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["date_received"] = self.getDateReceivedStr()
				fields["received_by"] = self.getReceivedByStr()
				fields["work_description"] = self.getWorkDescriptionStr()
				fields["date_worked"] = self.getDateWorkedStr()
				fields["worked_by"] = self.getWorkedByStr()
				fields["date_printed"] = self.getDatePrintedStr()
				fields["printed_by"] = self.getPrintedByStr()
				fields["date_mailed"] = self.getDateMailedStr()
				fields["mailed_by"] = self.getMailedByStr()
				fields["started_by"] = self.getStartedByStr()
				fields["start_date"] = self.getStartDateStr()
				fields["time_stamp"] = self.getTimeStampStr()
				fields["close_flag"] = self.getCloseFlagStr()
				fields["closed_by"] = self.getClosedByStr()
				fields["paypal_id"] = self.getPaypalIdStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["work_received_id"] = self.getWorkReceivedIdStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["date_received"] = self.getDateReceivedStr()
		fields["received_by"] = self.getReceivedByStr()
		fields["work_description"] = self.getWorkDescriptionStr()
		fields["date_worked"] = self.getDateWorkedStr()
		fields["worked_by"] = self.getWorkedByStr()
		fields["date_printed"] = self.getDatePrintedStr()
		fields["printed_by"] = self.getPrintedByStr()
		fields["date_mailed"] = self.getDateMailedStr()
		fields["mailed_by"] = self.getMailedByStr()
		fields["started_by"] = self.getStartedByStr()
		fields["start_date"] = self.getStartDateStr()
		fields["time_stamp"] = self.getTimeStampStr()
		fields["close_flag"] = self.getCloseFlagStr()
		fields["closed_by"] = self.getClosedByStr()
		fields["paypal_id"] = self.getPaypalIdStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["work_received_id"] = self.getWorkReceivedIdStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["date_received"] = self.getDateReceivedStrPG()
		fields["received_by"] = self.getReceivedByStrPG()
		fields["work_description"] = self.getWorkDescriptionStrPG()
		fields["date_worked"] = self.getDateWorkedStrPG()
		fields["worked_by"] = self.getWorkedByStrPG()
		fields["date_printed"] = self.getDatePrintedStrPG()
		fields["printed_by"] = self.getPrintedByStrPG()
		fields["date_mailed"] = self.getDateMailedStrPG()
		fields["mailed_by"] = self.getMailedByStrPG()
		fields["started_by"] = self.getStartedByStrPG()
		fields["start_date"] = self.getStartDateStrPG()
		fields["time_stamp"] = self.getTimeStampStrPG()
		fields["close_flag"] = self.getCloseFlagStrPG()
		fields["closed_by"] = self.getClosedByStrPG()
		fields["paypal_id"] = self.getPaypalIdStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_work_recieved ("
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

        var statement = "INSERT INTO tbl_work_recieved ("
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

            var statement = "INSERT INTO tbl_work_recieved ("

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

        var statement = "UPDATE tbl_work_recieved "
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

        var statement = "UPDATE tbl_work_recieved "
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
        let query = "DELETE FROM tbl_work_recieved WHERE member_id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM tbl_work_recieved WHERE member_id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastmemberId() -> String {
        let member_id: String = ""
        let query = "SELECT member_id from tbl_work_recieved ORDER BY _id DESC LIMIT 1 "
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
