

//
//  TblInventorySemen.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblInventorySemenData {

	var pk_id: Int = -1
    var pk_id_str: String = "unset"
	var member_id: Int = -1
    var member_id_str: String = "unset"
	var animal_registration: String = "unset"
    var animal_registration_str: String = "unset"
	var tank_id: String = "unset"
    var tank_id_str: String = "unset"
	var canister_id: String = "unset"
    var canister_id_str: String = "unset"
	var cane_code: String = "unset"
    var cane_code_str: String = "unset"
	var css_certified: Int = -1
    var css_certified_str: String = "unset"
	var straws: Int = -1
    var straws_str: String = "unset"
	var create_user: String = "unset"
    var create_user_str: String = "unset"
	var create_stamp: NSDate = NSDate.distantFuture() as NSDate
    var create_stamp_str: String = "unset"
	var update_user: String = "unset"
    var update_user_str: String = "unset"
	var update_stamp: NSDate = NSDate.distantFuture() as NSDate
    var update_stamp_str: String = "unset"
	var for_sale_private_treaty: Int = -1
    var for_sale_private_treaty_str: String = "unset"
	var private_treaty_date: NSDate = NSDate.distantFuture() as NSDate
    var private_treaty_date_str: String = "unset"
	var seller_comments: String = "unset"
    var seller_comments_str: String = "unset"
	var sale_price: Int = -1
    var sale_price_str: String = "unset"
	
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

	func setCssCertified(css_certified: Int?) {
        self.css_certified = css_certified ?? 0
        self.css_certified_str = ((self.css_certified) == 1) ? "t" : "f"
    }
    func getCssCertified() -> Int {
        return self.css_certified
    }
    func getCssCertifiedType() -> String {
        return "Int"
    };
	func getCssCertifiedStr() -> String {
        return String(css_certified)
    };
	func getCssCertifiedStrPG() -> String {
        return css_certified_str
    };

	func setStraws(straws: Int?) {
        self.straws = straws ?? 0
        let straws2 = straws ?? 0
        self.straws_str = String(straws2)
        self.straws_str = (self.straws_str == "0") ? "" : self.straws_str
    }
    func getStraws() -> Int {
        return self.straws
    }
    func getStrawsType() -> String {
        return "Int"
    };
	func getStrawsStr() -> String {
        return straws_str
    };
	func getStrawsStrPG() -> String {
        return straws_str
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

	func getFieldType(field: String) -> String {
        switch field {
			case "pk_id":
				return "Int"
			case "member_id":
				return "Int"
			case "animal_registration":
				return "String"
			case "tank_id":
				return "String"
			case "canister_id":
				return "String"
			case "cane_code":
				return "String"
			case "css_certified":
				return "Int"
			case "straws":
				return "Int"
			case "create_user":
				return "String"
			case "create_stamp":
				return "NSDate"
			case "update_user":
				return "String"
			case "update_stamp":
				return "NSDate"
			case "for_sale_private_treaty":
				return "Int"
			case "private_treaty_date":
				return "NSDate"
			case "seller_comments":
				return "String"
			case "sale_price":
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
			case "animal_registration":
			return self.getAnimalRegistrationStr()
			case "tank_id":
			return self.getTankIdStr()
			case "canister_id":
			return self.getCanisterIdStr()
			case "cane_code":
			return self.getCaneCodeStr()
			case "css_certified":
			return self.getCssCertifiedStr()
			case "straws":
			return self.getStrawsStr()
			case "create_user":
			return self.getCreateUserStr()
			case "create_stamp":
			return self.getCreateStampStr()
			case "update_user":
			return self.getUpdateUserStr()
			case "update_stamp":
			return self.getUpdateStampStr()
			case "for_sale_private_treaty":
			return self.getForSalePrivateTreatyStr()
			case "private_treaty_date":
			return self.getPrivateTreatyDateStr()
			case "seller_comments":
			return self.getSellerCommentsStr()
			case "sale_price":
			return self.getSalePriceStr()
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
        
        let query =
        "SELECT * FROM tbl_semen_inventory " +
        "WHERE pk_id = ? "

        var fieldsArr: [AnyObject] = []
        fieldsArr.append(pk_id)

        let fields = [String: String]()
        let (resultset, error) = SDOld.executeQuery(query, withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]

				self.setPkId((row["pk_id"]?.asInt()));
				self.setMemberId((row["member_id"]?.asInt()));
				self.setAnimalRegistration((row["animal_registration"]?.asString()));
				self.setTankId((row["tank_id"]?.asString()));
				self.setCanisterId((row["canister_id"]?.asString()));
				self.setCaneCode((row["cane_code"]?.asString()));
				self.setCssCertified((row["css_certified"]?.asMyBool()));
				self.setStraws((row["straws"]?.asInt()));
				self.setCreateUser((row["create_user"]?.asString()));
				self.setCreateStamp((row["create_stamp"]?.asDate()));
				self.setUpdateUser((row["update_user"]?.asString()));
				self.setUpdateStamp((row["update_stamp"]?.asDate()));
				self.setForSalePrivateTreaty((row["for_sale_private_treaty"]?.asMyBool()));
				self.setPrivateTreatyDate((row["private_treaty_date"]?.asDate()));
				self.setSellerComments((row["seller_comments"]?.asString()));
				self.setSalePrice((row["sale_price"]?.asInt()));

				var fields = [String: String]()
				fields["pk_id"] = self.getPkIdStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["animal_registration"] = self.getAnimalRegistrationStr()
				fields["tank_id"] = self.getTankIdStr()
				fields["canister_id"] = self.getCanisterIdStr()
				fields["cane_code"] = self.getCaneCodeStr()
				fields["css_certified"] = self.getCssCertifiedStr()
				fields["straws"] = self.getStrawsStr()
				fields["create_user"] = self.getCreateUserStr()
				fields["create_stamp"] = self.getCreateStampStr()
				fields["update_user"] = self.getUpdateUserStr()
				fields["update_stamp"] = self.getUpdateStampStr()
				fields["for_sale_private_treaty"] = self.getForSalePrivateTreatyStr()
				fields["private_treaty_date"] = self.getPrivateTreatyDateStr()
				fields["seller_comments"] = self.getSellerCommentsStr()
				fields["sale_price"] = self.getSalePriceStr()

                return fields
            }
        }
        return fields
    }
    
    func deleteByPKID(pk_id: Int, andMemberID: String) {
        
        let query =
        "DELETE FROM tbl_semen_inventory " +
        "WHERE member_id = ? " +
        "AND pk_id = ? "
        
        var fieldsArr: [AnyObject] = []
        fieldsArr.append(andMemberID)
        fieldsArr.append(pk_id)
        
        let error = SDOld.executeChange(query, withArgs: fieldsArr)
        if error != nil {
            SDOld.printDie(error!)
        }
    }
    
    func deleteByPKIDPG(pk_id: Int, andMemberID: String) {
        
        var query =
        "DELETE FROM tbl_semen_inventory " +
        "WHERE member_id = ? " +
        "AND pk_id = ? "
        
        var fieldsArr: [AnyObject] = []
        fieldsArr.append(andMemberID)
        fieldsArr.append(pk_id)
        
        query = SDOld.printQuery(query, withArgs: fieldsArr)
        query = query.stringByReplacingOccurrencesOfString("'", withString: "''")
        
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + query + "')");
        
        print("pg query done")
        
    }
    
    func findByMemberID(member_id: String) -> [TblInventorySemenData] {
        
        let query =
        "SELECT B.animal_name, A.pk_id, A.canister_id, A.animal_registration, A.tank_id, A.cane_code, A.straws " +
            "FROM tbl_semen_inventory A " +
            "LEFT JOIN tbl_animal B " +
            "ON A.animal_registration = B.animal_registration " +
            "where A.member_id = ? and ifnull(A.straws, 0) > 0 and A.straws <> '' " +
        "ORDER BY A.canister_id DESC"
        
        var withFields = [AnyObject]()
        withFields.append(member_id)
        
        var SemenHolder: [TblInventorySemenData] = []
        
        SDOld.printQuery(query, withArgs: withFields)
        let (resultset, error) = SDOld.executeQuery(query, withArgs: withFields)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            
            print("resultset.count at 3:", resultset.count)
            if resultset.count > 0 {
                
                for row in resultset {
                    
                    let Semen = TblInventorySemenData()
                    Semen.setPkId((row["pk_id"]?.asInt()));
                    Semen.setMemberId((row["member_id"]?.asInt()));
                    Semen.setAnimalRegistration((row["animal_registration"]?.asString()));
                    Semen.setTankId((row["tank_id"]?.asString()));
                    Semen.setCanisterId((row["canister_id"]?.asString()));
                    Semen.setCaneCode((row["cane_code"]?.asString()));
                    Semen.setCssCertified((row["css_certified"]?.asMyBool()));
                    Semen.setStraws((row["straws"]?.asInt()));
                    Semen.setCreateUser((row["create_user"]?.asString()));
                    Semen.setCreateStamp((row["create_stamp"]?.asDate()));
                    Semen.setUpdateUser((row["update_user"]?.asString()));
                    Semen.setUpdateStamp((row["update_stamp"]?.asDate()));
                    Semen.setForSalePrivateTreaty((row["for_sale_private_treaty"]?.asMyBool()));
                    Semen.setPrivateTreatyDate((row["private_treaty_date"]?.asDate()));
                    Semen.setSellerComments((row["seller_comments"]?.asString()));
                    Semen.setSalePrice((row["sale_price"]?.asInt()));
                    
                    /*let obj = Mirror(reflecting: Semen)
                    for child in obj.children {
                        guard let key = child.label else { continue }
                        let value = child.value
                        print(key, ": ", value)
                    }*/
                    
                    SemenHolder.append(Semen);
                }
            }
        }
        return SemenHolder
    }
    
    func findAnimalNamesByMemberID(member_id: String) -> [[String: AnyObject]] {
        
        let query =
        "SELECT B.animal_name, B.animal_private_herd_id, A.animal_registration " +
            "FROM tbl_semen_inventory A " +
            "LEFT JOIN tbl_animal B " +
            "ON A.animal_registration = B.animal_registration " +
            "where A.member_id = ? and ifnull(A.straws, 0) > 0 and A.straws <> '' " +
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
                    
                    let animal_name = row["animal_name"]?.asString() ?? ""
                    let animal_registration = row["animal_registration"]?.asString() ?? ""
                    let animal_private_herd_id = row["animal_private_herd_id"]?.asString() ?? ""
                    
                    fieldsArr["animal_name"] = animal_name
                    fieldsArr["animal_registration"] = animal_registration
                    fieldsArr["animal_private_herd_id"] = animal_private_herd_id
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
		fields["animal_registration"] = self.getAnimalRegistrationStr()
		fields["tank_id"] = self.getTankIdStr()
		fields["canister_id"] = self.getCanisterIdStr()
		fields["cane_code"] = self.getCaneCodeStr()
		fields["css_certified"] = self.getCssCertifiedStr()
		fields["straws"] = self.getStrawsStr()
		fields["create_user"] = self.getCreateUserStr()
		fields["create_stamp"] = self.getCreateStampStr()
		fields["update_user"] = self.getUpdateUserStr()
		fields["update_stamp"] = self.getUpdateStampStr()
		fields["for_sale_private_treaty"] = self.getForSalePrivateTreatyStr()
		fields["private_treaty_date"] = self.getPrivateTreatyDateStr()
		fields["seller_comments"] = self.getSellerCommentsStr()
		fields["sale_price"] = self.getSalePriceStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["pk_id"] = self.getPkIdStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["animal_registration"] = self.getAnimalRegistrationStrPG()
		fields["tank_id"] = self.getTankIdStrPG()
		fields["canister_id"] = self.getCanisterIdStrPG()
		fields["cane_code"] = self.getCaneCodeStrPG()
		fields["css_certified"] = self.getCssCertifiedStrPG()
		fields["straws"] = self.getStrawsStrPG()
		fields["create_user"] = self.getCreateUserStrPG()
		fields["create_stamp"] = self.getCreateStampStrPG()
		fields["update_user"] = self.getUpdateUserStrPG()
		fields["update_stamp"] = self.getUpdateStampStrPG()
		fields["for_sale_private_treaty"] = self.getForSalePrivateTreatyStrPG()
		fields["private_treaty_date"] = self.getPrivateTreatyDateStrPG()
		fields["seller_comments"] = self.getSellerCommentsStrPG()
		fields["sale_price"] = self.getSalePriceStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_semen_inventory ("
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

        var statement = "INSERT INTO tbl_semen_inventory ("
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
        
        

        statement = statement.stringByReplacingOccurrencesOfString("'", withString: "''")
        
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

            var statement = "INSERT INTO tbl_semen_inventory ("

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

    func updateForPKID(PKID: Int, var andMemberID: String) {

        andMemberID = andMemberID.stringByReplacingOccurrencesOfString("'", withString: "''")
        var PKID2 = String(PKID)
        PKID2 = PKID2.stringByReplacingOccurrencesOfString("'", withString: "''")
        
        // get all field/values as string values
        var fields = self.getFields()

        var statement = "UPDATE tbl_semen_inventory "
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
        statement += "WHERE member_id = '" + andMemberID + "' and pk_id = '" + PKID2 + "' "
        
        let dbn = DatabaseOld()
        dbn.query(statement)
    }

    func updatePGForPKID(PKID: Int, var andMemberID: String) {

        andMemberID = andMemberID.stringByReplacingOccurrencesOfString("'", withString: "''")
        var PKID2 = String(PKID)
        PKID2 = PKID2.stringByReplacingOccurrencesOfString("'", withString: "''")
        
        // get all field/values as string values
        var fields = self.getFieldsPG()

        var statement = "UPDATE tbl_semen_inventory "
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
        statement += "WHERE member_id = '" + andMemberID + "' and pk_id = '" + PKID2 + "' "
        
        statement = statement.stringByReplacingOccurrencesOfString("'", withString: "''")

        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastanimalRegistration() -> String {
        let animal_registration: String = ""
        let query = "SELECT animal_registration from tbl_semen_inventory ORDER BY _id DESC LIMIT 1 "
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
