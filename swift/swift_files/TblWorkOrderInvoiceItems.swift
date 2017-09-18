//
//  TblWorkOrderInvoiceItems.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblWorkOrderInvoiceItems {
    
    static var TABLE_NAME = "tbl_invoice_items";
    static var _ID = "_id";
    static var INVOICE_ITEM_ID = "invoice_item_id";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var MEMBER_ID = "member_id";
    static var DESCRIPTION = "description";
    static var FEE = "fee";
    static var ENTERED_BY = "entered_by";
    static var ENTERED_ON = "entered_on";
    static var FEE_TYPE = "fee_type";
    static var INVOICE_ID = "invoice_id";
    static var DATE_RECEIVED = "date_received";
    static var CHECK_NUMBER = "check_number";
    static var CHECK_DATE = "check_date";
    static var CHECK_AMOUNT = "check_amount";
    static var PRIVATE_HERD_ID = "private_herd_id";
    static var INVOICE_DATE = "invoice_date";
    static var SEND_TO_ID = "send_to_id";
    static var LOCK_INVOICE_ITEM = "lock_invoice_item";
    static var WORK_ORDER = "work_order";
    static var UPDATED_BY = "updated_by";
    static var UPDATED_ON = "updated_on";
    static var TEMP_ID = "temp_id";
    static var MAS90_ID = "mas90_id";
    static var SUPPLEMENT_NUMBER = "supplement_number";
    static var MAIL_CERTIFICATE_TO = "mail_certificate_to";
    static var SUPPLEMENT_SEQUENCE = "supplement_sequence";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_invoice_items"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getInvoiceItemId() -> String {
        return INVOICE_ITEM_ID;
    }
    
    class func getAnimalRegistration() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getDESCRIPTION() -> String {
        return DESCRIPTION;
    }
    
    class func getFEE() -> String {
        return FEE;
    }
    
    class func getEnteredBy() -> String {
        return ENTERED_BY;
    }
    
    class func getEnteredOn() -> String {
        return ENTERED_ON;
    }
    
    class func getFeeType() -> String {
        return FEE_TYPE;
    }
    
    class func getInvoiceId() -> String {
        return INVOICE_ID;
    }
    
    class func getDateReceived() -> String {
        return DATE_RECEIVED;
    }
    
    class func getCheckNumber() -> String {
        return CHECK_NUMBER;
    }
    
    class func getCheckDate() -> String {
        return CHECK_DATE;
    }
    
    class func getCheckAmount() -> String {
        return CHECK_AMOUNT;
    }
    
    class func getPrivateHerdId() -> String {
        return PRIVATE_HERD_ID;
    }
    
    class func getInvoiceDate() -> String {
        return INVOICE_DATE;
    }
    
    class func getSendToId() -> String {
        return SEND_TO_ID;
    }
    
    class func getLockInvoiceItem() -> String {
        return LOCK_INVOICE_ITEM;
    }
    
    class func getWorkOrder() -> String {
        return WORK_ORDER;
    }
    
    class func getUpdatedBy() -> String {
        return UPDATED_BY;
    }
    
    class func getUpdatedOn() -> String {
        return UPDATED_ON;
    }
    
    class func getTempId() -> String {
        return TEMP_ID;
    }
    
    class func getMas90Id() -> String {
        return MAS90_ID;
    }
    
    class func getSupplementNumber() -> String {
        return SUPPLEMENT_NUMBER;
    }
    
    class func getMailCertificateTo() -> String {
        return MAIL_CERTIFICATE_TO;
    }
    
    class func getSupplementSequence() -> String {
        return SUPPLEMENT_SEQUENCE;
    }
}
