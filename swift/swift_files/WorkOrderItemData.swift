

//
//  WorkOrderItem.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class WorkOrderItemData {

	var item_id: Int = -1
    var item_id_str: String = "unset"
	var work_order: Int = -1
    var work_order_str: String = "unset"
	var member_id: String = "unset"
    var member_id_str: String = "unset"
	var date_entered: NSDate = NSDate.distantFuture() as NSDate
    var date_entered_str: String = "unset"
	var entered_by: String = "unset"
    var entered_by_str: String = "unset"
	var quantity: Int = -1
    var quantity_str: String = "unset"
	var fee: Double = -1.0
    var fee_str: String = "unset"
	var description: String = "unset"
    var description_str: String = "unset"
	
	func setItemId(item_id: Int?) {
        self.item_id = item_id ?? 0
        let item_id2 = item_id ?? 0
        self.item_id_str = String(item_id2)
        self.item_id_str = (self.item_id_str == "0") ? "" : self.item_id_str
    }
    func getItemId() -> Int {
        return self.item_id
    }
    func getItemIdType() -> String {
        return "Int"
    };
	func getItemIdStr() -> String {
        return item_id_str
    };
	func getItemIdStrPG() -> String {
        return item_id_str
    };

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

	func setDateEntered(date_entered: NSDate?) {
        self.date_entered = date_entered ?? NSDate.distantPast() as NSDate
        self.date_entered_str = Utils.dateToString(self.date_entered)
    }
    func getDateEntered() -> NSDate {
        return self.date_entered
    }
    func getDateEnteredType() -> String {
        return "NSDate"
    };
	func getDateEnteredStr() -> String {
        return date_entered_str == "unset" || date_entered_str == "0000-12-30 00:00:00 +0000" ? "" : date_entered_str
    };
	func getDateEnteredStrPG() -> String {
        return date_entered_str == "unset" || date_entered_str == "0000-12-30 00:00:00 +0000" ? "" : date_entered_str
    };

	func setEnteredBy(entered_by: String?) {
        self.entered_by = entered_by ?? ""
        self.entered_by_str = String(self.entered_by)
    }
    func getEnteredBy() -> String {
        return self.entered_by
    }
    func getEnteredByType() -> String {
        return "String"
    };
	func getEnteredByStr() -> String {
        return entered_by_str == "unset" ? "" : entered_by_str
    };
	func getEnteredByStrPG() -> String {
        return entered_by_str == "unset" ? "" : entered_by_str
    };

	func setQuantity(quantity: Int?) {
        self.quantity = quantity ?? 0
        let quantity2 = quantity ?? 0
        self.quantity_str = String(quantity2)
        self.quantity_str = (self.quantity_str == "0") ? "" : self.quantity_str
    }
    func getQuantity() -> Int {
        return self.quantity
    }
    func getQuantityType() -> String {
        return "Int"
    };
	func getQuantityStr() -> String {
        return quantity_str
    };
	func getQuantityStrPG() -> String {
        return quantity_str
    };

	func setFee(fee: Double?) {
   	   self.fee = fee ?? 0.0
   	   self.fee_str = String(self.fee)
    }
    func getFee() -> Double {
        return self.fee
    }
    func getFeeType() -> String {
        return "Double"
    };
	func getFeeStr() -> String {
        return fee_str
    };
	func getFeeStrPG() -> String {
        return fee_str
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

	func getFieldType(field: String) -> String {
        switch field {
			case "item_id":
				return "Int"
			case "work_order":
				return "Int"
			case "member_id":
				return "String"
			case "date_entered":
				return "NSDate"
			case "entered_by":
				return "String"
			case "quantity":
				return "Int"
			case "fee":
				return "Double"
			case "description":
				return "String"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "item_id":
			return self.getItemIdStr()
			case "work_order":
			return self.getWorkOrderStr()
			case "member_id":
			return self.getMemberIdStr()
			case "date_entered":
			return self.getDateEnteredStr()
			case "entered_by":
			return self.getEnteredByStr()
			case "quantity":
			return self.getQuantityStr()
			case "fee":
			return self.getFeeStr()
			case "description":
			return self.getDescriptionStr()
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
    func loadByID(work_order: String) -> [String: String] {
        let qb = QueryBuilder()
        qb.selectFrom("work_order_item")
            .Where("work_order = ?")

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(work_order)

        var fields = [String: String]()
        let (resultset, error) = SD.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SD.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setItemId((row["item_id"]?.asInt()));
				self.setWorkOrder((row["work_order"]?.asInt()));
				self.setMemberId((row["member_id"]?.asString()));
				self.setDateEntered((row["date_entered"]?.asDate()));
				self.setEnteredBy((row["entered_by"]?.asString()));
				self.setQuantity((row["quantity"]?.asInt()));
				self.setFee((row["fee"]?.asDouble()));
				self.setDescription((row["description"]?.asString()));

				
				fields["item_id"] = self.getItemIdStr()
				fields["work_order"] = self.getWorkOrderStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["date_entered"] = self.getDateEnteredStr()
				fields["entered_by"] = self.getEnteredByStr()
				fields["quantity"] = self.getQuantityStr()
				fields["fee"] = self.getFeeStr()
				fields["description"] = self.getDescriptionStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["item_id"] = self.getItemIdStr()
		fields["work_order"] = self.getWorkOrderStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["date_entered"] = self.getDateEnteredStr()
		fields["entered_by"] = self.getEnteredByStr()
		fields["quantity"] = self.getQuantityStr()
		fields["fee"] = self.getFeeStr()
		fields["description"] = self.getDescriptionStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["item_id"] = self.getItemIdStrPG()
		fields["work_order"] = self.getWorkOrderStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["date_entered"] = self.getDateEnteredStrPG()
		fields["entered_by"] = self.getEnteredByStrPG()
		fields["quantity"] = self.getQuantityStrPG()
		fields["fee"] = self.getFeeStrPG()
		fields["description"] = self.getDescriptionStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO work_order_item ("
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

        var statement = "INSERT INTO work_order_item ("
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

            var statement = "INSERT INTO work_order_item ("

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

        var statement = "UPDATE work_order_item "
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
        statement += "WHERE work_order = " + String(forID)

        let dbn = Database()
        dbn.query(statement)
    }

    func updatePG(forID: String) {

        // get all field/values as string values
        var fields = self.getFieldsPG()

        var statement = "UPDATE work_order_item "
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
        statement += "WHERE work_order = " + String(forID)

        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    func delete(forID: Int) {
        let query = "DELETE FROM work_order_item WHERE work_order = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM work_order_item WHERE work_order = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastworkOrder() -> String {
        let work_order: String = ""
        let query = "SELECT work_order from work_order_item ORDER BY _id DESC LIMIT 1 "
        let (resultset, err) = SD.executeQuery(query)
        if (err == nil) {
            if resultset.count > 0 {
                let row = resultset[0]
                let work_order2 = row["work_order"]?.asString() ?? ""

                return work_order2

            }
        }
        return work_order
    }
}
