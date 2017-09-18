

//
//  TblOwnership.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblOwnershipData {
    
    var ownership_id: Int = -1
    var ownership_id_str: String = "unset"
    var animal_registration: String = "unset"
    var animal_registration_str: String = "unset"
    var owner_id: Int = -1
    var owner_id_str: String = "unset"
    var ownership_amount: Double = -1.0
    var ownership_amount_str: String = "unset"
    var ownership_date: NSDate = NSDate.distantFuture() as NSDate
    var ownership_date_str: String = "unset"
    var is_primary: Int = -1
    var is_primary_str: String = "unset"
    var superceded_flag: Int = -1
    var superceded_flag_str: String = "unset"
    var superceded_date: NSDate = NSDate.distantFuture() as NSDate
    var superceded_date_str: String = "unset"
    var old_owner_id: Int = -1
    var old_owner_id_str: String = "unset"
    var is_transfer: Int = -1
    var is_transfer_str: String = "unset"
    var is_calf_at_side: Int = -1
    var is_calf_at_side_str: String = "unset"
    var for_sale_private_treaty: Int = -1
    var for_sale_private_treaty_str: String = "unset"
    var seller_comments: String = "unset"
    var seller_comments_str: String = "unset"
    var sale_price: Int = -1
    var sale_price_str: String = "unset"
    var private_treaty_date: NSDate = NSDate.distantFuture() as NSDate
    var private_treaty_date_str: String = "unset"
    var work_order: String = "unset"
    var work_order_str: String = "unset"
    var create_user: String = "unset"
    var create_user_str: String = "unset"
    var create_stamp: NSDate = NSDate.distantFuture() as NSDate
    var create_stamp_str: String = "unset"
    var update_user: String = "unset"
    var update_user_str: String = "unset"
    var update_stamp: NSDate = NSDate.distantFuture() as NSDate
    var update_stamp_str: String = "unset"
    
    func setOwnershipId(ownership_id: Int?) {
        self.ownership_id = ownership_id ?? 0
        let ownership_id2 = ownership_id ?? 0
        self.ownership_id_str = String(ownership_id2)
        self.ownership_id_str = (self.ownership_id_str == "0") ? "" : self.ownership_id_str
    }
    func getOwnershipId() -> Int {
        return self.ownership_id
    }
    func getOwnershipIdType() -> String {
        return "Int"
    };
    func getOwnershipIdStr() -> String {
        return ownership_id_str
    };
    func getOwnershipIdStrPG() -> String {
        return ownership_id_str
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
    
    func setOwnershipAmount(ownership_amount: Double?) {
        self.ownership_amount = ownership_amount ?? 0.0
        self.ownership_amount_str = String(self.ownership_amount)
    }
    func getOwnershipAmount() -> Double {
        return self.ownership_amount
    }
    func getOwnershipAmountType() -> String {
        return "Double"
    };
    func getOwnershipAmountStr() -> String {
        return ownership_amount_str
    };
    func getOwnershipAmountStrPG() -> String {
        return ownership_amount_str
    };
    
    func setOwnershipDate(ownership_date: NSDate?) {
        self.ownership_date = ownership_date ?? NSDate.distantPast() as NSDate
        self.ownership_date_str = Utils.dateToString(self.ownership_date)
    }
    func getOwnershipDate() -> NSDate {
        return self.ownership_date
    }
    func getOwnershipDateType() -> String {
        return "NSDate"
    };
    func getOwnershipDateStr() -> String {
        return ownership_date_str == "unset" || ownership_date_str == "0000-12-30 00:00:00 +0000" ? "" : ownership_date_str
    };
    func getOwnershipDateStrPG() -> String {
        return ownership_date_str == "unset" || ownership_date_str == "0000-12-30 00:00:00 +0000" ? "" : ownership_date_str
    };
    
    func setIsPrimary(is_primary: Int?) {
        self.is_primary = is_primary ?? 0
        self.is_primary_str = ((self.is_primary) == 1) ? "t" : "f"
    }
    func getIsPrimary() -> Int {
        return self.is_primary
    }
    func getIsPrimaryType() -> String {
        return "Int"
    };
    func getIsPrimaryStr() -> String {
        return String(is_primary)
    };
    func getIsPrimaryStrPG() -> String {
        return is_primary_str
    };
    
    func setSupercededFlag(superceded_flag: Int?) {
        self.superceded_flag = superceded_flag ?? 0
        self.superceded_flag_str = ((self.superceded_flag) == 1) ? "t" : "f"
    }
    func getSupercededFlag() -> Int {
        return self.superceded_flag
    }
    func getSupercededFlagType() -> String {
        return "Int"
    };
    func getSupercededFlagStr() -> String {
        return String(superceded_flag)
    };
    func getSupercededFlagStrPG() -> String {
        return superceded_flag_str
    };
    
    func setSupercededDate(superceded_date: NSDate?) {
        self.superceded_date = superceded_date ?? NSDate.distantPast() as NSDate
        self.superceded_date_str = Utils.dateToString(self.superceded_date)
    }
    func getSupercededDate() -> NSDate {
        return self.superceded_date
    }
    func getSupercededDateType() -> String {
        return "NSDate"
    };
    func getSupercededDateStr() -> String {
        return superceded_date_str == "unset" || superceded_date_str == "0000-12-30 00:00:00 +0000" ? "" : superceded_date_str
    };
    func getSupercededDateStrPG() -> String {
        return superceded_date_str == "unset" || superceded_date_str == "0000-12-30 00:00:00 +0000" ? "" : superceded_date_str
    };
    
    func setOldOwnerId(old_owner_id: Int?) {
        self.old_owner_id = old_owner_id ?? 0
        let old_owner_id2 = old_owner_id ?? 0
        self.old_owner_id_str = String(old_owner_id2)
        self.old_owner_id_str = (self.old_owner_id_str == "0") ? "" : self.old_owner_id_str
    }
    func getOldOwnerId() -> Int {
        return self.old_owner_id
    }
    func getOldOwnerIdType() -> String {
        return "Int"
    };
    func getOldOwnerIdStr() -> String {
        return old_owner_id_str
    };
    func getOldOwnerIdStrPG() -> String {
        return old_owner_id_str
    };
    
    func setIsTransfer(is_transfer: Int?) {
        self.is_transfer = is_transfer ?? 0
        self.is_transfer_str = ((self.is_transfer) == 1) ? "t" : "f"
    }
    func getIsTransfer() -> Int {
        return self.is_transfer
    }
    func getIsTransferType() -> String {
        return "Int"
    };
    func getIsTransferStr() -> String {
        return String(is_transfer)
    };
    func getIsTransferStrPG() -> String {
        return is_transfer_str
    };
    
    func setIsCalfAtSide(is_calf_at_side: Int?) {
        self.is_calf_at_side = is_calf_at_side ?? 0
        self.is_calf_at_side_str = ((self.is_calf_at_side) == 1) ? "t" : "f"
    }
    func getIsCalfAtSide() -> Int {
        return self.is_calf_at_side
    }
    func getIsCalfAtSideType() -> String {
        return "Int"
    };
    func getIsCalfAtSideStr() -> String {
        return String(is_calf_at_side)
    };
    func getIsCalfAtSideStrPG() -> String {
        return is_calf_at_side_str
    };
    
    func setForSalePrivateTreaty(for_sale_private_treaty: Int?) {
        self.for_sale_private_treaty = for_sale_private_treaty ?? 0
        self.for_sale_private_treaty_str = ((self.for_sale_private_treaty) == 1) ? "t" : "f"
    }
    func getForSalePrivateTreaty() -> Int {
        return self.for_sale_private_treaty
    }
    func getForSalePrivateTreatyType() -> String {
        return "Int"
    };
    func getForSalePrivateTreatyStr() -> String {
        return String(for_sale_private_treaty)
    };
    func getForSalePrivateTreatyStrPG() -> String {
        return for_sale_private_treaty_str
    };
    
    func setSellerComments(seller_comments: String?) {
        self.seller_comments = seller_comments ?? ""
        self.seller_comments_str = String(self.seller_comments)
    }
    func getSellerComments() -> String {
        return self.seller_comments
    }
    func getSellerCommentsType() -> String {
        return "String"
    };
    func getSellerCommentsStr() -> String {
        return seller_comments_str == "unset" ? "" : seller_comments_str
    };
    func getSellerCommentsStrPG() -> String {
        return seller_comments_str == "unset" ? "" : seller_comments_str
    };
    
    func setSalePrice(sale_price: Int?) {
        self.sale_price = sale_price ?? 0
        let sale_price2 = sale_price ?? 0
        self.sale_price_str = String(sale_price2)
        self.sale_price_str = (self.sale_price_str == "0") ? "" : self.sale_price_str
    }
    func getSalePrice() -> Int {
        return self.sale_price
    }
    func getSalePriceType() -> String {
        return "Int"
    };
    func getSalePriceStr() -> String {
        return sale_price_str
    };
    func getSalePriceStrPG() -> String {
        return sale_price_str
    };
    
    func setPrivateTreatyDate(private_treaty_date: NSDate?) {
        self.private_treaty_date = private_treaty_date ?? NSDate.distantPast() as NSDate
        self.private_treaty_date_str = Utils.dateToString(self.private_treaty_date)
    }
    func getPrivateTreatyDate() -> NSDate {
        return self.private_treaty_date
    }
    func getPrivateTreatyDateType() -> String {
        return "NSDate"
    };
    func getPrivateTreatyDateStr() -> String {
        return private_treaty_date_str == "unset" || private_treaty_date_str == "0000-12-30 00:00:00 +0000" ? "" : private_treaty_date_str
    };
    func getPrivateTreatyDateStrPG() -> String {
        return private_treaty_date_str == "unset" || private_treaty_date_str == "0000-12-30 00:00:00 +0000" ? "" : private_treaty_date_str
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
        case "ownership_id":
            return "Int"
        case "animal_registration":
            return "String"
        case "owner_id":
            return "Int"
        case "ownership_amount":
            return "Double"
        case "ownership_date":
            return "NSDate"
        case "is_primary":
            return "Int"
        case "superceded_flag":
            return "Int"
        case "superceded_date":
            return "NSDate"
        case "old_owner_id":
            return "Int"
        case "is_transfer":
            return "Int"
        case "is_calf_at_side":
            return "Int"
        case "for_sale_private_treaty":
            return "Int"
        case "seller_comments":
            return "String"
        case "sale_price":
            return "Int"
        case "private_treaty_date":
            return "NSDate"
        case "work_order":
            return "String"
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
        case "ownership_id":
            return self.getOwnershipIdStr()
        case "animal_registration":
            return self.getAnimalRegistrationStr()
        case "owner_id":
            return self.getOwnerIdStr()
        case "ownership_amount":
            return self.getOwnershipAmountStr()
        case "ownership_date":
            return self.getOwnershipDateStr()
        case "is_primary":
            return self.getIsPrimaryStr()
        case "superceded_flag":
            return self.getSupercededFlagStr()
        case "superceded_date":
            return self.getSupercededDateStr()
        case "old_owner_id":
            return self.getOldOwnerIdStr()
        case "is_transfer":
            return self.getIsTransferStr()
        case "is_calf_at_side":
            return self.getIsCalfAtSideStr()
        case "for_sale_private_treaty":
            return self.getForSalePrivateTreatyStr()
        case "seller_comments":
            return self.getSellerCommentsStr()
        case "sale_price":
            return self.getSalePriceStr()
        case "private_treaty_date":
            return self.getPrivateTreatyDateStr()
        case "work_order":
            return self.getWorkOrderStr()
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
    func loadByID(animal_registration: String) -> [String: String] {
        let qb = QueryBuilder()
        qb.selectFrom("tbl_ownership")
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
                
                self.setOwnershipId((row["ownership_id"]?.asInt()));
                self.setAnimalRegistration((row["animal_registration"]?.asString()));
                self.setOwnerId((row["owner_id"]?.asInt()));
                self.setOwnershipAmount((row["ownership_amount"]?.asDouble()));
                self.setOwnershipDate((row["ownership_date"]?.asDate()));
                self.setIsPrimary((row["is_primary"]?.asMyBool()));
                self.setSupercededFlag((row["superceded_flag"]?.asMyBool()));
                self.setSupercededDate((row["superceded_date"]?.asDate()));
                self.setOldOwnerId((row["old_owner_id"]?.asInt()));
                self.setIsTransfer((row["is_transfer"]?.asMyBool()));
                self.setIsCalfAtSide((row["is_calf_at_side"]?.asMyBool()));
                self.setForSalePrivateTreaty((row["for_sale_private_treaty"]?.asMyBool()));
                self.setSellerComments((row["seller_comments"]?.asString()));
                self.setSalePrice((row["sale_price"]?.asInt()));
                self.setPrivateTreatyDate((row["private_treaty_date"]?.asDate()));
                self.setWorkOrder((row["work_order"]?.asString()));
                self.setCreateUser((row["create_user"]?.asString()));
                self.setCreateStamp((row["create_stamp"]?.asDate()));
                self.setUpdateUser((row["update_user"]?.asString()));
                self.setUpdateStamp((row["update_stamp"]?.asDate()));
                
                var fields = [String: String]()
                fields["ownership_id"] = self.getOwnershipIdStr()
                fields["animal_registration"] = self.getAnimalRegistrationStr()
                fields["owner_id"] = self.getOwnerIdStr()
                fields["ownership_amount"] = self.getOwnershipAmountStr()
                fields["ownership_date"] = self.getOwnershipDateStr()
                fields["is_primary"] = self.getIsPrimaryStr()
                fields["superceded_flag"] = self.getSupercededFlagStr()
                fields["superceded_date"] = self.getSupercededDateStr()
                fields["old_owner_id"] = self.getOldOwnerIdStr()
                fields["is_transfer"] = self.getIsTransferStr()
                fields["is_calf_at_side"] = self.getIsCalfAtSideStr()
                fields["for_sale_private_treaty"] = self.getForSalePrivateTreatyStr()
                fields["seller_comments"] = self.getSellerCommentsStr()
                fields["sale_price"] = self.getSalePriceStr()
                fields["private_treaty_date"] = self.getPrivateTreatyDateStr()
                fields["work_order"] = self.getWorkOrderStr()
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
        fields["ownership_id"] = self.getOwnershipIdStr()
        fields["animal_registration"] = self.getAnimalRegistrationStr()
        fields["owner_id"] = self.getOwnerIdStr()
        fields["ownership_amount"] = self.getOwnershipAmountStr()
        fields["ownership_date"] = self.getOwnershipDateStr()
        fields["is_primary"] = self.getIsPrimaryStr()
        fields["superceded_flag"] = self.getSupercededFlagStr()
        fields["superceded_date"] = self.getSupercededDateStr()
        fields["old_owner_id"] = self.getOldOwnerIdStr()
        fields["is_transfer"] = self.getIsTransferStr()
        fields["is_calf_at_side"] = self.getIsCalfAtSideStr()
        fields["for_sale_private_treaty"] = self.getForSalePrivateTreatyStr()
        fields["seller_comments"] = self.getSellerCommentsStr()
        fields["sale_price"] = self.getSalePriceStr()
        fields["private_treaty_date"] = self.getPrivateTreatyDateStr()
        fields["work_order"] = self.getWorkOrderStr()
        fields["create_user"] = self.getCreateUserStr()
        fields["create_stamp"] = self.getCreateStampStr()
        fields["update_user"] = self.getUpdateUserStr()
        fields["update_stamp"] = self.getUpdateStampStr()
        return fields
    }
    
    func getFieldsPG() -> [String: String] {
        
        var fields = [String: String]()
        
        
        fields["ownership_id"] = self.getOwnershipIdStrPG()
        fields["animal_registration"] = self.getAnimalRegistrationStrPG()
        fields["owner_id"] = self.getOwnerIdStrPG()
        fields["ownership_amount"] = self.getOwnershipAmountStrPG()
        fields["ownership_date"] = self.getOwnershipDateStrPG()
        fields["is_primary"] = self.getIsPrimaryStrPG()
        fields["superceded_flag"] = self.getSupercededFlagStrPG()
        fields["superceded_date"] = self.getSupercededDateStrPG()
        fields["old_owner_id"] = self.getOldOwnerIdStrPG()
        fields["is_transfer"] = self.getIsTransferStrPG()
        fields["is_calf_at_side"] = self.getIsCalfAtSideStrPG()
        fields["for_sale_private_treaty"] = self.getForSalePrivateTreatyStrPG()
        fields["seller_comments"] = self.getSellerCommentsStrPG()
        fields["sale_price"] = self.getSalePriceStrPG()
        fields["private_treaty_date"] = self.getPrivateTreatyDateStrPG()
        fields["work_order"] = self.getWorkOrderStrPG()
        fields["create_user"] = self.getCreateUserStrPG()
        fields["create_stamp"] = self.getCreateStampStrPG()
        fields["update_user"] = self.getUpdateUserStrPG()
        fields["update_stamp"] = self.getUpdateStampStrPG()
        return fields    }
    
    func addNew() {
        
        var statement = "INSERT INTO tbl_ownership ("
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
        
        var statement = "INSERT INTO tbl_ownership ("
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
            
            var statement = "INSERT INTO tbl_ownership ("
            
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
        
        var statement = "UPDATE tbl_ownership "
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
        
        var statement = "UPDATE tbl_ownership "
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
        let query = "DELETE FROM tbl_ownership WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }
    
    
    func deletePG(forID: String) {
        
        let statement = "DELETE FROM tbl_ownership WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    class func getLastanimalRegistration() -> String {
        let animal_registration: String = ""
        let query = "SELECT animal_registration from tbl_ownership ORDER BY _id DESC LIMIT 1 "
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
