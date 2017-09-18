

//
//  TblAnimalAssessment.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalAssessmentData {

	var animal_assessment_id: Int = -1
    var animal_assessment_id_str: String = "unset"
	var animal_registration: String = "unset"
    var animal_registration_str: String = "unset"
	var owner_id: Int = -1
    var owner_id_str: String = "unset"
	var assessment_year: Double = -1.0
    var assessment_year_str: String = "unset"
	var assessment_season: String = "unset"
    var assessment_season_str: String = "unset"
	var create_user: String = "unset"
    var create_user_str: String = "unset"
	var create_stamp: NSDate = NSDate.distantFuture() as NSDate
    var create_stamp_str: String = "unset"
	var update_user: String = "unset"
    var update_user_str: String = "unset"
	var update_stamp: NSDate = NSDate.distantFuture() as NSDate
    var update_stamp_str: String = "unset"
	var calf_registration: String = "unset"
    var calf_registration_str: String = "unset"
	var calf_registration_date: NSDate = NSDate.distantFuture() as NSDate
    var calf_registration_date_str: String = "unset"
	var calf_transfer_date: NSDate = NSDate.distantFuture() as NSDate
    var calf_transfer_date_str: String = "unset"
	var invoice_id: Int = -1
    var invoice_id_str: String = "unset"
	var work_order: Int = -1
    var work_order_str: String = "unset"
	var validation_date: NSDate = NSDate.distantFuture() as NSDate
    var validation_date_str: String = "unset"
	var animal_sex: String = "unset"
    var animal_sex_str: String = "unset"
	var confirmed_by: String = "unset"
    var confirmed_by_str: String = "unset"
	var confirmed_on: NSDate = NSDate.distantFuture() as NSDate
    var confirmed_on_str: String = "unset"
	var non_calving_status_code: Int = -1
    var non_calving_status_code_str: String = "unset"
	var assessment_invoiced_to: Int = -1
    var assessment_invoiced_to_str: String = "unset"
	var calf_wean_date: NSDate = NSDate.distantFuture() as NSDate
    var calf_wean_date_str: String = "unset"
	var calf_prewean_disposal_code: Int = -1
    var calf_prewean_disposal_code_str: String = "unset"
	
	func setAnimalAssessmentId(animal_assessment_id: Int?) {
        self.animal_assessment_id = animal_assessment_id ?? 0
        let animal_assessment_id2 = animal_assessment_id ?? 0
        self.animal_assessment_id_str = String(animal_assessment_id2)
        self.animal_assessment_id_str = (self.animal_assessment_id_str == "0") ? "" : self.animal_assessment_id_str
    }
    func getAnimalAssessmentId() -> Int {
        return self.animal_assessment_id
    }
    func getAnimalAssessmentIdType() -> String {
        return "Int"
    };
	func getAnimalAssessmentIdStr() -> String {
        return animal_assessment_id_str
    };
	func getAnimalAssessmentIdStrPG() -> String {
        return animal_assessment_id_str
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

	func setOwnerId(owner_id: Int?) {
        self.owner_id = owner_id ?? 0
        let owner_id2 = owner_id ?? 0
        self.owner_id_str = String(owner_id2)
        self.owner_id_str = (self.owner_id_str == "0") ? "" : self.owner_id_str
    }
    func getOwnerId() -> Int {
        return self.owner_id
    }
    func getOwnerIdType() -> String {
        return "Int"
    };
	func getOwnerIdStr() -> String {
        return owner_id_str
    };
	func getOwnerIdStrPG() -> String {
        return owner_id_str
    };

	func setAssessmentYear(assessment_year: Double?) {
   	   self.assessment_year = assessment_year ?? 0.0
   	   self.assessment_year_str = String(self.assessment_year)
    }
    func getAssessmentYear() -> Double {
        return self.assessment_year
    }
    func getAssessmentYearType() -> String {
        return "Double"
    };
	func getAssessmentYearStr() -> String {
        return assessment_year_str
    };
	func getAssessmentYearStrPG() -> String {
        return assessment_year_str
    };

	func setAssessmentSeason(assessment_season: String?) {
        self.assessment_season = assessment_season ?? ""
        self.assessment_season_str = String(self.assessment_season)
    }
    func getAssessmentSeason() -> String {
        return self.assessment_season
    }
    func getAssessmentSeasonType() -> String {
        return "String"
    };
	func getAssessmentSeasonStr() -> String {
        return assessment_season_str == "unset" ? "" : assessment_season_str
    };
	func getAssessmentSeasonStrPG() -> String {
        return assessment_season_str == "unset" ? "" : assessment_season_str
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

	func setCalfRegistration(calf_registration: String?) {
        self.calf_registration = calf_registration ?? ""
        self.calf_registration_str = String(self.calf_registration)
    }
    func getCalfRegistration() -> String {
        return self.calf_registration
    }
    func getCalfRegistrationType() -> String {
        return "String"
    };
	func getCalfRegistrationStr() -> String {
        return calf_registration_str == "unset" ? "" : calf_registration_str
    };
	func getCalfRegistrationStrPG() -> String {
        return calf_registration_str == "unset" ? "" : calf_registration_str
    };

	func setCalfRegistrationDate(calf_registration_date: NSDate?) {
        self.calf_registration_date = calf_registration_date ?? NSDate.distantPast() as NSDate
        self.calf_registration_date_str = Utils.dateToString(self.calf_registration_date)
    }
    func getCalfRegistrationDate() -> NSDate {
        return self.calf_registration_date
    }
    func getCalfRegistrationDateType() -> String {
        return "NSDate"
    };
	func getCalfRegistrationDateStr() -> String {
        return calf_registration_date_str == "unset" || calf_registration_date_str == "0000-12-30 00:00:00 +0000" ? "" : calf_registration_date_str
    };
	func getCalfRegistrationDateStrPG() -> String {
        return calf_registration_date_str == "unset" || calf_registration_date_str == "0000-12-30 00:00:00 +0000" ? "" : calf_registration_date_str
    };

	func setCalfTransferDate(calf_transfer_date: NSDate?) {
        self.calf_transfer_date = calf_transfer_date ?? NSDate.distantPast() as NSDate
        self.calf_transfer_date_str = Utils.dateToString(self.calf_transfer_date)
    }
    func getCalfTransferDate() -> NSDate {
        return self.calf_transfer_date
    }
    func getCalfTransferDateType() -> String {
        return "NSDate"
    };
	func getCalfTransferDateStr() -> String {
        return calf_transfer_date_str == "unset" || calf_transfer_date_str == "0000-12-30 00:00:00 +0000" ? "" : calf_transfer_date_str
    };
	func getCalfTransferDateStrPG() -> String {
        return calf_transfer_date_str == "unset" || calf_transfer_date_str == "0000-12-30 00:00:00 +0000" ? "" : calf_transfer_date_str
    };

	func setInvoiceId(invoice_id: Int?) {
        self.invoice_id = invoice_id ?? 0
        let invoice_id2 = invoice_id ?? 0
        self.invoice_id_str = String(invoice_id2)
        self.invoice_id_str = (self.invoice_id_str == "0") ? "" : self.invoice_id_str
    }
    func getInvoiceId() -> Int {
        return self.invoice_id
    }
    func getInvoiceIdType() -> String {
        return "Int"
    };
	func getInvoiceIdStr() -> String {
        return invoice_id_str
    };
	func getInvoiceIdStrPG() -> String {
        return invoice_id_str
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

	func setValidationDate(validation_date: NSDate?) {
        self.validation_date = validation_date ?? NSDate.distantPast() as NSDate
        self.validation_date_str = Utils.dateToString(self.validation_date)
    }
    func getValidationDate() -> NSDate {
        return self.validation_date
    }
    func getValidationDateType() -> String {
        return "NSDate"
    };
	func getValidationDateStr() -> String {
        return validation_date_str == "unset" || validation_date_str == "0000-12-30 00:00:00 +0000" ? "" : validation_date_str
    };
	func getValidationDateStrPG() -> String {
        return validation_date_str == "unset" || validation_date_str == "0000-12-30 00:00:00 +0000" ? "" : validation_date_str
    };

	func setAnimalSex(animal_sex: String?) {
        self.animal_sex = animal_sex ?? ""
        self.animal_sex_str = String(self.animal_sex)
    }
    func getAnimalSex() -> String {
        return self.animal_sex
    }
    func getAnimalSexType() -> String {
        return "String"
    };
	func getAnimalSexStr() -> String {
        return animal_sex_str == "unset" ? "" : animal_sex_str
    };
	func getAnimalSexStrPG() -> String {
        return animal_sex_str == "unset" ? "" : animal_sex_str
    };

	func setConfirmedBy(confirmed_by: String?) {
        self.confirmed_by = confirmed_by ?? ""
        self.confirmed_by_str = String(self.confirmed_by)
    }
    func getConfirmedBy() -> String {
        return self.confirmed_by
    }
    func getConfirmedByType() -> String {
        return "String"
    };
	func getConfirmedByStr() -> String {
        return confirmed_by_str == "unset" ? "" : confirmed_by_str
    };
	func getConfirmedByStrPG() -> String {
        return confirmed_by_str == "unset" ? "" : confirmed_by_str
    };

	func setConfirmedOn(confirmed_on: NSDate?) {
        self.confirmed_on = confirmed_on ?? NSDate.distantPast() as NSDate
        self.confirmed_on_str = Utils.dateToString(self.confirmed_on)
    }
    func getConfirmedOn() -> NSDate {
        return self.confirmed_on
    }
    func getConfirmedOnType() -> String {
        return "NSDate"
    };
	func getConfirmedOnStr() -> String {
        return confirmed_on_str == "unset" || confirmed_on_str == "0000-12-30 00:00:00 +0000" ? "" : confirmed_on_str
    };
	func getConfirmedOnStrPG() -> String {
        return confirmed_on_str == "unset" || confirmed_on_str == "0000-12-30 00:00:00 +0000" ? "" : confirmed_on_str
    };

	func setNonCalvingStatusCode(non_calving_status_code: Int?) {
        self.non_calving_status_code = non_calving_status_code ?? 0
        let non_calving_status_code2 = non_calving_status_code ?? 0
        self.non_calving_status_code_str = String(non_calving_status_code2)
        self.non_calving_status_code_str = (self.non_calving_status_code_str == "0") ? "" : self.non_calving_status_code_str
    }
    func getNonCalvingStatusCode() -> Int {
        return self.non_calving_status_code
    }
    func getNonCalvingStatusCodeType() -> String {
        return "Int"
    };
	func getNonCalvingStatusCodeStr() -> String {
        return non_calving_status_code_str
    };
	func getNonCalvingStatusCodeStrPG() -> String {
        return non_calving_status_code_str
    };

	func setAssessmentInvoicedTo(assessment_invoiced_to: Int?) {
        self.assessment_invoiced_to = assessment_invoiced_to ?? 0
        let assessment_invoiced_to2 = assessment_invoiced_to ?? 0
        self.assessment_invoiced_to_str = String(assessment_invoiced_to2)
        self.assessment_invoiced_to_str = (self.assessment_invoiced_to_str == "0") ? "" : self.assessment_invoiced_to_str
    }
    func getAssessmentInvoicedTo() -> Int {
        return self.assessment_invoiced_to
    }
    func getAssessmentInvoicedToType() -> String {
        return "Int"
    };
	func getAssessmentInvoicedToStr() -> String {
        return assessment_invoiced_to_str
    };
	func getAssessmentInvoicedToStrPG() -> String {
        return assessment_invoiced_to_str
    };

	func setCalfWeanDate(calf_wean_date: NSDate?) {
        self.calf_wean_date = calf_wean_date ?? NSDate.distantPast() as NSDate
        self.calf_wean_date_str = Utils.dateToString(self.calf_wean_date)
    }
    func getCalfWeanDate() -> NSDate {
        return self.calf_wean_date
    }
    func getCalfWeanDateType() -> String {
        return "NSDate"
    };
	func getCalfWeanDateStr() -> String {
        return calf_wean_date_str == "unset" || calf_wean_date_str == "0000-12-30 00:00:00 +0000" ? "" : calf_wean_date_str
    };
	func getCalfWeanDateStrPG() -> String {
        return calf_wean_date_str == "unset" || calf_wean_date_str == "0000-12-30 00:00:00 +0000" ? "" : calf_wean_date_str
    };

	func setCalfPreweanDisposalCode(calf_prewean_disposal_code: Int?) {
        self.calf_prewean_disposal_code = calf_prewean_disposal_code ?? 0
        let calf_prewean_disposal_code2 = calf_prewean_disposal_code ?? 0
        self.calf_prewean_disposal_code_str = String(calf_prewean_disposal_code2)
        self.calf_prewean_disposal_code_str = (self.calf_prewean_disposal_code_str == "0") ? "" : self.calf_prewean_disposal_code_str
    }
    func getCalfPreweanDisposalCode() -> Int {
        return self.calf_prewean_disposal_code
    }
    func getCalfPreweanDisposalCodeType() -> String {
        return "Int"
    };
	func getCalfPreweanDisposalCodeStr() -> String {
        return calf_prewean_disposal_code_str
    };
	func getCalfPreweanDisposalCodeStrPG() -> String {
        return calf_prewean_disposal_code_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "animal_assessment_id":
				return "Int"
			case "animal_registration":
				return "String"
			case "owner_id":
				return "Int"
			case "assessment_year":
				return "Double"
			case "assessment_season":
				return "String"
			case "create_user":
				return "String"
			case "create_stamp":
				return "NSDate"
			case "update_user":
				return "String"
			case "update_stamp":
				return "NSDate"
			case "calf_registration":
				return "String"
			case "calf_registration_date":
				return "NSDate"
			case "calf_transfer_date":
				return "NSDate"
			case "invoice_id":
				return "Int"
			case "work_order":
				return "Int"
			case "validation_date":
				return "NSDate"
			case "animal_sex":
				return "String"
			case "confirmed_by":
				return "String"
			case "confirmed_on":
				return "NSDate"
			case "non_calving_status_code":
				return "Int"
			case "assessment_invoiced_to":
				return "Int"
			case "calf_wean_date":
				return "NSDate"
			case "calf_prewean_disposal_code":
				return "Int"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "animal_assessment_id":
			return self.getAnimalAssessmentIdStr()
			case "animal_registration":
			return self.getAnimalRegistrationStr()
			case "owner_id":
			return self.getOwnerIdStr()
			case "assessment_year":
			return self.getAssessmentYearStr()
			case "assessment_season":
			return self.getAssessmentSeasonStr()
			case "create_user":
			return self.getCreateUserStr()
			case "create_stamp":
			return self.getCreateStampStr()
			case "update_user":
			return self.getUpdateUserStr()
			case "update_stamp":
			return self.getUpdateStampStr()
			case "calf_registration":
			return self.getCalfRegistrationStr()
			case "calf_registration_date":
			return self.getCalfRegistrationDateStr()
			case "calf_transfer_date":
			return self.getCalfTransferDateStr()
			case "invoice_id":
			return self.getInvoiceIdStr()
			case "work_order":
			return self.getWorkOrderStr()
			case "validation_date":
			return self.getValidationDateStr()
			case "animal_sex":
			return self.getAnimalSexStr()
			case "confirmed_by":
			return self.getConfirmedByStr()
			case "confirmed_on":
			return self.getConfirmedOnStr()
			case "non_calving_status_code":
			return self.getNonCalvingStatusCodeStr()
			case "assessment_invoiced_to":
			return self.getAssessmentInvoicedToStr()
			case "calf_wean_date":
			return self.getCalfWeanDateStr()
			case "calf_prewean_disposal_code":
			return self.getCalfPreweanDisposalCodeStr()
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
        qb.selectFrom("tbl_animal_assessment")
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

				self.setAnimalAssessmentId((row["animal_assessment_id"]?.asInt()));
				self.setAnimalRegistration((row["animal_registration"]?.asString()));
				self.setOwnerId((row["owner_id"]?.asInt()));
				self.setAssessmentYear((row["assessment_year"]?.asDouble()));
				self.setAssessmentSeason((row["assessment_season"]?.asString()));
				self.setCreateUser((row["create_user"]?.asString()));
				self.setCreateStamp((row["create_stamp"]?.asDate()));
				self.setUpdateUser((row["update_user"]?.asString()));
				self.setUpdateStamp((row["update_stamp"]?.asDate()));
				self.setCalfRegistration((row["calf_registration"]?.asString()));
				self.setCalfRegistrationDate((row["calf_registration_date"]?.asDate()));
				self.setCalfTransferDate((row["calf_transfer_date"]?.asDate()));
				self.setInvoiceId((row["invoice_id"]?.asInt()));
				self.setWorkOrder((row["work_order"]?.asInt()));
				self.setValidationDate((row["validation_date"]?.asDate()));
				self.setAnimalSex((row["animal_sex"]?.asString()));
				self.setConfirmedBy((row["confirmed_by"]?.asString()));
				self.setConfirmedOn((row["confirmed_on"]?.asDate()));
				self.setNonCalvingStatusCode((row["non_calving_status_code"]?.asInt()));
				self.setAssessmentInvoicedTo((row["assessment_invoiced_to"]?.asInt()));
				self.setCalfWeanDate((row["calf_wean_date"]?.asDate()));
				self.setCalfPreweanDisposalCode((row["calf_prewean_disposal_code"]?.asInt()));

				var fields = [String: String]()
				fields["animal_assessment_id"] = self.getAnimalAssessmentIdStr()
				fields["animal_registration"] = self.getAnimalRegistrationStr()
				fields["owner_id"] = self.getOwnerIdStr()
				fields["assessment_year"] = self.getAssessmentYearStr()
				fields["assessment_season"] = self.getAssessmentSeasonStr()
				fields["create_user"] = self.getCreateUserStr()
				fields["create_stamp"] = self.getCreateStampStr()
				fields["update_user"] = self.getUpdateUserStr()
				fields["update_stamp"] = self.getUpdateStampStr()
				fields["calf_registration"] = self.getCalfRegistrationStr()
				fields["calf_registration_date"] = self.getCalfRegistrationDateStr()
				fields["calf_transfer_date"] = self.getCalfTransferDateStr()
				fields["invoice_id"] = self.getInvoiceIdStr()
				fields["work_order"] = self.getWorkOrderStr()
				fields["validation_date"] = self.getValidationDateStr()
				fields["animal_sex"] = self.getAnimalSexStr()
				fields["confirmed_by"] = self.getConfirmedByStr()
				fields["confirmed_on"] = self.getConfirmedOnStr()
				fields["non_calving_status_code"] = self.getNonCalvingStatusCodeStr()
				fields["assessment_invoiced_to"] = self.getAssessmentInvoicedToStr()
				fields["calf_wean_date"] = self.getCalfWeanDateStr()
				fields["calf_prewean_disposal_code"] = self.getCalfPreweanDisposalCodeStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["animal_assessment_id"] = self.getAnimalAssessmentIdStr()
		fields["animal_registration"] = self.getAnimalRegistrationStr()
		fields["owner_id"] = self.getOwnerIdStr()
		fields["assessment_year"] = self.getAssessmentYearStr()
		fields["assessment_season"] = self.getAssessmentSeasonStr()
		fields["create_user"] = self.getCreateUserStr()
		fields["create_stamp"] = self.getCreateStampStr()
		fields["update_user"] = self.getUpdateUserStr()
		fields["update_stamp"] = self.getUpdateStampStr()
		fields["calf_registration"] = self.getCalfRegistrationStr()
		fields["calf_registration_date"] = self.getCalfRegistrationDateStr()
		fields["calf_transfer_date"] = self.getCalfTransferDateStr()
		fields["invoice_id"] = self.getInvoiceIdStr()
		fields["work_order"] = self.getWorkOrderStr()
		fields["validation_date"] = self.getValidationDateStr()
		fields["animal_sex"] = self.getAnimalSexStr()
		fields["confirmed_by"] = self.getConfirmedByStr()
		fields["confirmed_on"] = self.getConfirmedOnStr()
		fields["non_calving_status_code"] = self.getNonCalvingStatusCodeStr()
		fields["assessment_invoiced_to"] = self.getAssessmentInvoicedToStr()
		fields["calf_wean_date"] = self.getCalfWeanDateStr()
		fields["calf_prewean_disposal_code"] = self.getCalfPreweanDisposalCodeStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["animal_assessment_id"] = self.getAnimalAssessmentIdStrPG()
		fields["animal_registration"] = self.getAnimalRegistrationStrPG()
		fields["owner_id"] = self.getOwnerIdStrPG()
		fields["assessment_year"] = self.getAssessmentYearStrPG()
		fields["assessment_season"] = self.getAssessmentSeasonStrPG()
		fields["create_user"] = self.getCreateUserStrPG()
		fields["create_stamp"] = self.getCreateStampStrPG()
		fields["update_user"] = self.getUpdateUserStrPG()
		fields["update_stamp"] = self.getUpdateStampStrPG()
		fields["calf_registration"] = self.getCalfRegistrationStrPG()
		fields["calf_registration_date"] = self.getCalfRegistrationDateStrPG()
		fields["calf_transfer_date"] = self.getCalfTransferDateStrPG()
		fields["invoice_id"] = self.getInvoiceIdStrPG()
		fields["work_order"] = self.getWorkOrderStrPG()
		fields["validation_date"] = self.getValidationDateStrPG()
		fields["animal_sex"] = self.getAnimalSexStrPG()
		fields["confirmed_by"] = self.getConfirmedByStrPG()
		fields["confirmed_on"] = self.getConfirmedOnStrPG()
		fields["non_calving_status_code"] = self.getNonCalvingStatusCodeStrPG()
		fields["assessment_invoiced_to"] = self.getAssessmentInvoicedToStrPG()
		fields["calf_wean_date"] = self.getCalfWeanDateStrPG()
		fields["calf_prewean_disposal_code"] = self.getCalfPreweanDisposalCodeStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_animal_assessment ("
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

        var statement = "INSERT INTO tbl_animal_assessment ("
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

            var statement = "INSERT INTO tbl_animal_assessment ("

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

        var statement = "UPDATE tbl_animal_assessment "
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

        var statement = "UPDATE tbl_animal_assessment "
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
        let query = "DELETE FROM tbl_animal_assessment WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM tbl_animal_assessment WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastanimalRegistration() -> String {
        let animal_registration: String = ""
        let query = "SELECT animal_registration from tbl_animal_assessment ORDER BY _id DESC LIMIT 1 "
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
