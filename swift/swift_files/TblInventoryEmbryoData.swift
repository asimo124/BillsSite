

//
//  TblInventoryEmbryo.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblInventoryEmbryoData {

	var pk_id: Int = -1
    var pk_id_str: String = "unset"
	var member_id: Int = -1
    var member_id_str: String = "unset"
	var dam_registration: String = "unset"
    var dam_registration_str: String = "unset"
	var sire_registration: String = "unset"
    var sire_registration_str: String = "unset"
	var tank_id: String = "unset"
    var tank_id_str: String = "unset"
	var canister_id: String = "unset"
    var canister_id_str: String = "unset"
	var cane_code: String = "unset"
    var cane_code_str: String = "unset"
	var exportable: Int = -1
    var exportable_str: String = "unset"
	var quantity: Int = -1
    var quantity_str: String = "unset"
	var create_user: String = "unset"
    var create_user_str: String = "unset"
	var create_stamp: NSDate = NSDate.distantFuture() as NSDate
    var create_stamp_str: String = "unset"
	var update_user: String = "unset"
    var update_user_str: String = "unset"
	var update_stamp: NSDate = NSDate.distantFuture() as NSDate
    var update_stamp_str: String = "unset"
	var flush_date: NSDate = NSDate.distantFuture() as NSDate
    var flush_date_str: String = "unset"
	var for_sale_private_treaty: Int = -1
    var for_sale_private_treaty_str: String = "unset"
	var private_treaty_date: NSDate = NSDate.distantFuture() as NSDate
    var private_treaty_date_str: String = "unset"
	var seller_comments: String = "unset"
    var seller_comments_str: String = "unset"
	var sale_price: Int = -1
    var sale_price_str: String = "unset"
	var breeder_id: Int = -1
    var breeder_id_str: String = "unset"
	
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

	func setDamRegistration(dam_registration: String?) {
        self.dam_registration = dam_registration ?? ""
        self.dam_registration_str = String(self.dam_registration)
    }
    func getDamRegistration() -> String {
        return self.dam_registration
    }
    func getDamRegistrationType() -> String {
        return "String"
    };
	func getDamRegistrationStr() -> String {
        return dam_registration_str == "unset" ? "" : dam_registration_str
    };
	func getDamRegistrationStrPG() -> String {
        return dam_registration_str == "unset" ? "" : dam_registration_str
    };

	func setSireRegistration(sire_registration: String?) {
        self.sire_registration = sire_registration ?? ""
        self.sire_registration_str = String(self.sire_registration)
    }
    func getSireRegistration() -> String {
        return self.sire_registration
    }
    func getSireRegistrationType() -> String {
        return "String"
    };
	func getSireRegistrationStr() -> String {
        return sire_registration_str == "unset" ? "" : sire_registration_str
    };
	func getSireRegistrationStrPG() -> String {
        return sire_registration_str == "unset" ? "" : sire_registration_str
    };

	func setTankId(tank_id: String?) {
        self.tank_id = tank_id ?? ""
        self.tank_id_str = String(self.tank_id)
    }
    func getTankId() -> String {
        return self.tank_id
    }
    func getTankIdType() -> String {
        return "String"
    };
	func getTankIdStr() -> String {
        return tank_id_str == "unset" ? "" : tank_id_str
    };
	func getTankIdStrPG() -> String {
        return tank_id_str == "unset" ? "" : tank_id_str
    };

	func setCanisterId(canister_id: String?) {
        self.canister_id = canister_id ?? ""
        self.canister_id_str = String(self.canister_id)
    }
    func getCanisterId() -> String {
        return self.canister_id
    }
    func getCanisterIdType() -> String {
        return "String"
    };
	func getCanisterIdStr() -> String {
        return canister_id_str == "unset" ? "" : canister_id_str
    };
	func getCanisterIdStrPG() -> String {
        return canister_id_str == "unset" ? "" : canister_id_str
    };

	func setCaneCode(cane_code: String?) {
        self.cane_code = cane_code ?? ""
        self.cane_code_str = String(self.cane_code)
    }
    func getCaneCode() -> String {
        return self.cane_code
    }
    func getCaneCodeType() -> String {
        return "String"
    };
	func getCaneCodeStr() -> String {
        return cane_code_str == "unset" ? "" : cane_code_str
    };
	func getCaneCodeStrPG() -> String {
        return cane_code_str == "unset" ? "" : cane_code_str
    };

	func setExportable(exportable: Int?) {
        self.exportable = exportable ?? 0
        self.exportable_str = ((self.exportable) == 1) ? "t" : "f"
    }
    func getExportable() -> Int {
        return self.exportable
    }
    func getExportableType() -> String {
        return "Int"
    };
	func getExportableStr() -> String {
        return String(exportable)
    };
	func getExportableStrPG() -> String {
        return exportable_str
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

	func setBreederId(breeder_id: Int?) {
        self.breeder_id = breeder_id ?? 0
        let breeder_id2 = breeder_id ?? 0
        self.breeder_id_str = String(breeder_id2)
        self.breeder_id_str = (self.breeder_id_str == "0") ? "" : self.breeder_id_str
    }
    func getBreederId() -> Int {
        return self.breeder_id
    }
    func getBreederIdType() -> String {
        return "Int"
    };
	func getBreederIdStr() -> String {
        return breeder_id_str
    };
	func getBreederIdStrPG() -> String {
        return breeder_id_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "pk_id":
				return "Int"
			case "member_id":
				return "Int"
			case "dam_registration":
				return "String"
			case "sire_registration":
				return "String"
			case "tank_id":
				return "String"
			case "canister_id":
				return "String"
			case "cane_code":
				return "String"
			case "exportable":
				return "Int"
			case "quantity":
				return "Int"
			case "create_user":
				return "String"
			case "create_stamp":
				return "NSDate"
			case "update_user":
				return "String"
			case "update_stamp":
				return "NSDate"
			case "flush_date":
				return "NSDate"
			case "for_sale_private_treaty":
				return "Int"
			case "private_treaty_date":
				return "NSDate"
			case "seller_comments":
				return "String"
			case "sale_price":
				return "Int"
			case "breeder_id":
				return "Int"
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
			case "dam_registration":
			return self.getDamRegistrationStr()
			case "sire_registration":
			return self.getSireRegistrationStr()
			case "tank_id":
			return self.getTankIdStr()
			case "canister_id":
			return self.getCanisterIdStr()
			case "cane_code":
			return self.getCaneCodeStr()
			case "exportable":
			return self.getExportableStr()
			case "quantity":
			return self.getQuantityStr()
			case "create_user":
			return self.getCreateUserStr()
			case "create_stamp":
			return self.getCreateStampStr()
			case "update_user":
			return self.getUpdateUserStr()
			case "update_stamp":
			return self.getUpdateStampStr()
			case "flush_date":
			return self.getFlushDateStr()
			case "for_sale_private_treaty":
			return self.getForSalePrivateTreatyStr()
			case "private_treaty_date":
			return self.getPrivateTreatyDateStr()
			case "seller_comments":
			return self.getSellerCommentsStr()
			case "sale_price":
			return self.getSalePriceStr()
			case "breeder_id":
			return self.getBreederIdStr()
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
    func loadByPKID(pk_id: Int) -> [String: String] {
        
        var query =
        "SELECT * FROM tbl_embryo_inventory " +
        "WHERE pk_id = ? "

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(pk_id)

        var fields = [String: String]()
        let (resultset, error) = SDOld.executeQuery(query, withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setPkId((row["pk_id"]?.asInt()));
				self.setMemberId((row["member_id"]?.asInt()));
				self.setDamRegistration((row["dam_registration"]?.asString()));
				self.setSireRegistration((row["sire_registration"]?.asString()));
				self.setTankId((row["tank_id"]?.asString()));
				self.setCanisterId((row["canister_id"]?.asString()));
				self.setCaneCode((row["cane_code"]?.asString()));
				self.setExportable((row["exportable"]?.asMyBool()));
				self.setQuantity((row["quantity"]?.asInt()));
				self.setCreateUser((row["create_user"]?.asString()));
				self.setCreateStamp((row["create_stamp"]?.asDate()));
				self.setUpdateUser((row["update_user"]?.asString()));
				self.setUpdateStamp((row["update_stamp"]?.asDate()));
				self.setFlushDate((row["flush_date"]?.asDate()));
				self.setForSalePrivateTreaty((row["for_sale_private_treaty"]?.asMyBool()));
				self.setPrivateTreatyDate((row["private_treaty_date"]?.asDate()));
				self.setSellerComments((row["seller_comments"]?.asString()));
				self.setSalePrice((row["sale_price"]?.asInt()));
				self.setBreederId((row["breeder_id"]?.asInt()));

				var fields = [String: String]()
				fields["pk_id"] = self.getPkIdStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["dam_registration"] = self.getDamRegistrationStr()
				fields["sire_registration"] = self.getSireRegistrationStr()
				fields["tank_id"] = self.getTankIdStr()
				fields["canister_id"] = self.getCanisterIdStr()
				fields["cane_code"] = self.getCaneCodeStr()
				fields["exportable"] = self.getExportableStr()
				fields["quantity"] = self.getQuantityStr()
				fields["create_user"] = self.getCreateUserStr()
				fields["create_stamp"] = self.getCreateStampStr()
				fields["update_user"] = self.getUpdateUserStr()
				fields["update_stamp"] = self.getUpdateStampStr()
				fields["flush_date"] = self.getFlushDateStr()
				fields["for_sale_private_treaty"] = self.getForSalePrivateTreatyStr()
				fields["private_treaty_date"] = self.getPrivateTreatyDateStr()
				fields["seller_comments"] = self.getSellerCommentsStr()
				fields["sale_price"] = self.getSalePriceStr()
				fields["breeder_id"] = self.getBreederIdStr()

                return fields
            }
        }
        return fields
    }
    
    func findByMemberID(member_id: String) -> [TblInventoryEmbryoData] {
        
        var query =
        "SELECT A.* " +
            "FROM tbl_embryo_inventory A " +
            "where A.member_id = ? and ifnull(A.quantity, 0) > 0 and A.quantity <> '' " +
        "ORDER BY A.quantity DESC"
        
        var withFields = [AnyObject]()
        withFields.append(member_id)

        var EmbryoHolder: [TblInventoryEmbryoData] = []
        
        SDOld.printQuery(query, withArgs: withFields)
        let (resultset, error) = SDOld.executeQuery(query, withArgs: withFields)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            if resultset.count > 0 {
                for row in resultset {
                    
                    let Embryo = TblInventoryEmbryoData()
                    Embryo.setPkId((row["pk_id"]?.asInt()));
                    Embryo.setMemberId((row["member_id"]?.asInt()));
                    Embryo.setDamRegistration((row["dam_registration"]?.asString()));
                    Embryo.setSireRegistration((row["sire_registration"]?.asString()));
                    Embryo.setTankId((row["tank_id"]?.asString()));
                    Embryo.setCanisterId((row["canister_id"]?.asString()));
                    Embryo.setCaneCode((row["cane_code"]?.asString()));
                    Embryo.setExportable((row["exportable"]?.asMyBool()));
                    Embryo.setQuantity((row["quantity"]?.asInt()));
                    Embryo.setCreateUser((row["create_user"]?.asString()));
                    Embryo.setCreateStamp((row["create_stamp"]?.asDate()));
                    Embryo.setUpdateUser((row["update_user"]?.asString()));
                    Embryo.setUpdateStamp((row["update_stamp"]?.asDate()));
                    Embryo.setFlushDate((row["flush_date"]?.asDate()));
                    Embryo.setForSalePrivateTreaty((row["for_sale_private_treaty"]?.asMyBool()));
                    Embryo.setPrivateTreatyDate((row["private_treaty_date"]?.asDate()));
                    Embryo.setSellerComments((row["seller_comments"]?.asString()));
                    Embryo.setSalePrice((row["sale_price"]?.asInt()));
                    Embryo.setBreederId((row["breeder_id"]?.asInt()));
                    EmbryoHolder.append(Embryo)
                }
            }
        }
        return EmbryoHolder
    }
    
    func findAnimalNamesByMemberID(member_id: String) -> [[String: AnyObject]] {
        let query =
        "SELECT A.dam_registration, A.sire_registration, B.animal_private_herd_id " +
            "FROM tbl_embryo_inventory A " +
            "INNER JOIN tbl_animal B " +
            "ON A.dam_registration = A.dam_registration " +
            "where A.member_id = ? and ifnull(A.quantity, 0) > 0 and A.quantity <> '' " +
        "ORDER BY A.canister_id DESC"
    
        var withFields = [AnyObject]()
        withFields.append(member_id)
        
        var AnimalNames = [[String: AnyObject]]()
        let (resultset, error) = SDOld.executeQuery(query, withArgs: withFields)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
        
            if resultset.count > 0 {
                for row in resultset {
    
                    var fieldsArr = [String: AnyObject]()
                    fieldsArr["animal_name"] = row["animal_name"]?.asString() ?? ""
                    fieldsArr["animal_private_herd_id"] = row["animal_private_herd_id"]?.asString() ?? ""
                    AnimalNames.append(fieldsArr)
                }
            }
        }
        return AnimalNames
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["pk_id"] = self.getPkIdStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["dam_registration"] = self.getDamRegistrationStr()
		fields["sire_registration"] = self.getSireRegistrationStr()
		fields["tank_id"] = self.getTankIdStr()
		fields["canister_id"] = self.getCanisterIdStr()
		fields["cane_code"] = self.getCaneCodeStr()
		fields["exportable"] = self.getExportableStr()
		fields["quantity"] = self.getQuantityStr()
		fields["create_user"] = self.getCreateUserStr()
		fields["create_stamp"] = self.getCreateStampStr()
		fields["update_user"] = self.getUpdateUserStr()
		fields["update_stamp"] = self.getUpdateStampStr()
		fields["flush_date"] = self.getFlushDateStr()
		fields["for_sale_private_treaty"] = self.getForSalePrivateTreatyStr()
		fields["private_treaty_date"] = self.getPrivateTreatyDateStr()
		fields["seller_comments"] = self.getSellerCommentsStr()
		fields["sale_price"] = self.getSalePriceStr()
		fields["breeder_id"] = self.getBreederIdStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["pk_id"] = self.getPkIdStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["dam_registration"] = self.getDamRegistrationStrPG()
		fields["sire_registration"] = self.getSireRegistrationStrPG()
		fields["tank_id"] = self.getTankIdStrPG()
		fields["canister_id"] = self.getCanisterIdStrPG()
		fields["cane_code"] = self.getCaneCodeStrPG()
		fields["exportable"] = self.getExportableStrPG()
		fields["quantity"] = self.getQuantityStrPG()
		fields["create_user"] = self.getCreateUserStrPG()
		fields["create_stamp"] = self.getCreateStampStrPG()
		fields["update_user"] = self.getUpdateUserStrPG()
		fields["update_stamp"] = self.getUpdateStampStrPG()
		fields["flush_date"] = self.getFlushDateStrPG()
		fields["for_sale_private_treaty"] = self.getForSalePrivateTreatyStrPG()
		fields["private_treaty_date"] = self.getPrivateTreatyDateStrPG()
		fields["seller_comments"] = self.getSellerCommentsStrPG()
		fields["sale_price"] = self.getSalePriceStrPG()
		fields["breeder_id"] = self.getBreederIdStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_embryo_inventory ("
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
        
        print(statement)

        let dbn = DatabaseOld()
        dbn.query(statement)
    }

    func addNewPG() {

        var statement = "INSERT INTO tbl_embryo_inventory ("
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

            var statement = "INSERT INTO tbl_embryo_inventory ("

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

    func updateForPKID(pk_id: Int, var andMemberID: String) {

        andMemberID = andMemberID.stringByReplacingOccurrencesOfString("'", withString: "''")
        var pk_id2 = String(pk_id)
        pk_id2 = pk_id2.stringByReplacingOccurrencesOfString("'", withString: "''")
        
        // get all field/values as string values
        var fields = self.getFields()

        var statement = "UPDATE tbl_embryo_inventory "
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
        statement += "WHERE member_id = '" + String(andMemberID) + "' and pk_id = '" + pk_id2 + "' "

        let dbn = DatabaseOld()
        dbn.query(statement)
    }

    func updateForPKIDPG(pk_id: Int, var andMemberID: String) {

        andMemberID = andMemberID.stringByReplacingOccurrencesOfString("'", withString: "''")
        var pk_id2 = String(pk_id)
        pk_id2 = pk_id2.stringByReplacingOccurrencesOfString("'", withString: "''")
        
        // get all field/values as string values
        var fields = self.getFieldsPG()

        var statement = "UPDATE tbl_embryo_inventory "
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
        statement += "WHERE member_id = '" + String(andMemberID) + "' and pk_id = '" + pk_id2 + "' "

        statement = statement.stringByReplacingOccurrencesOfString("'", withString: "''")
        
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    func deleteForPKID(pk_id: Int, var andMemberID: String) {
        
        let query = "DELETE FROM tbl_embryo_inventory WHERE member_id = ? and pk_id = ? "
        
        var fieldsArr = [AnyObject]()
        fieldsArr.append(andMemberID)
        fieldsArr.append(pk_id)
        
        SDOld.printQuery(query, withArgs: fieldsArr)
        SDOld.executeChange(query, withArgs: fieldsArr)
       
    }


    func deleteForPKIDPG(pk_id: Int, var andMemberID: String) {

        let query = "DELETE FROM tbl_embryo_inventory WHERE member_id = ? and pk_id = ? "
        
        var fieldsArr = [AnyObject]()
        fieldsArr.append(andMemberID)
        fieldsArr.append(pk_id)
        
        var statement = SDOld.printQuery(query, withArgs: fieldsArr)
        statement = statement.stringByReplacingOccurrencesOfString("'", withString: "''")
        
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
        
        print("just added delete PG")
        
    }

    class func getLastanimalRegistration() -> String {
        let animal_registration: String = ""
        let query = "SELECT animal_registration from tbl_embryo_inventory ORDER BY _id DESC LIMIT 1 "
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
