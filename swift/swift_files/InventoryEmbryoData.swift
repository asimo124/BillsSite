

//
//  InventoryEmbryo.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class InventoryEmbryoData {

	var embryo_id: Int = -1
    var embryo_id_str: String = "unset"
	var member_id: String = "unset"
    var member_id_str: String = "unset"
	var registration: String = "unset"
    var registration_str: String = "unset"
	var tank: String = "unset"
    var tank_str: String = "unset"
	var canister: String = "unset"
    var canister_str: String = "unset"
	var cane: String = "unset"
    var cane_str: String = "unset"
	var straw_qty: Int = -1
    var straw_qty_str: String = "unset"
	var flush_date: NSDate = NSDate.distantFuture() as NSDate
    var flush_date_str: String = "unset"
	
	func setEmbryoId(embryo_id: Int?) {
        self.embryo_id = embryo_id ?? 0
        let embryo_id2 = embryo_id ?? 0
        self.embryo_id_str = String(embryo_id2)
        self.embryo_id_str = (self.embryo_id_str == "0") ? "" : self.embryo_id_str
    }
    func getEmbryoId() -> Int {
        return self.embryo_id
    }
    func getEmbryoIdType() -> String {
        return "Int"
    };
	func getEmbryoIdStr() -> String {
        return embryo_id_str
    };
	func getEmbryoIdStrPG() -> String {
        return embryo_id_str
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

	func setTank(tank: String?) {
        self.tank = tank ?? ""
        self.tank_str = String(self.tank)
    }
    func getTank() -> String {
        return self.tank
    }
    func getTankType() -> String {
        return "String"
    };
	func getTankStr() -> String {
        return tank_str == "unset" ? "" : tank_str
    };
	func getTankStrPG() -> String {
        return tank_str == "unset" ? "" : tank_str
    };

	func setCanister(canister: String?) {
        self.canister = canister ?? ""
        self.canister_str = String(self.canister)
    }
    func getCanister() -> String {
        return self.canister
    }
    func getCanisterType() -> String {
        return "String"
    };
	func getCanisterStr() -> String {
        return canister_str == "unset" ? "" : canister_str
    };
	func getCanisterStrPG() -> String {
        return canister_str == "unset" ? "" : canister_str
    };

	func setCane(cane: String?) {
        self.cane = cane ?? ""
        self.cane_str = String(self.cane)
    }
    func getCane() -> String {
        return self.cane
    }
    func getCaneType() -> String {
        return "String"
    };
	func getCaneStr() -> String {
        return cane_str == "unset" ? "" : cane_str
    };
	func getCaneStrPG() -> String {
        return cane_str == "unset" ? "" : cane_str
    };

	func setStrawQty(straw_qty: Int?) {
        self.straw_qty = straw_qty ?? 0
        let straw_qty2 = straw_qty ?? 0
        self.straw_qty_str = String(straw_qty2)
        self.straw_qty_str = (self.straw_qty_str == "0") ? "" : self.straw_qty_str
    }
    func getStrawQty() -> Int {
        return self.straw_qty
    }
    func getStrawQtyType() -> String {
        return "Int"
    };
	func getStrawQtyStr() -> String {
        return straw_qty_str
    };
	func getStrawQtyStrPG() -> String {
        return straw_qty_str
    };

	func setFlushDate(flush_date: NSDate?) {
        self.flush_date = flush_date ?? NSDate.distantPast() as NSDate
        self.flush_date_str = Utils.dateToString(self.flush_date)
    }
    func getFlushDate() -> NSDate {
        return self.flush_date
    }
    func getFlushDateType() -> String {
        return "NSDate"
    };
	func getFlushDateStr() -> String {
        return flush_date_str == "unset" || flush_date_str == "0000-12-30 00:00:00 +0000" ? "" : flush_date_str
    };
	func getFlushDateStrPG() -> String {
        return flush_date_str == "unset" || flush_date_str == "0000-12-30 00:00:00 +0000" ? "" : flush_date_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "embryo_id":
				return "Int"
			case "member_id":
				return "String"
			case "registration":
				return "String"
			case "tank":
				return "String"
			case "canister":
				return "String"
			case "cane":
				return "String"
			case "straw_qty":
				return "Int"
			case "flush_date":
				return "NSDate"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "embryo_id":
			return self.getEmbryoIdStr()
			case "member_id":
			return self.getMemberIdStr()
			case "registration":
			return self.getRegistrationStr()
			case "tank":
			return self.getTankStr()
			case "canister":
			return self.getCanisterStr()
			case "cane":
			return self.getCaneStr()
			case "straw_qty":
			return self.getStrawQtyStr()
			case "flush_date":
			return self.getFlushDateStr()
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
    func loadByEmbryoID(EmbryoID: Int) -> [String: String] {
        
        var query =
        "SELECT * FROM embryo_inventory " +
        "WHERE embryo_id = ? and ifnull(straw_qty, 0) > 0 and straw_qty <> '' "

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(EmbryoID)

        var fields = [String: String]()
        let (resultset, error) = SD.executeQuery(query, withArgs: fieldsArr)
        if (error != nil) {
            SD.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setEmbryoId((row["embryo_id"]?.asInt()));
				self.setMemberId((row["member_id"]?.asString()));
				self.setRegistration((row["registration"]?.asString()));
				self.setTank((row["tank"]?.asString()));
				self.setCanister((row["canister"]?.asString()));
				self.setCane((row["cane"]?.asString()));
				self.setStrawQty((row["straw_qty"]?.asInt()));
				self.setFlushDate((row["flush_date"]?.asDate()));

				
				fields["embryo_id"] = self.getEmbryoIdStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["registration"] = self.getRegistrationStr()
				fields["tank"] = self.getTankStr()
				fields["canister"] = self.getCanisterStr()
				fields["cane"] = self.getCaneStr()
				fields["straw_qty"] = self.getStrawQtyStr()
				fields["flush_date"] = self.getFlushDateStr()

                return fields
            }
        }
        return fields
    }
    
    func findByMemberID(member_id: String) -> [InventoryEmbryoData] {
        
        let query =
        "select A.* " +
        "from embryo_inventory A " +
        "WHERE A.member_id = ? and ifnull(A.straw_qty, 0) > 0 and A.straw_qty <> '' " +
        "ORDER BY A.straw_qty DESC "
        
        var withFields = [AnyObject]()
        withFields.append(member_id)
        
        var EmbryoHolder: [InventoryEmbryoData] = []
        SD.printQuery(query, withArgs: withFields)
        let (resultset, error) = SD.executeQuery(query, withArgs: withFields)
        if error != nil {
            SD.printDie(error!)
        } else {
            if resultset.count > 0 {
                for row in resultset {
                    
                    let Embryo = InventoryEmbryoData()
                    Embryo.setEmbryoId((row["embryo_id"]?.asInt()));
                    Embryo.setMemberId((row["member_id"]?.asString()));
                    Embryo.setRegistration((row["registration"]?.asString()));
                    Embryo.setTank((row["tank"]?.asString()));
                    Embryo.setCanister((row["canister"]?.asString()));
                    Embryo.setCane((row["cane"]?.asString()));
                    Embryo.setStrawQty((row["straw_qty"]?.asInt()));
                    Embryo.setFlushDate((row["flush_date"]?.asDate()));
                    EmbryoHolder.append(Embryo)
                }
            }
        }
        return EmbryoHolder
    }
    
    func findAnimalNamesByMemberID(member_id: String) -> [[String: AnyObject]] {

        let query =
        "select B.animal_name, B.private_herd_number " +
        "from embryo_inventory A " +
        "INNER JOIN animal B " +
        "ON A.registration = B.registration " +
        "WHERE A.member_id = ? and ifnull(A.straw_qty, 0) > 0 and A.straw_qty <> '' " +
        "ORDER BY A.canister DESC "
        
        var withFields = [AnyObject]()
        withFields.append(member_id)
        
        var AnimalNames = [[String: AnyObject]]()
        let (resultset, error) = SD.executeQuery(query, withArgs: withFields)
        if (error != nil) {
            SD.printDie(error!)
        } else {
            
            if resultset.count > 0 {
                for row in resultset {
                    var fieldsArr = [String: AnyObject]()
                    fieldsArr["animal_name"] = row["animal_name"]?.asString() ?? ""
                    fieldsArr["private_herd_number"] = row["private_herd_number"]?.asString() ?? ""
                    AnimalNames.append(fieldsArr)
                }
            }
        }
        return AnimalNames
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["embryo_id"] = self.getEmbryoIdStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["registration"] = self.getRegistrationStr()
		fields["tank"] = self.getTankStr()
		fields["canister"] = self.getCanisterStr()
		fields["cane"] = self.getCaneStr()
		fields["straw_qty"] = self.getStrawQtyStr()
		fields["flush_date"] = self.getFlushDateStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["embryo_id"] = self.getEmbryoIdStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["registration"] = self.getRegistrationStrPG()
		fields["tank"] = self.getTankStrPG()
		fields["canister"] = self.getCanisterStrPG()
		fields["cane"] = self.getCaneStrPG()
		fields["straw_qty"] = self.getStrawQtyStrPG()
		fields["flush_date"] = self.getFlushDateStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO embryo_inventory ("
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
        
        print("statement1:", statement)

        let dbn = Database()
        dbn.query(statement)
    }

    func addNewPG() {

        var statement = "INSERT INTO embryo_inventory ("
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
        
        statement = statement.stringByReplacingOccurrencesOfString("'", withString: "''")
        
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

            var statement = "INSERT INTO embryo_inventory ("

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

    func updateForEmbryoID(embryo_id: Int, var andMemberID: String) {

        andMemberID = andMemberID.stringByReplacingOccurrencesOfString("'", withString: "''")
        var embryo_id2 = String(embryo_id)
        embryo_id2 = embryo_id2.stringByReplacingOccurrencesOfString("'", withString: "''")
        
        // get all field/values as string values
        var fields = self.getFields()

        var statement = "UPDATE embryo_inventory "
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
        statement += "WHERE member_id = '" + String(andMemberID) + "' and embryo_id = '" + embryo_id2 + "' "

        let dbn = Database()
        dbn.query(statement)
    }

    func updateForEmbryoIDPG(embryo_id: Int, var andMemberID: String) {

        andMemberID = andMemberID.stringByReplacingOccurrencesOfString("'", withString: "''")
        var embryo_id2 = String(embryo_id)
        embryo_id2 = embryo_id2.stringByReplacingOccurrencesOfString("'", withString: "''")
        
        // get all field/values as string values
        var fields = self.getFieldsPG()

        var statement = "UPDATE embryo_inventory "
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
        statement += "WHERE member_id = '" + String(andMemberID) + "' and embryo_id = '" + embryo_id2 + "' "
        
        statement = statement.stringByReplacingOccurrencesOfString("'", withString: "''")

        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    func deleteForEmbryoID(embryo_id: Int, var andMemberID: String) {
        
        
        let query = "DELETE FROM embryo_inventory WHERE member_id = ? and embryo_id = ? "
        
        var fieldsArr = [AnyObject]()
        fieldsArr.append(andMemberID)
        fieldsArr.append(embryo_id)
        
        let error = SD.executeChange(query, withArgs: fieldsArr)
        if error != nil {
            SD.printDie(error!)
        }
    }


    func deleteForEmbryoIDPG(embryo_id: Int, var andMemberID: String) {

        let query = "DELETE FROM embryo_inventory WHERE member_id = ? and embryo_id = ? "
        
        var fieldsArr = [AnyObject]()
        fieldsArr.append(andMemberID)
        fieldsArr.append(embryo_id)
        
        var statement = SD.printQuery(query, withArgs: fieldsArr)
        
        statement = statement.stringByReplacingOccurrencesOfString("'", withString: "''")
                
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastmemberId() -> String {
        let member_id: String = ""
        let query = "SELECT member_id from embryo_inventory ORDER BY _id DESC LIMIT 1 "
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
