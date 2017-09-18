//
//  TblMember.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblMemberData {
    
    var member_id: String = "unset"
    var member_id_str: String = "unset"
    var member_name: String = "unset"
    var member_name_str: String = "unset"
    var member_dba: String = "unset"
    var member_dba_str: String = "unset"
    var member_type: String = "unset"
    var member_type_str: String = "unset"
    var create_user: String = "unset"
    var create_user_str: String = "unset"
    var create_stamp: NSDate = NSDate.distantFuture() as NSDate
    var create_stamp_str: String = "unset"
    var update_user: String = "unset"
    var update_user_str: String = "unset"
    var update_stamp: NSDate = NSDate.distantFuture() as NSDate
    var update_stamp_str: String = "unset"
    var active_flag: Int = -1
    var active_flag_str: String = "unset"
    var website: String = "unset"
    var website_str: String = "unset"
    var membership_begin_date: NSDate = NSDate.distantFuture() as NSDate
    var membership_begin_date_str: String = "unset"
    var membership_end_date: NSDate = NSDate.distantFuture() as NSDate
    var membership_end_date_str: String = "unset"
    var pub_subscription_start_date: NSDate = NSDate.distantFuture() as NSDate
    var pub_subscription_start_date_str: String = "unset"
    var pub_subscription_end_date: NSDate = NSDate.distantFuture() as NSDate
    var pub_subscription_end_date_str: String = "unset"
    var parent_member_id: Int = -1
    var parent_member_id_str: String = "unset"
    var newspaper_name: String = "unset"
    var newspaper_name_str: String = "unset"
    var newspaper_email: String = "unset"
    var newspaper_email_str: String = "unset"
    var newspaper_phone: String = "unset"
    var newspaper_phone_str: String = "unset"
    var account_locked: Int = -1
    var account_locked_str: String = "unset"
    var locking_user: String = "unset"
    var locking_user_str: String = "unset"
    var legacy_association: String = "unset"
    var legacy_association_str: String = "unset"
    var legacy_association_id: Int = -1
    var legacy_association_id_str: String = "unset"
    var general_correspondance_address: Int = -1
    var general_correspondance_address_str: String = "unset"
    var registry_correspondance_address: Int = -1
    var registry_correspondance_address_str: String = "unset"
    var accounting_correspondance_address: Int = -1
    var accounting_correspondance_address_str: String = "unset"
    var hold_brand: String = "unset"
    var hold_brand_str: String = "unset"
    var hold_brand_location: String = "unset"
    var hold_brand_location_str: String = "unset"
    var phn_location: String = "unset"
    var phn_location_str: String = "unset"
    var date_last_activity: NSDate = NSDate.distantFuture() as NSDate
    var date_last_activity_str: String = "unset"
    var date_last_change: NSDate = NSDate.distantFuture() as NSDate
    var date_last_change_str: String = "unset"
    var date_last_registration: NSDate = NSDate.distantFuture() as NSDate
    var date_last_registration_str: String = "unset"
    var date_last_transfer: NSDate = NSDate.distantFuture() as NSDate
    var date_last_transfer_str: String = "unset"
    var date_last_purchase: NSDate = NSDate.distantFuture() as NSDate
    var date_last_purchase_str: String = "unset"
    var date_last_performance: NSDate = NSDate.distantFuture() as NSDate
    var date_last_performance_str: String = "unset"
    var mas90_customer_no: String = "unset"
    var mas90_customer_no_str: String = "unset"
    var m_opt_out: Int = -1
    var m_opt_out_str: String = "unset"
    var m_opt_out_date: NSDate = NSDate.distantFuture() as NSDate
    var m_opt_out_date_str: String = "unset"
    var m_opted_out_by: String = "unset"
    var m_opted_out_by_str: String = "unset"
    var c_opt_in: Int = -1
    var c_opt_in_str: String = "unset"
    var c_opt_in_date: NSDate = NSDate.distantFuture() as NSDate
    var c_opt_in_date_str: String = "unset"
    var c_opted_in_by: String = "unset"
    var c_opted_in_by_str: String = "unset"
    var e_opt_out: Int = -1
    var e_opt_out_str: String = "unset"
    var e_opt_out_date: NSDate = NSDate.distantFuture() as NSDate
    var e_opt_out_date_str: String = "unset"
    var e_opted_out_by: String = "unset"
    var e_opted_out_by_str: String = "unset"
    var cash_only: Int = -1
    var cash_only_str: String = "unset"
    var junior_birthdate: NSDate = NSDate.distantFuture() as NSDate
    var junior_birthdate_str: String = "unset"
    var herd_code: String = "unset"
    var herd_code_str: String = "unset"
    var herd_code_location: String = "unset"
    var herd_code_location_str: String = "unset"
    var verification_code: String = "unset"
    var verification_code_str: String = "unset"
    var premise_id: String = "unset"
    var premise_id_str: String = "unset"
    
    func setMemberId(member_id: String?) {
        self.member_id = member_id ?? ""
        self.member_id_str = String(self.member_id)
    }
    func getMemberId() -> String {
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
    
    func setMemberType(member_type: String?) {
        self.member_type = member_type ?? ""
        self.member_type_str = String(self.member_type)
    }
    func getMemberType() -> String {
        return self.member_type
    }
    func getMemberTypeType() -> String {
        return "String"
    };
    func getMemberTypeStr() -> String {
        return member_type_str == "unset" ? "" : member_type_str
    };
    func getMemberTypeStrPG() -> String {
        return member_type_str == "unset" ? "" : member_type_str
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
    
    func setMembershipBeginDate(membership_begin_date: NSDate?) {
        self.membership_begin_date = membership_begin_date ?? NSDate.distantPast() as NSDate
        self.membership_begin_date_str = Utils.dateToString(self.membership_begin_date)
    }
    func getMembershipBeginDate() -> NSDate {
        return self.membership_begin_date
    }
    func getMembershipBeginDateType() -> String {
        return "NSDate"
    };
    func getMembershipBeginDateStr() -> String {
        return membership_begin_date_str == "unset" || membership_begin_date_str == "0000-12-30 00:00:00 +0000" ? "" : membership_begin_date_str
    };
    func getMembershipBeginDateStrPG() -> String {
        return membership_begin_date_str == "unset" || membership_begin_date_str == "0000-12-30 00:00:00 +0000" ? "" : membership_begin_date_str
    };
    
    func setMembershipEndDate(membership_end_date: NSDate?) {
        self.membership_end_date = membership_end_date ?? NSDate.distantPast() as NSDate
        self.membership_end_date_str = Utils.dateToString(self.membership_end_date)
    }
    func getMembershipEndDate() -> NSDate {
        return self.membership_end_date
    }
    func getMembershipEndDateType() -> String {
        return "NSDate"
    };
    func getMembershipEndDateStr() -> String {
        return membership_end_date_str == "unset" || membership_end_date_str == "0000-12-30 00:00:00 +0000" ? "" : membership_end_date_str
    };
    func getMembershipEndDateStrPG() -> String {
        return membership_end_date_str == "unset" || membership_end_date_str == "0000-12-30 00:00:00 +0000" ? "" : membership_end_date_str
    };
    
    func setPubSubscriptionStartDate(pub_subscription_start_date: NSDate?) {
        self.pub_subscription_start_date = pub_subscription_start_date ?? NSDate.distantPast() as NSDate
        self.pub_subscription_start_date_str = Utils.dateToString(self.pub_subscription_start_date)
    }
    func getPubSubscriptionStartDate() -> NSDate {
        return self.pub_subscription_start_date
    }
    func getPubSubscriptionStartDateType() -> String {
        return "NSDate"
    };
    func getPubSubscriptionStartDateStr() -> String {
        return pub_subscription_start_date_str == "unset" || pub_subscription_start_date_str == "0000-12-30 00:00:00 +0000" ? "" : pub_subscription_start_date_str
    };
    func getPubSubscriptionStartDateStrPG() -> String {
        return pub_subscription_start_date_str == "unset" || pub_subscription_start_date_str == "0000-12-30 00:00:00 +0000" ? "" : pub_subscription_start_date_str
    };
    
    func setPubSubscriptionEndDate(pub_subscription_end_date: NSDate?) {
        self.pub_subscription_end_date = pub_subscription_end_date ?? NSDate.distantPast() as NSDate
        self.pub_subscription_end_date_str = Utils.dateToString(self.pub_subscription_end_date)
    }
    func getPubSubscriptionEndDate() -> NSDate {
        return self.pub_subscription_end_date
    }
    func getPubSubscriptionEndDateType() -> String {
        return "NSDate"
    };
    func getPubSubscriptionEndDateStr() -> String {
        return pub_subscription_end_date_str == "unset" || pub_subscription_end_date_str == "0000-12-30 00:00:00 +0000" ? "" : pub_subscription_end_date_str
    };
    func getPubSubscriptionEndDateStrPG() -> String {
        return pub_subscription_end_date_str == "unset" || pub_subscription_end_date_str == "0000-12-30 00:00:00 +0000" ? "" : pub_subscription_end_date_str
    };
    
    func setParentMemberId(parent_member_id: Int?) {
        self.parent_member_id = parent_member_id ?? 0
        let parent_member_id2 = parent_member_id ?? 0
        self.parent_member_id_str = String(parent_member_id2)
        self.parent_member_id_str = (self.parent_member_id_str == "0") ? "" : self.parent_member_id_str
    }
    func getParentMemberId() -> Int {
        return self.parent_member_id
    }
    func getParentMemberIdType() -> String {
        return "Int"
    };
    func getParentMemberIdStr() -> String {
        return parent_member_id_str
    };
    func getParentMemberIdStrPG() -> String {
        return parent_member_id_str
    };
    
    func setNewspaperName(newspaper_name: String?) {
        self.newspaper_name = newspaper_name ?? ""
        self.newspaper_name_str = String(self.newspaper_name)
    }
    func getNewspaperName() -> String {
        return self.newspaper_name
    }
    func getNewspaperNameType() -> String {
        return "String"
    };
    func getNewspaperNameStr() -> String {
        return newspaper_name_str == "unset" ? "" : newspaper_name_str
    };
    func getNewspaperNameStrPG() -> String {
        return newspaper_name_str == "unset" ? "" : newspaper_name_str
    };
    
    func setNewspaperEmail(newspaper_email: String?) {
        self.newspaper_email = newspaper_email ?? ""
        self.newspaper_email_str = String(self.newspaper_email)
    }
    func getNewspaperEmail() -> String {
        return self.newspaper_email
    }
    func getNewspaperEmailType() -> String {
        return "String"
    };
    func getNewspaperEmailStr() -> String {
        return newspaper_email_str == "unset" ? "" : newspaper_email_str
    };
    func getNewspaperEmailStrPG() -> String {
        return newspaper_email_str == "unset" ? "" : newspaper_email_str
    };
    
    func setNewspaperPhone(newspaper_phone: String?) {
        self.newspaper_phone = newspaper_phone ?? ""
        self.newspaper_phone_str = String(self.newspaper_phone)
    }
    func getNewspaperPhone() -> String {
        return self.newspaper_phone
    }
    func getNewspaperPhoneType() -> String {
        return "String"
    };
    func getNewspaperPhoneStr() -> String {
        return newspaper_phone_str == "unset" ? "" : newspaper_phone_str
    };
    func getNewspaperPhoneStrPG() -> String {
        return newspaper_phone_str == "unset" ? "" : newspaper_phone_str
    };
    
    func setAccountLocked(account_locked: Int?) {
        self.account_locked = account_locked ?? 0
        self.account_locked_str = ((self.account_locked) == 1) ? "t" : "f"
    }
    func getAccountLocked() -> Int {
        return self.account_locked
    }
    func getAccountLockedType() -> String {
        return "Int"
    };
    func getAccountLockedStr() -> String {
        return String(account_locked)
    };
    func getAccountLockedStrPG() -> String {
        return account_locked_str
    };
    
    func setLockingUser(locking_user: String?) {
        self.locking_user = locking_user ?? ""
        self.locking_user_str = String(self.locking_user)
    }
    func getLockingUser() -> String {
        return self.locking_user
    }
    func getLockingUserType() -> String {
        return "String"
    };
    func getLockingUserStr() -> String {
        return locking_user_str == "unset" ? "" : locking_user_str
    };
    func getLockingUserStrPG() -> String {
        return locking_user_str == "unset" ? "" : locking_user_str
    };
    
    func setLegacyAssociation(legacy_association: String?) {
        self.legacy_association = legacy_association ?? ""
        self.legacy_association_str = String(self.legacy_association)
    }
    func getLegacyAssociation() -> String {
        return self.legacy_association
    }
    func getLegacyAssociationType() -> String {
        return "String"
    };
    func getLegacyAssociationStr() -> String {
        return legacy_association_str == "unset" ? "" : legacy_association_str
    };
    func getLegacyAssociationStrPG() -> String {
        return legacy_association_str == "unset" ? "" : legacy_association_str
    };
    
    func setLegacyAssociationId(legacy_association_id: Int?) {
        self.legacy_association_id = legacy_association_id ?? 0
        let legacy_association_id2 = legacy_association_id ?? 0
        self.legacy_association_id_str = String(legacy_association_id2)
        self.legacy_association_id_str = (self.legacy_association_id_str == "0") ? "" : self.legacy_association_id_str
    }
    func getLegacyAssociationId() -> Int {
        return self.legacy_association_id
    }
    func getLegacyAssociationIdType() -> String {
        return "Int"
    };
    func getLegacyAssociationIdStr() -> String {
        return legacy_association_id_str
    };
    func getLegacyAssociationIdStrPG() -> String {
        return legacy_association_id_str
    };
    
    func setGeneralCorrespondanceAddress(general_correspondance_address: Int?) {
        self.general_correspondance_address = general_correspondance_address ?? 0
        let general_correspondance_address2 = general_correspondance_address ?? 0
        self.general_correspondance_address_str = String(general_correspondance_address2)
        self.general_correspondance_address_str = (self.general_correspondance_address_str == "0") ? "" : self.general_correspondance_address_str
    }
    func getGeneralCorrespondanceAddress() -> Int {
        return self.general_correspondance_address
    }
    func getGeneralCorrespondanceAddressType() -> String {
        return "Int"
    };
    func getGeneralCorrespondanceAddressStr() -> String {
        return general_correspondance_address_str
    };
    func getGeneralCorrespondanceAddressStrPG() -> String {
        return general_correspondance_address_str
    };
    
    func setRegistryCorrespondanceAddress(registry_correspondance_address: Int?) {
        self.registry_correspondance_address = registry_correspondance_address ?? 0
        let registry_correspondance_address2 = registry_correspondance_address ?? 0
        self.registry_correspondance_address_str = String(registry_correspondance_address2)
        self.registry_correspondance_address_str = (self.registry_correspondance_address_str == "0") ? "" : self.registry_correspondance_address_str
    }
    func getRegistryCorrespondanceAddress() -> Int {
        return self.registry_correspondance_address
    }
    func getRegistryCorrespondanceAddressType() -> String {
        return "Int"
    };
    func getRegistryCorrespondanceAddressStr() -> String {
        return registry_correspondance_address_str
    };
    func getRegistryCorrespondanceAddressStrPG() -> String {
        return registry_correspondance_address_str
    };
    
    func setAccountingCorrespondanceAddress(accounting_correspondance_address: Int?) {
        self.accounting_correspondance_address = accounting_correspondance_address ?? 0
        let accounting_correspondance_address2 = accounting_correspondance_address ?? 0
        self.accounting_correspondance_address_str = String(accounting_correspondance_address2)
        self.accounting_correspondance_address_str = (self.accounting_correspondance_address_str == "0") ? "" : self.accounting_correspondance_address_str
    }
    func getAccountingCorrespondanceAddress() -> Int {
        return self.accounting_correspondance_address
    }
    func getAccountingCorrespondanceAddressType() -> String {
        return "Int"
    };
    func getAccountingCorrespondanceAddressStr() -> String {
        return accounting_correspondance_address_str
    };
    func getAccountingCorrespondanceAddressStrPG() -> String {
        return accounting_correspondance_address_str
    };
    
    func setHoldBrand(hold_brand: String?) {
        self.hold_brand = hold_brand ?? ""
        self.hold_brand_str = String(self.hold_brand)
    }
    func getHoldBrand() -> String {
        return self.hold_brand
    }
    func getHoldBrandType() -> String {
        return "String"
    };
    func getHoldBrandStr() -> String {
        return hold_brand_str == "unset" ? "" : hold_brand_str
    };
    func getHoldBrandStrPG() -> String {
        return hold_brand_str == "unset" ? "" : hold_brand_str
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
    
    func setPhnLocation(phn_location: String?) {
        self.phn_location = phn_location ?? ""
        self.phn_location_str = String(self.phn_location)
    }
    func getPhnLocation() -> String {
        return self.phn_location
    }
    func getPhnLocationType() -> String {
        return "String"
    };
    func getPhnLocationStr() -> String {
        return phn_location_str == "unset" ? "" : phn_location_str
    };
    func getPhnLocationStrPG() -> String {
        return phn_location_str == "unset" ? "" : phn_location_str
    };
    
    func setDateLastActivity(date_last_activity: NSDate?) {
        self.date_last_activity = date_last_activity ?? NSDate.distantPast() as NSDate
        self.date_last_activity_str = Utils.dateToString(self.date_last_activity)
    }
    func getDateLastActivity() -> NSDate {
        return self.date_last_activity
    }
    func getDateLastActivityType() -> String {
        return "NSDate"
    };
    func getDateLastActivityStr() -> String {
        return date_last_activity_str == "unset" || date_last_activity_str == "0000-12-30 00:00:00 +0000" ? "" : date_last_activity_str
    };
    func getDateLastActivityStrPG() -> String {
        return date_last_activity_str == "unset" || date_last_activity_str == "0000-12-30 00:00:00 +0000" ? "" : date_last_activity_str
    };
    
    func setDateLastChange(date_last_change: NSDate?) {
        self.date_last_change = date_last_change ?? NSDate.distantPast() as NSDate
        self.date_last_change_str = Utils.dateToString(self.date_last_change)
    }
    func getDateLastChange() -> NSDate {
        return self.date_last_change
    }
    func getDateLastChangeType() -> String {
        return "NSDate"
    };
    func getDateLastChangeStr() -> String {
        return date_last_change_str == "unset" || date_last_change_str == "0000-12-30 00:00:00 +0000" ? "" : date_last_change_str
    };
    func getDateLastChangeStrPG() -> String {
        return date_last_change_str == "unset" || date_last_change_str == "0000-12-30 00:00:00 +0000" ? "" : date_last_change_str
    };
    
    func setDateLastRegistration(date_last_registration: NSDate?) {
        self.date_last_registration = date_last_registration ?? NSDate.distantPast() as NSDate
        self.date_last_registration_str = Utils.dateToString(self.date_last_registration)
    }
    func getDateLastRegistration() -> NSDate {
        return self.date_last_registration
    }
    func getDateLastRegistrationType() -> String {
        return "NSDate"
    };
    func getDateLastRegistrationStr() -> String {
        return date_last_registration_str == "unset" || date_last_registration_str == "0000-12-30 00:00:00 +0000" ? "" : date_last_registration_str
    };
    func getDateLastRegistrationStrPG() -> String {
        return date_last_registration_str == "unset" || date_last_registration_str == "0000-12-30 00:00:00 +0000" ? "" : date_last_registration_str
    };
    
    func setDateLastTransfer(date_last_transfer: NSDate?) {
        self.date_last_transfer = date_last_transfer ?? NSDate.distantPast() as NSDate
        self.date_last_transfer_str = Utils.dateToString(self.date_last_transfer)
    }
    func getDateLastTransfer() -> NSDate {
        return self.date_last_transfer
    }
    func getDateLastTransferType() -> String {
        return "NSDate"
    };
    func getDateLastTransferStr() -> String {
        return date_last_transfer_str == "unset" || date_last_transfer_str == "0000-12-30 00:00:00 +0000" ? "" : date_last_transfer_str
    };
    func getDateLastTransferStrPG() -> String {
        return date_last_transfer_str == "unset" || date_last_transfer_str == "0000-12-30 00:00:00 +0000" ? "" : date_last_transfer_str
    };
    
    func setDateLastPurchase(date_last_purchase: NSDate?) {
        self.date_last_purchase = date_last_purchase ?? NSDate.distantPast() as NSDate
        self.date_last_purchase_str = Utils.dateToString(self.date_last_purchase)
    }
    func getDateLastPurchase() -> NSDate {
        return self.date_last_purchase
    }
    func getDateLastPurchaseType() -> String {
        return "NSDate"
    };
    func getDateLastPurchaseStr() -> String {
        return date_last_purchase_str == "unset" || date_last_purchase_str == "0000-12-30 00:00:00 +0000" ? "" : date_last_purchase_str
    };
    func getDateLastPurchaseStrPG() -> String {
        return date_last_purchase_str == "unset" || date_last_purchase_str == "0000-12-30 00:00:00 +0000" ? "" : date_last_purchase_str
    };
    
    func setDateLastPerformance(date_last_performance: NSDate?) {
        self.date_last_performance = date_last_performance ?? NSDate.distantPast() as NSDate
        self.date_last_performance_str = Utils.dateToString(self.date_last_performance)
    }
    func getDateLastPerformance() -> NSDate {
        return self.date_last_performance
    }
    func getDateLastPerformanceType() -> String {
        return "NSDate"
    };
    func getDateLastPerformanceStr() -> String {
        return date_last_performance_str == "unset" || date_last_performance_str == "0000-12-30 00:00:00 +0000" ? "" : date_last_performance_str
    };
    func getDateLastPerformanceStrPG() -> String {
        return date_last_performance_str == "unset" || date_last_performance_str == "0000-12-30 00:00:00 +0000" ? "" : date_last_performance_str
    };
    
    func setMas90CustomerNo(mas90_customer_no: String?) {
        self.mas90_customer_no = mas90_customer_no ?? ""
        self.mas90_customer_no_str = String(self.mas90_customer_no)
    }
    func getMas90CustomerNo() -> String {
        return self.mas90_customer_no
    }
    func getMas90CustomerNoType() -> String {
        return "String"
    };
    func getMas90CustomerNoStr() -> String {
        return mas90_customer_no_str == "unset" ? "" : mas90_customer_no_str
    };
    func getMas90CustomerNoStrPG() -> String {
        return mas90_customer_no_str == "unset" ? "" : mas90_customer_no_str
    };
    
    func setMOptOut(m_opt_out: Int?) {
        self.m_opt_out = m_opt_out ?? 0
        self.m_opt_out_str = ((self.m_opt_out) == 1) ? "t" : "f"
    }
    func getMOptOut() -> Int {
        return self.m_opt_out
    }
    func getMOptOutType() -> String {
        return "Int"
    };
    func getMOptOutStr() -> String {
        return String(m_opt_out)
    };
    func getMOptOutStrPG() -> String {
        return m_opt_out_str
    };
    
    func setMOptOutDate(m_opt_out_date: NSDate?) {
        self.m_opt_out_date = m_opt_out_date ?? NSDate.distantPast() as NSDate
        self.m_opt_out_date_str = Utils.dateToString(self.m_opt_out_date)
    }
    func getMOptOutDate() -> NSDate {
        return self.m_opt_out_date
    }
    func getMOptOutDateType() -> String {
        return "NSDate"
    };
    func getMOptOutDateStr() -> String {
        return m_opt_out_date_str == "unset" || m_opt_out_date_str == "0000-12-30 00:00:00 +0000" ? "" : m_opt_out_date_str
    };
    func getMOptOutDateStrPG() -> String {
        return m_opt_out_date_str == "unset" || m_opt_out_date_str == "0000-12-30 00:00:00 +0000" ? "" : m_opt_out_date_str
    };
    
    func setMOptedOutBy(m_opted_out_by: String?) {
        self.m_opted_out_by = m_opted_out_by ?? ""
        self.m_opted_out_by_str = String(self.m_opted_out_by)
    }
    func getMOptedOutBy() -> String {
        return self.m_opted_out_by
    }
    func getMOptedOutByType() -> String {
        return "String"
    };
    func getMOptedOutByStr() -> String {
        return m_opted_out_by_str == "unset" ? "" : m_opted_out_by_str
    };
    func getMOptedOutByStrPG() -> String {
        return m_opted_out_by_str == "unset" ? "" : m_opted_out_by_str
    };
    
    func setCOptIn(c_opt_in: Int?) {
        self.c_opt_in = c_opt_in ?? 0
        self.c_opt_in_str = ((self.c_opt_in) == 1) ? "t" : "f"
    }
    func getCOptIn() -> Int {
        return self.c_opt_in
    }
    func getCOptInType() -> String {
        return "Int"
    };
    func getCOptInStr() -> String {
        return String(c_opt_in)
    };
    func getCOptInStrPG() -> String {
        return c_opt_in_str
    };
    
    func setCOptInDate(c_opt_in_date: NSDate?) {
        self.c_opt_in_date = c_opt_in_date ?? NSDate.distantPast() as NSDate
        self.c_opt_in_date_str = Utils.dateToString(self.c_opt_in_date)
    }
    func getCOptInDate() -> NSDate {
        return self.c_opt_in_date
    }
    func getCOptInDateType() -> String {
        return "NSDate"
    };
    func getCOptInDateStr() -> String {
        return c_opt_in_date_str == "unset" || c_opt_in_date_str == "0000-12-30 00:00:00 +0000" ? "" : c_opt_in_date_str
    };
    func getCOptInDateStrPG() -> String {
        return c_opt_in_date_str == "unset" || c_opt_in_date_str == "0000-12-30 00:00:00 +0000" ? "" : c_opt_in_date_str
    };
    
    func setCOptedInBy(c_opted_in_by: String?) {
        self.c_opted_in_by = c_opted_in_by ?? ""
        self.c_opted_in_by_str = String(self.c_opted_in_by)
    }
    func getCOptedInBy() -> String {
        return self.c_opted_in_by
    }
    func getCOptedInByType() -> String {
        return "String"
    };
    func getCOptedInByStr() -> String {
        return c_opted_in_by_str == "unset" ? "" : c_opted_in_by_str
    };
    func getCOptedInByStrPG() -> String {
        return c_opted_in_by_str == "unset" ? "" : c_opted_in_by_str
    };
    
    func setEOptOut(e_opt_out: Int?) {
        self.e_opt_out = e_opt_out ?? 0
        self.e_opt_out_str = ((self.e_opt_out) == 1) ? "t" : "f"
    }
    func getEOptOut() -> Int {
        return self.e_opt_out
    }
    func getEOptOutType() -> String {
        return "Int"
    };
    func getEOptOutStr() -> String {
        return String(e_opt_out)
    };
    func getEOptOutStrPG() -> String {
        return e_opt_out_str
    };
    
    func setEOptOutDate(e_opt_out_date: NSDate?) {
        self.e_opt_out_date = e_opt_out_date ?? NSDate.distantPast() as NSDate
        self.e_opt_out_date_str = Utils.dateToString(self.e_opt_out_date)
    }
    func getEOptOutDate() -> NSDate {
        return self.e_opt_out_date
    }
    func getEOptOutDateType() -> String {
        return "NSDate"
    };
    func getEOptOutDateStr() -> String {
        return e_opt_out_date_str == "unset" || e_opt_out_date_str == "0000-12-30 00:00:00 +0000" ? "" : e_opt_out_date_str
    };
    func getEOptOutDateStrPG() -> String {
        return e_opt_out_date_str == "unset" || e_opt_out_date_str == "0000-12-30 00:00:00 +0000" ? "" : e_opt_out_date_str
    };
    
    func setEOptedOutBy(e_opted_out_by: String?) {
        self.e_opted_out_by = e_opted_out_by ?? ""
        self.e_opted_out_by_str = String(self.e_opted_out_by)
    }
    func getEOptedOutBy() -> String {
        return self.e_opted_out_by
    }
    func getEOptedOutByType() -> String {
        return "String"
    };
    func getEOptedOutByStr() -> String {
        return e_opted_out_by_str == "unset" ? "" : e_opted_out_by_str
    };
    func getEOptedOutByStrPG() -> String {
        return e_opted_out_by_str == "unset" ? "" : e_opted_out_by_str
    };
    
    func setCashOnly(cash_only: Int?) {
        self.cash_only = cash_only ?? 0
        self.cash_only_str = ((self.cash_only) == 1) ? "t" : "f"
    }
    func getCashOnly() -> Int {
        return self.cash_only
    }
    func getCashOnlyType() -> String {
        return "Int"
    };
    func getCashOnlyStr() -> String {
        return String(cash_only)
    };
    func getCashOnlyStrPG() -> String {
        return cash_only_str
    };
    
    func setJuniorBirthdate(junior_birthdate: NSDate?) {
        self.junior_birthdate = junior_birthdate ?? NSDate.distantPast() as NSDate
        self.junior_birthdate_str = Utils.dateToString(self.junior_birthdate)
    }
    func getJuniorBirthdate() -> NSDate {
        return self.junior_birthdate
    }
    func getJuniorBirthdateType() -> String {
        return "NSDate"
    };
    func getJuniorBirthdateStr() -> String {
        return junior_birthdate_str == "unset" || junior_birthdate_str == "0000-12-30 00:00:00 +0000" ? "" : junior_birthdate_str
    };
    func getJuniorBirthdateStrPG() -> String {
        return junior_birthdate_str == "unset" || junior_birthdate_str == "0000-12-30 00:00:00 +0000" ? "" : junior_birthdate_str
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
    
    func setHerdCodeLocation(herd_code_location: String?) {
        self.herd_code_location = herd_code_location ?? ""
        self.herd_code_location_str = String(self.herd_code_location)
    }
    func getHerdCodeLocation() -> String {
        return self.herd_code_location
    }
    func getHerdCodeLocationType() -> String {
        return "String"
    };
    func getHerdCodeLocationStr() -> String {
        return herd_code_location_str == "unset" ? "" : herd_code_location_str
    };
    func getHerdCodeLocationStrPG() -> String {
        return herd_code_location_str == "unset" ? "" : herd_code_location_str
    };
    
    func setVerificationCode(verification_code: String?) {
        self.verification_code = verification_code ?? ""
        self.verification_code_str = String(self.verification_code)
    }
    func getVerificationCode() -> String {
        return self.verification_code
    }
    func getVerificationCodeType() -> String {
        return "String"
    };
    func getVerificationCodeStr() -> String {
        return verification_code_str == "unset" ? "" : verification_code_str
    };
    func getVerificationCodeStrPG() -> String {
        return verification_code_str == "unset" ? "" : verification_code_str
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
    
    func getFieldType(field: String) -> String {
        switch field {
        case "member_id":
            return "String"
        case "member_name":
            return "String"
        case "member_dba":
            return "String"
        case "member_type":
            return "String"
        case "create_user":
            return "String"
        case "create_stamp":
            return "NSDate"
        case "update_user":
            return "String"
        case "update_stamp":
            return "NSDate"
        case "active_flag":
            return "Int"
        case "website":
            return "String"
        case "membership_begin_date":
            return "NSDate"
        case "membership_end_date":
            return "NSDate"
        case "pub_subscription_start_date":
            return "NSDate"
        case "pub_subscription_end_date":
            return "NSDate"
        case "parent_member_id":
            return "Int"
        case "newspaper_name":
            return "String"
        case "newspaper_email":
            return "String"
        case "newspaper_phone":
            return "String"
        case "account_locked":
            return "Int"
        case "locking_user":
            return "String"
        case "legacy_association":
            return "String"
        case "legacy_association_id":
            return "Int"
        case "general_correspondance_address":
            return "Int"
        case "registry_correspondance_address":
            return "Int"
        case "accounting_correspondance_address":
            return "Int"
        case "hold_brand":
            return "String"
        case "hold_brand_location":
            return "String"
        case "phn_location":
            return "String"
        case "date_last_activity":
            return "NSDate"
        case "date_last_change":
            return "NSDate"
        case "date_last_registration":
            return "NSDate"
        case "date_last_transfer":
            return "NSDate"
        case "date_last_purchase":
            return "NSDate"
        case "date_last_performance":
            return "NSDate"
        case "mas90_customer_no":
            return "String"
        case "m_opt_out":
            return "Int"
        case "m_opt_out_date":
            return "NSDate"
        case "m_opted_out_by":
            return "String"
        case "c_opt_in":
            return "Int"
        case "c_opt_in_date":
            return "NSDate"
        case "c_opted_in_by":
            return "String"
        case "e_opt_out":
            return "Int"
        case "e_opt_out_date":
            return "NSDate"
        case "e_opted_out_by":
            return "String"
        case "cash_only":
            return "Int"
        case "junior_birthdate":
            return "NSDate"
        case "herd_code":
            return "String"
        case "herd_code_location":
            return "String"
        case "verification_code":
            return "String"
        case "premise_id":
            return "String"
        default:
            return "String"
            
        }
    }
    
    
    
    func getFieldString(field: String) -> String {
        switch field {
        case "member_id":
            return self.getMemberIdStr()
        case "member_name":
            return self.getMemberNameStr()
        case "member_dba":
            return self.getMemberDbaStr()
        case "member_type":
            return self.getMemberTypeStr()
        case "create_user":
            return self.getCreateUserStr()
        case "create_stamp":
            return self.getCreateStampStr()
        case "update_user":
            return self.getUpdateUserStr()
        case "update_stamp":
            return self.getUpdateStampStr()
        case "active_flag":
            return self.getActiveFlagStr()
        case "website":
            return self.getWebsiteStr()
        case "membership_begin_date":
            return self.getMembershipBeginDateStr()
        case "membership_end_date":
            return self.getMembershipEndDateStr()
        case "pub_subscription_start_date":
            return self.getPubSubscriptionStartDateStr()
        case "pub_subscription_end_date":
            return self.getPubSubscriptionEndDateStr()
        case "parent_member_id":
            return self.getParentMemberIdStr()
        case "newspaper_name":
            return self.getNewspaperNameStr()
        case "newspaper_email":
            return self.getNewspaperEmailStr()
        case "newspaper_phone":
            return self.getNewspaperPhoneStr()
        case "account_locked":
            return self.getAccountLockedStr()
        case "locking_user":
            return self.getLockingUserStr()
        case "legacy_association":
            return self.getLegacyAssociationStr()
        case "legacy_association_id":
            return self.getLegacyAssociationIdStr()
        case "general_correspondance_address":
            return self.getGeneralCorrespondanceAddressStr()
        case "registry_correspondance_address":
            return self.getRegistryCorrespondanceAddressStr()
        case "accounting_correspondance_address":
            return self.getAccountingCorrespondanceAddressStr()
        case "hold_brand":
            return self.getHoldBrandStr()
        case "hold_brand_location":
            return self.getHoldBrandLocationStr()
        case "phn_location":
            return self.getPhnLocationStr()
        case "date_last_activity":
            return self.getDateLastActivityStr()
        case "date_last_change":
            return self.getDateLastChangeStr()
        case "date_last_registration":
            return self.getDateLastRegistrationStr()
        case "date_last_transfer":
            return self.getDateLastTransferStr()
        case "date_last_purchase":
            return self.getDateLastPurchaseStr()
        case "date_last_performance":
            return self.getDateLastPerformanceStr()
        case "mas90_customer_no":
            return self.getMas90CustomerNoStr()
        case "m_opt_out":
            return self.getMOptOutStr()
        case "m_opt_out_date":
            return self.getMOptOutDateStr()
        case "m_opted_out_by":
            return self.getMOptedOutByStr()
        case "c_opt_in":
            return self.getCOptInStr()
        case "c_opt_in_date":
            return self.getCOptInDateStr()
        case "c_opted_in_by":
            return self.getCOptedInByStr()
        case "e_opt_out":
            return self.getEOptOutStr()
        case "e_opt_out_date":
            return self.getEOptOutDateStr()
        case "e_opted_out_by":
            return self.getEOptedOutByStr()
        case "cash_only":
            return self.getCashOnlyStr()
        case "junior_birthdate":
            return self.getJuniorBirthdateStr()
        case "herd_code":
            return self.getHerdCodeStr()
        case "herd_code_location":
            return self.getHerdCodeLocationStr()
        case "verification_code":
            return self.getVerificationCodeStr()
        case "premise_id":
            return self.getPremiseIdStr()
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
        qb.selectFrom("tbl_member")
            .Where("member_id = ?")
        
        var fieldsArr: [AnyObject] = []
        fieldsArr.append(member_id)
        
        var fields = [String: String]()
        
        print("print query")
        SDOld.printQuery(qb.getQuery(), withArgs: fieldsArr)
        
        
        let (resultset, error) = SDOld.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            
            
            print("resultset.count:", resultset.count)
            if resultset.count > 0 {
                let row = resultset[0]
                
                self.setMemberId((row["member_id"]?.asString()));
                self.setMemberName((row["member_name"]?.asString()));
                self.setMemberDba((row["member_dba"]?.asString()));
                self.setMemberType((row["member_type"]?.asString()));
                self.setCreateUser((row["create_user"]?.asString()));
                self.setCreateStamp((row["create_stamp"]?.asDate()));
                self.setUpdateUser((row["update_user"]?.asString()));
                self.setUpdateStamp((row["update_stamp"]?.asDate()));
                self.setActiveFlag((row["active_flag"]?.asMyBool()));
                self.setWebsite((row["website"]?.asString()));
                self.setMembershipBeginDate((row["membership_begin_date"]?.asDate()));
                self.setMembershipEndDate((row["membership_end_date"]?.asDate()));
                self.setPubSubscriptionStartDate((row["pub_subscription_start_date"]?.asDate()));
                self.setPubSubscriptionEndDate((row["pub_subscription_end_date"]?.asDate()));
                self.setParentMemberId((row["parent_member_id"]?.asInt()));
                self.setNewspaperName((row["newspaper_name"]?.asString()));
                self.setNewspaperEmail((row["newspaper_email"]?.asString()));
                self.setNewspaperPhone((row["newspaper_phone"]?.asString()));
                self.setAccountLocked((row["account_locked"]?.asMyBool()));
                self.setLockingUser((row["locking_user"]?.asString()));
                self.setLegacyAssociation((row["legacy_association"]?.asString()));
                self.setLegacyAssociationId((row["legacy_association_id"]?.asInt()));
                self.setGeneralCorrespondanceAddress((row["general_correspondance_address"]?.asInt()));
                self.setRegistryCorrespondanceAddress((row["registry_correspondance_address"]?.asInt()));
                self.setAccountingCorrespondanceAddress((row["accounting_correspondance_address"]?.asInt()));
                self.setHoldBrand((row["hold_brand"]?.asString()));
                self.setHoldBrandLocation((row["hold_brand_location"]?.asString()));
                self.setPhnLocation((row["phn_location"]?.asString()));
                self.setDateLastActivity((row["date_last_activity"]?.asDate()));
                self.setDateLastChange((row["date_last_change"]?.asDate()));
                self.setDateLastRegistration((row["date_last_registration"]?.asDate()));
                self.setDateLastTransfer((row["date_last_transfer"]?.asDate()));
                self.setDateLastPurchase((row["date_last_purchase"]?.asDate()));
                self.setDateLastPerformance((row["date_last_performance"]?.asDate()));
                self.setMas90CustomerNo((row["mas90_customer_no"]?.asString()));
                self.setMOptOut((row["m_opt_out"]?.asMyBool()));
                self.setMOptOutDate((row["m_opt_out_date"]?.asDate()));
                self.setMOptedOutBy((row["m_opted_out_by"]?.asString()));
                self.setCOptIn((row["c_opt_in"]?.asMyBool()));
                self.setCOptInDate((row["c_opt_in_date"]?.asDate()));
                self.setCOptedInBy((row["c_opted_in_by"]?.asString()));
                self.setEOptOut((row["e_opt_out"]?.asMyBool()));
                self.setEOptOutDate((row["e_opt_out_date"]?.asDate()));
                self.setEOptedOutBy((row["e_opted_out_by"]?.asString()));
                self.setCashOnly((row["cash_only"]?.asMyBool()));
                self.setJuniorBirthdate((row["junior_birthdate"]?.asDate()));
                self.setHerdCode((row["herd_code"]?.asString()));
                self.setHerdCodeLocation((row["herd_code_location"]?.asString()));
                self.setVerificationCode((row["verification_code"]?.asString()));
                self.setPremiseId((row["premise_id"]?.asString()));
                
                var fields = [String: String]()
                fields["member_id"] = self.getMemberIdStr()
                fields["member_name"] = self.getMemberNameStr()
                fields["member_dba"] = self.getMemberDbaStr()
                fields["member_type"] = self.getMemberTypeStr()
                fields["create_user"] = self.getCreateUserStr()
                fields["create_stamp"] = self.getCreateStampStr()
                fields["update_user"] = self.getUpdateUserStr()
                fields["update_stamp"] = self.getUpdateStampStr()
                fields["active_flag"] = self.getActiveFlagStr()
                fields["website"] = self.getWebsiteStr()
                fields["membership_begin_date"] = self.getMembershipBeginDateStr()
                fields["membership_end_date"] = self.getMembershipEndDateStr()
                fields["pub_subscription_start_date"] = self.getPubSubscriptionStartDateStr()
                fields["pub_subscription_end_date"] = self.getPubSubscriptionEndDateStr()
                fields["parent_member_id"] = self.getParentMemberIdStr()
                fields["newspaper_name"] = self.getNewspaperNameStr()
                fields["newspaper_email"] = self.getNewspaperEmailStr()
                fields["newspaper_phone"] = self.getNewspaperPhoneStr()
                fields["account_locked"] = self.getAccountLockedStr()
                fields["locking_user"] = self.getLockingUserStr()
                fields["legacy_association"] = self.getLegacyAssociationStr()
                fields["legacy_association_id"] = self.getLegacyAssociationIdStr()
                fields["general_correspondance_address"] = self.getGeneralCorrespondanceAddressStr()
                fields["registry_correspondance_address"] = self.getRegistryCorrespondanceAddressStr()
                fields["accounting_correspondance_address"] = self.getAccountingCorrespondanceAddressStr()
                fields["hold_brand"] = self.getHoldBrandStr()
                fields["hold_brand_location"] = self.getHoldBrandLocationStr()
                fields["phn_location"] = self.getPhnLocationStr()
                fields["date_last_activity"] = self.getDateLastActivityStr()
                fields["date_last_change"] = self.getDateLastChangeStr()
                fields["date_last_registration"] = self.getDateLastRegistrationStr()
                fields["date_last_transfer"] = self.getDateLastTransferStr()
                fields["date_last_purchase"] = self.getDateLastPurchaseStr()
                fields["date_last_performance"] = self.getDateLastPerformanceStr()
                fields["mas90_customer_no"] = self.getMas90CustomerNoStr()
                fields["m_opt_out"] = self.getMOptOutStr()
                fields["m_opt_out_date"] = self.getMOptOutDateStr()
                fields["m_opted_out_by"] = self.getMOptedOutByStr()
                fields["c_opt_in"] = self.getCOptInStr()
                fields["c_opt_in_date"] = self.getCOptInDateStr()
                fields["c_opted_in_by"] = self.getCOptedInByStr()
                fields["e_opt_out"] = self.getEOptOutStr()
                fields["e_opt_out_date"] = self.getEOptOutDateStr()
                fields["e_opted_out_by"] = self.getEOptedOutByStr()
                fields["cash_only"] = self.getCashOnlyStr()
                fields["junior_birthdate"] = self.getJuniorBirthdateStr()
                fields["herd_code"] = self.getHerdCodeStr()
                fields["herd_code_location"] = self.getHerdCodeLocationStr()
                fields["verification_code"] = self.getVerificationCodeStr()
                fields["premise_id"] = self.getPremiseIdStr()
                
                return fields
            }
        }
        return fields
    }
    
    func getFields() -> [String: String] {
        
        var fields = [String: String]()
        fields["member_id"] = self.getMemberIdStr()
        fields["member_name"] = self.getMemberNameStr()
        fields["member_dba"] = self.getMemberDbaStr()
        fields["member_type"] = self.getMemberTypeStr()
        fields["create_user"] = self.getCreateUserStr()
        fields["create_stamp"] = self.getCreateStampStr()
        fields["update_user"] = self.getUpdateUserStr()
        fields["update_stamp"] = self.getUpdateStampStr()
        fields["active_flag"] = self.getActiveFlagStr()
        fields["website"] = self.getWebsiteStr()
        fields["membership_begin_date"] = self.getMembershipBeginDateStr()
        fields["membership_end_date"] = self.getMembershipEndDateStr()
        fields["pub_subscription_start_date"] = self.getPubSubscriptionStartDateStr()
        fields["pub_subscription_end_date"] = self.getPubSubscriptionEndDateStr()
        fields["parent_member_id"] = self.getParentMemberIdStr()
        fields["newspaper_name"] = self.getNewspaperNameStr()
        fields["newspaper_email"] = self.getNewspaperEmailStr()
        fields["newspaper_phone"] = self.getNewspaperPhoneStr()
        fields["account_locked"] = self.getAccountLockedStr()
        fields["locking_user"] = self.getLockingUserStr()
        fields["legacy_association"] = self.getLegacyAssociationStr()
        fields["legacy_association_id"] = self.getLegacyAssociationIdStr()
        fields["general_correspondance_address"] = self.getGeneralCorrespondanceAddressStr()
        fields["registry_correspondance_address"] = self.getRegistryCorrespondanceAddressStr()
        fields["accounting_correspondance_address"] = self.getAccountingCorrespondanceAddressStr()
        fields["hold_brand"] = self.getHoldBrandStr()
        fields["hold_brand_location"] = self.getHoldBrandLocationStr()
        fields["phn_location"] = self.getPhnLocationStr()
        fields["date_last_activity"] = self.getDateLastActivityStr()
        fields["date_last_change"] = self.getDateLastChangeStr()
        fields["date_last_registration"] = self.getDateLastRegistrationStr()
        fields["date_last_transfer"] = self.getDateLastTransferStr()
        fields["date_last_purchase"] = self.getDateLastPurchaseStr()
        fields["date_last_performance"] = self.getDateLastPerformanceStr()
        fields["mas90_customer_no"] = self.getMas90CustomerNoStr()
        fields["m_opt_out"] = self.getMOptOutStr()
        fields["m_opt_out_date"] = self.getMOptOutDateStr()
        fields["m_opted_out_by"] = self.getMOptedOutByStr()
        fields["c_opt_in"] = self.getCOptInStr()
        fields["c_opt_in_date"] = self.getCOptInDateStr()
        fields["c_opted_in_by"] = self.getCOptedInByStr()
        fields["e_opt_out"] = self.getEOptOutStr()
        fields["e_opt_out_date"] = self.getEOptOutDateStr()
        fields["e_opted_out_by"] = self.getEOptedOutByStr()
        fields["cash_only"] = self.getCashOnlyStr()
        fields["junior_birthdate"] = self.getJuniorBirthdateStr()
        fields["herd_code"] = self.getHerdCodeStr()
        fields["herd_code_location"] = self.getHerdCodeLocationStr()
        fields["verification_code"] = self.getVerificationCodeStr()
        fields["premise_id"] = self.getPremiseIdStr()
        return fields
    }
    
    func getFieldsPG() -> [String: String] {
        
        var fields = [String: String]()
        
        
        fields["member_id"] = self.getMemberIdStrPG()
        fields["member_name"] = self.getMemberNameStrPG()
        fields["member_dba"] = self.getMemberDbaStrPG()
        fields["member_type"] = self.getMemberTypeStrPG()
        fields["create_user"] = self.getCreateUserStrPG()
        fields["create_stamp"] = self.getCreateStampStrPG()
        fields["update_user"] = self.getUpdateUserStrPG()
        fields["update_stamp"] = self.getUpdateStampStrPG()
        fields["active_flag"] = self.getActiveFlagStrPG()
        fields["website"] = self.getWebsiteStrPG()
        fields["membership_begin_date"] = self.getMembershipBeginDateStrPG()
        fields["membership_end_date"] = self.getMembershipEndDateStrPG()
        fields["pub_subscription_start_date"] = self.getPubSubscriptionStartDateStrPG()
        fields["pub_subscription_end_date"] = self.getPubSubscriptionEndDateStrPG()
        fields["parent_member_id"] = self.getParentMemberIdStrPG()
        fields["newspaper_name"] = self.getNewspaperNameStrPG()
        fields["newspaper_email"] = self.getNewspaperEmailStrPG()
        fields["newspaper_phone"] = self.getNewspaperPhoneStrPG()
        fields["account_locked"] = self.getAccountLockedStrPG()
        fields["locking_user"] = self.getLockingUserStrPG()
        fields["legacy_association"] = self.getLegacyAssociationStrPG()
        fields["legacy_association_id"] = self.getLegacyAssociationIdStrPG()
        fields["general_correspondance_address"] = self.getGeneralCorrespondanceAddressStrPG()
        fields["registry_correspondance_address"] = self.getRegistryCorrespondanceAddressStrPG()
        fields["accounting_correspondance_address"] = self.getAccountingCorrespondanceAddressStrPG()
        fields["hold_brand"] = self.getHoldBrandStrPG()
        fields["hold_brand_location"] = self.getHoldBrandLocationStrPG()
        fields["phn_location"] = self.getPhnLocationStrPG()
        fields["date_last_activity"] = self.getDateLastActivityStrPG()
        fields["date_last_change"] = self.getDateLastChangeStrPG()
        fields["date_last_registration"] = self.getDateLastRegistrationStrPG()
        fields["date_last_transfer"] = self.getDateLastTransferStrPG()
        fields["date_last_purchase"] = self.getDateLastPurchaseStrPG()
        fields["date_last_performance"] = self.getDateLastPerformanceStrPG()
        fields["mas90_customer_no"] = self.getMas90CustomerNoStrPG()
        fields["m_opt_out"] = self.getMOptOutStrPG()
        fields["m_opt_out_date"] = self.getMOptOutDateStrPG()
        fields["m_opted_out_by"] = self.getMOptedOutByStrPG()
        fields["c_opt_in"] = self.getCOptInStrPG()
        fields["c_opt_in_date"] = self.getCOptInDateStrPG()
        fields["c_opted_in_by"] = self.getCOptedInByStrPG()
        fields["e_opt_out"] = self.getEOptOutStrPG()
        fields["e_opt_out_date"] = self.getEOptOutDateStrPG()
        fields["e_opted_out_by"] = self.getEOptedOutByStrPG()
        fields["cash_only"] = self.getCashOnlyStrPG()
        fields["junior_birthdate"] = self.getJuniorBirthdateStrPG()
        fields["herd_code"] = self.getHerdCodeStrPG()
        fields["herd_code_location"] = self.getHerdCodeLocationStrPG()
        fields["verification_code"] = self.getVerificationCodeStrPG()
        fields["premise_id"] = self.getPremiseIdStrPG()
        return fields    }
    
    func addNew() {
        
        var statement = "INSERT INTO tbl_member ("
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
        
        var statement = "INSERT INTO tbl_member ("
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
            
            var statement = "INSERT INTO tbl_member ("
            
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
        
        var statement = "UPDATE tbl_member "
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
        
        var statement = "UPDATE tbl_member "
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
        let query = "DELETE FROM tbl_member WHERE member_id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }
    
    
    func deletePG(forID: String) {
        
        let statement = "DELETE FROM tbl_member WHERE member_id = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    func printFields() {
        let obj = self
        let reflected = Mirror(reflecting: obj)
        for child in reflected.children {
            guard let key = child.label else { continue }
            let value = child.value
            print(key, ": ", value)
        }
    }
    
    class func getLastmemberId() -> String {
        let member_id: String = ""
        let query = "SELECT member_id from tbl_member ORDER BY _id DESC LIMIT 1 "
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
