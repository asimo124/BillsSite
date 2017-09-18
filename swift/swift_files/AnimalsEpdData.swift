//
//  AnimalsEpd.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsEpdData {
    
   	var _id: Int = -1
    var _id_str: String = "unset"
   	var registration: String = "unset"
    var registration_str: String = "unset"
   	var epd_year: Int = -1
    var epd_year_str: String = "unset"
   	var epd_season: String = "unset"
    var epd_season_str: String = "unset"
   	var bw_epd: Double = -1.0
    var bw_epd_str: String = "unset"
   	var bw_acc: Double = -1.0
    var bw_acc_str: String = "unset"
   	var ww_epd: Double = -1.0
    var ww_epd_str: String = "unset"
   	var ww_acc: Double = -1.0
    var ww_acc_str: String = "unset"
   	var yw_epd: Double = -1.0
    var yw_epd_str: String = "unset"
   	var yw_acc: Double = -1.0
    var yw_acc_str: String = "unset"
   	var milk_epd: Double = -1.0
    var milk_epd_str: String = "unset"
   	var milk_acc: Double = -1.0
    var milk_acc_str: String = "unset"
   	var sc_epd: Double = -1.0
    var sc_epd_str: String = "unset"
   	var sc_acc: Double = -1.0
    var sc_acc_str: String = "unset"
   	var rea_epd: Double = -1.0
    var rea_epd_str: String = "unset"
   	var rea_acc: Double = -1.0
    var rea_acc_str: String = "unset"
   	var fat_epd: Double = -1.0
    var fat_epd_str: String = "unset"
   	var fat_acc: Double = -1.0
    var fat_acc_str: String = "unset"
   	var imf_epd: Double = -1.0
    var imf_epd_str: String = "unset"
   	var imf_acc: Double = -1.0
    var imf_acc_str: String = "unset"
   	var ced_epd: Double = -1.0
    var ced_epd_str: String = "unset"
   	var ced_acc: Double = -1.0
    var ced_acc_str: String = "unset"
   	var cem_epd: Double = -1.0
    var cem_epd_str: String = "unset"
   	var cem_acc: Double = -1.0
    var cem_acc_str: String = "unset"
   	var tm_epd: Double = -1.0
    var tm_epd_str: String = "unset"
   	var tm_acc: Double = -1.0
    var tm_acc_str: String = "unset"
    
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
    
   	func setEpdYear(epd_year: Int?) {
        self.epd_year = epd_year ?? 0
        let epd_year2 = epd_year ?? 0
        self.epd_year_str = String(epd_year2)
        self.epd_year_str = (self.epd_year_str == "0") ? "" : self.epd_year_str
    }
    func getEpdYear() -> Int {
        return self.epd_year
    }
    func getEpdYearType() -> String {
        return "Int"
    };
   	func getEpdYearStr() -> String {
        return epd_year_str
    };
   	func getEpdYearStrPG() -> String {
        return epd_year_str
    };
    
   	func setEpdSeason(epd_season: String?) {
        self.epd_season = epd_season ?? ""
        self.epd_season_str = String(self.epd_season)
    }
    func getEpdSeason() -> String {
        return self.epd_season
    }
    func getEpdSeasonType() -> String {
        return "String"
    };
   	func getEpdSeasonStr() -> String {
        return epd_season_str == "unset" ? "" : epd_season_str
    };
   	func getEpdSeasonStrPG() -> String {
        return epd_season_str
    };
    
   	func setBwEpd(bw_epd: Double?) {
        self.bw_epd = bw_epd ?? 0.0
        self.bw_epd_str = String(self.bw_epd)
    }
    func getBwEpd() -> Double {
        return self.bw_epd
    }
    func getBwEpdType() -> String {
        return "Double"
    };
   	func getBwEpdStr() -> String {
        return bw_epd_str
    };
   	func getBwEpdStrPG() -> String {
        return bw_epd_str
    };
    
   	func setBwAcc(bw_acc: Double?) {
        self.bw_acc = bw_acc ?? 0.0
        self.bw_acc_str = String(self.bw_acc)
    }
    func getBwAcc() -> Double {
        return self.bw_acc
    }
    func getBwAccType() -> String {
        return "Double"
    };
   	func getBwAccStr() -> String {
        return bw_acc_str
    };
   	func getBwAccStrPG() -> String {
        return bw_acc_str
    };
    
   	func setWwEpd(ww_epd: Double?) {
        self.ww_epd = ww_epd ?? 0.0
        self.ww_epd_str = String(self.ww_epd)
    }
    func getWwEpd() -> Double {
        return self.ww_epd
    }
    func getWwEpdType() -> String {
        return "Double"
    };
   	func getWwEpdStr() -> String {
        return ww_epd_str
    };
   	func getWwEpdStrPG() -> String {
        return ww_epd_str
    };
    
   	func setWwAcc(ww_acc: Double?) {
        self.ww_acc = ww_acc ?? 0.0
        self.ww_acc_str = String(self.ww_acc)
    }
    func getWwAcc() -> Double {
        return self.ww_acc
    }
    func getWwAccType() -> String {
        return "Double"
    };
   	func getWwAccStr() -> String {
        return ww_acc_str
    };
   	func getWwAccStrPG() -> String {
        return ww_acc_str
    };
    
   	func setYwEpd(yw_epd: Double?) {
        self.yw_epd = yw_epd ?? 0.0
        self.yw_epd_str = String(self.yw_epd)
    }
    func getYwEpd() -> Double {
        return self.yw_epd
    }
    func getYwEpdType() -> String {
        return "Double"
    };
   	func getYwEpdStr() -> String {
        return yw_epd_str
    };
   	func getYwEpdStrPG() -> String {
        return yw_epd_str
    };
    
   	func setYwAcc(yw_acc: Double?) {
        self.yw_acc = yw_acc ?? 0.0
        self.yw_acc_str = String(self.yw_acc)
    }
    func getYwAcc() -> Double {
        return self.yw_acc
    }
    func getYwAccType() -> String {
        return "Double"
    };
   	func getYwAccStr() -> String {
        return yw_acc_str
    };
   	func getYwAccStrPG() -> String {
        return yw_acc_str
    };
    
   	func setMilkEpd(milk_epd: Double?) {
        self.milk_epd = milk_epd ?? 0.0
        self.milk_epd_str = String(self.milk_epd)
    }
    func getMilkEpd() -> Double {
        return self.milk_epd
    }
    func getMilkEpdType() -> String {
        return "Double"
    };
   	func getMilkEpdStr() -> String {
        return milk_epd_str
    };
   	func getMilkEpdStrPG() -> String {
        return milk_epd_str
    };
    
   	func setMilkAcc(milk_acc: Double?) {
        self.milk_acc = milk_acc ?? 0.0
        self.milk_acc_str = String(self.milk_acc)
    }
    func getMilkAcc() -> Double {
        return self.milk_acc
    }
    func getMilkAccType() -> String {
        return "Double"
    };
   	func getMilkAccStr() -> String {
        return milk_acc_str
    };
   	func getMilkAccStrPG() -> String {
        return milk_acc_str
    };
    
   	func setScEpd(sc_epd: Double?) {
        self.sc_epd = sc_epd ?? 0.0
        self.sc_epd_str = String(self.sc_epd)
    }
    func getScEpd() -> Double {
        return self.sc_epd
    }
    func getScEpdType() -> String {
        return "Double"
    };
   	func getScEpdStr() -> String {
        return sc_epd_str
    };
   	func getScEpdStrPG() -> String {
        return sc_epd_str
    };
    
   	func setScAcc(sc_acc: Double?) {
        self.sc_acc = sc_acc ?? 0.0
        self.sc_acc_str = String(self.sc_acc)
    }
    func getScAcc() -> Double {
        return self.sc_acc
    }
    func getScAccType() -> String {
        return "Double"
    };
   	func getScAccStr() -> String {
        return sc_acc_str
    };
   	func getScAccStrPG() -> String {
        return sc_acc_str
    };
    
   	func setReaEpd(rea_epd: Double?) {
        self.rea_epd = rea_epd ?? 0.0
        self.rea_epd_str = String(self.rea_epd)
    }
    func getReaEpd() -> Double {
        return self.rea_epd
    }
    func getReaEpdType() -> String {
        return "Double"
    };
   	func getReaEpdStr() -> String {
        return rea_epd_str
    };
   	func getReaEpdStrPG() -> String {
        return rea_epd_str
    };
    
   	func setReaAcc(rea_acc: Double?) {
        self.rea_acc = rea_acc ?? 0.0
        self.rea_acc_str = String(self.rea_acc)
    }
    func getReaAcc() -> Double {
        return self.rea_acc
    }
    func getReaAccType() -> String {
        return "Double"
    };
   	func getReaAccStr() -> String {
        return rea_acc_str
    };
   	func getReaAccStrPG() -> String {
        return rea_acc_str
    };
    
   	func setFatEpd(fat_epd: Double?) {
        self.fat_epd = fat_epd ?? 0.0
        self.fat_epd_str = String(self.fat_epd)
    }
    func getFatEpd() -> Double {
        return self.fat_epd
    }
    func getFatEpdType() -> String {
        return "Double"
    };
   	func getFatEpdStr() -> String {
        return fat_epd_str
    };
   	func getFatEpdStrPG() -> String {
        return fat_epd_str
    };
    
   	func setFatAcc(fat_acc: Double?) {
        self.fat_acc = fat_acc ?? 0.0
        self.fat_acc_str = String(self.fat_acc)
    }
    func getFatAcc() -> Double {
        return self.fat_acc
    }
    func getFatAccType() -> String {
        return "Double"
    };
   	func getFatAccStr() -> String {
        return fat_acc_str
    };
   	func getFatAccStrPG() -> String {
        return fat_acc_str
    };
    
   	func setImfEpd(imf_epd: Double?) {
        self.imf_epd = imf_epd ?? 0.0
        self.imf_epd_str = String(self.imf_epd)
    }
    func getImfEpd() -> Double {
        return self.imf_epd
    }
    func getImfEpdType() -> String {
        return "Double"
    };
   	func getImfEpdStr() -> String {
        return imf_epd_str
    };
   	func getImfEpdStrPG() -> String {
        return imf_epd_str
    };
    
   	func setImfAcc(imf_acc: Double?) {
        self.imf_acc = imf_acc ?? 0.0
        self.imf_acc_str = String(self.imf_acc)
    }
    func getImfAcc() -> Double {
        return self.imf_acc
    }
    func getImfAccType() -> String {
        return "Double"
    };
   	func getImfAccStr() -> String {
        return imf_acc_str
    };
   	func getImfAccStrPG() -> String {
        return imf_acc_str
    };
    
   	func setCedEpd(ced_epd: Double?) {
        self.ced_epd = ced_epd ?? 0.0
        self.ced_epd_str = String(self.ced_epd)
    }
    func getCedEpd() -> Double {
        return self.ced_epd
    }
    func getCedEpdType() -> String {
        return "Double"
    };
   	func getCedEpdStr() -> String {
        return ced_epd_str
    };
   	func getCedEpdStrPG() -> String {
        return ced_epd_str
    };
    
   	func setCedAcc(ced_acc: Double?) {
        self.ced_acc = ced_acc ?? 0.0
        self.ced_acc_str = String(self.ced_acc)
    }
    func getCedAcc() -> Double {
        return self.ced_acc
    }
    func getCedAccType() -> String {
        return "Double"
    };
   	func getCedAccStr() -> String {
        return ced_acc_str
    };
   	func getCedAccStrPG() -> String {
        return ced_acc_str
    };
    
   	func setCemEpd(cem_epd: Double?) {
        self.cem_epd = cem_epd ?? 0.0
        self.cem_epd_str = String(self.cem_epd)
    }
    func getCemEpd() -> Double {
        return self.cem_epd
    }
    func getCemEpdType() -> String {
        return "Double"
    };
   	func getCemEpdStr() -> String {
        return cem_epd_str
    };
   	func getCemEpdStrPG() -> String {
        return cem_epd_str
    };
    
   	func setCemAcc(cem_acc: Double?) {
        self.cem_acc = cem_acc ?? 0.0
        self.cem_acc_str = String(self.cem_acc)
    }
    func getCemAcc() -> Double {
        return self.cem_acc
    }
    func getCemAccType() -> String {
        return "Double"
    };
   	func getCemAccStr() -> String {
        return cem_acc_str
    };
   	func getCemAccStrPG() -> String {
        return cem_acc_str
    };
    
   	func setTmEpd(tm_epd: Double?) {
        self.tm_epd = tm_epd ?? 0.0
        self.tm_epd_str = String(self.tm_epd)
    }
    func getTmEpd() -> Double {
        return self.tm_epd
    }
    func getTmEpdType() -> String {
        return "Double"
    };
   	func getTmEpdStr() -> String {
        return tm_epd_str
    };
   	func getTmEpdStrPG() -> String {
        return tm_epd_str
    };
    
   	func setTmAcc(tm_acc: Double?) {
        self.tm_acc = tm_acc ?? 0.0
        self.tm_acc_str = String(self.tm_acc)
    }
    func getTmAcc() -> Double {
        return self.tm_acc
    }
    func getTmAccType() -> String {
        return "Double"
    };
   	func getTmAccStr() -> String {
        return tm_acc_str
    };
   	func getTmAccStrPG() -> String {
        return tm_acc_str
    };
    
    func clearFields() {
        self.registration = ""
        self.registration_str = ""
        self.epd_year = 0
        self.epd_year_str = ""
        self.epd_season = ""
        self.epd_season_str = ""
        self.bw_epd = 0.0
        self.bw_epd_str = ""
        self.bw_acc = 0.0
        self.bw_acc_str = ""
        self.ww_epd = 0.0
        self.ww_epd_str = ""
        self.ww_acc = 0.0
        self.ww_acc_str = ""
        self.yw_epd = 0.0
        self.yw_epd_str = ""
        self.yw_acc = 0.0
        self.yw_acc_str = ""
        self.milk_epd = 0.0
        self.milk_epd_str = ""
        self.milk_acc = 0.0
        self.milk_acc_str = ""
        self.sc_epd = 0.0
        self.sc_epd_str = ""
        self.sc_acc = 0.0
        self.sc_acc_str = ""
        self.rea_epd = 0.0
        self.rea_epd_str = ""
        self.rea_acc = 0.0
        self.rea_acc_str = ""
        self.fat_epd = 0.0
        self.fat_epd_str = ""
        self.fat_acc = 0.0
        self.fat_acc_str = ""
        self.imf_epd = 0.0
        self.imf_epd_str = ""
        self.imf_acc = 0.0
        self.imf_acc_str = ""
        self.ced_epd = 0.0
        self.ced_epd_str = ""
        self.ced_acc = 0.0
        self.ced_acc_str = ""
        self.cem_epd = 0.0
        self.cem_epd_str = ""
        self.cem_acc = 0.0
        self.cem_acc_str = ""
        self.tm_epd = 0.0
        self.tm_epd_str = ""
        self.tm_acc = 0.0
        self.tm_acc_str = ""
        
    }
    
   	func getFieldType(field: String) -> String {
        switch field {
        case "_id":
            return "Int"
        case "registration":
            return "String"
        case "epd_year":
            return "Int"
        case "epd_season":
            return "String"
        case "bw_epd":
            return "Double"
        case "bw_acc":
            return "Double"
        case "ww_epd":
            return "Double"
        case "ww_acc":
            return "Double"
        case "yw_epd":
            return "Double"
        case "yw_acc":
            return "Double"
        case "milk_epd":
            return "Double"
        case "milk_acc":
            return "Double"
        case "sc_epd":
            return "Double"
        case "sc_acc":
            return "Double"
        case "rea_epd":
            return "Double"
        case "rea_acc":
            return "Double"
        case "fat_epd":
            return "Double"
        case "fat_acc":
            return "Double"
        case "imf_epd":
            return "Double"
        case "imf_acc":
            return "Double"
        case "ced_epd":
            return "Double"
        case "ced_acc":
            return "Double"
        case "cem_epd":
            return "Double"
        case "cem_acc":
            return "Double"
        case "tm_epd":
            return "Double"
        case "tm_acc":
            return "Double"
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
        case "registration":
            return self.getRegistrationStr()
        case "epd_year":
            return self.getEpdYearStr()
        case "epd_season":
            return self.getEpdSeasonStr()
        case "bw_epd":
            return self.getBwEpdStr()
        case "bw_acc":
            return self.getBwAccStr()
        case "ww_epd":
            return self.getWwEpdStr()
        case "ww_acc":
            return self.getWwAccStr()
        case "yw_epd":
            return self.getYwEpdStr()
        case "yw_acc":
            return self.getYwAccStr()
        case "milk_epd":
            return self.getMilkEpdStr()
        case "milk_acc":
            return self.getMilkAccStr()
        case "sc_epd":
            return self.getScEpdStr()
        case "sc_acc":
            return self.getScAccStr()
        case "rea_epd":
            return self.getReaEpdStr()
        case "rea_acc":
            return self.getReaAccStr()
        case "fat_epd":
            return self.getFatEpdStr()
        case "fat_acc":
            return self.getFatAccStr()
        case "imf_epd":
            return self.getImfEpdStr()
        case "imf_acc":
            return self.getImfAccStr()
        case "ced_epd":
            return self.getCedEpdStr()
        case "ced_acc":
            return self.getCedAccStr()
        case "cem_epd":
            return self.getCemEpdStr()
        case "cem_acc":
            return self.getCemAccStr()
        case "tm_epd":
            return self.getTmEpdStr()
        case "tm_acc":
            return self.getTmAccStr()
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
        qb.selectFrom("animal_epd")
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
                self.setRegistration((row["registration"]?.asString()));
                self.setEpdYear((row["epd_year"]?.asInt()));
                self.setEpdSeason((row["epd_season"]?.asString()));
                self.setBwEpd((row["bw_epd"]?.asDouble()));
                self.setBwAcc((row["bw_acc"]?.asDouble()));
                self.setWwEpd((row["ww_epd"]?.asDouble()));
                self.setWwAcc((row["ww_acc"]?.asDouble()));
                self.setYwEpd((row["yw_epd"]?.asDouble()));
                self.setYwAcc((row["yw_acc"]?.asDouble()));
                self.setMilkEpd((row["milk_epd"]?.asDouble()));
                self.setMilkAcc((row["milk_acc"]?.asDouble()));
                self.setScEpd((row["sc_epd"]?.asDouble()));
                self.setScAcc((row["sc_acc"]?.asDouble()));
                self.setReaEpd((row["rea_epd"]?.asDouble()));
                self.setReaAcc((row["rea_acc"]?.asDouble()));
                self.setFatEpd((row["fat_epd"]?.asDouble()));
                self.setFatAcc((row["fat_acc"]?.asDouble()));
                self.setImfEpd((row["imf_epd"]?.asDouble()));
                self.setImfAcc((row["imf_acc"]?.asDouble()));
                self.setCedEpd((row["ced_epd"]?.asDouble()));
                self.setCedAcc((row["ced_acc"]?.asDouble()));
                self.setCemEpd((row["cem_epd"]?.asDouble()));
                self.setCemAcc((row["cem_acc"]?.asDouble()));
                self.setTmEpd((row["tm_epd"]?.asDouble()));
                self.setTmAcc((row["tm_acc"]?.asDouble()));
                
                
                fields["_id"] = self.getIdStr()
                fields["registration"] = self.getRegistrationStr()
                fields["epd_year"] = self.getEpdYearStr()
                fields["epd_season"] = self.getEpdSeasonStr()
                fields["bw_epd"] = self.getBwEpdStr()
                fields["bw_acc"] = self.getBwAccStr()
                fields["ww_epd"] = self.getWwEpdStr()
                fields["ww_acc"] = self.getWwAccStr()
                fields["yw_epd"] = self.getYwEpdStr()
                fields["yw_acc"] = self.getYwAccStr()
                fields["milk_epd"] = self.getMilkEpdStr()
                fields["milk_acc"] = self.getMilkAccStr()
                fields["sc_epd"] = self.getScEpdStr()
                fields["sc_acc"] = self.getScAccStr()
                fields["rea_epd"] = self.getReaEpdStr()
                fields["rea_acc"] = self.getReaAccStr()
                fields["fat_epd"] = self.getFatEpdStr()
                fields["fat_acc"] = self.getFatAccStr()
                fields["imf_epd"] = self.getImfEpdStr()
                fields["imf_acc"] = self.getImfAccStr()
                fields["ced_epd"] = self.getCedEpdStr()
                fields["ced_acc"] = self.getCedAccStr()
                fields["cem_epd"] = self.getCemEpdStr()
                fields["cem_acc"] = self.getCemAccStr()
                fields["tm_epd"] = self.getTmEpdStr()
                fields["tm_acc"] = self.getTmAccStr()
                
                return fields
            }
        }
        return fields
    }
    
    func loadByRegistration(registration: String) {
        
        let query =
        "select A.* " +
        "from animal_epd A " +
        "WHERE A.registration = ? " +
        "ORDER BY A.epd_year DESC, A.epd_season ASC " +
        "LIMIT 1 "
        
        var fieldsArr: [AnyObject] = []
        fieldsArr.append(registration)
        
        var fields = [String: String]()
        let (resultset, error) = SD.executeQuery(query, withArgs: fieldsArr)
        if (error != nil) {
            SD.printDie(error!)
        } else {
            
            if resultset.count > 0 {
                let row = resultset[0];
                    
                self.setId((row["_id"]?.asInt()));
                self.setRegistration((row["registration"]?.asString()));
                self.setEpdYear((row["epd_year"]?.asInt()));
                self.setEpdSeason((row["epd_season"]?.asString()));
                self.setBwEpd((row["bw_epd"]?.asDouble()));
                self.setBwAcc((row["bw_acc"]?.asDouble()));
                self.setWwEpd((row["ww_epd"]?.asDouble()));
                self.setWwAcc((row["ww_acc"]?.asDouble()));
                self.setYwEpd((row["yw_epd"]?.asDouble()));
                self.setYwAcc((row["yw_acc"]?.asDouble()));
                self.setMilkEpd((row["milk_epd"]?.asDouble()));
                self.setMilkAcc((row["milk_acc"]?.asDouble()));
                self.setScEpd((row["sc_epd"]?.asDouble()));
                self.setScAcc((row["sc_acc"]?.asDouble()));
                self.setReaEpd((row["rea_epd"]?.asDouble()));
                self.setReaAcc((row["rea_acc"]?.asDouble()));
                self.setFatEpd((row["fat_epd"]?.asDouble()));
                self.setFatAcc((row["fat_acc"]?.asDouble()));
                self.setImfEpd((row["imf_epd"]?.asDouble()));
                self.setImfAcc((row["imf_acc"]?.asDouble()));
                self.setCedEpd((row["ced_epd"]?.asDouble()));
                self.setCedAcc((row["ced_acc"]?.asDouble()));
                self.setCemEpd((row["cem_epd"]?.asDouble()));
                self.setCemAcc((row["cem_acc"]?.asDouble()));
                self.setTmEpd((row["tm_epd"]?.asDouble()));
                self.setTmAcc((row["tm_acc"]?.asDouble()));
            } else {
                
                self.clearFields()
            }
        }
    }
    
    func getFields() -> [String: String] {
        
        var fields = [String: String]()
        fields["_id"] = self.getIdStr()
        fields["registration"] = self.getRegistrationStr()
        fields["epd_year"] = self.getEpdYearStr()
        fields["epd_season"] = self.getEpdSeasonStr()
        fields["bw_epd"] = self.getBwEpdStr()
        fields["bw_acc"] = self.getBwAccStr()
        fields["ww_epd"] = self.getWwEpdStr()
        fields["ww_acc"] = self.getWwAccStr()
        fields["yw_epd"] = self.getYwEpdStr()
        fields["yw_acc"] = self.getYwAccStr()
        fields["milk_epd"] = self.getMilkEpdStr()
        fields["milk_acc"] = self.getMilkAccStr()
        fields["sc_epd"] = self.getScEpdStr()
        fields["sc_acc"] = self.getScAccStr()
        fields["rea_epd"] = self.getReaEpdStr()
        fields["rea_acc"] = self.getReaAccStr()
        fields["fat_epd"] = self.getFatEpdStr()
        fields["fat_acc"] = self.getFatAccStr()
        fields["imf_epd"] = self.getImfEpdStr()
        fields["imf_acc"] = self.getImfAccStr()
        fields["ced_epd"] = self.getCedEpdStr()
        fields["ced_acc"] = self.getCedAccStr()
        fields["cem_epd"] = self.getCemEpdStr()
        fields["cem_acc"] = self.getCemAccStr()
        fields["tm_epd"] = self.getTmEpdStr()
        fields["tm_acc"] = self.getTmAccStr()
        return fields
    }
    
    func getFieldsPG() -> [String: String] {
        
        var fields = [String: String]()
        
        
        fields["_id"] = self.getIdStrPG()
        fields["registration"] = self.getRegistrationStrPG()
        fields["epd_year"] = self.getEpdYearStrPG()
        fields["epd_season"] = self.getEpdSeasonStrPG()
        fields["bw_epd"] = self.getBwEpdStrPG()
        fields["bw_acc"] = self.getBwAccStrPG()
        fields["ww_epd"] = self.getWwEpdStrPG()
        fields["ww_acc"] = self.getWwAccStrPG()
        fields["yw_epd"] = self.getYwEpdStrPG()
        fields["yw_acc"] = self.getYwAccStrPG()
        fields["milk_epd"] = self.getMilkEpdStrPG()
        fields["milk_acc"] = self.getMilkAccStrPG()
        fields["sc_epd"] = self.getScEpdStrPG()
        fields["sc_acc"] = self.getScAccStrPG()
        fields["rea_epd"] = self.getReaEpdStrPG()
        fields["rea_acc"] = self.getReaAccStrPG()
        fields["fat_epd"] = self.getFatEpdStrPG()
        fields["fat_acc"] = self.getFatAccStrPG()
        fields["imf_epd"] = self.getImfEpdStrPG()
        fields["imf_acc"] = self.getImfAccStrPG()
        fields["ced_epd"] = self.getCedEpdStrPG()
        fields["ced_acc"] = self.getCedAccStrPG()
        fields["cem_epd"] = self.getCemEpdStrPG()
        fields["cem_acc"] = self.getCemAccStrPG()
        fields["tm_epd"] = self.getTmEpdStrPG()
        fields["tm_acc"] = self.getTmAccStrPG()
        return fields    }
    
    func addNew() {
        
        var statement = "INSERT INTO animal_epd ("
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
        
        var statement = "INSERT INTO animal_epd ("
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
            
            var statement = "INSERT INTO animal_epd ("
            
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
        
        var statement = "UPDATE animal_epd "
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
        
        var statement = "UPDATE animal_epd "
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
        let query = "DELETE FROM animal_epd WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }
    
    
    func deletePG(forID: String) {
        
        let statement = "DELETE FROM animal_epd WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }
    
    class func getLastregistration() -> String {
        let registration: String = ""
        let query = "SELECT registration from animal_epd ORDER BY _id DESC LIMIT 1 "
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
