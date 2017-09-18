

//
//  TblAssociationCodesDisposal.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAssociationCodesDisposalData {

	var _id: Int = -1
    var _id_str: String = "unset"
	var disposal: Int = -1
    var disposal_str: String = "unset"
	var disposal_stat: String = "unset"
    var disposal_stat_str: String = "unset"
	var disposal_text: String = "unset"
    var disposal_text_str: String = "unset"
	var inventory: Int = -1
    var inventory_str: String = "unset"
	var birth: Int = -1
    var birth_str: String = "unset"
	var wean: Int = -1
    var wean_str: String = "unset"
	var year: Int = -1
    var year_str: String = "unset"
	var reason: Int = -1
    var reason_str: String = "unset"
	var bull: Int = -1
    var bull_str: String = "unset"
	var cow: Int = -1
    var cow_str: String = "unset"
	var calf: Int = -1
    var calf_str: String = "unset"
	var sort_order: Int = -1
    var sort_order_str: String = "unset"
	
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

	func setDisposal(disposal: Int?) {
        self.disposal = disposal ?? 0
        let disposal2 = disposal ?? 0
        self.disposal_str = String(disposal2)
        self.disposal_str = (self.disposal_str == "0") ? "" : self.disposal_str
    }
    func getDisposal() -> Int {
        return self.disposal
    }
    func getDisposalType() -> String {
        return "Int"
    };
	func getDisposalStr() -> String {
        return disposal_str
    };
	func getDisposalStrPG() -> String {
        return disposal_str
    };

	func setDisposalStat(disposal_stat: String?) {
        self.disposal_stat = disposal_stat ?? ""
        self.disposal_stat_str = String(self.disposal_stat)
    }
    func getDisposalStat() -> String {
        return self.disposal_stat
    }
    func getDisposalStatType() -> String {
        return "String"
    };
	func getDisposalStatStr() -> String {
        return disposal_stat_str == "unset" ? "" : disposal_stat_str
    };
	func getDisposalStatStrPG() -> String {
        return disposal_stat_str == "unset" ? "" : disposal_stat_str
    };

	func setDisposalText(disposal_text: String?) {
        self.disposal_text = disposal_text ?? ""
        self.disposal_text_str = String(self.disposal_text)
    }
    func getDisposalText() -> String {
        return self.disposal_text
    }
    func getDisposalTextType() -> String {
        return "String"
    };
	func getDisposalTextStr() -> String {
        return disposal_text_str == "unset" ? "" : disposal_text_str
    };
	func getDisposalTextStrPG() -> String {
        return disposal_text_str == "unset" ? "" : disposal_text_str
    };

	func setInventory(inventory: Int?) {
        self.inventory = inventory ?? 0
        self.inventory_str = ((self.inventory) == 1) ? "t" : "f"
    }
    func getInventory() -> Int {
        return self.inventory
    }
    func getInventoryType() -> String {
        return "Int"
    };
	func getInventoryStr() -> String {
        return String(inventory)
    };
	func getInventoryStrPG() -> String {
        return inventory_str
    };

	func setBirth(birth: Int?) {
        self.birth = birth ?? 0
        self.birth_str = ((self.birth) == 1) ? "t" : "f"
    }
    func getBirth() -> Int {
        return self.birth
    }
    func getBirthType() -> String {
        return "Int"
    };
	func getBirthStr() -> String {
        return String(birth)
    };
	func getBirthStrPG() -> String {
        return birth_str
    };

	func setWean(wean: Int?) {
        self.wean = wean ?? 0
        self.wean_str = ((self.wean) == 1) ? "t" : "f"
    }
    func getWean() -> Int {
        return self.wean
    }
    func getWeanType() -> String {
        return "Int"
    };
	func getWeanStr() -> String {
        return String(wean)
    };
	func getWeanStrPG() -> String {
        return wean_str
    };

	func setYear(year: Int?) {
        self.year = year ?? 0
        self.year_str = ((self.year) == 1) ? "t" : "f"
    }
    func getYear() -> Int {
        return self.year
    }
    func getYearType() -> String {
        return "Int"
    };
	func getYearStr() -> String {
        return String(year)
    };
	func getYearStrPG() -> String {
        return year_str
    };

	func setReason(reason: Int?) {
        self.reason = reason ?? 0
        self.reason_str = ((self.reason) == 1) ? "t" : "f"
    }
    func getReason() -> Int {
        return self.reason
    }
    func getReasonType() -> String {
        return "Int"
    };
	func getReasonStr() -> String {
        return String(reason)
    };
	func getReasonStrPG() -> String {
        return reason_str
    };

	func setBull(bull: Int?) {
        self.bull = bull ?? 0
        self.bull_str = ((self.bull) == 1) ? "t" : "f"
    }
    func getBull() -> Int {
        return self.bull
    }
    func getBullType() -> String {
        return "Int"
    };
	func getBullStr() -> String {
        return String(bull)
    };
	func getBullStrPG() -> String {
        return bull_str
    };

	func setCow(cow: Int?) {
        self.cow = cow ?? 0
        self.cow_str = ((self.cow) == 1) ? "t" : "f"
    }
    func getCow() -> Int {
        return self.cow
    }
    func getCowType() -> String {
        return "Int"
    };
	func getCowStr() -> String {
        return String(cow)
    };
	func getCowStrPG() -> String {
        return cow_str
    };

	func setCalf(calf: Int?) {
        self.calf = calf ?? 0
        self.calf_str = ((self.calf) == 1) ? "t" : "f"
    }
    func getCalf() -> Int {
        return self.calf
    }
    func getCalfType() -> String {
        return "Int"
    };
	func getCalfStr() -> String {
        return String(calf)
    };
	func getCalfStrPG() -> String {
        return calf_str
    };

	func setSortOrder(sort_order: Int?) {
        self.sort_order = sort_order ?? 0
        let sort_order2 = sort_order ?? 0
        self.sort_order_str = String(sort_order2)
        self.sort_order_str = (self.sort_order_str == "0") ? "" : self.sort_order_str
    }
    func getSortOrder() -> Int {
        return self.sort_order
    }
    func getSortOrderType() -> String {
        return "Int"
    };
	func getSortOrderStr() -> String {
        return sort_order_str
    };
	func getSortOrderStrPG() -> String {
        return sort_order_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "_id":
				return "Int"
			case "disposal":
				return "Int"
			case "disposal_stat":
				return "String"
			case "disposal_text":
				return "String"
			case "inventory":
				return "Int"
			case "birth":
				return "Int"
			case "wean":
				return "Int"
			case "year":
				return "Int"
			case "reason":
				return "Int"
			case "bull":
				return "Int"
			case "cow":
				return "Int"
			case "calf":
				return "Int"
			case "sort_order":
				return "Int"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "_id":
			return self.getIdStr()
			case "disposal":
			return self.getDisposalStr()
			case "disposal_stat":
			return self.getDisposalStatStr()
			case "disposal_text":
			return self.getDisposalTextStr()
			case "inventory":
			return self.getInventoryStr()
			case "birth":
			return self.getBirthStr()
			case "wean":
			return self.getWeanStr()
			case "year":
			return self.getYearStr()
			case "reason":
			return self.getReasonStr()
			case "bull":
			return self.getBullStr()
			case "cow":
			return self.getCowStr()
			case "calf":
			return self.getCalfStr()
			case "sort_order":
			return self.getSortOrderStr()
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
    func loadByID(animal_registration: String) -> [String: String] {
        let qb = QueryBuilder()
        qb.selectFrom("codes_disposal")
            .Where("animal_registration = ?")

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(animal_registration)

        let fields = [String: String]()
        let (resultset, error) = SDOld.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setId((row["_id"]?.asInt()));
				self.setDisposal((row["disposal"]?.asInt()));
				self.setDisposalStat((row["disposal_stat"]?.asString()));
				self.setDisposalText((row["disposal_text"]?.asString()));
				self.setInventory((row["inventory"]?.asMyBool()));
				self.setBirth((row["birth"]?.asMyBool()));
				self.setWean((row["wean"]?.asMyBool()));
				self.setYear((row["year"]?.asMyBool()));
				self.setReason((row["reason"]?.asMyBool()));
				self.setBull((row["bull"]?.asMyBool()));
				self.setCow((row["cow"]?.asMyBool()));
				self.setCalf((row["calf"]?.asMyBool()));
				self.setSortOrder((row["sort_order"]?.asInt()));

				var fields = [String: String]()
				fields["_id"] = self.getIdStr()
				fields["disposal"] = self.getDisposalStr()
				fields["disposal_stat"] = self.getDisposalStatStr()
				fields["disposal_text"] = self.getDisposalTextStr()
				fields["inventory"] = self.getInventoryStr()
				fields["birth"] = self.getBirthStr()
				fields["wean"] = self.getWeanStr()
				fields["year"] = self.getYearStr()
				fields["reason"] = self.getReasonStr()
				fields["bull"] = self.getBullStr()
				fields["cow"] = self.getCowStr()
				fields["calf"] = self.getCalfStr()
				fields["sort_order"] = self.getSortOrderStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["_id"] = self.getIdStr()
		fields["disposal"] = self.getDisposalStr()
		fields["disposal_stat"] = self.getDisposalStatStr()
		fields["disposal_text"] = self.getDisposalTextStr()
		fields["inventory"] = self.getInventoryStr()
		fields["birth"] = self.getBirthStr()
		fields["wean"] = self.getWeanStr()
		fields["year"] = self.getYearStr()
		fields["reason"] = self.getReasonStr()
		fields["bull"] = self.getBullStr()
		fields["cow"] = self.getCowStr()
		fields["calf"] = self.getCalfStr()
		fields["sort_order"] = self.getSortOrderStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["_id"] = self.getIdStrPG()
		fields["disposal"] = self.getDisposalStrPG()
		fields["disposal_stat"] = self.getDisposalStatStrPG()
		fields["disposal_text"] = self.getDisposalTextStrPG()
		fields["inventory"] = self.getInventoryStrPG()
		fields["birth"] = self.getBirthStrPG()
		fields["wean"] = self.getWeanStrPG()
		fields["year"] = self.getYearStrPG()
		fields["reason"] = self.getReasonStrPG()
		fields["bull"] = self.getBullStrPG()
		fields["cow"] = self.getCowStrPG()
		fields["calf"] = self.getCalfStrPG()
		fields["sort_order"] = self.getSortOrderStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO codes_disposal ("
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

        var statement = "INSERT INTO codes_disposal ("
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

            var statement = "INSERT INTO codes_disposal ("

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

        var statement = "UPDATE codes_disposal "
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
        statement += "WHERE animal_registration = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query(statement)
    }

    func updatePG(forID: String) {

        // get all field/values as string values
        var fields = self.getFieldsPG()

        var statement = "UPDATE codes_disposal "
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
        statement += "WHERE animal_registration = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    func delete(forID: Int) {
        let query = "DELETE FROM codes_disposal WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM codes_disposal WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastanimalRegistration() -> String {
        let animal_registration: String = ""
        let query = "SELECT animal_registration from codes_disposal ORDER BY _id DESC LIMIT 1 "
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
