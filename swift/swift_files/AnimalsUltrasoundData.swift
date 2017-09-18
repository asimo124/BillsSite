

//
//  AnimalsUltrasound.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class AnimalsUltrasoundData {

	var registration: String = "unset"
    var registration_str: String = "unset"
	var ultrasound_date: NSDate = NSDate.distantFuture() as NSDate
    var ultrasound_date_str: String = "unset"
	var weight: Int = -1
    var weight_str: String = "unset"
	var height: Double = -1.0
    var height_str: String = "unset"
	var scrotal_circumference: Int = -1
    var scrotal_circumference_str: String = "unset"
	var management_code: Int = -1
    var management_code_str: String = "unset"
	var contemporary_group: Int = -1
    var contemporary_group_str: String = "unset"
	var technician: String = "unset"
    var technician_str: String = "unset"
	var hardware: String = "unset"
    var hardware_str: String = "unset"
	var software: String = "unset"
    var software_str: String = "unset"
	var ribeye_area: Double = -1.0
    var ribeye_area_str: String = "unset"
	var backfat_thickness: Double = -1.0
    var backfat_thickness_str: String = "unset"
	var intramuscular_fat: Double = -1.0
    var intramuscular_fat_str: String = "unset"
	var rump_fat: Double = -1.0
    var rump_fat_str: String = "unset"
	var ribeye_area_adj: Double = -1.0
    var ribeye_area_adj_str: String = "unset"
	var backfat_thickness_adj: Double = -1.0
    var backfat_thickness_adj_str: String = "unset"
	var intramuscular_fat_adj: Double = -1.0
    var intramuscular_fat_adj_str: String = "unset"
	var rump_fat_adj: Double = -1.0
    var rump_fat_adj_str: String = "unset"
	var ribeye_area_ratio: Double = -1.0
    var ribeye_area_ratio_str: String = "unset"
	var backfat_thickness_ratio: Double = -1.0
    var backfat_thickness_ratio_str: String = "unset"
	var intramuscular_fat_ratio: Double = -1.0
    var intramuscular_fat_ratio_str: String = "unset"
	var rump_fat_ratio: Double = -1.0
    var rump_fat_ratio_str: String = "unset"
	
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

	func setUltrasoundDate(ultrasound_date: NSDate?) {
        self.ultrasound_date = ultrasound_date ?? NSDate.distantPast() as NSDate
        self.ultrasound_date_str = Utils.dateToString(self.ultrasound_date)
    }
    func getUltrasoundDate() -> NSDate {
        return self.ultrasound_date
    }
    func getUltrasoundDateType() -> String {
        return "NSDate"
    };
	func getUltrasoundDateStr() -> String {
        return ultrasound_date_str == "unset" || ultrasound_date_str == "0000-12-30 00:00:00 +0000" ? "" : ultrasound_date_str
    };
	func getUltrasoundDateStrPG() -> String {
        return ultrasound_date_str == "unset" || ultrasound_date_str == "0000-12-30 00:00:00 +0000" ? "" : ultrasound_date_str
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
        return weight_str
    };
	func getWeightStrPG() -> String {
        return weight_str
    };

	func setHeight(height: Double?) {
   	   self.height = height ?? 0.0
   	   self.height_str = String(self.height)
    }
    func getHeight() -> Double {
        return self.height
    }
    func getHeightType() -> String {
        return "Double"
    };
	func getHeightStr() -> String {
        return height_str
    };
	func getHeightStrPG() -> String {
        return height_str
    };

	func setScrotalCircumference(scrotal_circumference: Int?) {
        self.scrotal_circumference = scrotal_circumference ?? 0
        let scrotal_circumference2 = scrotal_circumference ?? 0
        self.scrotal_circumference_str = String(scrotal_circumference2)
        self.scrotal_circumference_str = (self.scrotal_circumference_str == "0") ? "" : self.scrotal_circumference_str
    }
    func getScrotalCircumference() -> Int {
        return self.scrotal_circumference
    }
    func getScrotalCircumferenceType() -> String {
        return "Int"
    };
	func getScrotalCircumferenceStr() -> String {
        return scrotal_circumference_str
    };
	func getScrotalCircumferenceStrPG() -> String {
        return scrotal_circumference_str
    };

	func setManagementCode(management_code: Int?) {
        self.management_code = management_code ?? 0
        let management_code2 = management_code ?? 0
        self.management_code_str = String(management_code2)
        self.management_code_str = (self.management_code_str == "0") ? "" : self.management_code_str
    }
    func getManagementCode() -> Int {
        return self.management_code
    }
    func getManagementCodeType() -> String {
        return "Int"
    };
	func getManagementCodeStr() -> String {
        return management_code_str
    };
	func getManagementCodeStrPG() -> String {
        return management_code_str
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
        return contemporary_group_str
    };
	func getContemporaryGroupStrPG() -> String {
        return contemporary_group_str
    };

	func setTechnician(technician: String?) {
        self.technician = technician ?? ""
        self.technician_str = String(self.technician)
    }
    func getTechnician() -> String {
        return self.technician
    }
    func getTechnicianType() -> String {
        return "String"
    };
	func getTechnicianStr() -> String {
        return technician_str == "unset" ? "" : technician_str
    };
	func getTechnicianStrPG() -> String {
        return technician_str == "unset" ? "" : technician_str
    };

	func setHardware(hardware: String?) {
        self.hardware = hardware ?? ""
        self.hardware_str = String(self.hardware)
    }
    func getHardware() -> String {
        return self.hardware
    }
    func getHardwareType() -> String {
        return "String"
    };
	func getHardwareStr() -> String {
        return hardware_str == "unset" ? "" : hardware_str
    };
	func getHardwareStrPG() -> String {
        return hardware_str == "unset" ? "" : hardware_str
    };

	func setSoftware(software: String?) {
        self.software = software ?? ""
        self.software_str = String(self.software)
    }
    func getSoftware() -> String {
        return self.software
    }
    func getSoftwareType() -> String {
        return "String"
    };
	func getSoftwareStr() -> String {
        return software_str == "unset" ? "" : software_str
    };
	func getSoftwareStrPG() -> String {
        return software_str == "unset" ? "" : software_str
    };

	func setRibeyeArea(ribeye_area: Double?) {
   	   self.ribeye_area = ribeye_area ?? 0.0
   	   self.ribeye_area_str = String(self.ribeye_area)
    }
    func getRibeyeArea() -> Double {
        return self.ribeye_area
    }
    func getRibeyeAreaType() -> String {
        return "Double"
    };
	func getRibeyeAreaStr() -> String {
        return ribeye_area_str
    };
	func getRibeyeAreaStrPG() -> String {
        return ribeye_area_str
    };

	func setBackfatThickness(backfat_thickness: Double?) {
   	   self.backfat_thickness = backfat_thickness ?? 0.0
   	   self.backfat_thickness_str = String(self.backfat_thickness)
    }
    func getBackfatThickness() -> Double {
        return self.backfat_thickness
    }
    func getBackfatThicknessType() -> String {
        return "Double"
    };
	func getBackfatThicknessStr() -> String {
        return backfat_thickness_str
    };
	func getBackfatThicknessStrPG() -> String {
        return backfat_thickness_str
    };

	func setIntramuscularFat(intramuscular_fat: Double?) {
   	   self.intramuscular_fat = intramuscular_fat ?? 0.0
   	   self.intramuscular_fat_str = String(self.intramuscular_fat)
    }
    func getIntramuscularFat() -> Double {
        return self.intramuscular_fat
    }
    func getIntramuscularFatType() -> String {
        return "Double"
    };
	func getIntramuscularFatStr() -> String {
        return intramuscular_fat_str
    };
	func getIntramuscularFatStrPG() -> String {
        return intramuscular_fat_str
    };

	func setRumpFat(rump_fat: Double?) {
   	   self.rump_fat = rump_fat ?? 0.0
   	   self.rump_fat_str = String(self.rump_fat)
    }
    func getRumpFat() -> Double {
        return self.rump_fat
    }
    func getRumpFatType() -> String {
        return "Double"
    };
	func getRumpFatStr() -> String {
        return rump_fat_str
    };
	func getRumpFatStrPG() -> String {
        return rump_fat_str
    };

	func setRibeyeAreaAdj(ribeye_area_adj: Double?) {
   	   self.ribeye_area_adj = ribeye_area_adj ?? 0.0
   	   self.ribeye_area_adj_str = String(self.ribeye_area_adj)
    }
    func getRibeyeAreaAdj() -> Double {
        return self.ribeye_area_adj
    }
    func getRibeyeAreaAdjType() -> String {
        return "Double"
    };
	func getRibeyeAreaAdjStr() -> String {
        return ribeye_area_adj_str
    };
	func getRibeyeAreaAdjStrPG() -> String {
        return ribeye_area_adj_str
    };

	func setBackfatThicknessAdj(backfat_thickness_adj: Double?) {
   	   self.backfat_thickness_adj = backfat_thickness_adj ?? 0.0
   	   self.backfat_thickness_adj_str = String(self.backfat_thickness_adj)
    }
    func getBackfatThicknessAdj() -> Double {
        return self.backfat_thickness_adj
    }
    func getBackfatThicknessAdjType() -> String {
        return "Double"
    };
	func getBackfatThicknessAdjStr() -> String {
        return backfat_thickness_adj_str
    };
	func getBackfatThicknessAdjStrPG() -> String {
        return backfat_thickness_adj_str
    };

	func setIntramuscularFatAdj(intramuscular_fat_adj: Double?) {
   	   self.intramuscular_fat_adj = intramuscular_fat_adj ?? 0.0
   	   self.intramuscular_fat_adj_str = String(self.intramuscular_fat_adj)
    }
    func getIntramuscularFatAdj() -> Double {
        return self.intramuscular_fat_adj
    }
    func getIntramuscularFatAdjType() -> String {
        return "Double"
    };
	func getIntramuscularFatAdjStr() -> String {
        return intramuscular_fat_adj_str
    };
	func getIntramuscularFatAdjStrPG() -> String {
        return intramuscular_fat_adj_str
    };

	func setRumpFatAdj(rump_fat_adj: Double?) {
   	   self.rump_fat_adj = rump_fat_adj ?? 0.0
   	   self.rump_fat_adj_str = String(self.rump_fat_adj)
    }
    func getRumpFatAdj() -> Double {
        return self.rump_fat_adj
    }
    func getRumpFatAdjType() -> String {
        return "Double"
    };
	func getRumpFatAdjStr() -> String {
        return rump_fat_adj_str
    };
	func getRumpFatAdjStrPG() -> String {
        return rump_fat_adj_str
    };

	func setRibeyeAreaRatio(ribeye_area_ratio: Double?) {
   	   self.ribeye_area_ratio = ribeye_area_ratio ?? 0.0
   	   self.ribeye_area_ratio_str = String(self.ribeye_area_ratio)
    }
    func getRibeyeAreaRatio() -> Double {
        return self.ribeye_area_ratio
    }
    func getRibeyeAreaRatioType() -> String {
        return "Double"
    };
	func getRibeyeAreaRatioStr() -> String {
        return ribeye_area_ratio_str
    };
	func getRibeyeAreaRatioStrPG() -> String {
        return ribeye_area_ratio_str
    };

	func setBackfatThicknessRatio(backfat_thickness_ratio: Double?) {
   	   self.backfat_thickness_ratio = backfat_thickness_ratio ?? 0.0
   	   self.backfat_thickness_ratio_str = String(self.backfat_thickness_ratio)
    }
    func getBackfatThicknessRatio() -> Double {
        return self.backfat_thickness_ratio
    }
    func getBackfatThicknessRatioType() -> String {
        return "Double"
    };
	func getBackfatThicknessRatioStr() -> String {
        return backfat_thickness_ratio_str
    };
	func getBackfatThicknessRatioStrPG() -> String {
        return backfat_thickness_ratio_str
    };

	func setIntramuscularFatRatio(intramuscular_fat_ratio: Double?) {
   	   self.intramuscular_fat_ratio = intramuscular_fat_ratio ?? 0.0
   	   self.intramuscular_fat_ratio_str = String(self.intramuscular_fat_ratio)
    }
    func getIntramuscularFatRatio() -> Double {
        return self.intramuscular_fat_ratio
    }
    func getIntramuscularFatRatioType() -> String {
        return "Double"
    };
	func getIntramuscularFatRatioStr() -> String {
        return intramuscular_fat_ratio_str
    };
	func getIntramuscularFatRatioStrPG() -> String {
        return intramuscular_fat_ratio_str
    };

	func setRumpFatRatio(rump_fat_ratio: Double?) {
   	   self.rump_fat_ratio = rump_fat_ratio ?? 0.0
   	   self.rump_fat_ratio_str = String(self.rump_fat_ratio)
    }
    func getRumpFatRatio() -> Double {
        return self.rump_fat_ratio
    }
    func getRumpFatRatioType() -> String {
        return "Double"
    };
	func getRumpFatRatioStr() -> String {
        return rump_fat_ratio_str
    };
	func getRumpFatRatioStrPG() -> String {
        return rump_fat_ratio_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "registration":
				return "String"
			case "ultrasound_date":
				return "NSDate"
			case "weight":
				return "Int"
			case "height":
				return "Double"
			case "scrotal_circumference":
				return "Int"
			case "management_code":
				return "Int"
			case "contemporary_group":
				return "Int"
			case "technician":
				return "String"
			case "hardware":
				return "String"
			case "software":
				return "String"
			case "ribeye_area":
				return "Double"
			case "backfat_thickness":
				return "Double"
			case "intramuscular_fat":
				return "Double"
			case "rump_fat":
				return "Double"
			case "ribeye_area_adj":
				return "Double"
			case "backfat_thickness_adj":
				return "Double"
			case "intramuscular_fat_adj":
				return "Double"
			case "rump_fat_adj":
				return "Double"
			case "ribeye_area_ratio":
				return "Double"
			case "backfat_thickness_ratio":
				return "Double"
			case "intramuscular_fat_ratio":
				return "Double"
			case "rump_fat_ratio":
				return "Double"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "registration":
			return self.getRegistrationStr()
			case "ultrasound_date":
			return self.getUltrasoundDateStr()
			case "weight":
			return self.getWeightStr()
			case "height":
			return self.getHeightStr()
			case "scrotal_circumference":
			return self.getScrotalCircumferenceStr()
			case "management_code":
			return self.getManagementCodeStr()
			case "contemporary_group":
			return self.getContemporaryGroupStr()
			case "technician":
			return self.getTechnicianStr()
			case "hardware":
			return self.getHardwareStr()
			case "software":
			return self.getSoftwareStr()
			case "ribeye_area":
			return self.getRibeyeAreaStr()
			case "backfat_thickness":
			return self.getBackfatThicknessStr()
			case "intramuscular_fat":
			return self.getIntramuscularFatStr()
			case "rump_fat":
			return self.getRumpFatStr()
			case "ribeye_area_adj":
			return self.getRibeyeAreaAdjStr()
			case "backfat_thickness_adj":
			return self.getBackfatThicknessAdjStr()
			case "intramuscular_fat_adj":
			return self.getIntramuscularFatAdjStr()
			case "rump_fat_adj":
			return self.getRumpFatAdjStr()
			case "ribeye_area_ratio":
			return self.getRibeyeAreaRatioStr()
			case "backfat_thickness_ratio":
			return self.getBackfatThicknessRatioStr()
			case "intramuscular_fat_ratio":
			return self.getIntramuscularFatRatioStr()
			case "rump_fat_ratio":
			return self.getRumpFatRatioStr()
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
        qb.selectFrom("animal_ultrasound")
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
				self.setUltrasoundDate((row["ultrasound_date"]?.asDate()));
				self.setWeight((row["weight"]?.asInt()));
				self.setHeight((row["height"]?.asDouble()));
				self.setScrotalCircumference((row["scrotal_circumference"]?.asInt()));
				self.setManagementCode((row["management_code"]?.asInt()));
				self.setContemporaryGroup((row["contemporary_group"]?.asInt()));
				self.setTechnician((row["technician"]?.asString()));
				self.setHardware((row["hardware"]?.asString()));
				self.setSoftware((row["software"]?.asString()));
				self.setRibeyeArea((row["ribeye_area"]?.asDouble()));
				self.setBackfatThickness((row["backfat_thickness"]?.asDouble()));
				self.setIntramuscularFat((row["intramuscular_fat"]?.asDouble()));
				self.setRumpFat((row["rump_fat"]?.asDouble()));
				self.setRibeyeAreaAdj((row["ribeye_area_adj"]?.asDouble()));
				self.setBackfatThicknessAdj((row["backfat_thickness_adj"]?.asDouble()));
				self.setIntramuscularFatAdj((row["intramuscular_fat_adj"]?.asDouble()));
				self.setRumpFatAdj((row["rump_fat_adj"]?.asDouble()));
				self.setRibeyeAreaRatio((row["ribeye_area_ratio"]?.asDouble()));
				self.setBackfatThicknessRatio((row["backfat_thickness_ratio"]?.asDouble()));
				self.setIntramuscularFatRatio((row["intramuscular_fat_ratio"]?.asDouble()));
				self.setRumpFatRatio((row["rump_fat_ratio"]?.asDouble()));

				
				fields["registration"] = self.getRegistrationStr()
				fields["ultrasound_date"] = self.getUltrasoundDateStr()
				fields["weight"] = self.getWeightStr()
				fields["height"] = self.getHeightStr()
				fields["scrotal_circumference"] = self.getScrotalCircumferenceStr()
				fields["management_code"] = self.getManagementCodeStr()
				fields["contemporary_group"] = self.getContemporaryGroupStr()
				fields["technician"] = self.getTechnicianStr()
				fields["hardware"] = self.getHardwareStr()
				fields["software"] = self.getSoftwareStr()
				fields["ribeye_area"] = self.getRibeyeAreaStr()
				fields["backfat_thickness"] = self.getBackfatThicknessStr()
				fields["intramuscular_fat"] = self.getIntramuscularFatStr()
				fields["rump_fat"] = self.getRumpFatStr()
				fields["ribeye_area_adj"] = self.getRibeyeAreaAdjStr()
				fields["backfat_thickness_adj"] = self.getBackfatThicknessAdjStr()
				fields["intramuscular_fat_adj"] = self.getIntramuscularFatAdjStr()
				fields["rump_fat_adj"] = self.getRumpFatAdjStr()
				fields["ribeye_area_ratio"] = self.getRibeyeAreaRatioStr()
				fields["backfat_thickness_ratio"] = self.getBackfatThicknessRatioStr()
				fields["intramuscular_fat_ratio"] = self.getIntramuscularFatRatioStr()
				fields["rump_fat_ratio"] = self.getRumpFatRatioStr()

                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["registration"] = self.getRegistrationStr()
		fields["ultrasound_date"] = self.getUltrasoundDateStr()
		fields["weight"] = self.getWeightStr()
		fields["height"] = self.getHeightStr()
		fields["scrotal_circumference"] = self.getScrotalCircumferenceStr()
		fields["management_code"] = self.getManagementCodeStr()
		fields["contemporary_group"] = self.getContemporaryGroupStr()
		fields["technician"] = self.getTechnicianStr()
		fields["hardware"] = self.getHardwareStr()
		fields["software"] = self.getSoftwareStr()
		fields["ribeye_area"] = self.getRibeyeAreaStr()
		fields["backfat_thickness"] = self.getBackfatThicknessStr()
		fields["intramuscular_fat"] = self.getIntramuscularFatStr()
		fields["rump_fat"] = self.getRumpFatStr()
		fields["ribeye_area_adj"] = self.getRibeyeAreaAdjStr()
		fields["backfat_thickness_adj"] = self.getBackfatThicknessAdjStr()
		fields["intramuscular_fat_adj"] = self.getIntramuscularFatAdjStr()
		fields["rump_fat_adj"] = self.getRumpFatAdjStr()
		fields["ribeye_area_ratio"] = self.getRibeyeAreaRatioStr()
		fields["backfat_thickness_ratio"] = self.getBackfatThicknessRatioStr()
		fields["intramuscular_fat_ratio"] = self.getIntramuscularFatRatioStr()
		fields["rump_fat_ratio"] = self.getRumpFatRatioStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["registration"] = self.getRegistrationStrPG()
		fields["ultrasound_date"] = self.getUltrasoundDateStrPG()
		fields["weight"] = self.getWeightStrPG()
		fields["height"] = self.getHeightStrPG()
		fields["scrotal_circumference"] = self.getScrotalCircumferenceStrPG()
		fields["management_code"] = self.getManagementCodeStrPG()
		fields["contemporary_group"] = self.getContemporaryGroupStrPG()
		fields["technician"] = self.getTechnicianStrPG()
		fields["hardware"] = self.getHardwareStrPG()
		fields["software"] = self.getSoftwareStrPG()
		fields["ribeye_area"] = self.getRibeyeAreaStrPG()
		fields["backfat_thickness"] = self.getBackfatThicknessStrPG()
		fields["intramuscular_fat"] = self.getIntramuscularFatStrPG()
		fields["rump_fat"] = self.getRumpFatStrPG()
		fields["ribeye_area_adj"] = self.getRibeyeAreaAdjStrPG()
		fields["backfat_thickness_adj"] = self.getBackfatThicknessAdjStrPG()
		fields["intramuscular_fat_adj"] = self.getIntramuscularFatAdjStrPG()
		fields["rump_fat_adj"] = self.getRumpFatAdjStrPG()
		fields["ribeye_area_ratio"] = self.getRibeyeAreaRatioStrPG()
		fields["backfat_thickness_ratio"] = self.getBackfatThicknessRatioStrPG()
		fields["intramuscular_fat_ratio"] = self.getIntramuscularFatRatioStrPG()
		fields["rump_fat_ratio"] = self.getRumpFatRatioStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO animal_ultrasound ("
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

        var statement = "INSERT INTO animal_ultrasound ("
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

            var statement = "INSERT INTO animal_ultrasound ("

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

        var statement = "UPDATE animal_ultrasound "
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

        var statement = "UPDATE animal_ultrasound "
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
        let query = "DELETE FROM animal_ultrasound WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM animal_ultrasound WHERE registration = " + String(forID)
        let dbn = Database()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastregistration() -> String {
        let registration: String = ""
        let query = "SELECT registration from animal_ultrasound ORDER BY _id DESC LIMIT 1 "
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
