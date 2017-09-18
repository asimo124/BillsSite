//
//  AnimalsBirth.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsBirthData {
    
   	var registration: String = "unset"
    var registration_str: String = "unset"
   	var birth_date: NSDate = NSDate.distantFuture() as NSDate
    var birth_date_str: String = "unset"
   	var weight: Int = -1
    var weight_str: String = "unset"
   	var weight_adj: Int = -1
    var weight_adj_str: String = "unset"
   	var weight_ratio: Double = -1.0
    var weight_ratio_str: String = "unset"
   	var season: Int = -1
    var season_str: String = "unset"
   	var service_type: String = "unset"
    var service_type_str: String = "unset"
   	var calving_ease: Int = -1
    var calving_ease_str: String = "unset"
   	var birth_type: Int = -1
    var birth_type_str: String = "unset"
   	var scur_score: String = "unset"
    var scur_score_str: String = "unset"
   	var color_score: String = "unset"
    var color_score_str: String = "unset"
   	var contemporary_group: Int = -1
    var contemporary_group_str: String = "unset"
   	var udder_suspension_score: Int = -1
    var udder_suspension_score_str: String = "unset"
   	var udder_teat_score: Int = -1
    var udder_teat_score_str: String = "unset"
   	var recipient_dam: String = "unset"
    var recipient_dam_str: String = "unset"
   	var flush_date: NSDate = NSDate.distantFuture() as NSDate
    var flush_date_str: String = "unset"
   	var transfer_date: NSDate = NSDate.distantFuture() as NSDate
    var transfer_date_str: String = "unset"
    
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
    
   	func setWeight(weight: Int?) {
        self.weight = weight ?? 0
        let weight2 = weight ?? 0
        self.weight_str = String(weight2)
        self.weight_str = (self.weight_str == "0") ? "" : self.weight_str
    }
    func getWeight() -> Int {
        return self.weight
    }
    func getWeightType() -> String {
        return "Int"
    };
   	func getWeightStr() -> String {
        return weight_str == "unset" ? "" : weight_str
    };
   	func getWeightStrPG() -> String {
        return weight_str == "unset" ? "" : weight_str
    };
    
   	func setWeightAdj(weight_adj: Int?) {
        self.weight_adj = weight_adj ?? 0
        let weight_adj2 = weight_adj ?? 0
        self.weight_adj_str = String(weight_adj2)
        self.weight_adj_str = (self.weight_adj_str == "0") ? "" : self.weight_adj_str
    }
    func getWeightAdj() -> Int {
        return self.weight_adj
    }
    func getWeightAdjType() -> String {
        return "Int"
    };
   	func getWeightAdjStr() -> String {
        return weight_adj_str == "unset" ? "" : weight_adj_str
    };
   	func getWeightAdjStrPG() -> String {
        return weight_adj_str == "unset" ? "" : weight_adj_str
    };
    
   	func setWeightRatio(weight_ratio: Double?) {
        self.weight_ratio = weight_ratio ?? 0.0
        self.weight_ratio_str = String(self.weight_ratio)
    }
    func getWeightRatio() -> Double {
        return self.weight_ratio
    }
    func getWeightRatioType() -> String {
        return "Double"
    };
   	func getWeightRatioStr() -> String {
        return weight_ratio_str == "unset" ? "" : weight_ratio_str
    };
   	func getWeightRatioStrPG() -> String {
        return weight_ratio_str == "unset" ? "" : weight_ratio_str
    };
    
   	func setSeason(season: Int?) {
        self.season = season ?? 0
        let season2 = season ?? 0
        self.season_str = String(season2)
        self.season_str = (self.season_str == "0") ? "" : self.season_str
    }
    func getSeason() -> Int {
        return self.season
    }
    func getSeasonType() -> String {
        return "Int"
    };
   	func getSeasonStr() -> String {
        return season_str == "unset" ? "" : season_str
    };
   	func getSeasonStrPG() -> String {
        return season_str == "unset" ? "" : season_str
    };
    
   	func setServiceType(service_type: String?) {
        self.service_type = service_type ?? ""
        self.service_type_str = String(self.service_type)
    }
    func getServiceType() -> String {
        return self.service_type
    }
    func getServiceTypeType() -> String {
        return "String"
    };
   	func getServiceTypeStr() -> String {
        return service_type_str == "unset" ? "" : service_type_str
    };
   	func getServiceTypeStrPG() -> String {
        return service_type_str == "unset" ? "" : service_type_str
    };
    
   	func setCalvingEase(calving_ease: Int?) {
        self.calving_ease = calving_ease ?? 0
        let calving_ease2 = calving_ease ?? 0
        self.calving_ease_str = String(calving_ease2)
        self.calving_ease_str = (self.calving_ease_str == "0") ? "" : self.calving_ease_str
    }
    func getCalvingEase() -> Int {
        return self.calving_ease
    }
    func getCalvingEaseType() -> String {
        return "Int"
    };
   	func getCalvingEaseStr() -> String {
        return calving_ease_str == "unset" ? "" : calving_ease_str
    };
   	func getCalvingEaseStrPG() -> String {
        return calving_ease_str == "unset" ? "" : calving_ease_str
    };
    
   	func setBirthType(birth_type: Int?) {
        self.birth_type = birth_type ?? 0
        let birth_type2 = birth_type ?? 0
        self.birth_type_str = String(birth_type2)
        self.birth_type_str = (self.birth_type_str == "0") ? "" : self.birth_type_str
    }
    func getBirthType() -> Int {
        return self.birth_type
    }
    func getBirthTypeType() -> String {
        return "Int"
    };
   	func getBirthTypeStr() -> String {
        return birth_type_str == "unset" ? "" : birth_type_str
    };
   	func getBirthTypeStrPG() -> String {
        return birth_type_str == "unset" ? "" : birth_type_str
    };
    
   	func setScurScore(scur_score: String?) {
        self.scur_score = scur_score ?? ""
        self.scur_score_str = String(self.scur_score)
    }
    func getScurScore() -> String {
        return self.scur_score
    }
    func getScurScoreType() -> String {
        return "String"
    };
   	func getScurScoreStr() -> String {
        return scur_score_str == "unset" ? "" : scur_score_str
    };
   	func getScurScoreStrPG() -> String {
        return scur_score_str == "unset" ? "" : scur_score_str
    };
    
   	func setColorScore(color_score: String?) {
        self.color_score = color_score ?? ""
        self.color_score_str = String(self.color_score)
    }
    func getColorScore() -> String {
        return self.color_score
    }
    func getColorScoreType() -> String {
        return "String"
    };
   	func getColorScoreStr() -> String {
        return color_score_str == "unset" ? "" : color_score_str
    };
   	func getColorScoreStrPG() -> String {
        return color_score_str == "unset" ? "" : color_score_str
    };
    
   	func setContemporaryGroup(contemporary_group: Int?) {
        self.contemporary_group = contemporary_group ?? 0
        let contemporary_group2 = contemporary_group ?? 0
        self.contemporary_group_str = String(contemporary_group2)
        self.contemporary_group_str = (self.contemporary_group_str == "0") ? "" : self.contemporary_group_str
    }
    func getContemporaryGroup() -> Int {
        return self.contemporary_group
    }
    func getContemporaryGroupType() -> String {
        return "Int"
    };
   	func getContemporaryGroupStr() -> String {
        return contemporary_group_str == "unset" ? "" : contemporary_group_str
    };
   	func getContemporaryGroupStrPG() -> String {
        return contemporary_group_str == "unset" ? "" : contemporary_group_str
    };
    
   	func setUdderSuspensionScore(udder_suspension_score: Int?) {
        self.udder_suspension_score = udder_suspension_score ?? 0
        let udder_suspension_score2 = udder_suspension_score ?? 0
        self.udder_suspension_score_str = String(udder_suspension_score2)
        self.udder_suspension_score_str = (self.udder_suspension_score_str == "0") ? "" : self.udder_suspension_score_str
    }
    func getUdderSuspensionScore() -> Int {
        return self.udder_suspension_score
    }
    func getUdderSuspensionScoreType() -> String {
        return "Int"
    };
   	func getUdderSuspensionScoreStr() -> String {
        return udder_suspension_score_str == "unset" ? "" : udder_suspension_score_str
    };
   	func getUdderSuspensionScoreStrPG() -> String {
        return udder_suspension_score_str == "unset" ? "" : udder_suspension_score_str
    };
    
   	func setUdderTeatScore(udder_teat_score: Int?) {
        self.udder_teat_score = udder_teat_score ?? 0
        let udder_teat_score2 = udder_teat_score ?? 0
        self.udder_teat_score_str = String(udder_teat_score2)
        self.udder_teat_score_str = (self.udder_teat_score_str == "0") ? "" : self.udder_teat_score_str
    }
    func getUdderTeatScore() -> Int {
        return self.udder_teat_score
    }
    func getUdderTeatScoreType() -> String {
        return "Int"
    };
   	func getUdderTeatScoreStr() -> String {
        return udder_teat_score_str == "unset" ? "" : udder_teat_score_str
    };
   	func getUdderTeatScoreStrPG() -> String {
        return udder_teat_score_str == "unset" ? "" : udder_teat_score_str
    };
    
   	func setRecipientDam(recipient_dam: String?) {
        self.recipient_dam = recipient_dam ?? ""
        self.recipient_dam_str = String(self.recipient_dam)
    }
    func getRecipientDam() -> String {
        return self.recipient_dam
    }
    func getRecipientDamType() -> String {
        return "String"
    };
   	func getRecipientDamStr() -> String {
        return recipient_dam_str == "unset" ? "" : recipient_dam_str
    };
   	func getRecipientDamStrPG() -> String {
        return recipient_dam_str == "unset" ? "" : recipient_dam_str
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
    
   	func setTransferDate(transfer_date: NSDate?) {
        self.transfer_date = transfer_date ?? NSDate.distantPast() as NSDate
        self.transfer_date_str = Utils.dateToString(self.transfer_date)
    }
    func getTransferDate() -> NSDate {
        return self.transfer_date
    }
    func getTransferDateType() -> String {
        return "NSDate"
    };
   	func getTransferDateStr() -> String {
        return transfer_date_str == "unset" || transfer_date_str == "0000-12-30 00:00:00 +0000" ? "" : transfer_date_str
    };
   	func getTransferDateStrPG() -> String {
        return transfer_date_str == "unset" || transfer_date_str == "0000-12-30 00:00:00 +0000" ? "" : transfer_date_str
    };
    
   	func getFieldType(field: String) -> String {
        switch field {
        case "registration":
            return "String"
        case "birth_date":
            return "NSDate"
        case "weight":
            return "Int"
        case "weight_adj":
            return "Int"
        case "weight_ratio":
            return "Double"
        case "season":
            return "Int"
        case "service_type":
            return "String"
        case "calving_ease":
            return "Int"
        case "birth_type":
            return "Int"
        case "scur_score":
            return "String"
        case "color_score":
            return "String"
        case "contemporary_group":
            return "Int"
        case "udder_suspension_score":
            return "Int"
        case "udder_teat_score":
            return "Int"
        case "recipient_dam":
            return "String"
        case "flush_date":
            return "NSDate"
        case "transfer_date":
            return "NSDate"
        default:
            return "String"
            break;
        }
        return "String"
   	}
    
   	func getFieldString(field: String) -> String {
        switch field {
        case "registration":
            return self.getRegistrationStr()
        case "birth_date":
            return self.getBirthDateStr()
        case "weight":
            return self.getWeightStr()
        case "weight_adj":
            return self.getWeightAdjStr()
        case "weight_ratio":
            return self.getWeightRatioStr()
        case "season":
            return self.getSeasonStr()
        case "service_type":
            return self.getServiceTypeStr()
        case "calving_ease":
            return self.getCalvingEaseStr()
        case "birth_type":
            return self.getBirthTypeStr()
        case "scur_score":
            return self.getScurScoreStr()
        case "color_score":
            return self.getColorScoreStr()
        case "contemporary_group":
            return self.getContemporaryGroupStr()
        case "udder_suspension_score":
            return self.getUdderSuspensionScoreStr()
        case "udder_teat_score":
            return self.getUdderTeatScoreStr()
        case "recipient_dam":
            return self.getRecipientDamStr()
        case "flush_date":
            return self.getFlushDateStr()
        case "transfer_date":
            return self.getTransferDateStr()
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
    func loadByID(registration: String) -> [String: String] {
        let qb = QueryBuilder()
        qb.selectFrom("animal_birth")
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
                
                self.setRegistration((row["registration"]?.asString()));
                self.setBirthDate((row["birth_date"]?.asDate()));
                self.setWeight((row["weight"]?.asInt()));
                self.setWeightAdj((row["weight_adj"]?.asInt()));
                self.setWeightRatio((row["weight_ratio"]?.asDouble()));
                self.setSeason((row["season"]?.asInt()));
                self.setServiceType((row["service_type"]?.asString()));
                self.setCalvingEase((row["calving_ease"]?.asInt()));
                self.setBirthType((row["birth_type"]?.asInt()));
                self.setScurScore((row["scur_score"]?.asString()));
                self.setColorScore((row["color_score"]?.asString()));
                self.setContemporaryGroup((row["contemporary_group"]?.asInt()));
                self.setUdderSuspensionScore((row["udder_suspension_score"]?.asInt()));
                self.setUdderTeatScore((row["udder_teat_score"]?.asInt()));
                self.setRecipientDam((row["recipient_dam"]?.asString()));
                self.setFlushDate((row["flush_date"]?.asDate()));
                self.setTransferDate((row["transfer_date"]?.asDate()));
                
                
                fields["registration"] = self.getRegistrationStr()
                fields["birth_date"] = self.getBirthDateStr()
                fields["weight"] = self.getWeightStr()
                fields["weight_adj"] = self.getWeightAdjStr()
                fields["weight_ratio"] = self.getWeightRatioStr()
                fields["season"] = self.getSeasonStr()
                fields["service_type"] = self.getServiceTypeStr()
                fields["calving_ease"] = self.getCalvingEaseStr()
                fields["birth_type"] = self.getBirthTypeStr()
                fields["scur_score"] = self.getScurScoreStr()
                fields["color_score"] = self.getColorScoreStr()
                fields["contemporary_group"] = self.getContemporaryGroupStr()
                fields["udder_suspension_score"] = self.getUdderSuspensionScoreStr()
                fields["udder_teat_score"] = self.getUdderTeatScoreStr()
                fields["recipient_dam"] = self.getRecipientDamStr()
                fields["flush_date"] = self.getFlushDateStr()
                fields["transfer_date"] = self.getTransferDateStr()
                
                return fields
            }
        }
        return fields
    }
    
    func getFields() -> [String: String] {
        
        var fields = [String: String]()
        fields["registration"] = self.getRegistrationStr()
        fields["birth_date"] = self.getBirthDateStr()
        fields["weight"] = self.getWeightStr()
        fields["weight_adj"] = self.getWeightAdjStr()
        fields["weight_ratio"] = self.getWeightRatioStr()
        fields["season"] = self.getSeasonStr()
        fields["service_type"] = self.getServiceTypeStr()
        fields["calving_ease"] = self.getCalvingEaseStr()
        fields["birth_type"] = self.getBirthTypeStr()
        fields["scur_score"] = self.getScurScoreStr()
        fields["color_score"] = self.getColorScoreStr()
        fields["contemporary_group"] = self.getContemporaryGroupStr()
        fields["udder_suspension_score"] = self.getUdderSuspensionScoreStr()
        fields["udder_teat_score"] = self.getUdderTeatScoreStr()
        fields["recipient_dam"] = self.getRecipientDamStr()
        fields["flush_date"] = self.getFlushDateStr()
        fields["transfer_date"] = self.getTransferDateStr()
        return fields
    }
    
    func getFieldsPG() -> [String: String] {
        
        var fields = [String: String]()
        
        
        fields["registration"] = self.getRegistrationStrPG()
        fields["birth_date"] = self.getBirthDateStrPG()
        fields["weight"] = self.getWeightStrPG()
        fields["weight_adj"] = self.getWeightAdjStrPG()
        fields["weight_ratio"] = self.getWeightRatioStrPG()
        fields["season"] = self.getSeasonStrPG()
        fields["service_type"] = self.getServiceTypeStrPG()
        fields["calving_ease"] = self.getCalvingEaseStrPG()
        fields["birth_type"] = self.getBirthTypeStrPG()
        fields["scur_score"] = self.getScurScoreStrPG()
        fields["color_score"] = self.getColorScoreStrPG()
        fields["contemporary_group"] = self.getContemporaryGroupStrPG()
        fields["udder_suspension_score"] = self.getUdderSuspensionScoreStrPG()
        fields["udder_teat_score"] = self.getUdderTeatScoreStrPG()
        fields["recipient_dam"] = self.getRecipientDamStrPG()
        fields["flush_date"] = self.getFlushDateStrPG()
        fields["transfer_date"] = self.getTransferDateStrPG()
        return fields    }
    
    func addNew() {
        
        var statement = "INSERT INTO animal_birth ("
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
        
        var statement = "INSERT INTO animal_birth ("
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
            
            var statement = "INSERT INTO animal_birth ("
            
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
        return ret_str == "unset" ? "" : ret_str
    }
    
    func update(forID: String) {
        
        // get all field/values as string values
        var fields = self.getFields()
        
        var statement = "UPDATE animal_birth "
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
        statement += "WHERE registration = " + String(forID)
        
        let dbn = Database()
        dbn.query(statement)
    }
    
    func updatePG(forID: String) {
        
        // get all field/values as string values
        var fields = self.getFieldsPG()
        
        var statement = "UPDATE animal_birth "
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
        statement += "WHERE registration = " + String(forID)
        
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    func delete(forID: Int) {
        let query = "DELETE FROM animal_birth WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }
    
    
    func deletePG(forID: String) {
        
        let statement = "DELETE FROM animal_birth WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    class func getLastregistration() -> String {
        var registration: String = ""
        let query = "SELECT registration from animal_birth ORDER BY _id DESC LIMIT 1 "
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
