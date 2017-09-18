

//
//  TblAnimalHealth.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalHealthData {

	var animal_health_id: Int = -1
    var animal_health_id_str: String = "unset"
	var animal_registration: String = "unset"
    var animal_registration_str: String = "unset"
	var date_administered: NSDate = NSDate.distantFuture() as NSDate
    var date_administered_str: String = "unset"
	var product_name: String = "unset"
    var product_name_str: String = "unset"
	var serial_number: String = "unset"
    var serial_number_str: String = "unset"
	var dosage: String = "unset"
    var dosage_str: String = "unset"
	var application_location: String = "unset"
    var application_location_str: String = "unset"
	var withdrawal_period: String = "unset"
    var withdrawal_period_str: String = "unset"
	var administered_by: String = "unset"
    var administered_by_str: String = "unset"
	var create_user: String = "unset"
    var create_user_str: String = "unset"
	var create_stamp: NSDate = NSDate.distantFuture() as NSDate
    var create_stamp_str: String = "unset"
	var update_user: String = "unset"
    var update_user_str: String = "unset"
	var update_stamp: NSDate = NSDate.distantFuture() as NSDate
    var update_stamp_str: String = "unset"
	var lot_number: String = "unset"
    var lot_number_str: String = "unset"
	var application_method: String = "unset"
    var application_method_str: String = "unset"
	var expiration_date: String = "unset"
    var expiration_date_str: String = "unset"
	
	func setAnimalHealthId(animal_health_id: Int?) {
        self.animal_health_id = animal_health_id ?? 0
        let animal_health_id2 = animal_health_id ?? 0
        self.animal_health_id_str = String(animal_health_id2)
        self.animal_health_id_str = (self.animal_health_id_str == "0") ? "" : self.animal_health_id_str
    }
    func getAnimalHealthId() -> Int {
        return self.animal_health_id
    }
    func getAnimalHealthIdType() -> String {
        return "Int"
    };
	func getAnimalHealthIdStr() -> String {
        return animal_health_id_str
    };
	func getAnimalHealthIdStrPG() -> String {
        return animal_health_id_str
    };

	func setAnimalRegistration(animal_registration: String?) {
        self.animal_registration = animal_registration ?? ""
        self.animal_registration_str = String(self.animal_registration)
    }
    func getAnimalRegistration() -> String {
        return self.animal_registration
    }
    func getAnimalRegistrationType() -> String {
        return "String"
    };
	func getAnimalRegistrationStr() -> String {
        return animal_registration_str == "unset" ? "" : animal_registration_str
    };
	func getAnimalRegistrationStrPG() -> String {
        return animal_registration_str == "unset" ? "" : animal_registration_str
    };

	func setDateAdministered(date_administered: NSDate?) {
        self.date_administered = date_administered ?? NSDate.distantPast() as NSDate
        self.date_administered_str = Utils.dateToString(self.date_administered)
    }
    func getDateAdministered() -> NSDate {
        return self.date_administered
    }
    func getDateAdministeredType() -> String {
        return "NSDate"
    };
	func getDateAdministeredStr() -> String {
        return date_administered_str == "unset" || date_administered_str == "0000-12-30 00:00:00 +0000" ? "" : date_administered_str
    };
	func getDateAdministeredStrPG() -> String {
        return date_administered_str == "unset" || date_administered_str == "0000-12-30 00:00:00 +0000" ? "" : date_administered_str
    };

	func setProductName(product_name: String?) {
        self.product_name = product_name ?? ""
        self.product_name_str = String(self.product_name)
    }
    func getProductName() -> String {
        return self.product_name
    }
    func getProductNameType() -> String {
        return "String"
    };
	func getProductNameStr() -> String {
        return product_name_str == "unset" ? "" : product_name_str
    };
	func getProductNameStrPG() -> String {
        return product_name_str == "unset" ? "" : product_name_str
    };

	func setSerialNumber(serial_number: String?) {
        self.serial_number = serial_number ?? ""
        self.serial_number_str = String(self.serial_number)
    }
    func getSerialNumber() -> String {
        return self.serial_number
    }
    func getSerialNumberType() -> String {
        return "String"
    };
	func getSerialNumberStr() -> String {
        return serial_number_str == "unset" ? "" : serial_number_str
    };
	func getSerialNumberStrPG() -> String {
        return serial_number_str == "unset" ? "" : serial_number_str
    };

	func setDosage(dosage: String?) {
        self.dosage = dosage ?? ""
        self.dosage_str = String(self.dosage)
    }
    func getDosage() -> String {
        return self.dosage
    }
    func getDosageType() -> String {
        return "String"
    };
	func getDosageStr() -> String {
        return dosage_str == "unset" ? "" : dosage_str
    };
	func getDosageStrPG() -> String {
        return dosage_str == "unset" ? "" : dosage_str
    };

	func setApplicationLocation(application_location: String?) {
        self.application_location = application_location ?? ""
        self.application_location_str = String(self.application_location)
    }
    func getApplicationLocation() -> String {
        return self.application_location
    }
    func getApplicationLocationType() -> String {
        return "String"
    };
	func getApplicationLocationStr() -> String {
        return application_location_str == "unset" ? "" : application_location_str
    };
	func getApplicationLocationStrPG() -> String {
        return application_location_str == "unset" ? "" : application_location_str
    };

	func setWithdrawalPeriod(withdrawal_period: String?) {
        self.withdrawal_period = withdrawal_period ?? ""
        self.withdrawal_period_str = String(self.withdrawal_period)
    }
    func getWithdrawalPeriod() -> String {
        return self.withdrawal_period
    }
    func getWithdrawalPeriodType() -> String {
        return "String"
    };
	func getWithdrawalPeriodStr() -> String {
        return withdrawal_period_str == "unset" ? "" : withdrawal_period_str
    };
	func getWithdrawalPeriodStrPG() -> String {
        return withdrawal_period_str == "unset" ? "" : withdrawal_period_str
    };

	func setAdministeredBy(administered_by: String?) {
        self.administered_by = administered_by ?? ""
        self.administered_by_str = String(self.administered_by)
    }
    func getAdministeredBy() -> String {
        return self.administered_by
    }
    func getAdministeredByType() -> String {
        return "String"
    };
	func getAdministeredByStr() -> String {
        return administered_by_str == "unset" ? "" : administered_by_str
    };
	func getAdministeredByStrPG() -> String {
        return administered_by_str == "unset" ? "" : administered_by_str
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

	func setLotNumber(lot_number: String?) {
        self.lot_number = lot_number ?? ""
        self.lot_number_str = String(self.lot_number)
    }
    func getLotNumber() -> String {
        return self.lot_number
    }
    func getLotNumberType() -> String {
        return "String"
    };
	func getLotNumberStr() -> String {
        return lot_number_str == "unset" ? "" : lot_number_str
    };
	func getLotNumberStrPG() -> String {
        return lot_number_str == "unset" ? "" : lot_number_str
    };

	func setApplicationMethod(application_method: String?) {
        self.application_method = application_method ?? ""
        self.application_method_str = String(self.application_method)
    }
    func getApplicationMethod() -> String {
        return self.application_method
    }
    func getApplicationMethodType() -> String {
        return "String"
    };
	func getApplicationMethodStr() -> String {
        return application_method_str == "unset" ? "" : application_method_str
    };
	func getApplicationMethodStrPG() -> String {
        return application_method_str == "unset" ? "" : application_method_str
    };

	func setExpirationDate(expiration_date: String?) {
        self.expiration_date = expiration_date ?? ""
        self.expiration_date_str = String(self.expiration_date)
    }
    func getExpirationDate() -> String {
        return self.expiration_date
    }
    func getExpirationDateType() -> String {
        return "String"
    };
	func getExpirationDateStr() -> String {
        return expiration_date_str == "unset" ? "" : expiration_date_str
    };
	func getExpirationDateStrPG() -> String {
        return expiration_date_str == "unset" ? "" : expiration_date_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "animal_health_id":
				return "Int"
			case "animal_registration":
				return "String"
			case "date_administered":
				return "NSDate"
			case "product_name":
				return "String"
			case "serial_number":
				return "String"
			case "dosage":
				return "String"
			case "application_location":
				return "String"
			case "withdrawal_period":
				return "String"
			case "administered_by":
				return "String"
			case "create_user":
				return "String"
			case "create_stamp":
				return "NSDate"
			case "update_user":
				return "String"
			case "update_stamp":
				return "NSDate"
			case "lot_number":
				return "String"
			case "application_method":
				return "String"
			case "expiration_date":
				return "String"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "animal_health_id":
			return self.getAnimalHealthIdStr()
			case "animal_registration":
			return self.getAnimalRegistrationStr()
			case "date_administered":
			return self.getDateAdministeredStr()
			case "product_name":
			return self.getProductNameStr()
			case "serial_number":
			return self.getSerialNumberStr()
			case "dosage":
			return self.getDosageStr()
			case "application_location":
			return self.getApplicationLocationStr()
			case "withdrawal_period":
			return self.getWithdrawalPeriodStr()
			case "administered_by":
			return self.getAdministeredByStr()
			case "create_user":
			return self.getCreateUserStr()
			case "create_stamp":
			return self.getCreateStampStr()
			case "update_user":
			return self.getUpdateUserStr()
			case "update_stamp":
			return self.getUpdateStampStr()
			case "lot_number":
			return self.getLotNumberStr()
			case "application_method":
			return self.getApplicationMethodStr()
			case "expiration_date":
			return self.getExpirationDateStr()
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
        qb.selectFrom("tbl_animal_health")
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

				self.setAnimalHealthId((row["animal_health_id"]?.asInt()));
				self.setAnimalRegistration((row["animal_registration"]?.asString()));
				self.setDateAdministered((row["date_administered"]?.asDate()));
				self.setProductName((row["product_name"]?.asString()));
				self.setSerialNumber((row["serial_number"]?.asString()));
				self.setDosage((row["dosage"]?.asString()));
				self.setApplicationLocation((row["application_location"]?.asString()));
				self.setWithdrawalPeriod((row["withdrawal_period"]?.asString()));
				self.setAdministeredBy((row["administered_by"]?.asString()));
				self.setCreateUser((row["create_user"]?.asString()));
				self.setCreateStamp((row["create_stamp"]?.asDate()));
				self.setUpdateUser((row["update_user"]?.asString()));
				self.setUpdateStamp((row["update_stamp"]?.asDate()));
				self.setLotNumber((row["lot_number"]?.asString()));
				self.setApplicationMethod((row["application_method"]?.asString()));
				self.setExpirationDate((row["expiration_date"]?.asString()));

				var fields = [String: String]()
				fields["animal_health_id"] = self.getAnimalHealthIdStr()
				fields["animal_registration"] = self.getAnimalRegistrationStr()
				fields["date_administered"] = self.getDateAdministeredStr()
				fields["product_name"] = self.getProductNameStr()
				fields["serial_number"] = self.getSerialNumberStr()
				fields["dosage"] = self.getDosageStr()
				fields["application_location"] = self.getApplicationLocationStr()
				fields["withdrawal_period"] = self.getWithdrawalPeriodStr()
				fields["administered_by"] = self.getAdministeredByStr()
				fields["create_user"] = self.getCreateUserStr()
				fields["create_stamp"] = self.getCreateStampStr()
				fields["update_user"] = self.getUpdateUserStr()
				fields["update_stamp"] = self.getUpdateStampStr()
				fields["lot_number"] = self.getLotNumberStr()
				fields["application_method"] = self.getApplicationMethodStr()
				fields["expiration_date"] = self.getExpirationDateStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["animal_health_id"] = self.getAnimalHealthIdStr()
		fields["animal_registration"] = self.getAnimalRegistrationStr()
		fields["date_administered"] = self.getDateAdministeredStr()
		fields["product_name"] = self.getProductNameStr()
		fields["serial_number"] = self.getSerialNumberStr()
		fields["dosage"] = self.getDosageStr()
		fields["application_location"] = self.getApplicationLocationStr()
		fields["withdrawal_period"] = self.getWithdrawalPeriodStr()
		fields["administered_by"] = self.getAdministeredByStr()
		fields["create_user"] = self.getCreateUserStr()
		fields["create_stamp"] = self.getCreateStampStr()
		fields["update_user"] = self.getUpdateUserStr()
		fields["update_stamp"] = self.getUpdateStampStr()
		fields["lot_number"] = self.getLotNumberStr()
		fields["application_method"] = self.getApplicationMethodStr()
		fields["expiration_date"] = self.getExpirationDateStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["animal_health_id"] = self.getAnimalHealthIdStrPG()
		fields["animal_registration"] = self.getAnimalRegistrationStrPG()
		fields["date_administered"] = self.getDateAdministeredStrPG()
		fields["product_name"] = self.getProductNameStrPG()
		fields["serial_number"] = self.getSerialNumberStrPG()
		fields["dosage"] = self.getDosageStrPG()
		fields["application_location"] = self.getApplicationLocationStrPG()
		fields["withdrawal_period"] = self.getWithdrawalPeriodStrPG()
		fields["administered_by"] = self.getAdministeredByStrPG()
		fields["create_user"] = self.getCreateUserStrPG()
		fields["create_stamp"] = self.getCreateStampStrPG()
		fields["update_user"] = self.getUpdateUserStrPG()
		fields["update_stamp"] = self.getUpdateStampStrPG()
		fields["lot_number"] = self.getLotNumberStrPG()
		fields["application_method"] = self.getApplicationMethodStrPG()
		fields["expiration_date"] = self.getExpirationDateStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_animal_health ("
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

        var statement = "INSERT INTO tbl_animal_health ("
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

            var statement = "INSERT INTO tbl_animal_health ("

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

        var statement = "UPDATE tbl_animal_health "
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

        var statement = "UPDATE tbl_animal_health "
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
        let query = "DELETE FROM tbl_animal_health WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM tbl_animal_health WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastanimalRegistration() -> String {
        let animal_registration: String = ""
        let query = "SELECT animal_registration from tbl_animal_health ORDER BY _id DESC LIMIT 1 "
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
