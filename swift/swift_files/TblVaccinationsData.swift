

//
//  TblVaccinations.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblVaccinationsData {

	var pk_id: Int = -1
    var pk_id_str: String = "unset"
	var member_id: Int = -1
    var member_id_str: String = "unset"
	var _id: Int = -1
    var _id_str: String = "unset"
	var withdrawal_period: String = "unset"
    var withdrawal_period_str: String = "unset"
	var date: NSDate = NSDate.distantFuture() as NSDate
    var date_str: String = "unset"
	var product_name: String = "unset"
    var product_name_str: String = "unset"
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
	var less_ten_month: Int = -1
    var less_ten_month_str: String = "unset"
	var greater_ten_month: Int = -1
    var greater_ten_month_str: String = "unset"
	var female_only: Int = -1
    var female_only_str: String = "unset"
	var male_only: Int = -1
    var male_only_str: String = "unset"
	var less_twelve_month: Int = -1
    var less_twelve_month_str: String = "unset"
	var bangs_vaccs: Int = -1
    var bangs_vaccs_str: String = "unset"
	var no_requirements: Int = -1
    var no_requirements_str: String = "unset"
	var active_flag: Int = -1
    var active_flag_str: String = "unset"
	var create_user: String = "unset"
    var create_user_str: String = "unset"
	var create_stamp: NSDate = NSDate.distantFuture() as NSDate
    var create_stamp_str: String = "unset"
	var update_user: String = "unset"
    var update_user_str: String = "unset"
	var update_stamp: NSDate = NSDate.distantFuture() as NSDate
    var update_stamp_str: String = "unset"
	
	func setPkId(pk_id: Int?) {
        self.pk_id = pk_id ?? 0
        let pk_id2 = pk_id ?? 0
        self.pk_id_str = String(pk_id2)
        self.pk_id_str = (self.pk_id_str == "0") ? "" : self.pk_id_str
    }
    func getPkId() -> Int {
        return self.pk_id
    }
    func getPkIdType() -> String {
        return "Int"
    };
	func getPkIdStr() -> String {
        return pk_id_str
    };
	func getPkIdStrPG() -> String {
        return pk_id_str
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

	func setDate(date: NSDate?) {
        self.date = date ?? NSDate.distantPast() as NSDate
        self.date_str = Utils.dateToString(self.date)
    }
    func getDate() -> NSDate {
        return self.date
    }
    func getDateType() -> String {
        return "NSDate"
    };
	func getDateStr() -> String {
        return date_str == "unset" || date_str == "0000-12-30 00:00:00 +0000" ? "" : date_str
    };
	func getDateStrPG() -> String {
        return date_str == "unset" || date_str == "0000-12-30 00:00:00 +0000" ? "" : date_str
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

	func setLessTenMonth(less_ten_month: Int?) {
        self.less_ten_month = less_ten_month ?? 0
        self.less_ten_month_str = ((self.less_ten_month) == 1) ? "t" : "f"
    }
    func getLessTenMonth() -> Int {
        return self.less_ten_month
    }
    func getLessTenMonthType() -> String {
        return "Int"
    };
	func getLessTenMonthStr() -> String {
        return String(less_ten_month)
    };
	func getLessTenMonthStrPG() -> String {
        return less_ten_month_str
    };

	func setGreaterTenMonth(greater_ten_month: Int?) {
        self.greater_ten_month = greater_ten_month ?? 0
        self.greater_ten_month_str = ((self.greater_ten_month) == 1) ? "t" : "f"
    }
    func getGreaterTenMonth() -> Int {
        return self.greater_ten_month
    }
    func getGreaterTenMonthType() -> String {
        return "Int"
    };
	func getGreaterTenMonthStr() -> String {
        return String(greater_ten_month)
    };
	func getGreaterTenMonthStrPG() -> String {
        return greater_ten_month_str
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

	func setLessTwelveMonth(less_twelve_month: Int?) {
        self.less_twelve_month = less_twelve_month ?? 0
        self.less_twelve_month_str = ((self.less_twelve_month) == 1) ? "t" : "f"
    }
    func getLessTwelveMonth() -> Int {
        return self.less_twelve_month
    }
    func getLessTwelveMonthType() -> String {
        return "Int"
    };
	func getLessTwelveMonthStr() -> String {
        return String(less_twelve_month)
    };
	func getLessTwelveMonthStrPG() -> String {
        return less_twelve_month_str
    };

	func setBangsVaccs(bangs_vaccs: Int?) {
        self.bangs_vaccs = bangs_vaccs ?? 0
        self.bangs_vaccs_str = ((self.bangs_vaccs) == 1) ? "t" : "f"
    }
    func getBangsVaccs() -> Int {
        return self.bangs_vaccs
    }
    func getBangsVaccsType() -> String {
        return "Int"
    };
	func getBangsVaccsStr() -> String {
        return String(bangs_vaccs)
    };
	func getBangsVaccsStrPG() -> String {
        return bangs_vaccs_str
    };

	func setNoRequirements(no_requirements: Int?) {
        self.no_requirements = no_requirements ?? 0
        self.no_requirements_str = ((self.no_requirements) == 1) ? "t" : "f"
    }
    func getNoRequirements() -> Int {
        return self.no_requirements
    }
    func getNoRequirementsType() -> String {
        return "Int"
    };
	func getNoRequirementsStr() -> String {
        return String(no_requirements)
    };
	func getNoRequirementsStrPG() -> String {
        return no_requirements_str
    };

	func setActiveFlag(active_flag: Int?) {
        self.active_flag = active_flag ?? 0
        self.active_flag_str = ((self.active_flag) == 1) ? "t" : "f"
    }
    func getActiveFlag() -> Int {
        return self.active_flag
    }
    func getActiveFlagType() -> String {
        return "Int"
    };
	func getActiveFlagStr() -> String {
        return String(active_flag)
    };
	func getActiveFlagStrPG() -> String {
        return active_flag_str
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

	func getFieldType(field: String) -> String {
        switch field {
			case "pk_id":
				return "Int"
			case "member_id":
				return "Int"
			case "_id":
				return "Int"
			case "withdrawal_period":
				return "String"
			case "date":
				return "NSDate"
			case "product_name":
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
			case "less_ten_month":
				return "Int"
			case "greater_ten_month":
				return "Int"
			case "female_only":
				return "Int"
			case "male_only":
				return "Int"
			case "less_twelve_month":
				return "Int"
			case "bangs_vaccs":
				return "Int"
			case "no_requirements":
				return "Int"
			case "active_flag":
				return "Int"
			case "create_user":
				return "String"
			case "create_stamp":
				return "NSDate"
			case "update_user":
				return "String"
			case "update_stamp":
				return "NSDate"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "pk_id":
			return self.getPkIdStr()
			case "member_id":
			return self.getMemberIdStr()
			case "_id":
			return self.getIdStr()
			case "withdrawal_period":
			return self.getWithdrawalPeriodStr()
			case "date":
			return self.getDateStr()
			case "product_name":
			return self.getProductNameStr()
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
			case "less_ten_month":
			return self.getLessTenMonthStr()
			case "greater_ten_month":
			return self.getGreaterTenMonthStr()
			case "female_only":
			return self.getFemaleOnlyStr()
			case "male_only":
			return self.getMaleOnlyStr()
			case "less_twelve_month":
			return self.getLessTwelveMonthStr()
			case "bangs_vaccs":
			return self.getBangsVaccsStr()
			case "no_requirements":
			return self.getNoRequirementsStr()
			case "active_flag":
			return self.getActiveFlagStr()
			case "create_user":
			return self.getCreateUserStr()
			case "create_stamp":
			return self.getCreateStampStr()
			case "update_user":
			return self.getUpdateUserStr()
			case "update_stamp":
			return self.getUpdateStampStr()
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
        qb.selectFrom("tbl_vaccinations")
            .Where("member_id = ?")

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(member_id)

        let fields = [String: String]()
        let (resultset, error) = SDOld.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setPkId((row["pk_id"]?.asInt()));
				self.setMemberId((row["member_id"]?.asInt()));
				self.setId((row["_id"]?.asInt()));
				self.setWithdrawalPeriod((row["withdrawal_period"]?.asString()));
				self.setDate((row["date"]?.asDate()));
				self.setProductName((row["product_name"]?.asString()));
				self.setLotNumber((row["lot_number"]?.asString()));
				self.setSerialNumber((row["serial_number"]?.asString()));
				self.setExpirationDate((row["expiration_date"]?.asDate()));
				self.setDosage((row["dosage"]?.asString()));
				self.setMethod((row["method"]?.asString()));
				self.setLocation((row["location"]?.asString()));
				self.setAdministeredBy((row["administered_by"]?.asString()));
				self.setLessTenMonth((row["less_ten_month"]?.asMyBool()));
				self.setGreaterTenMonth((row["greater_ten_month"]?.asMyBool()));
				self.setFemaleOnly((row["female_only"]?.asMyBool()));
				self.setMaleOnly((row["male_only"]?.asMyBool()));
				self.setLessTwelveMonth((row["less_twelve_month"]?.asMyBool()));
				self.setBangsVaccs((row["bangs_vaccs"]?.asMyBool()));
				self.setNoRequirements((row["no_requirements"]?.asMyBool()));
				self.setActiveFlag((row["active_flag"]?.asMyBool()));
				self.setCreateUser((row["create_user"]?.asString()));
				self.setCreateStamp((row["create_stamp"]?.asDate()));
				self.setUpdateUser((row["update_user"]?.asString()));
				self.setUpdateStamp((row["update_stamp"]?.asDate()));

				var fields = [String: String]()
				fields["pk_id"] = self.getPkIdStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["_id"] = self.getIdStr()
				fields["withdrawal_period"] = self.getWithdrawalPeriodStr()
				fields["date"] = self.getDateStr()
				fields["product_name"] = self.getProductNameStr()
				fields["lot_number"] = self.getLotNumberStr()
				fields["serial_number"] = self.getSerialNumberStr()
				fields["expiration_date"] = self.getExpirationDateStr()
				fields["dosage"] = self.getDosageStr()
				fields["method"] = self.getMethodStr()
				fields["location"] = self.getLocationStr()
				fields["administered_by"] = self.getAdministeredByStr()
				fields["less_ten_month"] = self.getLessTenMonthStr()
				fields["greater_ten_month"] = self.getGreaterTenMonthStr()
				fields["female_only"] = self.getFemaleOnlyStr()
				fields["male_only"] = self.getMaleOnlyStr()
				fields["less_twelve_month"] = self.getLessTwelveMonthStr()
				fields["bangs_vaccs"] = self.getBangsVaccsStr()
				fields["no_requirements"] = self.getNoRequirementsStr()
				fields["active_flag"] = self.getActiveFlagStr()
				fields["create_user"] = self.getCreateUserStr()
				fields["create_stamp"] = self.getCreateStampStr()
				fields["update_user"] = self.getUpdateUserStr()
				fields["update_stamp"] = self.getUpdateStampStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["pk_id"] = self.getPkIdStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["_id"] = self.getIdStr()
		fields["withdrawal_period"] = self.getWithdrawalPeriodStr()
		fields["date"] = self.getDateStr()
		fields["product_name"] = self.getProductNameStr()
		fields["lot_number"] = self.getLotNumberStr()
		fields["serial_number"] = self.getSerialNumberStr()
		fields["expiration_date"] = self.getExpirationDateStr()
		fields["dosage"] = self.getDosageStr()
		fields["method"] = self.getMethodStr()
		fields["location"] = self.getLocationStr()
		fields["administered_by"] = self.getAdministeredByStr()
		fields["less_ten_month"] = self.getLessTenMonthStr()
		fields["greater_ten_month"] = self.getGreaterTenMonthStr()
		fields["female_only"] = self.getFemaleOnlyStr()
		fields["male_only"] = self.getMaleOnlyStr()
		fields["less_twelve_month"] = self.getLessTwelveMonthStr()
		fields["bangs_vaccs"] = self.getBangsVaccsStr()
		fields["no_requirements"] = self.getNoRequirementsStr()
		fields["active_flag"] = self.getActiveFlagStr()
		fields["create_user"] = self.getCreateUserStr()
		fields["create_stamp"] = self.getCreateStampStr()
		fields["update_user"] = self.getUpdateUserStr()
		fields["update_stamp"] = self.getUpdateStampStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["pk_id"] = self.getPkIdStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["_id"] = self.getIdStrPG()
		fields["withdrawal_period"] = self.getWithdrawalPeriodStrPG()
		fields["date"] = self.getDateStrPG()
		fields["product_name"] = self.getProductNameStrPG()
		fields["lot_number"] = self.getLotNumberStrPG()
		fields["serial_number"] = self.getSerialNumberStrPG()
		fields["expiration_date"] = self.getExpirationDateStrPG()
		fields["dosage"] = self.getDosageStrPG()
		fields["method"] = self.getMethodStrPG()
		fields["location"] = self.getLocationStrPG()
		fields["administered_by"] = self.getAdministeredByStrPG()
		fields["less_ten_month"] = self.getLessTenMonthStrPG()
		fields["greater_ten_month"] = self.getGreaterTenMonthStrPG()
		fields["female_only"] = self.getFemaleOnlyStrPG()
		fields["male_only"] = self.getMaleOnlyStrPG()
		fields["less_twelve_month"] = self.getLessTwelveMonthStrPG()
		fields["bangs_vaccs"] = self.getBangsVaccsStrPG()
		fields["no_requirements"] = self.getNoRequirementsStrPG()
		fields["active_flag"] = self.getActiveFlagStrPG()
		fields["create_user"] = self.getCreateUserStrPG()
		fields["create_stamp"] = self.getCreateStampStrPG()
		fields["update_user"] = self.getUpdateUserStrPG()
		fields["update_stamp"] = self.getUpdateStampStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_vaccinations ("
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

        var statement = "INSERT INTO tbl_vaccinations ("
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

            var statement = "INSERT INTO tbl_vaccinations ("

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

        var statement = "UPDATE tbl_vaccinations "
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

        var statement = "UPDATE tbl_vaccinations "
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
        let query = "DELETE FROM tbl_vaccinations WHERE member_id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM tbl_vaccinations WHERE member_id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastmemberId() -> String {
        let member_id: String = ""
        let query = "SELECT member_id from tbl_vaccinations ORDER BY _id DESC LIMIT 1 "
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
