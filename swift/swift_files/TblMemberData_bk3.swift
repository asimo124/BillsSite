//
//  TblMemberData.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblMemberData_Bk3 {
    
    func loadByID(id: String) {
        let qb = QueryBuilder()
        qb.selectFrom("member")
            .Where("_id = ?")
        
        var fieldsArr: [AnyObject] = []
        fieldsArr.append(id)
        
        let (resultset, error) = SD.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SD.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]
                let get_id                      = (row["_id"]?.asInt())
                let get_member_id               = (row["member_id"]?.asString())
                let get_member_password         = (row["member_password"]?.asString())
                let get_member_name             = (row["member_name"]?.asString())
                let get_membership_type         = (row["membership_type"]?.asString())
                let get_ranch_name              = (row["ranch_name"]?.asString())
                let get_premise_id              = (row["premise_id"]?.asString())
                let get_website                 = (row["website"]?.asString())
                let get_member_since            = (row["member_since"]?.asDate())
                let get_membership_begin        = (row["membership_begin"]?.asDate())
                let get_subscription_end_date   = (row["subscription_end_date"]?.asDate())
                let get_birth_date              = (row["birth_date"]?.asDate())
                let get_active_flag             = (row["active_flag"]?.asInt())
                let get_mobile_app_active_flag  = (row["mobile_app_active_flag"]?.asInt())
                let get_is_staff                = (row["is_staff"]?.asInt())
                let get_is_admin                = (row["is_admin"]?.asInt())
                let get_legacy_password         = (row["legacy_password"]?.asString())
                let get_herd_code               = (row["herd_code"]?.asString())
                
                print("id: ", get_id!)
                print("member_id: ", get_member_id!)
                print("member_password", get_member_password!)
                print("member_name", get_member_name!)
                print("membership_type: ", get_membership_type!)
                print("ranch_name: ", get_ranch_name!)
                print("premise_id: ", get_premise_id!)
                print("website: ", get_website!)
                print("member_since: ", get_member_since!)
                print("membership_begin: ", get_membership_begin!)
                print("subscription_end_date: ", get_subscription_end_date!)
                print("birth_date: ", get_birth_date!)
                print("active_flag: ", get_active_flag!)
                print("mobile_app_active_flag: ", get_mobile_app_active_flag!)
                print("is_staff: ", get_is_staff!)
                print("is_admin: ", get_is_admin!)
                print("legacy_password: ", get_legacy_password!)
                print("herd_code: ", get_herd_code!)
            }
        }
    }
    
    class func hasMemberID(member_id: Int) -> Bool {
        
        let qb = QueryBuilder()
        qb.selectFrom("member")
            .Where("_id = ?")
        
        var fieldsArr: [AnyObject] = []
        fieldsArr.append(member_id)
        
        var hasRecords = false
        let (resultset, error) = SD.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SD.printDie(error!)
        } else {
            hasRecords = (resultset.count > 0) ? true : false
        }
        return hasRecords
    }
    
    class func checkForAnyMember() -> Int? {
        
        let qb = QueryBuilder()
        qb.selectFrom("member")
            .Where("_id > 0")
        
        var member_id: Int? = nil
        let (resultset, error) = SD.executeQuery(qb.getQuery())
        if (error != nil) {
            SD.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]
                member_id = (row["_id"]?.asInt())
            }
        }
        return member_id
    }
    
    class func getLastMemberID() -> String {
        
        var member_id: String = ""
        let query = "SELECT member_id from Member ORDER BY _id DESC LIMIT 1 "
        let (resultset, err) = SD.executeQuery(query)
        if (err == nil) {
            if resultset.count > 0 {
                let row = resultset[0]
                if let member_id2 = row["member_id"]?.asString() {
                    member_id = member_id2
                }
            }
        }
        return member_id
    }
}
