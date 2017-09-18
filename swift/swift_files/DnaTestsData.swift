

//
//  DnaTests.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class DnaTestsData {

	var dna_id: Int = -1
    var dna_id_str: String = "unset"
	var registration: String = "unset"
    var registration_str: String = "unset"
	var member_id: String = "unset"
    var member_id_str: String = "unset"
	var breed: String = "unset"
    var breed_str: String = "unset"
	var date_banked: NSDate = NSDate.distantFuture() as NSDate
    var date_banked_str: String = "unset"
	var blood_bank: String = "unset"
    var blood_bank_str: String = "unset"
	var hal_1843_stress: String = "unset"
    var hal_1843_stress_str: String = "unset"
	var hamp_color_gene: String = "unset"
    var hamp_color_gene_str: String = "unset"
	var dna_breed_profile: String = "unset"
    var dna_breed_profile_str: String = "unset"
	var rn_gene_napole: String = "unset"
    var rn_gene_napole_str: String = "unset"
	var total_gain: String = "unset"
    var total_gain_str: String = "unset"
	var litter_size: String = "unset"
    var litter_size_str: String = "unset"
	var animal_growth: String = "unset"
    var animal_growth_str: String = "unset"
	var meat_quality: String = "unset"
    var meat_quality_str: String = "unset"
	
	func setDnaId(dna_id: Int?) {
        self.dna_id = dna_id ?? 0
        let dna_id2 = dna_id ?? 0
        self.dna_id_str = String(dna_id2)
        self.dna_id_str = (self.dna_id_str == "0") ? "" : self.dna_id_str
    }
    func getDnaId() -> Int {
        return self.dna_id
    }
    func getDnaIdType() -> String {
        return "Int"
    };
	func getDnaIdStr() -> String {
        return dna_id_str
    };
	func getDnaIdStrPG() -> String {
        return dna_id_str
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

	func setBreed(breed: String?) {
        self.breed = breed ?? ""
        self.breed_str = String(self.breed)
    }
    func getBreed() -> String {
        return self.breed
    }
    func getBreedType() -> String {
        return "String"
    };
	func getBreedStr() -> String {
        return breed_str == "unset" ? "" : breed_str
    };
	func getBreedStrPG() -> String {
        return breed_str == "unset" ? "" : breed_str
    };

	func setDateBanked(date_banked: NSDate?) {
        self.date_banked = date_banked ?? NSDate.distantPast() as NSDate
        self.date_banked_str = Utils.dateToString(self.date_banked)
    }
    func getDateBanked() -> NSDate {
        return self.date_banked
    }
    func getDateBankedType() -> String {
        return "NSDate"
    };
	func getDateBankedStr() -> String {
        return date_banked_str == "unset" || date_banked_str == "0000-12-30 00:00:00 +0000" ? "" : date_banked_str
    };
	func getDateBankedStrPG() -> String {
        return date_banked_str == "unset" || date_banked_str == "0000-12-30 00:00:00 +0000" ? "" : date_banked_str
    };

	func setBloodBank(blood_bank: String?) {
        self.blood_bank = blood_bank ?? ""
        self.blood_bank_str = String(self.blood_bank)
    }
    func getBloodBank() -> String {
        return self.blood_bank
    }
    func getBloodBankType() -> String {
        return "String"
    };
	func getBloodBankStr() -> String {
        return blood_bank_str == "unset" ? "" : blood_bank_str
    };
	func getBloodBankStrPG() -> String {
        return blood_bank_str == "unset" ? "" : blood_bank_str
    };

	func setHal1843Stress(hal_1843_stress: String?) {
        self.hal_1843_stress = hal_1843_stress ?? ""
        self.hal_1843_stress_str = String(self.hal_1843_stress)
    }
    func getHal1843Stress() -> String {
        return self.hal_1843_stress
    }
    func getHal1843StressType() -> String {
        return "String"
    };
	func getHal1843StressStr() -> String {
        return hal_1843_stress_str == "unset" ? "" : hal_1843_stress_str
    };
	func getHal1843StressStrPG() -> String {
        return hal_1843_stress_str == "unset" ? "" : hal_1843_stress_str
    };

	func setHampColorGene(hamp_color_gene: String?) {
        self.hamp_color_gene = hamp_color_gene ?? ""
        self.hamp_color_gene_str = String(self.hamp_color_gene)
    }
    func getHampColorGene() -> String {
        return self.hamp_color_gene
    }
    func getHampColorGeneType() -> String {
        return "String"
    };
	func getHampColorGeneStr() -> String {
        return hamp_color_gene_str == "unset" ? "" : hamp_color_gene_str
    };
	func getHampColorGeneStrPG() -> String {
        return hamp_color_gene_str == "unset" ? "" : hamp_color_gene_str
    };

	func setDnaBreedProfile(dna_breed_profile: String?) {
        self.dna_breed_profile = dna_breed_profile ?? ""
        self.dna_breed_profile_str = String(self.dna_breed_profile)
    }
    func getDnaBreedProfile() -> String {
        return self.dna_breed_profile
    }
    func getDnaBreedProfileType() -> String {
        return "String"
    };
	func getDnaBreedProfileStr() -> String {
        return dna_breed_profile_str == "unset" ? "" : dna_breed_profile_str
    };
	func getDnaBreedProfileStrPG() -> String {
        return dna_breed_profile_str == "unset" ? "" : dna_breed_profile_str
    };

	func setRnGeneNapole(rn_gene_napole: String?) {
        self.rn_gene_napole = rn_gene_napole ?? ""
        self.rn_gene_napole_str = String(self.rn_gene_napole)
    }
    func getRnGeneNapole() -> String {
        return self.rn_gene_napole
    }
    func getRnGeneNapoleType() -> String {
        return "String"
    };
	func getRnGeneNapoleStr() -> String {
        return rn_gene_napole_str == "unset" ? "" : rn_gene_napole_str
    };
	func getRnGeneNapoleStrPG() -> String {
        return rn_gene_napole_str == "unset" ? "" : rn_gene_napole_str
    };

	func setTotalGain(total_gain: String?) {
        self.total_gain = total_gain ?? ""
        self.total_gain_str = String(self.total_gain)
    }
    func getTotalGain() -> String {
        return self.total_gain
    }
    func getTotalGainType() -> String {
        return "String"
    };
	func getTotalGainStr() -> String {
        return total_gain_str == "unset" ? "" : total_gain_str
    };
	func getTotalGainStrPG() -> String {
        return total_gain_str == "unset" ? "" : total_gain_str
    };

	func setLitterSize(litter_size: String?) {
        self.litter_size = litter_size ?? ""
        self.litter_size_str = String(self.litter_size)
    }
    func getLitterSize() -> String {
        return self.litter_size
    }
    func getLitterSizeType() -> String {
        return "String"
    };
	func getLitterSizeStr() -> String {
        return litter_size_str == "unset" ? "" : litter_size_str
    };
	func getLitterSizeStrPG() -> String {
        return litter_size_str == "unset" ? "" : litter_size_str
    };

	func setAnimalGrowth(animal_growth: String?) {
        self.animal_growth = animal_growth ?? ""
        self.animal_growth_str = String(self.animal_growth)
    }
    func getAnimalGrowth() -> String {
        return self.animal_growth
    }
    func getAnimalGrowthType() -> String {
        return "String"
    };
	func getAnimalGrowthStr() -> String {
        return animal_growth_str == "unset" ? "" : animal_growth_str
    };
	func getAnimalGrowthStrPG() -> String {
        return animal_growth_str == "unset" ? "" : animal_growth_str
    };

	func setMeatQuality(meat_quality: String?) {
        self.meat_quality = meat_quality ?? ""
        self.meat_quality_str = String(self.meat_quality)
    }
    func getMeatQuality() -> String {
        return self.meat_quality
    }
    func getMeatQualityType() -> String {
        return "String"
    };
	func getMeatQualityStr() -> String {
        return meat_quality_str == "unset" ? "" : meat_quality_str
    };
	func getMeatQualityStrPG() -> String {
        return meat_quality_str == "unset" ? "" : meat_quality_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "dna_id":
				return "Int"
			case "registration":
				return "String"
			case "member_id":
				return "String"
			case "breed":
				return "String"
			case "date_banked":
				return "NSDate"
			case "blood_bank":
				return "String"
			case "hal_1843_stress":
				return "String"
			case "hamp_color_gene":
				return "String"
			case "dna_breed_profile":
				return "String"
			case "rn_gene_napole":
				return "String"
			case "total_gain":
				return "String"
			case "litter_size":
				return "String"
			case "animal_growth":
				return "String"
			case "meat_quality":
				return "String"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "dna_id":
			return self.getDnaIdStr()
			case "registration":
			return self.getRegistrationStr()
			case "member_id":
			return self.getMemberIdStr()
			case "breed":
			return self.getBreedStr()
			case "date_banked":
			return self.getDateBankedStr()
			case "blood_bank":
			return self.getBloodBankStr()
			case "hal_1843_stress":
			return self.getHal1843StressStr()
			case "hamp_color_gene":
			return self.getHampColorGeneStr()
			case "dna_breed_profile":
			return self.getDnaBreedProfileStr()
			case "rn_gene_napole":
			return self.getRnGeneNapoleStr()
			case "total_gain":
			return self.getTotalGainStr()
			case "litter_size":
			return self.getLitterSizeStr()
			case "animal_growth":
			return self.getAnimalGrowthStr()
			case "meat_quality":
			return self.getMeatQualityStr()
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
        qb.selectFrom("dna_tests")
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

				self.setDnaId((row["dna_id"]?.asInt()));
				self.setRegistration((row["registration"]?.asString()));
				self.setMemberId((row["member_id"]?.asString()));
				self.setBreed((row["breed"]?.asString()));
				self.setDateBanked((row["date_banked"]?.asDate()));
				self.setBloodBank((row["blood_bank"]?.asString()));
				self.setHal1843Stress((row["hal_1843_stress"]?.asString()));
				self.setHampColorGene((row["hamp_color_gene"]?.asString()));
				self.setDnaBreedProfile((row["dna_breed_profile"]?.asString()));
				self.setRnGeneNapole((row["rn_gene_napole"]?.asString()));
				self.setTotalGain((row["total_gain"]?.asString()));
				self.setLitterSize((row["litter_size"]?.asString()));
				self.setAnimalGrowth((row["animal_growth"]?.asString()));
				self.setMeatQuality((row["meat_quality"]?.asString()));

				
				fields["dna_id"] = self.getDnaIdStr()
				fields["registration"] = self.getRegistrationStr()
				fields["member_id"] = self.getMemberIdStr()
				fields["breed"] = self.getBreedStr()
				fields["date_banked"] = self.getDateBankedStr()
				fields["blood_bank"] = self.getBloodBankStr()
				fields["hal_1843_stress"] = self.getHal1843StressStr()
				fields["hamp_color_gene"] = self.getHampColorGeneStr()
				fields["dna_breed_profile"] = self.getDnaBreedProfileStr()
				fields["rn_gene_napole"] = self.getRnGeneNapoleStr()
				fields["total_gain"] = self.getTotalGainStr()
				fields["litter_size"] = self.getLitterSizeStr()
				fields["animal_growth"] = self.getAnimalGrowthStr()
				fields["meat_quality"] = self.getMeatQualityStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["dna_id"] = self.getDnaIdStr()
		fields["registration"] = self.getRegistrationStr()
		fields["member_id"] = self.getMemberIdStr()
		fields["breed"] = self.getBreedStr()
		fields["date_banked"] = self.getDateBankedStr()
		fields["blood_bank"] = self.getBloodBankStr()
		fields["hal_1843_stress"] = self.getHal1843StressStr()
		fields["hamp_color_gene"] = self.getHampColorGeneStr()
		fields["dna_breed_profile"] = self.getDnaBreedProfileStr()
		fields["rn_gene_napole"] = self.getRnGeneNapoleStr()
		fields["total_gain"] = self.getTotalGainStr()
		fields["litter_size"] = self.getLitterSizeStr()
		fields["animal_growth"] = self.getAnimalGrowthStr()
		fields["meat_quality"] = self.getMeatQualityStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["dna_id"] = self.getDnaIdStrPG()
		fields["registration"] = self.getRegistrationStrPG()
		fields["member_id"] = self.getMemberIdStrPG()
		fields["breed"] = self.getBreedStrPG()
		fields["date_banked"] = self.getDateBankedStrPG()
		fields["blood_bank"] = self.getBloodBankStrPG()
		fields["hal_1843_stress"] = self.getHal1843StressStrPG()
		fields["hamp_color_gene"] = self.getHampColorGeneStrPG()
		fields["dna_breed_profile"] = self.getDnaBreedProfileStrPG()
		fields["rn_gene_napole"] = self.getRnGeneNapoleStrPG()
		fields["total_gain"] = self.getTotalGainStrPG()
		fields["litter_size"] = self.getLitterSizeStrPG()
		fields["animal_growth"] = self.getAnimalGrowthStrPG()
		fields["meat_quality"] = self.getMeatQualityStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO dna_tests ("
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

        var statement = "INSERT INTO dna_tests ("
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

            var statement = "INSERT INTO dna_tests ("

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

        var statement = "UPDATE dna_tests "
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

        var statement = "UPDATE dna_tests "
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
        let query = "DELETE FROM dna_tests WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM dna_tests WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastregistration() -> String {
        let registration: String = ""
        let query = "SELECT registration from dna_tests ORDER BY _id DESC LIMIT 1 "
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
