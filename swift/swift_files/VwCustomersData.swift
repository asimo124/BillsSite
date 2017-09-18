

//
//  VwCustomers.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class VwCustomersData {

	var _id: Int = -1
    var _id_str: String = "unset"
	var customer_id: Int = -1
    var customer_id_str: String = "unset"
	var address_id: Int = -1
    var address_id_str: String = "unset"
	var customer_name: String = "unset"
    var customer_name_str: String = "unset"
	var address_line1: String = "unset"
    var address_line1_str: String = "unset"
	var address_line2: String = "unset"
    var address_line2_str: String = "unset"
	var address_city: String = "unset"
    var address_city_str: String = "unset"
	var address_state: String = "unset"
    var address_state_str: String = "unset"
	var address_postal_code: String = "unset"
    var address_postal_code_str: String = "unset"
	var address_country: String = "unset"
    var address_country_str: String = "unset"
	var address_email: String = "unset"
    var address_email_str: String = "unset"
	var num_purch: Int = -1
    var num_purch_str: String = "unset"
	var date_purch: NSDate = NSDate.distantFuture() as NSDate
    var date_purch_str: String = "unset"
	var longitude: String = "unset"
    var longitude_str: String = "unset"
	var latitude: String = "unset"
    var latitude_str: String = "unset"
	var phone1: String = "unset"
    var phone1_str: String = "unset"
	var phone2: String = "unset"
    var phone2_str: String = "unset"
	var phone3: String = "unset"
    var phone3_str: String = "unset"
	var member_dba: String = "unset"
    var member_dba_str: String = "unset"
	var herd_code: String = "unset"
    var herd_code_str: String = "unset"
	var hold_brand_location: String = "unset"
    var hold_brand_location_str: String = "unset"
	var tattoo_location: String = "unset"
    var tattoo_location_str: String = "unset"
	
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

	func setCustomerId(customer_id: Int?) {
        self.customer_id = customer_id ?? 0
        let customer_id2 = customer_id ?? 0
        self.customer_id_str = String(customer_id2)
        self.customer_id_str = (self.customer_id_str == "0") ? "" : self.customer_id_str
    }
    func getCustomerId() -> Int {
        return self.customer_id
    }
    func getCustomerIdType() -> String {
        return "Int"
    };
	func getCustomerIdStr() -> String {
        return customer_id_str
    };
	func getCustomerIdStrPG() -> String {
        return customer_id_str
    };

	func setAddressId(address_id: Int?) {
        self.address_id = address_id ?? 0
        let address_id2 = address_id ?? 0
        self.address_id_str = String(address_id2)
        self.address_id_str = (self.address_id_str == "0") ? "" : self.address_id_str
    }
    func getAddressId() -> Int {
        return self.address_id
    }
    func getAddressIdType() -> String {
        return "Int"
    };
	func getAddressIdStr() -> String {
        return address_id_str
    };
	func getAddressIdStrPG() -> String {
        return address_id_str
    };

	func setCustomerName(customer_name: String?) {
        self.customer_name = customer_name ?? ""
        self.customer_name_str = String(self.customer_name)
    }
    func getCustomerName() -> String {
        return self.customer_name
    }
    func getCustomerNameType() -> String {
        return "String"
    };
	func getCustomerNameStr() -> String {
        return customer_name_str == "unset" ? "" : customer_name_str
    };
	func getCustomerNameStrPG() -> String {
        return customer_name_str == "unset" ? "" : customer_name_str
    };

	func setAddressLine1(address_line1: String?) {
        self.address_line1 = address_line1 ?? ""
        self.address_line1_str = String(self.address_line1)
    }
    func getAddressLine1() -> String {
        return self.address_line1
    }
    func getAddressLine1Type() -> String {
        return "String"
    };
	func getAddressLine1Str() -> String {
        return address_line1_str == "unset" ? "" : address_line1_str
    };
	func getAddressLine1StrPG() -> String {
        return address_line1_str == "unset" ? "" : address_line1_str
    };

	func setAddressLine2(address_line2: String?) {
        self.address_line2 = address_line2 ?? ""
        self.address_line2_str = String(self.address_line2)
    }
    func getAddressLine2() -> String {
        return self.address_line2
    }
    func getAddressLine2Type() -> String {
        return "String"
    };
	func getAddressLine2Str() -> String {
        return address_line2_str == "unset" ? "" : address_line2_str
    };
	func getAddressLine2StrPG() -> String {
        return address_line2_str == "unset" ? "" : address_line2_str
    };

	func setAddressCity(address_city: String?) {
        self.address_city = address_city ?? ""
        self.address_city_str = String(self.address_city)
    }
    func getAddressCity() -> String {
        return self.address_city
    }
    func getAddressCityType() -> String {
        return "String"
    };
	func getAddressCityStr() -> String {
        return address_city_str == "unset" ? "" : address_city_str
    };
	func getAddressCityStrPG() -> String {
        return address_city_str == "unset" ? "" : address_city_str
    };

	func setAddressState(address_state: String?) {
        self.address_state = address_state ?? ""
        self.address_state_str = String(self.address_state)
    }
    func getAddressState() -> String {
        return self.address_state
    }
    func getAddressStateType() -> String {
        return "String"
    };
	func getAddressStateStr() -> String {
        return address_state_str == "unset" ? "" : address_state_str
    };
	func getAddressStateStrPG() -> String {
        return address_state_str == "unset" ? "" : address_state_str
    };

	func setAddressPostalCode(address_postal_code: String?) {
        self.address_postal_code = address_postal_code ?? ""
        self.address_postal_code_str = String(self.address_postal_code)
    }
    func getAddressPostalCode() -> String {
        return self.address_postal_code
    }
    func getAddressPostalCodeType() -> String {
        return "String"
    };
	func getAddressPostalCodeStr() -> String {
        return address_postal_code_str == "unset" ? "" : address_postal_code_str
    };
	func getAddressPostalCodeStrPG() -> String {
        return address_postal_code_str == "unset" ? "" : address_postal_code_str
    };

	func setAddressCountry(address_country: String?) {
        self.address_country = address_country ?? ""
        self.address_country_str = String(self.address_country)
    }
    func getAddressCountry() -> String {
        return self.address_country
    }
    func getAddressCountryType() -> String {
        return "String"
    };
	func getAddressCountryStr() -> String {
        return address_country_str == "unset" ? "" : address_country_str
    };
	func getAddressCountryStrPG() -> String {
        return address_country_str == "unset" ? "" : address_country_str
    };

	func setAddressEmail(address_email: String?) {
        self.address_email = address_email ?? ""
        self.address_email_str = String(self.address_email)
    }
    func getAddressEmail() -> String {
        return self.address_email
    }
    func getAddressEmailType() -> String {
        return "String"
    };
	func getAddressEmailStr() -> String {
        return address_email_str == "unset" ? "" : address_email_str
    };
	func getAddressEmailStrPG() -> String {
        return address_email_str == "unset" ? "" : address_email_str
    };

	func setNumPurch(num_purch: Int?) {
        self.num_purch = num_purch ?? 0
        let num_purch2 = num_purch ?? 0
        self.num_purch_str = String(num_purch2)
        self.num_purch_str = (self.num_purch_str == "0") ? "" : self.num_purch_str
    }
    func getNumPurch() -> Int {
        return self.num_purch
    }
    func getNumPurchType() -> String {
        return "Int"
    };
	func getNumPurchStr() -> String {
        return num_purch_str
    };
	func getNumPurchStrPG() -> String {
        return num_purch_str
    };

	func setDatePurch(date_purch: NSDate?) {
        self.date_purch = date_purch ?? NSDate.distantPast() as NSDate
        self.date_purch_str = Utils.dateToString(self.date_purch)
    }
    func getDatePurch() -> NSDate {
        return self.date_purch
    }
    func getDatePurchType() -> String {
        return "NSDate"
    };
	func getDatePurchStr() -> String {
        return date_purch_str == "unset" || date_purch_str == "0000-12-30 00:00:00 +0000" ? "" : date_purch_str
    };
	func getDatePurchStrPG() -> String {
        return date_purch_str == "unset" || date_purch_str == "0000-12-30 00:00:00 +0000" ? "" : date_purch_str
    };

	func setLongitude(longitude: String?) {
        self.longitude = longitude ?? ""
        self.longitude_str = String(self.longitude)
    }
    func getLongitude() -> String {
        return self.longitude
    }
    func getLongitudeType() -> String {
        return "String"
    };
	func getLongitudeStr() -> String {
        return longitude_str == "unset" ? "" : longitude_str
    };
	func getLongitudeStrPG() -> String {
        return longitude_str == "unset" ? "" : longitude_str
    };

	func setLatitude(latitude: String?) {
        self.latitude = latitude ?? ""
        self.latitude_str = String(self.latitude)
    }
    func getLatitude() -> String {
        return self.latitude
    }
    func getLatitudeType() -> String {
        return "String"
    };
	func getLatitudeStr() -> String {
        return latitude_str == "unset" ? "" : latitude_str
    };
	func getLatitudeStrPG() -> String {
        return latitude_str == "unset" ? "" : latitude_str
    };

	func setPhone1(phone1: String?) {
        self.phone1 = phone1 ?? ""
        self.phone1_str = String(self.phone1)
    }
    func getPhone1() -> String {
        return self.phone1
    }
    func getPhone1Type() -> String {
        return "String"
    };
	func getPhone1Str() -> String {
        return phone1_str == "unset" ? "" : phone1_str
    };
	func getPhone1StrPG() -> String {
        return phone1_str == "unset" ? "" : phone1_str
    };

	func setPhone2(phone2: String?) {
        self.phone2 = phone2 ?? ""
        self.phone2_str = String(self.phone2)
    }
    func getPhone2() -> String {
        return self.phone2
    }
    func getPhone2Type() -> String {
        return "String"
    };
	func getPhone2Str() -> String {
        return phone2_str == "unset" ? "" : phone2_str
    };
	func getPhone2StrPG() -> String {
        return phone2_str == "unset" ? "" : phone2_str
    };

	func setPhone3(phone3: String?) {
        self.phone3 = phone3 ?? ""
        self.phone3_str = String(self.phone3)
    }
    func getPhone3() -> String {
        return self.phone3
    }
    func getPhone3Type() -> String {
        return "String"
    };
	func getPhone3Str() -> String {
        return phone3_str == "unset" ? "" : phone3_str
    };
	func getPhone3StrPG() -> String {
        return phone3_str == "unset" ? "" : phone3_str
    };

	func setMemberDba(member_dba: String?) {
        self.member_dba = member_dba ?? ""
        self.member_dba_str = String(self.member_dba)
    }
    func getMemberDba() -> String {
        return self.member_dba
    }
    func getMemberDbaType() -> String {
        return "String"
    };
	func getMemberDbaStr() -> String {
        return member_dba_str == "unset" ? "" : member_dba_str
    };
	func getMemberDbaStrPG() -> String {
        return member_dba_str == "unset" ? "" : member_dba_str
    };

	func setHerdCode(herd_code: String?) {
        self.herd_code = herd_code ?? ""
        self.herd_code_str = String(self.herd_code)
    }
    func getHerdCode() -> String {
        return self.herd_code
    }
    func getHerdCodeType() -> String {
        return "String"
    };
	func getHerdCodeStr() -> String {
        return herd_code_str == "unset" ? "" : herd_code_str
    };
	func getHerdCodeStrPG() -> String {
        return herd_code_str == "unset" ? "" : herd_code_str
    };

	func setHoldBrandLocation(hold_brand_location: String?) {
        self.hold_brand_location = hold_brand_location ?? ""
        self.hold_brand_location_str = String(self.hold_brand_location)
    }
    func getHoldBrandLocation() -> String {
        return self.hold_brand_location
    }
    func getHoldBrandLocationType() -> String {
        return "String"
    };
	func getHoldBrandLocationStr() -> String {
        return hold_brand_location_str == "unset" ? "" : hold_brand_location_str
    };
	func getHoldBrandLocationStrPG() -> String {
        return hold_brand_location_str == "unset" ? "" : hold_brand_location_str
    };

	func setTattooLocation(tattoo_location: String?) {
        self.tattoo_location = tattoo_location ?? ""
        self.tattoo_location_str = String(self.tattoo_location)
    }
    func getTattooLocation() -> String {
        return self.tattoo_location
    }
    func getTattooLocationType() -> String {
        return "String"
    };
	func getTattooLocationStr() -> String {
        return tattoo_location_str == "unset" ? "" : tattoo_location_str
    };
	func getTattooLocationStrPG() -> String {
        return tattoo_location_str == "unset" ? "" : tattoo_location_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "_id":
				return "Int"
			case "customer_id":
				return "Int"
			case "address_id":
				return "Int"
			case "customer_name":
				return "String"
			case "address_line1":
				return "String"
			case "address_line2":
				return "String"
			case "address_city":
				return "String"
			case "address_state":
				return "String"
			case "address_postal_code":
				return "String"
			case "address_country":
				return "String"
			case "address_email":
				return "String"
			case "num_purch":
				return "Int"
			case "date_purch":
				return "NSDate"
			case "longitude":
				return "String"
			case "latitude":
				return "String"
			case "phone1":
				return "String"
			case "phone2":
				return "String"
			case "phone3":
				return "String"
			case "member_dba":
				return "String"
			case "herd_code":
				return "String"
			case "hold_brand_location":
				return "String"
			case "tattoo_location":
				return "String"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "_id":
			return self.getIdStr()
			case "customer_id":
			return self.getCustomerIdStr()
			case "address_id":
			return self.getAddressIdStr()
			case "customer_name":
			return self.getCustomerNameStr()
			case "address_line1":
			return self.getAddressLine1Str()
			case "address_line2":
			return self.getAddressLine2Str()
			case "address_city":
			return self.getAddressCityStr()
			case "address_state":
			return self.getAddressStateStr()
			case "address_postal_code":
			return self.getAddressPostalCodeStr()
			case "address_country":
			return self.getAddressCountryStr()
			case "address_email":
			return self.getAddressEmailStr()
			case "num_purch":
			return self.getNumPurchStr()
			case "date_purch":
			return self.getDatePurchStr()
			case "longitude":
			return self.getLongitudeStr()
			case "latitude":
			return self.getLatitudeStr()
			case "phone1":
			return self.getPhone1Str()
			case "phone2":
			return self.getPhone2Str()
			case "phone3":
			return self.getPhone3Str()
			case "member_dba":
			return self.getMemberDbaStr()
			case "herd_code":
			return self.getHerdCodeStr()
			case "hold_brand_location":
			return self.getHoldBrandLocationStr()
			case "tattoo_location":
			return self.getTattooLocationStr()
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
        qb.selectFrom("vw_member_customers")
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

				self.setId((row["_id"]?.asInt()));
				self.setCustomerId((row["customer_id"]?.asInt()));
				self.setAddressId((row["address_id"]?.asInt()));
				self.setCustomerName((row["customer_name"]?.asString()));
				self.setAddressLine1((row["address_line1"]?.asString()));
				self.setAddressLine2((row["address_line2"]?.asString()));
				self.setAddressCity((row["address_city"]?.asString()));
				self.setAddressState((row["address_state"]?.asString()));
				self.setAddressPostalCode((row["address_postal_code"]?.asString()));
				self.setAddressCountry((row["address_country"]?.asString()));
				self.setAddressEmail((row["address_email"]?.asString()));
				self.setNumPurch((row["num_purch"]?.asInt()));
				self.setDatePurch((row["date_purch"]?.asDate()));
				self.setLongitude((row["longitude"]?.asString()));
				self.setLatitude((row["latitude"]?.asString()));
				self.setPhone1((row["phone1"]?.asString()));
				self.setPhone2((row["phone2"]?.asString()));
				self.setPhone3((row["phone3"]?.asString()));
				self.setMemberDba((row["member_dba"]?.asString()));
				self.setHerdCode((row["herd_code"]?.asString()));
				self.setHoldBrandLocation((row["hold_brand_location"]?.asString()));
				self.setTattooLocation((row["tattoo_location"]?.asString()));

				var fields = [String: String]()
				fields["_id"] = self.getIdStr()
				fields["customer_id"] = self.getCustomerIdStr()
				fields["address_id"] = self.getAddressIdStr()
				fields["customer_name"] = self.getCustomerNameStr()
				fields["address_line1"] = self.getAddressLine1Str()
				fields["address_line2"] = self.getAddressLine2Str()
				fields["address_city"] = self.getAddressCityStr()
				fields["address_state"] = self.getAddressStateStr()
				fields["address_postal_code"] = self.getAddressPostalCodeStr()
				fields["address_country"] = self.getAddressCountryStr()
				fields["address_email"] = self.getAddressEmailStr()
				fields["num_purch"] = self.getNumPurchStr()
				fields["date_purch"] = self.getDatePurchStr()
				fields["longitude"] = self.getLongitudeStr()
				fields["latitude"] = self.getLatitudeStr()
				fields["phone1"] = self.getPhone1Str()
				fields["phone2"] = self.getPhone2Str()
				fields["phone3"] = self.getPhone3Str()
				fields["member_dba"] = self.getMemberDbaStr()
				fields["herd_code"] = self.getHerdCodeStr()
				fields["hold_brand_location"] = self.getHoldBrandLocationStr()
				fields["tattoo_location"] = self.getTattooLocationStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["_id"] = self.getIdStr()
		fields["customer_id"] = self.getCustomerIdStr()
		fields["address_id"] = self.getAddressIdStr()
		fields["customer_name"] = self.getCustomerNameStr()
		fields["address_line1"] = self.getAddressLine1Str()
		fields["address_line2"] = self.getAddressLine2Str()
		fields["address_city"] = self.getAddressCityStr()
		fields["address_state"] = self.getAddressStateStr()
		fields["address_postal_code"] = self.getAddressPostalCodeStr()
		fields["address_country"] = self.getAddressCountryStr()
		fields["address_email"] = self.getAddressEmailStr()
		fields["num_purch"] = self.getNumPurchStr()
		fields["date_purch"] = self.getDatePurchStr()
		fields["longitude"] = self.getLongitudeStr()
		fields["latitude"] = self.getLatitudeStr()
		fields["phone1"] = self.getPhone1Str()
		fields["phone2"] = self.getPhone2Str()
		fields["phone3"] = self.getPhone3Str()
		fields["member_dba"] = self.getMemberDbaStr()
		fields["herd_code"] = self.getHerdCodeStr()
		fields["hold_brand_location"] = self.getHoldBrandLocationStr()
		fields["tattoo_location"] = self.getTattooLocationStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["_id"] = self.getIdStrPG()
		fields["customer_id"] = self.getCustomerIdStrPG()
		fields["address_id"] = self.getAddressIdStrPG()
		fields["customer_name"] = self.getCustomerNameStrPG()
		fields["address_line1"] = self.getAddressLine1StrPG()
		fields["address_line2"] = self.getAddressLine2StrPG()
		fields["address_city"] = self.getAddressCityStrPG()
		fields["address_state"] = self.getAddressStateStrPG()
		fields["address_postal_code"] = self.getAddressPostalCodeStrPG()
		fields["address_country"] = self.getAddressCountryStrPG()
		fields["address_email"] = self.getAddressEmailStrPG()
		fields["num_purch"] = self.getNumPurchStrPG()
		fields["date_purch"] = self.getDatePurchStrPG()
		fields["longitude"] = self.getLongitudeStrPG()
		fields["latitude"] = self.getLatitudeStrPG()
		fields["phone1"] = self.getPhone1StrPG()
		fields["phone2"] = self.getPhone2StrPG()
		fields["phone3"] = self.getPhone3StrPG()
		fields["member_dba"] = self.getMemberDbaStrPG()
		fields["herd_code"] = self.getHerdCodeStrPG()
		fields["hold_brand_location"] = self.getHoldBrandLocationStrPG()
		fields["tattoo_location"] = self.getTattooLocationStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO vw_member_customers ("
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

        var statement = "INSERT INTO vw_member_customers ("
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

            var statement = "INSERT INTO vw_member_customers ("

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

        var statement = "UPDATE vw_member_customers "
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

        var statement = "UPDATE vw_member_customers "
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
        let query = "DELETE FROM vw_member_customers WHERE _id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: Int) {

        let statement = "DELETE FROM vw_member_customers WHERE _id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastId() -> String {
        let _id: String = ""
        let query = "SELECT _id from vw_member_customers ORDER BY _id DESC LIMIT 1 "
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
