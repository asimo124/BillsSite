//
//  Member.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class MemberData: Model {
    
   	var _id: Int = -1
    var _id_str: String = "unset"
   	var member_id: String = "unset"
    var member_id_str: String = "unset"
   	var member_password: String = "unset"
    var member_password_str: String = "unset"
   	var member_name: String = "unset"
    var member_name_str: String = "unset"
   	var membership_type: String = "unset"
    var membership_type_str: String = "unset"
   	var ranch_name: String = "unset"
    var ranch_name_str: String = "unset"
   	var premise_id: String = "unset"
    var premise_id_str: String = "unset"
   	var website: String = "unset"
    var website_str: String = "unset"
   	var member_since: NSDate = NSDate.distantFuture() as NSDate
    var member_since_str: String = "unset"
   	var membership_begin: NSDate = NSDate.distantFuture() as NSDate
    var membership_begin_str: String = "unset"
   	var subscription_end_date: NSDate = NSDate.distantFuture() as NSDate
    var subscription_end_date_str: String = "unset"
   	var birth_date: NSDate = NSDate.distantFuture() as NSDate
    var birth_date_str: String = "unset"
   	var active_flag: Int = -1
    var active_flag_str: String = "unset"
   	var mobile_app_active_flag: Int = -1
    var mobile_app_active_flag_str: String = "unset"
   	var is_staff: Int = -1
    var is_staff_str: String = "unset"
   	var is_admin: Int = -1
    var is_admin_str: String = "unset"
   	var legacy_password: String = "unset"
    var legacy_password_str: String = "unset"
   	var herd_code: String = "unset"
    var herd_code_str: String = "unset"
    
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
        return _id_str == "unset" ? "" : _id_str
    };
   	func getIdStrPG() -> String {
        return _id_str == "unset" ? "" : _id_str
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
    
   	func setMemberPassword(member_password: String?) {
        self.member_password = member_password ?? ""
        self.member_password_str = String(self.member_password)
    }
    func getMemberPassword() -> String {
        return self.member_password
    }
    func getMemberPasswordType() -> String {
        return "String"
    };
   	func getMemberPasswordStr() -> String {
        return member_password_str == "unset" ? "" : member_password_str
    };
   	func getMemberPasswordStrPG() -> String {
        return member_password_str == "unset" ? "" : member_password_str
    };
    
   	func setMemberName(member_name: String?) {
        self.member_name = member_name ?? ""
        self.member_name_str = String(self.member_name)
    }
    func getMemberName() -> String {
        return self.member_name
    }
    func getMemberNameType() -> String {
        return "String"
    };
   	func getMemberNameStr() -> String {
        return member_name_str == "unset" ? "" : member_name_str
    };
   	func getMemberNameStrPG() -> String {
        return member_name_str == "unset" ? "" : member_name_str
    };
    
   	func setMembershipType(membership_type: String?) {
        self.membership_type = membership_type ?? ""
        self.membership_type_str = String(self.membership_type)
    }
    func getMembershipType() -> String {
        return self.membership_type
    }
    func getMembershipTypeType() -> String {
        return "String"
    };
   	func getMembershipTypeStr() -> String {
        return membership_type_str == "unset" ? "" : membership_type_str
    };
   	func getMembershipTypeStrPG() -> String {
        return membership_type_str == "unset" ? "" : membership_type_str
    };
    
   	func setRanchName(ranch_name: String?) {
        self.ranch_name = ranch_name ?? ""
        self.ranch_name_str = String(self.ranch_name)
    }
    func getRanchName() -> String {
        return self.ranch_name
    }
    func getRanchNameType() -> String {
        return "String"
    };
   	func getRanchNameStr() -> String {
        return ranch_name_str == "unset" ? "" : ranch_name_str
    };
   	func getRanchNameStrPG() -> String {
        return ranch_name_str == "unset" ? "" : ranch_name_str
    };
    
   	func setPremiseId(premise_id: String?) {
        self.premise_id = premise_id ?? ""
        self.premise_id_str = String(self.premise_id)
    }
    func getPremiseId() -> String {
        return self.premise_id
    }
    func getPremiseIdType() -> String {
        return "String"
    };
   	func getPremiseIdStr() -> String {
        return premise_id_str == "unset" ? "" : premise_id_str
    };
   	func getPremiseIdStrPG() -> String {
        return premise_id_str == "unset" ? "" : premise_id_str
    };
    
   	func setWebsite(website: String?) {
        self.website = website ?? ""
        self.website_str = String(self.website)
    }
    func getWebsite() -> String {
        return self.website
    }
    func getWebsiteType() -> String {
        return "String"
    };
   	func getWebsiteStr() -> String {
        return website_str == "unset" ? "" : website_str
    };
   	func getWebsiteStrPG() -> String {
        return website_str == "unset" ? "" : website_str
    };
    
   	func setMemberSince(member_since: NSDate?) {
        self.member_since = member_since ?? NSDate.distantPast() as NSDate
        self.member_since_str = Utils.dateToString(self.member_since)
    }
    func getMemberSince() -> NSDate {
        return self.member_since
    }
    func getMemberSinceType() -> String {
        return "NSDate"
    };
   	func getMemberSinceStr() -> String {
        return member_since_str == "unset" || member_since_str == "0000-12-30 00:00:00 +0000" ? "" : member_since_str
    };
   	func getMemberSinceStrPG() -> String {
        return member_since_str == "unset" || member_since_str == "0000-12-30 00:00:00 +0000" ? "" : member_since_str
    };
    
   	func setMembershipBegin(membership_begin: NSDate?) {
        self.membership_begin = membership_begin ?? NSDate.distantPast() as NSDate
        self.membership_begin_str = Utils.dateToString(self.membership_begin)
    }
    func getMembershipBegin() -> NSDate {
        return self.membership_begin
    }
    func getMembershipBeginType() -> String {
        return "NSDate"
    };
   	func getMembershipBeginStr() -> String {
        return membership_begin_str == "unset" || membership_begin_str == "0000-12-30 00:00:00 +0000" ? "" : membership_begin_str
    };
   	func getMembershipBeginStrPG() -> String {
        return membership_begin_str == "unset" || membership_begin_str == "0000-12-30 00:00:00 +0000" ? "" : membership_begin_str
    };
    
   	func setSubscriptionEndDate(subscription_end_date: NSDate?) {
        self.subscription_end_date = subscription_end_date ?? NSDate.distantPast() as NSDate
        self.subscription_end_date_str = Utils.dateToString(self.subscription_end_date)
    }
    func getSubscriptionEndDate() -> NSDate {
        return self.subscription_end_date
    }
    func getSubscriptionEndDateType() -> String {
        return "NSDate"
    };
   	func getSubscriptionEndDateStr() -> String {
        return subscription_end_date_str == "unset" || subscription_end_date_str == "0000-12-30 00:00:00 +0000" ? "" : subscription_end_date_str
    };
   	func getSubscriptionEndDateStrPG() -> String {
        return subscription_end_date_str == "unset" || subscription_end_date_str == "0000-12-30 00:00:00 +0000" ? "" : subscription_end_date_str
    };
    
   	func setBirthDate(birth_date: NSDate?) {
        self.birth_date = birth_date ?? NSDate.distantPast() as NSDate
        self.birth_date_str = Utils.dateToString(self.birth_date)
    }
    func getBirthDate() -> NSDate {
        return self.birth_date
    }
    func getBirthDateType() -> String {
        return "NSDate"
    };
   	func getBirthDateStr() -> String {
        return birth_date_str == "unset" || birth_date_str == "0000-12-30 00:00:00 +0000" ? "" : birth_date_str
    };
   	func getBirthDateStrPG() -> String {
        return birth_date_str == "unset" || birth_date_str == "0000-12-30 00:00:00 +0000" ? "" : birth_date_str
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
        return active_flag_str == "unset" ? "" : active_flag_str
    };
    
   	func setMobileAppActiveFlag(mobile_app_active_flag: Int?) {
        self.mobile_app_active_flag = mobile_app_active_flag ?? 0
        self.mobile_app_active_flag_str = ((self.mobile_app_active_flag) == 1) ? "t" : "f"
    }
    func getMobileAppActiveFlag() -> Int {
        return self.mobile_app_active_flag
    }
    func getMobileAppActiveFlagType() -> String {
        return "Int"
    };
   	func getMobileAppActiveFlagStr() -> String {
        return String(mobile_app_active_flag)
    };
   	func getMobileAppActiveFlagStrPG() -> String {
        return mobile_app_active_flag_str == "unset" ? "" : mobile_app_active_flag_str
    };
    
   	func setIsStaff(is_staff: Int?) {
        self.is_staff = is_staff ?? 0
        self.is_staff_str = ((self.is_staff) == 1) ? "t" : "f"
    }
    func getIsStaff() -> Int {
        return self.is_staff
    }
    func getIsStaffType() -> String {
        return "Int"
    };
   	func getIsStaffStr() -> String {
        return String(is_staff)
    };
   	func getIsStaffStrPG() -> String {
        return is_staff_str == "unset" ? "" : is_staff_str
    };
    
   	func setIsAdmin(is_admin: Int?) {
        self.is_admin = is_admin ?? 0
        self.is_admin_str = ((self.is_admin) == 1) ? "t" : "f"
    }
    func getIsAdmin() -> Int {
        return self.is_admin
    }
    func getIsAdminType() -> String {
        return "Int"
    };
   	func getIsAdminStr() -> String {
        return String(is_admin)
    };
   	func getIsAdminStrPG() -> String {
        return is_admin_str == "unset" ? "" : is_admin_str
    };
    
   	func setLegacyPassword(legacy_password: String?) {
        self.legacy_password = legacy_password ?? ""
        self.legacy_password_str = String(self.legacy_password)
    }
    func getLegacyPassword() -> String {
        return self.legacy_password
    }
    func getLegacyPasswordType() -> String {
        return "String"
    };
   	func getLegacyPasswordStr() -> String {
        return legacy_password_str == "unset" ? "" : legacy_password_str
    };
   	func getLegacyPasswordStrPG() -> String {
        return legacy_password_str == "unset" ? "" : legacy_password_str
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
    
   	func getFieldType(field: String) -> String {
        switch field {
        case "_id":
            return "Int"
        case "member_id":
            return "String"
        case "member_password":
            return "String"
        case "member_name":
            return "String"
        case "membership_type":
            return "String"
        case "ranch_name":
            return "String"
        case "premise_id":
            return "String"
        case "website":
            return "String"
        case "member_since":
            return "NSDate"
        case "membership_begin":
            return "NSDate"
        case "subscription_end_date":
            return "NSDate"
        case "birth_date":
            return "NSDate"
        case "active_flag":
            return "Int"
        case "mobile_app_active_flag":
            return "Int"
        case "is_staff":
            return "Int"
        case "is_admin":
            return "Int"
        case "legacy_password":
            return "String"
        case "herd_code":
            return "String"
        default:
            return "String"
            break;
        }
        return "String"
   	}
    
    
    func getFieldString(field: String) -> String {
        
        switch field {
        case "_id":
            return self.getIdStr()
        case "member_id":
            return self.getMemberIdStr()
        case "member_password":
            return self.getMemberPasswordStr()
        case "member_name":
            return self.getMemberNameStr()
        case "membership_type":
            return self.getMembershipTypeStr()
        case "ranch_name":
            return self.getRanchNameStr()
        case "premise_id":
            return self.getPremiseIdStr()
        case "website":
            return self.getWebsiteStr()
        case "member_since":
            return self.getMemberSinceStr()
        case "membership_begin":
            return self.getMembershipBeginStr()
        case "subscription_end_date":
            return self.getSubscriptionEndDateStr()
        case "birth_date":
            return self.getBirthDateStr()
        case "active_flag":
            return self.getActiveFlagStr()
        case "mobile_app_active_flag":
            return self.getMobileAppActiveFlagStr()
        case "is_staff":
            return self.getIsStaffStr()
        case "is_admin":
            return self.getIsAdminStr()
        case "legacy_password":
            return self.getLegacyPasswordStr()
        case "herd_code":
            return self.getHerdCodeStr()
        default:
            return ""
            break;
        }
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
        qb.selectFrom("member")
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
                self.setMemberId((row["member_id"]?.asString()));
                self.setMemberPassword((row["member_password"]?.asString()));
                self.setMemberName((row["member_name"]?.asString()));
                self.setMembershipType((row["membership_type"]?.asString()));
                self.setRanchName((row["ranch_name"]?.asString()));
                self.setPremiseId((row["premise_id"]?.asString()));
                self.setWebsite((row["website"]?.asString()));
                self.setMemberSince((row["member_since"]?.asDate()));
                self.setMembershipBegin((row["membership_begin"]?.asDate()));
                self.setSubscriptionEndDate((row["subscription_end_date"]?.asDate()));
                self.setBirthDate((row["birth_date"]?.asDate()));
                self.setActiveFlag((row["active_flag"]?.asMyBool()));
                self.setMobileAppActiveFlag((row["mobile_app_active_flag"]?.asMyBool()));
                self.setIsStaff((row["is_staff"]?.asMyBool()));
                self.setIsAdmin((row["is_admin"]?.asMyBool()));
                self.setLegacyPassword((row["legacy_password"]?.asString()));
                self.setHerdCode((row["herd_code"]?.asString()));
                
                
                fields["_id"] = self.getIdStr()
                fields["member_id"] = self.getMemberIdStr()
                fields["member_password"] = self.getMemberPasswordStr()
                fields["member_name"] = self.getMemberNameStr()
                fields["membership_type"] = self.getMembershipTypeStr()
                fields["ranch_name"] = self.getRanchNameStr()
                fields["premise_id"] = self.getPremiseIdStr()
                fields["website"] = self.getWebsiteStr()
                fields["member_since"] = self.getMemberSinceStr()
                fields["membership_begin"] = self.getMembershipBeginStr()
                fields["subscription_end_date"] = self.getSubscriptionEndDateStr()
                fields["birth_date"] = self.getBirthDateStr()
                fields["active_flag"] = self.getActiveFlagStr()
                fields["mobile_app_active_flag"] = self.getMobileAppActiveFlagStr()
                fields["is_staff"] = self.getIsStaffStr()
                fields["is_admin"] = self.getIsAdminStr()
                fields["legacy_password"] = self.getLegacyPasswordStr()
                fields["herd_code"] = self.getHerdCodeStr()
                
                return fields
            }
        }
        return fields
    }
    
    func getFields() -> [String: String] {
        
        var fields = [String: String]()
        fields["_id"] = self.getIdStr()
        fields["member_id"] = self.getMemberIdStr()
        fields["member_password"] = self.getMemberPasswordStr()
        fields["member_name"] = self.getMemberNameStr()
        fields["membership_type"] = self.getMembershipTypeStr()
        fields["ranch_name"] = self.getRanchNameStr()
        fields["premise_id"] = self.getPremiseIdStr()
        fields["website"] = self.getWebsiteStr()
        fields["member_since"] = self.getMemberSinceStr()
        fields["membership_begin"] = self.getMembershipBeginStr()
        fields["subscription_end_date"] = self.getSubscriptionEndDateStr()
        fields["birth_date"] = self.getBirthDateStr()
        fields["active_flag"] = self.getActiveFlagStr()
        fields["mobile_app_active_flag"] = self.getMobileAppActiveFlagStr()
        fields["is_staff"] = self.getIsStaffStr()
        fields["is_admin"] = self.getIsAdminStr()
        fields["legacy_password"] = self.getLegacyPasswordStr()
        fields["herd_code"] = self.getHerdCodeStr()
        return fields
    }
    
    func getFieldsPG() -> [String: String] {
        
        var fields = [String: String]()
        
        
        fields["_id"] = self.getIdStrPG()
        fields["member_id"] = self.getMemberIdStrPG()
        fields["member_password"] = self.getMemberPasswordStrPG()
        fields["member_name"] = self.getMemberNameStrPG()
        fields["membership_type"] = self.getMembershipTypeStrPG()
        fields["ranch_name"] = self.getRanchNameStrPG()
        fields["premise_id"] = self.getPremiseIdStrPG()
        fields["website"] = self.getWebsiteStrPG()
        fields["member_since"] = self.getMemberSinceStrPG()
        fields["membership_begin"] = self.getMembershipBeginStrPG()
        fields["subscription_end_date"] = self.getSubscriptionEndDateStrPG()
        fields["birth_date"] = self.getBirthDateStrPG()
        fields["active_flag"] = self.getActiveFlagStrPG()
        fields["mobile_app_active_flag"] = self.getMobileAppActiveFlagStrPG()
        fields["is_staff"] = self.getIsStaffStrPG()
        fields["is_admin"] = self.getIsAdminStrPG()
        fields["legacy_password"] = self.getLegacyPasswordStrPG()
        fields["herd_code"] = self.getHerdCodeStrPG()
        return fields    }
    
    func addNew() {
        
        var statement = "INSERT INTO member ("
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
        
        var statement = "INSERT INTO member ("
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
    
    func update(forID: Int) {
        
        // get all field/values as string values
        var fields = self.getFields()
        
        var statement = "UPDATE member "
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
    
    func updatePG(forID: Int) {
        
        // get all field/values as string values
        var fields = self.getFieldsPG()
        
        var statement = "UPDATE member "
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
        let query = "DELETE FROM member WHERE member_id = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }
    
    
    func deletePG(forID: Int) {
        
        let statement = "DELETE FROM member WHERE member_id = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    class func getLastMemberID() -> String {
        var member_id: String = ""
        let query = "SELECT member_id from member ORDER BY _id DESC LIMIT 1 "
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
