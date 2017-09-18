

//
//  InventoryHealth.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class InventoryHealthData {

	var _id: Int = -1
    var _id_str: String = "unset"
	var health_id: Int = -1
    var health_id_str: String = "unset"
	var member_id: String = "unset"
    var member_id_str: String = "unset"
	var product_name: String = "unset"
    var product_name_str: String = "unset"
	var withdrawal_period: String = "unset"
    var withdrawal_period_str: String = "unset"
	var lot_number: String = "unset"
    var lot_number_str: String = "unset"
	var serial_number: String = "unset"
    var serial_number_str: String = "unset"
	var expiration_date: NSDate = NSDate.distantFuture() as NSDate
    var expiration_date_str: String = "unset"
	var dosage: String = "unset"
    var dosage_str: String = "unset"
	var method: String = "unset"
    var method_str: String = "unset"
	var location: String = "unset"
    var location_str: String = "unset"
	var administered_by: String = "unset"
    var administered_by_str: String = "unset"
	var less_than_ten_months: Int = -1
    var less_than_ten_months_str: String = "unset"
	var greater_than_ten_months: Int = -1
    var greater_than_ten_months_str: String = "unset"
	var less_than_twelve_months: Int = -1
    var less_than_twelve_months_str: String = "unset"
	var female_only: Int = -1
    var female_only_str: String = "unset"
	var male_only: Int = -1
    var male_only_str: String = "unset"
	var is_bangs: Int = -1
    var is_bangs_str: String = "unset"
	var no_requirement: Int = -1
    var no_requirement_str: String = "unset"
	var is_active: Int = -1
    var is_active_str: String = "unset"
	
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

	func setHealthId(health_id: Int?) {
        self.health_id = health_id ?? 0
        let health_id2 = health_id ?? 0
        self.health_id_str = String(health_id2)
        self.health_id_str = (self.health_id_str == "0") ? "" : self.health_id_str
    }
    func getHealthId() -> Int {
        return self.health_id
    }
    func getHealthIdType() -> String {
        return "Int"
    };
	func getHealthIdStr() -> String {
        return health_id_str
    };
	func getHealthIdStrPG() -> String {
        return health_id_str
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

	func setExpirationDate(expiration_date: NSDate?) {
        self.expiration_date = expiration_date ?? NSDate.distantPast() as NSDate
        self.expiration_date_str = Utils.dateToString(self.expiration_date)
    }
    func getExpirationDate() -> NSDate {
        return self.expiration_date
    }
    func getExpirationDateType() -> String {
        return "NSDate"
    };
	func getExpirationDateStr() -> String {
        return expiration_date_str == "unset" || expiration_date_str == "0000-12-30 00:00:00 +0000" ? "" : expiration_date_str
    };
	func getExpirationDateStrPG() -> String {
        return expiration_date_str == "unset" || expiration_date_str == "0000-12-30 00:00:00 +0000" ? "" : expiration_date_str
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

	func setMethod(method: String?) {
        self.method = method ?? ""
        self.method_str = String(self.method)
    }
    func getMethod() -> String {
        return self.method
    }
    func getMethodType() -> String {
        return "String"
    };
	func getMethodStr() -> String {
        return method_str == "unset" ? "" : method_str
    };
	func getMethodStrPG() -> String {
        return method_str == "unset" ? "" : method_str
    };

	func setLocation(location: String?) {
        self.location = location ?? ""
        self.location_str = String(self.location)
    }
    func getLocation() -> String {
        return self.location
    }
    func getLocationType() -> String {
        return "String"
    };
	func getLocationStr() -> String {
        return location_str == "unset" ? "" : location_str
    };
	func getLocationStrPG() -> String {
        return location_str == "unset" ? "" : location_str
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

	func setLessThanTenMonths(less_than_ten_months: Int?) {
        self.less_than_ten_months = less_than_ten_months ?? 0
        self.less_than_ten_months_str = ((self.less_than_ten_months) == 1) ? "t" : "f"
    }
    func getLessThanTenMonths() -> Int {
        return self.less_than_ten_months
    }
    func getLessThanTenMonthsType() -> String {
        return "Int"
    };
	func getLessThanTenMonthsStr() -> String {
        return String(less_than_ten_months)
    };
	func getLessThanTenMonthsStrPG() -> String {
        return less_than_ten_months_str
    };

	func setGreaterThanTenMonths(greater_than_ten_months: Int?) {
        self.greater_than_ten_months = greater_than_ten_months ?? 0
        self.greater_than_ten_months_str = ((self.greater_than_ten_months) == 1) ? "t" : "f"
    }
    func getGreaterThanTenMonths() -> Int {
        return self.greater_than_ten_months
    }
    func getGreaterThanTenMonthsType() -> String {
        return "Int"
    };
	func getGreaterThanTenMonthsStr() -> String {
        return String(greater_than_ten_months)
    };
	func getGreaterThanTenMonthsStrPG() -> String {
        return greater_than_ten_months_str
    };

	func setLessThanTwelveMonths(less_than_twelve_months: Int?) {
        self.less_than_twelve_months = less_than_twelve_months ?? 0
        self.less_than_twelve_months_str = ((self.less_than_twelve_months) == 1) ? "t" : "f"
    }
    func getLessThanTwelveMonths() -> Int {
        return self.less_than_twelve_months
    }
    func getLessThanTwelveMonthsType() -> String {
        return "Int"
    };
	func getLessThanTwelveMonthsStr() -> String {
        return String(less_than_twelve_months)
    };
	func getLessThanTwelveMonthsStrPG() -> String {
        return less_than_twelve_months_str
    };

	func setFemaleOnly(female_only: Int?) {
        self.female_only = female_only ?? 0
        self.female_only_str = ((self.female_only) == 1) ? "t" : "f"
    }
    func getFemaleOnly() -> Int {
        return self.female_only
    }
    func getFemaleOnlyType() -> String {
        return "Int"
    };
	func getFemaleOnlyStr() -> String {
        return String(female_only)
    };
	func getFemaleOnlyStrPG() -> String {
        return female_only_str
    };

	func setMaleOnly(male_only: Int?) {
        self.male_only = male_only ?? 0
        self.male_only_str = ((self.male_only) == 1) ? "t" : "f"
    }
    func getMaleOnly() -> Int {
        return self.male_only
    }
    func getMaleOnlyType() -> String {
        return "Int"
    };
	func getMaleOnlyStr() -> String {
        return String(male_only)
    };
	func getMaleOnlyStrPG() -> String {
        return male_only_str
    };

	func setIsBangs(is_bangs: Int?) {
        self.is_bangs = is_bangs ?? 0
        self.is_bangs_str = ((self.is_bangs) == 1) ? "t" : "f"
    }
    func getIsBangs() -> Int {
        return self.is_bangs
    }
    func getIsBangsType() -> String {
        return "Int"
    };
	func getIsBangsStr() -> String {
        return String(is_bangs)
    };
	func getIsBangsStrPG() -> String {
        return is_bangs_str
    };

	func setNoRequirement(no_requirement: Int?) {
        self.no_requirement = no_requirement ?? 0
        self.no_requirement_str = ((self.no_requirement) == 1) ? "t" : "f"
    }
    func getNoRequirement() -> Int {
        return self.no_requirement
    }
    func getNoRequirementType() -> String {
        return "Int"
    };
	func getNoRequirementStr() -> String {
        return String(no_requirement)
    };
	func getNoRequirementStrPG() -> String {
        return no_requirement_str
    };

	func setIsActive(is_active: Int?) {
        self.is_active = is_active ?? 0
        self.is_active_str = ((self.is_active) == 1) ? "t" : "f"
    }
    func getIsActive() -> Int {
        return self.is_active
    }
    func getIsActiveType() -> String {
        return "Int"
    };
	func getIsActiveStr() -> String {
        return String(is_active)
    };
	func getIsActiveStrPG() -> String {
        return is_active_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "_id":
				return "Int"
			case "health_id":
				return "Int"
			case "member_id":
				return "String"
			case "product_name":
				return "String"
			case "withdrawal_period":
				return "String"
			case "lot_number":
				return "String"
			case "serial_number":
				return "String"
			case "expiration_date":
				return "NSDate"
			case "dosage":
				return "String"
			case "method":
				return "String"
			case "location":
				return "String"
			case "administered_by":
				return "String"
			case "less_than_ten_months":
				return "Int"
			case "greater_than_ten_months":
				return "Int"
			case "less_than_twelve_months":
				return "Int"
			case "female_only":
				return "Int"
			case "male_only":
				return "Int"
			case "is_bangs":
				return "Int"
			case "no_requirement":
				return "Int"
			case "is_active":
				return "Int"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "_id":
			return self.getIdStr()
			case "health_id":
			return self.getHealthIdStr()
			case "member_id":
			return self.getMemberIdStr()
			case "product_name":
			return self.getProductNameStr()
			case "withdrawal_period":
			return self.getWithdrawalPeriodStr()
			case "lot_number":
			return self.getLotNumberStr()
			case "serial_number":
			return self.getSerialNumberStr()
			case "expiration_date":
			return self.getExpirationDateStr()
			case "dosage":
			return self.getDosageStr()
			case "method":
			return self.getMethodStr()
			case "location":
			return self.getLocationStr()
			case "administered_by":
			return self.getAdministeredByStr()
			case "less_than_ten_months":
			return self.getLessThanTenMonthsStr()
			case "greater_than_ten_months":
			return self.getGreaterThanTenMonthsStr()
			case "less_than_twelve_months":
			return self.getLessThanTwelveMonthsStr()
			case "female_only":
			return self.getFemaleOnlyStr()
			case "male_only":
			return self.getMaleOnlyStr()
			case "is_bangs":
			return self.getIsBangsStr()
			case "no_requirement":
			return self.getNoRequirementStr()
			case "is_active":
			return self.getIsActiveStr()
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
        qb.selectFrom("health_manager")
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
				self.setHealthId((row["health_id"]?.asInt()));
				self.setMemberId((row["member_id"]?.asString()));
				self.setProductName((row["product_name"]?.asString()));
				self.setWithdrawalPeriod((row["withdrawal_period"]?.asString()));
				self.setLotNumber((row["lot_number"]?.asString()));
				self.setSerialNumber((row["serial_number"]?.asString()));
				self.setExpirationDate((row["expiration_date"]?.asDate()));
				self.setDosage((row["dosage"]?.asString()));
				self.setMethod((row["method"]?.asString()));
				self.setLocation((row["location"]?.asString()));
				self.setAdministeredBy((row["administered_by"]?.asString()));
				self.setLessThanTenMonths((row["less_than_ten_months"]?.asMyBool()));
				self.setGreaterThanTenMonths((row["greater_than_ten_months"]?.asMyBool()));
				self.setLessThanTwelveMonths((row["less_than_twelve_months"]?.asMyBool()));
				self.setFemaleOnly((row["female_only"]?.asMyBool()));
				self.setMaleOnly((row["male_only"]?.asMyBool()));
				self.setIsBangs((row["is_bangs"]?.asMyBool()));
				self.setNoRequirement((row["no_requirement"]?.asMyBool()));
				self.setIsActive((row["is_active"]?.asMyBool()));

				var fields = [String: String]()
				fields["_id"] = self.getIdStr()
				fields["health_id"] = self.getHealthIdStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["product_name"] = self.getProductNameStr()
				fields["withdrawal_period"] = self.getWithdrawalPeriodStr()
				fields["lot_number"] = self.getLotNumberStr()
				fields["serial_number"] = self.getSerialNumberStr()
				fields["expiration_date"] = self.getExpirationDateStr()
				fields["dosage"] = self.getDosageStr()
				fields["method"] = self.getMethodStr()
				fields["location"] = self.getLocationStr()
				fields["administered_by"] = self.getAdministeredByStr()
				fields["less_than_ten_months"] = self.getLessThanTenMonthsStr()
				fields["greater_than_ten_months"] = self.getGreaterThanTenMonthsStr()
				fields["less_than_twelve_months"] = self.getLessThanTwelveMonthsStr()
				fields["female_only"] = self.getFemaleOnlyStr()
				fields["male_only"] = self.getMaleOnlyStr()
				fields["is_bangs"] = self.getIsBangsStr()
				fields["no_requirement"] = self.getNoRequirementStr()
				fields["is_active"] = self.getIsActiveStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["_id"] = self.getIdStr()
		fields["health_id"] = self.getHealthIdStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["product_name"] = self.getProductNameStr()
		fields["withdrawal_period"] = self.getWithdrawalPeriodStr()
		fields["lot_number"] = self.getLotNumberStr()
		fields["serial_number"] = self.getSerialNumberStr()
		fields["expiration_date"] = self.getExpirationDateStr()
		fields["dosage"] = self.getDosageStr()
		fields["method"] = self.getMethodStr()
		fields["location"] = self.getLocationStr()
		fields["administered_by"] = self.getAdministeredByStr()
		fields["less_than_ten_months"] = self.getLessThanTenMonthsStr()
		fields["greater_than_ten_months"] = self.getGreaterThanTenMonthsStr()
		fields["less_than_twelve_months"] = self.getLessThanTwelveMonthsStr()
		fields["female_only"] = self.getFemaleOnlyStr()
		fields["male_only"] = self.getMaleOnlyStr()
		fields["is_bangs"] = self.getIsBangsStr()
		fields["no_requirement"] = self.getNoRequirementStr()
		fields["is_active"] = self.getIsActiveStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["_id"] = self.getIdStrPG()
		fields["health_id"] = self.getHealthIdStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["product_name"] = self.getProductNameStrPG()
		fields["withdrawal_period"] = self.getWithdrawalPeriodStrPG()
		fields["lot_number"] = self.getLotNumberStrPG()
		fields["serial_number"] = self.getSerialNumberStrPG()
		fields["expiration_date"] = self.getExpirationDateStrPG()
		fields["dosage"] = self.getDosageStrPG()
		fields["method"] = self.getMethodStrPG()
		fields["location"] = self.getLocationStrPG()
		fields["administered_by"] = self.getAdministeredByStrPG()
		fields["less_than_ten_months"] = self.getLessThanTenMonthsStrPG()
		fields["greater_than_ten_months"] = self.getGreaterThanTenMonthsStrPG()
		fields["less_than_twelve_months"] = self.getLessThanTwelveMonthsStrPG()
		fields["female_only"] = self.getFemaleOnlyStrPG()
		fields["male_only"] = self.getMaleOnlyStrPG()
		fields["is_bangs"] = self.getIsBangsStrPG()
		fields["no_requirement"] = self.getNoRequirementStrPG()
		fields["is_active"] = self.getIsActiveStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO health_manager ("
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

        var statement = "INSERT INTO health_manager ("
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

            var statement = "INSERT INTO health_manager ("

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

        var statement = "UPDATE health_manager "
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

        var statement = "UPDATE health_manager "
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
        let query = "DELETE FROM health_manager WHERE member_id = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM health_manager WHERE member_id = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastmemberId() -> String {
        let member_id: String = ""
        let query = "SELECT member_id from health_manager ORDER BY _id DESC LIMIT 1 "
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
