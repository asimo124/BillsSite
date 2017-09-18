

//
//  TblReports.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblReportsData {

	var _id: Int = -1
    var _id_str: String = "unset"
	var report_title: String = "unset"
    var report_title_str: String = "unset"
	var report_file_name: String = "unset"
    var report_file_name_str: String = "unset"
	var report_date: NSDate = NSDate.distantFuture() as NSDate
    var report_date_str: String = "unset"
	var report_format: String = "unset"
    var report_format_str: String = "unset"
	
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

	func setReportTitle(report_title: String?) {
        self.report_title = report_title ?? ""
        self.report_title_str = String(self.report_title)
    }
    func getReportTitle() -> String {
        return self.report_title
    }
    func getReportTitleType() -> String {
        return "String"
    };
	func getReportTitleStr() -> String {
        return report_title_str == "unset" ? "" : report_title_str
    };
	func getReportTitleStrPG() -> String {
        return report_title_str == "unset" ? "" : report_title_str
    };

	func setReportFileName(report_file_name: String?) {
        self.report_file_name = report_file_name ?? ""
        self.report_file_name_str = String(self.report_file_name)
    }
    func getReportFileName() -> String {
        return self.report_file_name
    }
    func getReportFileNameType() -> String {
        return "String"
    };
	func getReportFileNameStr() -> String {
        return report_file_name_str == "unset" ? "" : report_file_name_str
    };
	func getReportFileNameStrPG() -> String {
        return report_file_name_str == "unset" ? "" : report_file_name_str
    };

	func setReportDate(report_date: NSDate?) {
        self.report_date = report_date ?? NSDate.distantPast() as NSDate
        self.report_date_str = Utils.dateToString(self.report_date)
    }
    func getReportDate() -> NSDate {
        return self.report_date
    }
    func getReportDateType() -> String {
        return "NSDate"
    };
	func getReportDateStr() -> String {
        return report_date_str == "unset" || report_date_str == "0000-12-30 00:00:00 +0000" ? "" : report_date_str
    };
	func getReportDateStrPG() -> String {
        return report_date_str == "unset" || report_date_str == "0000-12-30 00:00:00 +0000" ? "" : report_date_str
    };

	func setReportFormat(report_format: String?) {
        self.report_format = report_format ?? ""
        self.report_format_str = String(self.report_format)
    }
    func getReportFormat() -> String {
        return self.report_format
    }
    func getReportFormatType() -> String {
        return "String"
    };
	func getReportFormatStr() -> String {
        return report_format_str == "unset" ? "" : report_format_str
    };
	func getReportFormatStrPG() -> String {
        return report_format_str == "unset" ? "" : report_format_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "_id":
				return "Int"
			case "report_title":
				return "String"
			case "report_file_name":
				return "String"
			case "report_date":
				return "NSDate"
			case "report_format":
				return "String"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "_id":
			return self.getIdStr()
			case "report_title":
			return self.getReportTitleStr()
			case "report_file_name":
			return self.getReportFileNameStr()
			case "report_date":
			return self.getReportDateStr()
			case "report_format":
			return self.getReportFormatStr()
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
            i++
        }
        return true
    }
    
    func find() -> [TblReportsData] {
        
        let query =
        "SELECT * FROM reports ORDER BY report_date DESC "
        
        var TblReportsHolder = [TblReportsData]()
        let (resultset, error) = SDOld.executeQuery(query)
        if error != nil {
         
            SD.printDie(error!)
        } else {
            
            for row in resultset {
                
                let TblReports = TblReportsData()
                TblReports.setId((row["_id"]?.asInt()));
                TblReports.setReportTitle((row["report_title"]?.asString()));
                TblReports.setReportFileName((row["report_file_name"]?.asString()));
                TblReports.setReportDate((row["report_date"]?.asDate()));
                TblReports.setReportFormat((row["report_format"]?.asString()));
                TblReportsHolder.append(TblReports)
            }
        }
        return TblReportsHolder
    }
    
    func loadByID(animal_registration: String) -> [String: String] {
        let qb = QueryBuilder()
        qb.selectFrom("reports")
            .Where("animal_registration = ?")

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(animal_registration)

        var fields = [String: String]()
        let (resultset, error) = SDOld.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setId((row["_id"]?.asInt()));
				self.setReportTitle((row["report_title"]?.asString()));
				self.setReportFileName((row["report_file_name"]?.asString()));
				self.setReportDate((row["report_date"]?.asDate()));
				self.setReportFormat((row["report_format"]?.asString()));

				var fields = [String: String]()
				fields["_id"] = self.getIdStr()
				fields["report_title"] = self.getReportTitleStr()
				fields["report_file_name"] = self.getReportFileNameStr()
				fields["report_date"] = self.getReportDateStr()
				fields["report_format"] = self.getReportFormatStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["_id"] = self.getIdStr()
		fields["report_title"] = self.getReportTitleStr()
		fields["report_file_name"] = self.getReportFileNameStr()
		fields["report_date"] = self.getReportDateStr()
		fields["report_format"] = self.getReportFormatStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["_id"] = self.getIdStrPG()
		fields["report_title"] = self.getReportTitleStrPG()
		fields["report_file_name"] = self.getReportFileNameStrPG()
		fields["report_date"] = self.getReportDateStrPG()
		fields["report_format"] = self.getReportFormatStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO reports ("
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
                    i++
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
                    let value2 = fields[use_key]!.stringByReplacingOccurrencesOfString("'", withString: "''")
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

        let dbn = DatabaseOld()
        dbn.query(statement)
    }

    func addNewPG() {

        var statement = "INSERT INTO reports ("
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
                    i++
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
                    let value2 = fields[use_key]!.stringByReplacingOccurrencesOfString("'", withString: "''")
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

            var statement = "INSERT INTO reports ("

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
                        i++
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
                    let value2 = fields[use_key]!.stringByReplacingOccurrencesOfString("'", withString: "''")
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

        var statement = "UPDATE reports "
        var i = 0
        let obj = self
        let reflected = Mirror(reflecting: obj)
        for child in reflected.children {
            guard let key = child.label else { continue }
            let _: Any = child.value
            if key != "_id" && key.rangeOfString("_str") != nil {
                let use_key = key.stringByReplacingOccurrencesOfString("_str", withString: "")
                if self.keyIsSet(use_key) {
                    let value2 = fields[use_key]!.stringByReplacingOccurrencesOfString("'", withString: "''")
                    if i == 0 {
                        statement += "SET " + use_key + " = '" + value2 + "' "
                    } else {
                        statement += ", " + use_key + " = '" + value2 + "' "
                    }
                    i++
                }
            }
        }
        statement += "WHERE animal_registration = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query(statement)
    }

    func updatePG(forID: String) {

        // get all field/values as string values
        var fields = self.getFieldsPG()

        var statement = "UPDATE reports "
        var i = 0
        let obj = self
        let reflected = Mirror(reflecting: obj)
        for child in reflected.children {
            guard let key = child.label else { continue }
            let _: Any = child.value
            if key != "_id" && key.rangeOfString("_str") != nil {
                let use_key = key.stringByReplacingOccurrencesOfString("_str", withString: "")
                if self.keyIsSet(use_key) {
                    let value2 = fields[use_key]!.stringByReplacingOccurrencesOfString("'", withString: "''")
                    if i == 0 {
                        statement += "SET " + use_key + " = '" + value2 + "' "
                    } else {
                        statement += ", " + use_key + " = '" + value2 + "' "
                    }
                    i++
                }
            }
        }
        statement += "WHERE animal_registration = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    func delete(forID: Int) {
        let query = "DELETE FROM reports WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM reports WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastanimalRegistration() -> String {
        let animal_registration: String = ""
        let query = "SELECT animal_registration from reports ORDER BY _id DESC LIMIT 1 "
        let (resultset, err) = SDOld.executeQuery(query)
        if (err == nil) {
            if resultset.count > 0 {
                let row = resultset[0]
                let animal_registration2 = row["animal_registration"]?.asString() ?? ""

                return animal_registration2

            }
        }
        return animal_registration
    }
}
