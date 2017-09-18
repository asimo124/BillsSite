

//
//  MemberContact.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class MemberContactData {

	var contact_id: Int = -1
    var contact_id_str: String = "unset"
	var member_id: String = "unset"
    var member_id_str: String = "unset"
	var nickname: String = "unset"
    var nickname_str: String = "unset"
	var address_line_1: String = "unset"
    var address_line_1_str: String = "unset"
	var address_line_2: String = "unset"
    var address_line_2_str: String = "unset"
	var city: String = "unset"
    var city_str: String = "unset"
	var state: String = "unset"
    var state_str: String = "unset"
	var zip_code: String = "unset"
    var zip_code_str: String = "unset"
	var country: String = "unset"
    var country_str: String = "unset"
	var email: String = "unset"
    var email_str: String = "unset"
	var phone_number: String = "unset"
    var phone_number_str: String = "unset"
	var is_primary: Int = -1
    var is_primary_str: String = "unset"
	
	func setContactId(contact_id: Int?) {
        self.contact_id = contact_id ?? 0
        let contact_id2 = contact_id ?? 0
        self.contact_id_str = String(contact_id2)
        self.contact_id_str = (self.contact_id_str == "0") ? "" : self.contact_id_str
    }
    func getContactId() -> Int {
        return self.contact_id
    }
    func getContactIdType() -> String {
        return "Int"
    };
	func getContactIdStr() -> String {
        return contact_id_str
    };
	func getContactIdStrPG() -> String {
        return contact_id_str
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

	func setNickname(nickname: String?) {
        self.nickname = nickname ?? ""
        self.nickname_str = String(self.nickname)
    }
    func getNickname() -> String {
        return self.nickname
    }
    func getNicknameType() -> String {
        return "String"
    };
	func getNicknameStr() -> String {
        return nickname_str == "unset" ? "" : nickname_str
    };
	func getNicknameStrPG() -> String {
        return nickname_str == "unset" ? "" : nickname_str
    };

	func setAddressLine1(address_line_1: String?) {
        self.address_line_1 = address_line_1 ?? ""
        self.address_line_1_str = String(self.address_line_1)
    }
    func getAddressLine1() -> String {
        return self.address_line_1
    }
    func getAddressLine1Type() -> String {
        return "String"
    };
	func getAddressLine1Str() -> String {
        return address_line_1_str == "unset" ? "" : address_line_1_str
    };
	func getAddressLine1StrPG() -> String {
        return address_line_1_str == "unset" ? "" : address_line_1_str
    };

	func setAddressLine2(address_line_2: String?) {
        self.address_line_2 = address_line_2 ?? ""
        self.address_line_2_str = String(self.address_line_2)
    }
    func getAddressLine2() -> String {
        return self.address_line_2
    }
    func getAddressLine2Type() -> String {
        return "String"
    };
	func getAddressLine2Str() -> String {
        return address_line_2_str == "unset" ? "" : address_line_2_str
    };
	func getAddressLine2StrPG() -> String {
        return address_line_2_str == "unset" ? "" : address_line_2_str
    };

	func setCity(city: String?) {
        self.city = city ?? ""
        self.city_str = String(self.city)
    }
    func getCity() -> String {
        return self.city
    }
    func getCityType() -> String {
        return "String"
    };
	func getCityStr() -> String {
        return city_str == "unset" ? "" : city_str
    };
	func getCityStrPG() -> String {
        return city_str == "unset" ? "" : city_str
    };

	func setState(state: String?) {
        self.state = state ?? ""
        self.state_str = String(self.state)
    }
    func getState() -> String {
        return self.state
    }
    func getStateType() -> String {
        return "String"
    };
	func getStateStr() -> String {
        return state_str == "unset" ? "" : state_str
    };
	func getStateStrPG() -> String {
        return state_str == "unset" ? "" : state_str
    };

	func setZipCode(zip_code: String?) {
        self.zip_code = zip_code ?? ""
        self.zip_code_str = String(self.zip_code)
    }
    func getZipCode() -> String {
        return self.zip_code
    }
    func getZipCodeType() -> String {
        return "String"
    };
	func getZipCodeStr() -> String {
        return zip_code_str == "unset" ? "" : zip_code_str
    };
	func getZipCodeStrPG() -> String {
        return zip_code_str == "unset" ? "" : zip_code_str
    };

	func setCountry(country: String?) {
        self.country = country ?? ""
        self.country_str = String(self.country)
    }
    func getCountry() -> String {
        return self.country
    }
    func getCountryType() -> String {
        return "String"
    };
	func getCountryStr() -> String {
        return country_str == "unset" ? "" : country_str
    };
	func getCountryStrPG() -> String {
        return country_str == "unset" ? "" : country_str
    };

	func setEmail(email: String?) {
        self.email = email ?? ""
        self.email_str = String(self.email)
    }
    func getEmail() -> String {
        return self.email
    }
    func getEmailType() -> String {
        return "String"
    };
	func getEmailStr() -> String {
        return email_str == "unset" ? "" : email_str
    };
	func getEmailStrPG() -> String {
        return email_str == "unset" ? "" : email_str
    };

	func setPhoneNumber(phone_number: String?) {
        self.phone_number = phone_number ?? ""
        self.phone_number_str = String(self.phone_number)
    }
    func getPhoneNumber() -> String {
        return self.phone_number
    }
    func getPhoneNumberType() -> String {
        return "String"
    };
	func getPhoneNumberStr() -> String {
        return phone_number_str == "unset" ? "" : phone_number_str
    };
	func getPhoneNumberStrPG() -> String {
        return phone_number_str == "unset" ? "" : phone_number_str
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

	func getFieldType(field: String) -> String {
        switch field {
			case "contact_id":
				return "Int"
			case "member_id":
				return "String"
			case "nickname":
				return "String"
			case "address_line_1":
				return "String"
			case "address_line_2":
				return "String"
			case "city":
				return "String"
			case "state":
				return "String"
			case "zip_code":
				return "String"
			case "country":
				return "String"
			case "email":
				return "String"
			case "phone_number":
				return "String"
			case "is_primary":
				return "Int"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "contact_id":
			return self.getContactIdStr()
			case "member_id":
			return self.getMemberIdStr()
			case "nickname":
			return self.getNicknameStr()
			case "address_line_1":
			return self.getAddressLine1Str()
			case "address_line_2":
			return self.getAddressLine2Str()
			case "city":
			return self.getCityStr()
			case "state":
			return self.getStateStr()
			case "zip_code":
			return self.getZipCodeStr()
			case "country":
			return self.getCountryStr()
			case "email":
			return self.getEmailStr()
			case "phone_number":
			return self.getPhoneNumberStr()
			case "is_primary":
			return self.getIsPrimaryStr()
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
        qb.selectFrom("contact")
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

				self.setContactId((row["contact_id"]?.asInt()));
				self.setMemberId((row["member_id"]?.asString()));
				self.setNickname((row["nickname"]?.asString()));
				self.setAddressLine1((row["address_line_1"]?.asString()));
				self.setAddressLine2((row["address_line_2"]?.asString()));
				self.setCity((row["city"]?.asString()));
				self.setState((row["state"]?.asString()));
				self.setZipCode((row["zip_code"]?.asString()));
				self.setCountry((row["country"]?.asString()));
				self.setEmail((row["email"]?.asString()));
				self.setPhoneNumber((row["phone_number"]?.asString()));
				self.setIsPrimary((row["is_primary"]?.asMyBool()));

				
				fields["contact_id"] = self.getContactIdStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["nickname"] = self.getNicknameStr()
				fields["address_line_1"] = self.getAddressLine1Str()
				fields["address_line_2"] = self.getAddressLine2Str()
				fields["city"] = self.getCityStr()
				fields["state"] = self.getStateStr()
				fields["zip_code"] = self.getZipCodeStr()
				fields["country"] = self.getCountryStr()
				fields["email"] = self.getEmailStr()
				fields["phone_number"] = self.getPhoneNumberStr()
				fields["is_primary"] = self.getIsPrimaryStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["contact_id"] = self.getContactIdStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["nickname"] = self.getNicknameStr()
		fields["address_line_1"] = self.getAddressLine1Str()
		fields["address_line_2"] = self.getAddressLine2Str()
		fields["city"] = self.getCityStr()
		fields["state"] = self.getStateStr()
		fields["zip_code"] = self.getZipCodeStr()
		fields["country"] = self.getCountryStr()
		fields["email"] = self.getEmailStr()
		fields["phone_number"] = self.getPhoneNumberStr()
		fields["is_primary"] = self.getIsPrimaryStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["contact_id"] = self.getContactIdStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["nickname"] = self.getNicknameStrPG()
		fields["address_line_1"] = self.getAddressLine1StrPG()
		fields["address_line_2"] = self.getAddressLine2StrPG()
		fields["city"] = self.getCityStrPG()
		fields["state"] = self.getStateStrPG()
		fields["zip_code"] = self.getZipCodeStrPG()
		fields["country"] = self.getCountryStrPG()
		fields["email"] = self.getEmailStrPG()
		fields["phone_number"] = self.getPhoneNumberStrPG()
		fields["is_primary"] = self.getIsPrimaryStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO contact ("
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

        var statement = "INSERT INTO contact ("
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

            var statement = "INSERT INTO contact ("

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

        var statement = "UPDATE contact "
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

        var statement = "UPDATE contact "
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
        let query = "DELETE FROM contact WHERE member_id = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM contact WHERE member_id = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastmemberId() -> String {
        let member_id: String = ""
        let query = "SELECT member_id from contact ORDER BY _id DESC LIMIT 1 "
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
