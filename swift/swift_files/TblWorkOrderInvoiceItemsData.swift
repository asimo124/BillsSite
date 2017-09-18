

//
//  TblWorkOrderInvoiceItems.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblWorkOrderInvoiceItemsData {

	var invoice_item_id: Int = -1
    var invoice_item_id_str: String = "unset"
	var animal_registration: String = "unset"
    var animal_registration_str: String = "unset"
	var member_id: Int = -1
    var member_id_str: String = "unset"
	var description: String = "unset"
    var description_str: String = "unset"
	var fee: Double = -1.0
    var fee_str: String = "unset"
	var entered_by: String = "unset"
    var entered_by_str: String = "unset"
	var entered_on: NSDate = NSDate.distantFuture() as NSDate
    var entered_on_str: String = "unset"
	var fee_type: String = "unset"
    var fee_type_str: String = "unset"
	var invoice_id: String = "unset"
    var invoice_id_str: String = "unset"
	var date_received: NSDate = NSDate.distantFuture() as NSDate
    var date_received_str: String = "unset"
	var check_number: String = "unset"
    var check_number_str: String = "unset"
	var check_date: NSDate = NSDate.distantFuture() as NSDate
    var check_date_str: String = "unset"
	var check_amount: Double = -1.0
    var check_amount_str: String = "unset"
	var private_herd_id: String = "unset"
    var private_herd_id_str: String = "unset"
	var invoice_date: NSDate = NSDate.distantFuture() as NSDate
    var invoice_date_str: String = "unset"
	var send_to_id: Int = -1
    var send_to_id_str: String = "unset"
	var lock_invoice_item: String = "unset"
    var lock_invoice_item_str: String = "unset"
	var work_order: String = "unset"
    var work_order_str: String = "unset"
	var updated_by: String = "unset"
    var updated_by_str: String = "unset"
	var updated_on: NSDate = NSDate.distantFuture() as NSDate
    var updated_on_str: String = "unset"
	var temp_id: Int = -1
    var temp_id_str: String = "unset"
	var mas90_id: String = "unset"
    var mas90_id_str: String = "unset"
	var supplement_number: Int = -1
    var supplement_number_str: String = "unset"
	var mail_certificate_to: String = "unset"
    var mail_certificate_to_str: String = "unset"
	var supplement_sequence: String = "unset"
    var supplement_sequence_str: String = "unset"
	
	func setInvoiceItemId(invoice_item_id: Int?) {
        self.invoice_item_id = invoice_item_id ?? 0
        let invoice_item_id2 = invoice_item_id ?? 0
        self.invoice_item_id_str = String(invoice_item_id2)
        self.invoice_item_id_str = (self.invoice_item_id_str == "0") ? "" : self.invoice_item_id_str
    }
    func getInvoiceItemId() -> Int {
        return self.invoice_item_id
    }
    func getInvoiceItemIdType() -> String {
        return "Int"
    };
	func getInvoiceItemIdStr() -> String {
        return invoice_item_id_str
    };
	func getInvoiceItemIdStrPG() -> String {
        return invoice_item_id_str
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

	func setEnteredOn(entered_on: NSDate?) {
        self.entered_on = entered_on ?? NSDate.distantPast() as NSDate
        self.entered_on_str = Utils.dateToString(self.entered_on)
    }
    func getEnteredOn() -> NSDate {
        return self.entered_on
    }
    func getEnteredOnType() -> String {
        return "NSDate"
    };
	func getEnteredOnStr() -> String {
        return entered_on_str == "unset" || entered_on_str == "0000-12-30 00:00:00 +0000" ? "" : entered_on_str
    };
	func getEnteredOnStrPG() -> String {
        return entered_on_str == "unset" || entered_on_str == "0000-12-30 00:00:00 +0000" ? "" : entered_on_str
    };

	func setFeeType(fee_type: String?) {
        self.fee_type = fee_type ?? ""
        self.fee_type_str = String(self.fee_type)
    }
    func getFeeTypeValue() -> String {
        return self.fee_type
    }
    func getFeeTypeType() -> String {
        return "String"
    };
	func getFeeTypeStr() -> String {
        return fee_type_str == "unset" ? "" : fee_type_str
    };
	func getFeeTypeStrPG() -> String {
        return fee_type_str == "unset" ? "" : fee_type_str
    };

	func setInvoiceId(invoice_id: String?) {
        self.invoice_id = invoice_id ?? ""
        self.invoice_id_str = String(self.invoice_id)
    }
    func getInvoiceId() -> String {
        return self.invoice_id
    }
    func getInvoiceIdType() -> String {
        return "String"
    };
	func getInvoiceIdStr() -> String {
        return invoice_id_str == "unset" ? "" : invoice_id_str
    };
	func getInvoiceIdStrPG() -> String {
        return invoice_id_str == "unset" ? "" : invoice_id_str
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

	func setCheckNumber(check_number: String?) {
        self.check_number = check_number ?? ""
        self.check_number_str = String(self.check_number)
    }
    func getCheckNumber() -> String {
        return self.check_number
    }
    func getCheckNumberType() -> String {
        return "String"
    };
	func getCheckNumberStr() -> String {
        return check_number_str == "unset" ? "" : check_number_str
    };
	func getCheckNumberStrPG() -> String {
        return check_number_str == "unset" ? "" : check_number_str
    };

	func setCheckDate(check_date: NSDate?) {
        self.check_date = check_date ?? NSDate.distantPast() as NSDate
        self.check_date_str = Utils.dateToString(self.check_date)
    }
    func getCheckDate() -> NSDate {
        return self.check_date
    }
    func getCheckDateType() -> String {
        return "NSDate"
    };
	func getCheckDateStr() -> String {
        return check_date_str == "unset" || check_date_str == "0000-12-30 00:00:00 +0000" ? "" : check_date_str
    };
	func getCheckDateStrPG() -> String {
        return check_date_str == "unset" || check_date_str == "0000-12-30 00:00:00 +0000" ? "" : check_date_str
    };

	func setCheckAmount(check_amount: Double?) {
   	   self.check_amount = check_amount ?? 0.0
   	   self.check_amount_str = String(self.check_amount)
    }
    func getCheckAmount() -> Double {
        return self.check_amount
    }
    func getCheckAmountType() -> String {
        return "Double"
    };
	func getCheckAmountStr() -> String {
        return check_amount_str
    };
	func getCheckAmountStrPG() -> String {
        return check_amount_str
    };

	func setPrivateHerdId(private_herd_id: String?) {
        self.private_herd_id = private_herd_id ?? ""
        self.private_herd_id_str = String(self.private_herd_id)
    }
    func getPrivateHerdId() -> String {
        return self.private_herd_id
    }
    func getPrivateHerdIdType() -> String {
        return "String"
    };
	func getPrivateHerdIdStr() -> String {
        return private_herd_id_str == "unset" ? "" : private_herd_id_str
    };
	func getPrivateHerdIdStrPG() -> String {
        return private_herd_id_str == "unset" ? "" : private_herd_id_str
    };

	func setInvoiceDate(invoice_date: NSDate?) {
        self.invoice_date = invoice_date ?? NSDate.distantPast() as NSDate
        self.invoice_date_str = Utils.dateToString(self.invoice_date)
    }
    func getInvoiceDate() -> NSDate {
        return self.invoice_date
    }
    func getInvoiceDateType() -> String {
        return "NSDate"
    };
	func getInvoiceDateStr() -> String {
        return invoice_date_str == "unset" || invoice_date_str == "0000-12-30 00:00:00 +0000" ? "" : invoice_date_str
    };
	func getInvoiceDateStrPG() -> String {
        return invoice_date_str == "unset" || invoice_date_str == "0000-12-30 00:00:00 +0000" ? "" : invoice_date_str
    };

	func setSendToId(send_to_id: Int?) {
        self.send_to_id = send_to_id ?? 0
        let send_to_id2 = send_to_id ?? 0
        self.send_to_id_str = String(send_to_id2)
        self.send_to_id_str = (self.send_to_id_str == "0") ? "" : self.send_to_id_str
    }
    func getSendToId() -> Int {
        return self.send_to_id
    }
    func getSendToIdType() -> String {
        return "Int"
    };
	func getSendToIdStr() -> String {
        return send_to_id_str
    };
	func getSendToIdStrPG() -> String {
        return send_to_id_str
    };

	func setLockInvoiceItem(lock_invoice_item: String?) {
        self.lock_invoice_item = lock_invoice_item ?? ""
        self.lock_invoice_item_str = String(self.lock_invoice_item)
    }
    func getLockInvoiceItem() -> String {
        return self.lock_invoice_item
    }
    func getLockInvoiceItemType() -> String {
        return "String"
    };
	func getLockInvoiceItemStr() -> String {
        return lock_invoice_item_str == "unset" ? "" : lock_invoice_item_str
    };
	func getLockInvoiceItemStrPG() -> String {
        return lock_invoice_item_str == "unset" ? "" : lock_invoice_item_str
    };

	func setWorkOrder(work_order: String?) {
        self.work_order = work_order ?? ""
        self.work_order_str = String(self.work_order)
    }
    func getWorkOrder() -> String {
        return self.work_order
    }
    func getWorkOrderType() -> String {
        return "String"
    };
	func getWorkOrderStr() -> String {
        return work_order_str == "unset" ? "" : work_order_str
    };
	func getWorkOrderStrPG() -> String {
        return work_order_str == "unset" ? "" : work_order_str
    };

	func setUpdatedBy(updated_by: String?) {
        self.updated_by = updated_by ?? ""
        self.updated_by_str = String(self.updated_by)
    }
    func getUpdatedBy() -> String {
        return self.updated_by
    }
    func getUpdatedByType() -> String {
        return "String"
    };
	func getUpdatedByStr() -> String {
        return updated_by_str == "unset" ? "" : updated_by_str
    };
	func getUpdatedByStrPG() -> String {
        return updated_by_str == "unset" ? "" : updated_by_str
    };

	func setUpdatedOn(updated_on: NSDate?) {
        self.updated_on = updated_on ?? NSDate.distantPast() as NSDate
        self.updated_on_str = Utils.dateToString(self.updated_on)
    }
    func getUpdatedOn() -> NSDate {
        return self.updated_on
    }
    func getUpdatedOnType() -> String {
        return "NSDate"
    };
	func getUpdatedOnStr() -> String {
        return updated_on_str == "unset" || updated_on_str == "0000-12-30 00:00:00 +0000" ? "" : updated_on_str
    };
	func getUpdatedOnStrPG() -> String {
        return updated_on_str == "unset" || updated_on_str == "0000-12-30 00:00:00 +0000" ? "" : updated_on_str
    };

	func setTempId(temp_id: Int?) {
        self.temp_id = temp_id ?? 0
        let temp_id2 = temp_id ?? 0
        self.temp_id_str = String(temp_id2)
        self.temp_id_str = (self.temp_id_str == "0") ? "" : self.temp_id_str
    }
    func getTempId() -> Int {
        return self.temp_id
    }
    func getTempIdType() -> String {
        return "Int"
    };
	func getTempIdStr() -> String {
        return temp_id_str
    };
	func getTempIdStrPG() -> String {
        return temp_id_str
    };

	func setMas90Id(mas90_id: String?) {
        self.mas90_id = mas90_id ?? ""
        self.mas90_id_str = String(self.mas90_id)
    }
    func getMas90Id() -> String {
        return self.mas90_id
    }
    func getMas90IdType() -> String {
        return "String"
    };
	func getMas90IdStr() -> String {
        return mas90_id_str == "unset" ? "" : mas90_id_str
    };
	func getMas90IdStrPG() -> String {
        return mas90_id_str == "unset" ? "" : mas90_id_str
    };

	func setSupplementNumber(supplement_number: Int?) {
        self.supplement_number = supplement_number ?? 0
        let supplement_number2 = supplement_number ?? 0
        self.supplement_number_str = String(supplement_number2)
        self.supplement_number_str = (self.supplement_number_str == "0") ? "" : self.supplement_number_str
    }
    func getSupplementNumber() -> Int {
        return self.supplement_number
    }
    func getSupplementNumberType() -> String {
        return "Int"
    };
	func getSupplementNumberStr() -> String {
        return supplement_number_str
    };
	func getSupplementNumberStrPG() -> String {
        return supplement_number_str
    };

	func setMailCertificateTo(mail_certificate_to: String?) {
        self.mail_certificate_to = mail_certificate_to ?? ""
        self.mail_certificate_to_str = String(self.mail_certificate_to)
    }
    func getMailCertificateTo() -> String {
        return self.mail_certificate_to
    }
    func getMailCertificateToType() -> String {
        return "String"
    };
	func getMailCertificateToStr() -> String {
        return mail_certificate_to_str == "unset" ? "" : mail_certificate_to_str
    };
	func getMailCertificateToStrPG() -> String {
        return mail_certificate_to_str == "unset" ? "" : mail_certificate_to_str
    };

	func setSupplementSequence(supplement_sequence: String?) {
        self.supplement_sequence = supplement_sequence ?? ""
        self.supplement_sequence_str = String(self.supplement_sequence)
    }
    func getSupplementSequence() -> String {
        return self.supplement_sequence
    }
    func getSupplementSequenceType() -> String {
        return "String"
    };
	func getSupplementSequenceStr() -> String {
        return supplement_sequence_str == "unset" ? "" : supplement_sequence_str
    };
	func getSupplementSequenceStrPG() -> String {
        return supplement_sequence_str == "unset" ? "" : supplement_sequence_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "invoice_item_id":
				return "Int"
			case "animal_registration":
				return "String"
			case "member_id":
				return "Int"
			case "description":
				return "String"
			case "fee":
				return "Double"
			case "entered_by":
				return "String"
			case "entered_on":
				return "NSDate"
			case "fee_type":
				return "String"
			case "invoice_id":
				return "String"
			case "date_received":
				return "NSDate"
			case "check_number":
				return "String"
			case "check_date":
				return "NSDate"
			case "check_amount":
				return "Double"
			case "private_herd_id":
				return "String"
			case "invoice_date":
				return "NSDate"
			case "send_to_id":
				return "Int"
			case "lock_invoice_item":
				return "String"
			case "work_order":
				return "String"
			case "updated_by":
				return "String"
			case "updated_on":
				return "NSDate"
			case "temp_id":
				return "Int"
			case "mas90_id":
				return "String"
			case "supplement_number":
				return "Int"
			case "mail_certificate_to":
				return "String"
			case "supplement_sequence":
				return "String"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "invoice_item_id":
			return self.getInvoiceItemIdStr()
			case "animal_registration":
			return self.getAnimalRegistrationStr()
			case "member_id":
			return self.getMemberIdStr()
			case "description":
			return self.getDescriptionStr()
			case "fee":
			return self.getFeeStr()
			case "entered_by":
			return self.getEnteredByStr()
			case "entered_on":
			return self.getEnteredOnStr()
			case "fee_type":
			return self.getFeeTypeStr()
			case "invoice_id":
			return self.getInvoiceIdStr()
			case "date_received":
			return self.getDateReceivedStr()
			case "check_number":
			return self.getCheckNumberStr()
			case "check_date":
			return self.getCheckDateStr()
			case "check_amount":
			return self.getCheckAmountStr()
			case "private_herd_id":
			return self.getPrivateHerdIdStr()
			case "invoice_date":
			return self.getInvoiceDateStr()
			case "send_to_id":
			return self.getSendToIdStr()
			case "lock_invoice_item":
			return self.getLockInvoiceItemStr()
			case "work_order":
			return self.getWorkOrderStr()
			case "updated_by":
			return self.getUpdatedByStr()
			case "updated_on":
			return self.getUpdatedOnStr()
			case "temp_id":
			return self.getTempIdStr()
			case "mas90_id":
			return self.getMas90IdStr()
			case "supplement_number":
			return self.getSupplementNumberStr()
			case "mail_certificate_to":
			return self.getMailCertificateToStr()
			case "supplement_sequence":
			return self.getSupplementSequenceStr()
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
    func loadByID(_id: String) -> [String: String] {
        let qb = QueryBuilder()
        qb.selectFrom("tbl_invoice_items")
            .Where("_id = ?")

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(_id)

        var fields = [String: String]()
        let (resultset, error) = SDOld.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setInvoiceItemId((row["invoice_item_id"]?.asInt()));
				self.setAnimalRegistration((row["animal_registration"]?.asString()));
				self.setMemberId((row["member_id"]?.asInt()));
				self.setDescription((row["description"]?.asString()));
				self.setFee((row["fee"]?.asDouble()));
				self.setEnteredBy((row["entered_by"]?.asString()));
				self.setEnteredOn((row["entered_on"]?.asDate()));
				self.setFeeType((row["fee_type"]?.asString()));
				self.setInvoiceId((row["invoice_id"]?.asString()));
				self.setDateReceived((row["date_received"]?.asDate()));
				self.setCheckNumber((row["check_number"]?.asString()));
				self.setCheckDate((row["check_date"]?.asDate()));
				self.setCheckAmount((row["check_amount"]?.asDouble()));
				self.setPrivateHerdId((row["private_herd_id"]?.asString()));
				self.setInvoiceDate((row["invoice_date"]?.asDate()));
				self.setSendToId((row["send_to_id"]?.asInt()));
				self.setLockInvoiceItem((row["lock_invoice_item"]?.asString()));
				self.setWorkOrder((row["work_order"]?.asString()));
				self.setUpdatedBy((row["updated_by"]?.asString()));
				self.setUpdatedOn((row["updated_on"]?.asDate()));
				self.setTempId((row["temp_id"]?.asInt()));
				self.setMas90Id((row["mas90_id"]?.asString()));
				self.setSupplementNumber((row["supplement_number"]?.asInt()));
				self.setMailCertificateTo((row["mail_certificate_to"]?.asString()));
				self.setSupplementSequence((row["supplement_sequence"]?.asString()));

				var fields = [String: String]()
				fields["invoice_item_id"] = self.getInvoiceItemIdStr()
				fields["animal_registration"] = self.getAnimalRegistrationStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["description"] = self.getDescriptionStr()
				fields["fee"] = self.getFeeStr()
				fields["entered_by"] = self.getEnteredByStr()
				fields["entered_on"] = self.getEnteredOnStr()
				fields["fee_type"] = self.getFeeTypeStr()
				fields["invoice_id"] = self.getInvoiceIdStr()
				fields["date_received"] = self.getDateReceivedStr()
				fields["check_number"] = self.getCheckNumberStr()
				fields["check_date"] = self.getCheckDateStr()
				fields["check_amount"] = self.getCheckAmountStr()
				fields["private_herd_id"] = self.getPrivateHerdIdStr()
				fields["invoice_date"] = self.getInvoiceDateStr()
				fields["send_to_id"] = self.getSendToIdStr()
				fields["lock_invoice_item"] = self.getLockInvoiceItemStr()
				fields["work_order"] = self.getWorkOrderStr()
				fields["updated_by"] = self.getUpdatedByStr()
				fields["updated_on"] = self.getUpdatedOnStr()
				fields["temp_id"] = self.getTempIdStr()
				fields["mas90_id"] = self.getMas90IdStr()
				fields["supplement_number"] = self.getSupplementNumberStr()
				fields["mail_certificate_to"] = self.getMailCertificateToStr()
				fields["supplement_sequence"] = self.getSupplementSequenceStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["invoice_item_id"] = self.getInvoiceItemIdStr()
		fields["animal_registration"] = self.getAnimalRegistrationStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["description"] = self.getDescriptionStr()
		fields["fee"] = self.getFeeStr()
		fields["entered_by"] = self.getEnteredByStr()
		fields["entered_on"] = self.getEnteredOnStr()
		fields["fee_type"] = self.getFeeTypeStr()
		fields["invoice_id"] = self.getInvoiceIdStr()
		fields["date_received"] = self.getDateReceivedStr()
		fields["check_number"] = self.getCheckNumberStr()
		fields["check_date"] = self.getCheckDateStr()
		fields["check_amount"] = self.getCheckAmountStr()
		fields["private_herd_id"] = self.getPrivateHerdIdStr()
		fields["invoice_date"] = self.getInvoiceDateStr()
		fields["send_to_id"] = self.getSendToIdStr()
		fields["lock_invoice_item"] = self.getLockInvoiceItemStr()
		fields["work_order"] = self.getWorkOrderStr()
		fields["updated_by"] = self.getUpdatedByStr()
		fields["updated_on"] = self.getUpdatedOnStr()
		fields["temp_id"] = self.getTempIdStr()
		fields["mas90_id"] = self.getMas90IdStr()
		fields["supplement_number"] = self.getSupplementNumberStr()
		fields["mail_certificate_to"] = self.getMailCertificateToStr()
		fields["supplement_sequence"] = self.getSupplementSequenceStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["invoice_item_id"] = self.getInvoiceItemIdStrPG()
		fields["animal_registration"] = self.getAnimalRegistrationStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["description"] = self.getDescriptionStrPG()
		fields["fee"] = self.getFeeStrPG()
		fields["entered_by"] = self.getEnteredByStrPG()
		fields["entered_on"] = self.getEnteredOnStrPG()
		fields["fee_type"] = self.getFeeTypeStrPG()
		fields["invoice_id"] = self.getInvoiceIdStrPG()
		fields["date_received"] = self.getDateReceivedStrPG()
		fields["check_number"] = self.getCheckNumberStrPG()
		fields["check_date"] = self.getCheckDateStrPG()
		fields["check_amount"] = self.getCheckAmountStrPG()
		fields["private_herd_id"] = self.getPrivateHerdIdStrPG()
		fields["invoice_date"] = self.getInvoiceDateStrPG()
		fields["send_to_id"] = self.getSendToIdStrPG()
		fields["lock_invoice_item"] = self.getLockInvoiceItemStrPG()
		fields["work_order"] = self.getWorkOrderStrPG()
		fields["updated_by"] = self.getUpdatedByStrPG()
		fields["updated_on"] = self.getUpdatedOnStrPG()
		fields["temp_id"] = self.getTempIdStrPG()
		fields["mas90_id"] = self.getMas90IdStrPG()
		fields["supplement_number"] = self.getSupplementNumberStrPG()
		fields["mail_certificate_to"] = self.getMailCertificateToStrPG()
		fields["supplement_sequence"] = self.getSupplementSequenceStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_invoice_items ("
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

        var statement = "INSERT INTO tbl_invoice_items ("
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

            var statement = "INSERT INTO tbl_invoice_items ("

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

    func update(forID: Int) {

        // get all field/values as string values
        var fields = self.getFields()

        var statement = "UPDATE tbl_invoice_items "
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
        statement += "WHERE _id = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query(statement)
    }

    func updatePG(forID: Int) {

        // get all field/values as string values
        var fields = self.getFieldsPG()

        var statement = "UPDATE tbl_invoice_items "
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
        statement += "WHERE _id = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    func delete(forID: Int) {
        let query = "DELETE FROM tbl_invoice_items WHERE _id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: Int) {

        let statement = "DELETE FROM tbl_invoice_items WHERE _id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastId() -> String {
        let _id: String = ""
        let query = "SELECT _id from tbl_invoice_items ORDER BY _id DESC LIMIT 1 "
        let (resultset, err) = SDOld.executeQuery(query)
        if (err == nil) {
            if resultset.count > 0 {
                let row = resultset[0]
                let _id2 = row["_id"]?.asString() ?? ""

                return _id2

            }
        }
        return _id
    }
}
