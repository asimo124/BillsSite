

//
//  AnimalsComments.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsCommentsData {
    
    var _id: Int = -1
    var _id_str: String = "unset"
    var comment_id: Int = -1
    var comment_id_str: String = "unset"
    var registration: String = "unset"
    var registration_str: String = "unset"
    var comment: String = "unset"
    var comment_str: String = "unset"
    var comment_date: NSDate = NSDate.distantFuture() as NSDate
    var comment_date_str: String = "unset"
    var is_deleted: Int = -1
    var is_deleted_str: String = "unset"
    var notify_user: Int = -1
    var notify_user_str: String = "unset"
    
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
    
    func setCommentId(comment_id: Int?) {
        self.comment_id = comment_id ?? 0
        let comment_id2 = comment_id ?? 0
        self.comment_id_str = String(comment_id2)
        self.comment_id_str = (self.comment_id_str == "0") ? "" : self.comment_id_str
    }
    func getCommentId() -> Int {
        return self.comment_id
    }
    func getCommentIdType() -> String {
        return "Int"
    };
    func getCommentIdStr() -> String {
        return comment_id_str
    };
    func getCommentIdStrPG() -> String {
        return comment_id_str
    };
    
    func setRegistration(registration: String?) {
        self.registration = registration ?? ""
        self.registration_str = String(self.registration)
    }
    func getRegistration() -> String {
        return self.registration
    }
    func getRegistrationType() -> String {
        return "String"
    };
    func getRegistrationStr() -> String {
        return registration_str == "unset" ? "" : registration_str
    };
    func getRegistrationStrPG() -> String {
        return registration_str == "unset" ? "" : registration_str
    };
    
    func setComment(comment: String?) {
        self.comment = comment ?? ""
        self.comment_str = String(self.comment)
    }
    func getComment() -> String {
        return self.comment
    }
    func getCommentType() -> String {
        return "String"
    };
    func getCommentStr() -> String {
        return comment_str == "unset" ? "" : comment_str
    };
    func getCommentStrPG() -> String {
        return comment_str == "unset" ? "" : comment_str
    };
    
    func setCommentDate(comment_date: NSDate?) {
        self.comment_date = comment_date ?? NSDate.distantPast() as NSDate
        self.comment_date_str = Utils.dateToString(self.comment_date)
    }
    func getCommentDate() -> NSDate {
        return self.comment_date
    }
    func getCommentDateType() -> String {
        return "NSDate"
    };
    func getCommentDateStr() -> String {
        return comment_date_str == "unset" || comment_date_str == "0000-12-30 00:00:00 +0000" ? "" : comment_date_str
    };
    func getCommentDateStrPG() -> String {
        return comment_date_str == "unset" || comment_date_str == "0000-12-30 00:00:00 +0000" ? "" : comment_date_str
    };
    
    func setIsDeleted(is_deleted: Int?) {
        self.is_deleted = is_deleted ?? 0
        self.is_deleted_str = ((self.is_deleted) == 1) ? "t" : "f"
    }
    func getIsDeleted() -> Int {
        return self.is_deleted
    }
    func getIsDeletedType() -> String {
        return "Int"
    };
    func getIsDeletedStr() -> String {
        return String(is_deleted)
    };
    func getIsDeletedStrPG() -> String {
        return is_deleted_str
    };
    
    func setNotifyUser(notify_user: Int?) {
        self.notify_user = notify_user ?? 0
        self.notify_user_str = ((self.notify_user) == 1) ? "t" : "f"
    }
    func getNotifyUser() -> Int {
        return self.notify_user
    }
    func getNotifyUserType() -> String {
        return "Int"
    };
    func getNotifyUserStr() -> String {
        return String(notify_user)
    };
    func getNotifyUserStrPG() -> String {
        return notify_user_str
    };
    
    func getFieldType(field: String) -> String {
        switch field {
        case "_id":
            return "Int"
        case "comment_id":
            return "Int"
        case "registration":
            return "String"
        case "comment":
            return "String"
        case "comment_date":
            return "NSDate"
        case "is_deleted":
            return "Int"
        case "notify_user":
            return "Int"
        default:
            return "String"
            
        }
    }
    
    func getFieldString(field: String) -> String {
        switch field {
        case "_id":
            return self.getIdStr()
        case "comment_id":
            return self.getCommentIdStr()
        case "registration":
            return self.getRegistrationStr()
        case "comment":
            return self.getCommentStr()
        case "comment_date":
            return self.getCommentDateStr()
        case "is_deleted":
            return self.getIsDeletedStr()
        case "notify_user":
            return self.getNotifyUserStr()
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
    func loadByID(registration: String) -> [String: String] {
        let qb = QueryBuilder()
        qb.selectFrom("animal_comments")
            .Where("registration = ?")
        
        var fieldsArr: [AnyObject] = []
        fieldsArr.append(registration)
        
        var fields = [String: String]()
        let (resultset, error) = SD.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SD.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]
                
                self.setId((row["_id"]?.asInt()));
                self.setCommentId((row["comment_id"]?.asInt()));
                self.setRegistration((row["registration"]?.asString()));
                self.setComment((row["comment"]?.asString()));
                self.setCommentDate((row["comment_date"]?.asDate()));
                self.setIsDeleted((row["is_deleted"]?.asMyBool()));
                self.setNotifyUser((row["notify_user"]?.asMyBool()));
                
                var fields = [String: String]()
                fields["_id"] = self.getIdStr()
                fields["comment_id"] = self.getCommentIdStr()
                fields["registration"] = self.getRegistrationStr()
                fields["comment"] = self.getCommentStr()
                fields["comment_date"] = self.getCommentDateStr()
                fields["is_deleted"] = self.getIsDeletedStr()
                fields["notify_user"] = self.getNotifyUserStr()
                
                return fields
            }
        }
        return fields
    }
    
    func getFields() -> [String: String] {
        
        var fields = [String: String]()
        fields["_id"] = self.getIdStr()
        fields["comment_id"] = self.getCommentIdStr()
        fields["registration"] = self.getRegistrationStr()
        fields["comment"] = self.getCommentStr()
        fields["comment_date"] = self.getCommentDateStr()
        fields["is_deleted"] = self.getIsDeletedStr()
        fields["notify_user"] = self.getNotifyUserStr()
        return fields
    }
    
    func getFieldsPG() -> [String: String] {
        
        var fields = [String: String]()
        
        
        fields["_id"] = self.getIdStrPG()
        fields["comment_id"] = self.getCommentIdStrPG()
        fields["registration"] = self.getRegistrationStrPG()
        fields["comment"] = self.getCommentStrPG()
        fields["comment_date"] = self.getCommentDateStrPG()
        fields["is_deleted"] = self.getIsDeletedStrPG()
        fields["notify_user"] = self.getNotifyUserStrPG()
        return fields    }
    
    func addNew() {
        
        var statement = "INSERT INTO animal_comments ("
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
        
        let dbn = Database()
        dbn.query(statement)
    }
    
    func addNewPG() {
        
        var statement = "INSERT INTO animal_comments ("
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
            
            var statement = "INSERT INTO animal_comments ("
            
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
        
        var statement = "UPDATE animal_comments "
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
        statement += "WHERE registration = " + String(forID)
        
        let dbn = Database()
        dbn.query(statement)
    }
    
    func updatePG(forID: String) {
        
        // get all field/values as string values
        var fields = self.getFieldsPG()
        
        var statement = "UPDATE animal_comments "
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
        statement += "WHERE registration = " + String(forID)
        
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    func delete(forID: Int) {
        let query = "DELETE FROM animal_comments WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }
    
    
    func deletePG(forID: String) {
        
        let statement = "DELETE FROM animal_comments WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    class func getLastregistration() -> String {
        let registration: String = ""
        let query = "SELECT registration from animal_comments ORDER BY _id DESC LIMIT 1 "
        let (resultset, err) = SD.executeQuery(query)
        if (err == nil) {
            if resultset.count > 0 {
                let row = resultset[0]
                let registration2 = row["registration"]?.asString() ?? ""
                
                return registration2
                
            }
        }
        return registration
    }
}
