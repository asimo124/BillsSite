

//
//  TblAnimal.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/12/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalData {

	var animal_id: Int = -1
    var animal_id_str: String = "unset"
	var animal_registration: String = "unset"
    var animal_registration_str: String = "unset"
	var breeder_id: Int = -1
    var breeder_id_str: String = "unset"
	var animal_record_status: String = "unset"
    var animal_record_status_str: String = "unset"
	var animal_name: String = "unset"
    var animal_name_str: String = "unset"
	var animal_sex: String = "unset"
    var animal_sex_str: String = "unset"
	var animal_sire: String = "unset"
    var animal_sire_str: String = "unset"
	var animal_dam: String = "unset"
    var animal_dam_str: String = "unset"
	var animal_hold_brand: String = "unset"
    var animal_hold_brand_str: String = "unset"
	var animal_hold_brand_location: String = "unset"
    var animal_hold_brand_location_str: String = "unset"
	var animal_private_herd_id: String = "unset"
    var animal_private_herd_id_str: String = "unset"
	var animal_private_herd_id_location: String = "unset"
    var animal_private_herd_id_location_str: String = "unset"
	var animal_color_score: Int = -1
    var animal_color_score_str: String = "unset"
	var animal_scurs_code: String = "unset"
    var animal_scurs_code_str: String = "unset"
	var breed_code_1: String = "unset"
    var breed_code_1_str: String = "unset"
	var breed_percentage_1: Double = -1.0
    var breed_percentage_1_str: String = "unset"
	var breed_code_2: String = "unset"
    var breed_code_2_str: String = "unset"
	var breed_percentage_2: Double = -1.0
    var breed_percentage_2_str: String = "unset"
	var breed_code_3: String = "unset"
    var breed_code_3_str: String = "unset"
	var breed_percentage_3: Double = -1.0
    var breed_percentage_3_str: String = "unset"
	var breed_code_4: String = "unset"
    var breed_code_4_str: String = "unset"
	var breed_percentage_4: Double = -1.0
    var breed_percentage_4_str: String = "unset"
	var create_user: String = "unset"
    var create_user_str: String = "unset"
	var create_stamp: NSDate = NSDate.distantFuture() as NSDate
    var create_stamp_str: String = "unset"
	var update_user: String = "unset"
    var update_user_str: String = "unset"
	var update_stamp: NSDate = NSDate.distantFuture() as NSDate
    var update_stamp_str: String = "unset"
	var status_code: Double = -1.0
    var status_code_str: String = "unset"
	var generation: Int = -1
    var generation_str: String = "unset"
	var certificate_filename: String = "unset"
    var certificate_filename_str: String = "unset"
	var work_order: String = "unset"
    var work_order_str: String = "unset"
	var foreign_association_registration: String = "unset"
    var foreign_association_registration_str: String = "unset"
	var foreign_registration_association: String = "unset"
    var foreign_registration_association_str: String = "unset"
	var status_code_date: NSDate = NSDate.distantFuture() as NSDate
    var status_code_date_str: String = "unset"
	var international_id: String = "unset"
    var international_id_str: String = "unset"
	var eid: String = "unset"
    var eid_str: String = "unset"
	var metal_ear_tag: String = "unset"
    var metal_ear_tag_str: String = "unset"
	var other_id: String = "unset"
    var other_id_str: String = "unset"
	
	func setAnimalId(animal_id: Int?) {
        self.animal_id = animal_id ?? 0
        let animal_id2 = animal_id ?? 0
        self.animal_id_str = String(animal_id2)
        self.animal_id_str = (self.animal_id_str == "0") ? "" : self.animal_id_str
    }
    func getAnimalId() -> Int {
        return self.animal_id
    }
    func getAnimalIdType() -> String {
        return "Int"
    };
	func getAnimalIdStr() -> String {
        return animal_id_str
    };
	func getAnimalIdStrPG() -> String {
        return animal_id_str
    };

	func setAnimalRegistration(animal_registration: String?) {
        self.animal_registration = animal_registration ?? ""
        self.animal_registration_str = String(self.animal_registration)
    }
    func getAnimalRegistration() -> String {
        return self.animal_registration
    }
    func getAnimalRegistrationType() -> String {
        return "String"
    };
	func getAnimalRegistrationStr() -> String {
        return animal_registration_str == "unset" ? "" : animal_registration_str
    };
	func getAnimalRegistrationStrPG() -> String {
        return animal_registration_str == "unset" ? "" : animal_registration_str
    };

	func setBreederId(breeder_id: Int?) {
        self.breeder_id = breeder_id ?? 0
        let breeder_id2 = breeder_id ?? 0
        self.breeder_id_str = String(breeder_id2)
        self.breeder_id_str = (self.breeder_id_str == "0") ? "" : self.breeder_id_str
    }
    func getBreederId() -> Int {
        return self.breeder_id
    }
    func getBreederIdType() -> String {
        return "Int"
    };
	func getBreederIdStr() -> String {
        return breeder_id_str
    };
	func getBreederIdStrPG() -> String {
        return breeder_id_str
    };

	func setAnimalRecordStatus(animal_record_status: String?) {
        self.animal_record_status = animal_record_status ?? ""
        self.animal_record_status_str = String(self.animal_record_status)
    }
    func getAnimalRecordStatus() -> String {
        return self.animal_record_status
    }
    func getAnimalRecordStatusType() -> String {
        return "String"
    };
	func getAnimalRecordStatusStr() -> String {
        return animal_record_status_str == "unset" ? "" : animal_record_status_str
    };
	func getAnimalRecordStatusStrPG() -> String {
        return animal_record_status_str == "unset" ? "" : animal_record_status_str
    };

	func setAnimalName(animal_name: String?) {
        self.animal_name = animal_name ?? ""
        self.animal_name_str = String(self.animal_name)
    }
    func getAnimalName() -> String {
        return self.animal_name
    }
    func getAnimalNameType() -> String {
        return "String"
    };
	func getAnimalNameStr() -> String {
        return animal_name_str == "unset" ? "" : animal_name_str
    };
	func getAnimalNameStrPG() -> String {
        return animal_name_str == "unset" ? "" : animal_name_str
    };

	func setAnimalSex(animal_sex: String?) {
        self.animal_sex = animal_sex ?? ""
        self.animal_sex_str = String(self.animal_sex)
    }
    func getAnimalSex() -> String {
        return self.animal_sex
    }
    func getAnimalSexType() -> String {
        return "String"
    };
	func getAnimalSexStr() -> String {
        return animal_sex_str == "unset" ? "" : animal_sex_str
    };
	func getAnimalSexStrPG() -> String {
        return animal_sex_str == "unset" ? "" : animal_sex_str
    };

	func setAnimalSire(animal_sire: String?) {
        self.animal_sire = animal_sire ?? ""
        self.animal_sire_str = String(self.animal_sire)
    }
    func getAnimalSire() -> String {
        return self.animal_sire
    }
    func getAnimalSireType() -> String {
        return "String"
    };
	func getAnimalSireStr() -> String {
        return animal_sire_str == "unset" ? "" : animal_sire_str
    };
	func getAnimalSireStrPG() -> String {
        return animal_sire_str == "unset" ? "" : animal_sire_str
    };

	func setAnimalDam(animal_dam: String?) {
        self.animal_dam = animal_dam ?? ""
        self.animal_dam_str = String(self.animal_dam)
    }
    func getAnimalDam() -> String {
        return self.animal_dam
    }
    func getAnimalDamType() -> String {
        return "String"
    };
	func getAnimalDamStr() -> String {
        return animal_dam_str == "unset" ? "" : animal_dam_str
    };
	func getAnimalDamStrPG() -> String {
        return animal_dam_str == "unset" ? "" : animal_dam_str
    };

	func setAnimalHoldBrand(animal_hold_brand: String?) {
        self.animal_hold_brand = animal_hold_brand ?? ""
        self.animal_hold_brand_str = String(self.animal_hold_brand)
    }
    func getAnimalHoldBrand() -> String {
        return self.animal_hold_brand
    }
    func getAnimalHoldBrandType() -> String {
        return "String"
    };
	func getAnimalHoldBrandStr() -> String {
        return animal_hold_brand_str == "unset" ? "" : animal_hold_brand_str
    };
	func getAnimalHoldBrandStrPG() -> String {
        return animal_hold_brand_str == "unset" ? "" : animal_hold_brand_str
    };

	func setAnimalHoldBrandLocation(animal_hold_brand_location: String?) {
        self.animal_hold_brand_location = animal_hold_brand_location ?? ""
        self.animal_hold_brand_location_str = String(self.animal_hold_brand_location)
    }
    func getAnimalHoldBrandLocation() -> String {
        return self.animal_hold_brand_location
    }
    func getAnimalHoldBrandLocationType() -> String {
        return "String"
    };
	func getAnimalHoldBrandLocationStr() -> String {
        return animal_hold_brand_location_str == "unset" ? "" : animal_hold_brand_location_str
    };
	func getAnimalHoldBrandLocationStrPG() -> String {
        return animal_hold_brand_location_str == "unset" ? "" : animal_hold_brand_location_str
    };

	func setAnimalPrivateHerdId(animal_private_herd_id: String?) {
        self.animal_private_herd_id = animal_private_herd_id ?? ""
        self.animal_private_herd_id_str = String(self.animal_private_herd_id)
    }
    func getAnimalPrivateHerdId() -> String {
        return self.animal_private_herd_id
    }
    func getAnimalPrivateHerdIdType() -> String {
        return "String"
    };
	func getAnimalPrivateHerdIdStr() -> String {
        return animal_private_herd_id_str == "unset" ? "" : animal_private_herd_id_str
    };
	func getAnimalPrivateHerdIdStrPG() -> String {
        return animal_private_herd_id_str == "unset" ? "" : animal_private_herd_id_str
    };

	func setAnimalPrivateHerdIdLocation(animal_private_herd_id_location: String?) {
        self.animal_private_herd_id_location = animal_private_herd_id_location ?? ""
        self.animal_private_herd_id_location_str = String(self.animal_private_herd_id_location)
    }
    func getAnimalPrivateHerdIdLocation() -> String {
        return self.animal_private_herd_id_location
    }
    func getAnimalPrivateHerdIdLocationType() -> String {
        return "String"
    };
	func getAnimalPrivateHerdIdLocationStr() -> String {
        return animal_private_herd_id_location_str == "unset" ? "" : animal_private_herd_id_location_str
    };
	func getAnimalPrivateHerdIdLocationStrPG() -> String {
        return animal_private_herd_id_location_str == "unset" ? "" : animal_private_herd_id_location_str
    };

	func setAnimalColorScore(animal_color_score: Int?) {
        self.animal_color_score = animal_color_score ?? 0
        let animal_color_score2 = animal_color_score ?? 0
        self.animal_color_score_str = String(animal_color_score2)
        self.animal_color_score_str = (self.animal_color_score_str == "0") ? "" : self.animal_color_score_str
    }
    func getAnimalColorScore() -> Int {
        return self.animal_color_score
    }
    func getAnimalColorScoreType() -> String {
        return "Int"
    };
	func getAnimalColorScoreStr() -> String {
        return animal_color_score_str
    };
	func getAnimalColorScoreStrPG() -> String {
        return animal_color_score_str
    };

	func setAnimalScursCode(animal_scurs_code: String?) {
        self.animal_scurs_code = animal_scurs_code ?? ""
        self.animal_scurs_code_str = String(self.animal_scurs_code)
    }
    func getAnimalScursCode() -> String {
        return self.animal_scurs_code
    }
    func getAnimalScursCodeType() -> String {
        return "String"
    };
	func getAnimalScursCodeStr() -> String {
        return animal_scurs_code_str == "unset" ? "" : animal_scurs_code_str
    };
	func getAnimalScursCodeStrPG() -> String {
        return animal_scurs_code_str == "unset" ? "" : animal_scurs_code_str
    };

	func setBreedCode1(breed_code_1: String?) {
        self.breed_code_1 = breed_code_1 ?? ""
        self.breed_code_1_str = String(self.breed_code_1)
    }
    func getBreedCode1() -> String {
        return self.breed_code_1
    }
    func getBreedCode1Type() -> String {
        return "String"
    };
	func getBreedCode1Str() -> String {
        return breed_code_1_str == "unset" ? "" : breed_code_1_str
    };
	func getBreedCode1StrPG() -> String {
        return breed_code_1_str == "unset" ? "" : breed_code_1_str
    };

	func setBreedPercentage1(breed_percentage_1: Double?) {
   	   self.breed_percentage_1 = breed_percentage_1 ?? 0.0
   	   self.breed_percentage_1_str = String(self.breed_percentage_1)
    }
    func getBreedPercentage1() -> Double {
        return self.breed_percentage_1
    }
    func getBreedPercentage1Type() -> String {
        return "Double"
    };
	func getBreedPercentage1Str() -> String {
        return breed_percentage_1_str
    };
	func getBreedPercentage1StrPG() -> String {
        return breed_percentage_1_str
    };

	func setBreedCode2(breed_code_2: String?) {
        self.breed_code_2 = breed_code_2 ?? ""
        self.breed_code_2_str = String(self.breed_code_2)
    }
    func getBreedCode2() -> String {
        return self.breed_code_2
    }
    func getBreedCode2Type() -> String {
        return "String"
    };
	func getBreedCode2Str() -> String {
        return breed_code_2_str == "unset" ? "" : breed_code_2_str
    };
	func getBreedCode2StrPG() -> String {
        return breed_code_2_str == "unset" ? "" : breed_code_2_str
    };

	func setBreedPercentage2(breed_percentage_2: Double?) {
   	   self.breed_percentage_2 = breed_percentage_2 ?? 0.0
   	   self.breed_percentage_2_str = String(self.breed_percentage_2)
    }
    func getBreedPercentage2() -> Double {
        return self.breed_percentage_2
    }
    func getBreedPercentage2Type() -> String {
        return "Double"
    };
	func getBreedPercentage2Str() -> String {
        return breed_percentage_2_str
    };
	func getBreedPercentage2StrPG() -> String {
        return breed_percentage_2_str
    };

	func setBreedCode3(breed_code_3: String?) {
        self.breed_code_3 = breed_code_3 ?? ""
        self.breed_code_3_str = String(self.breed_code_3)
    }
    func getBreedCode3() -> String {
        return self.breed_code_3
    }
    func getBreedCode3Type() -> String {
        return "String"
    };
	func getBreedCode3Str() -> String {
        return breed_code_3_str == "unset" ? "" : breed_code_3_str
    };
	func getBreedCode3StrPG() -> String {
        return breed_code_3_str == "unset" ? "" : breed_code_3_str
    };

	func setBreedPercentage3(breed_percentage_3: Double?) {
   	   self.breed_percentage_3 = breed_percentage_3 ?? 0.0
   	   self.breed_percentage_3_str = String(self.breed_percentage_3)
    }
    func getBreedPercentage3() -> Double {
        return self.breed_percentage_3
    }
    func getBreedPercentage3Type() -> String {
        return "Double"
    };
	func getBreedPercentage3Str() -> String {
        return breed_percentage_3_str
    };
	func getBreedPercentage3StrPG() -> String {
        return breed_percentage_3_str
    };

	func setBreedCode4(breed_code_4: String?) {
        self.breed_code_4 = breed_code_4 ?? ""
        self.breed_code_4_str = String(self.breed_code_4)
    }
    func getBreedCode4() -> String {
        return self.breed_code_4
    }
    func getBreedCode4Type() -> String {
        return "String"
    };
	func getBreedCode4Str() -> String {
        return breed_code_4_str == "unset" ? "" : breed_code_4_str
    };
	func getBreedCode4StrPG() -> String {
        return breed_code_4_str == "unset" ? "" : breed_code_4_str
    };

	func setBreedPercentage4(breed_percentage_4: Double?) {
   	   self.breed_percentage_4 = breed_percentage_4 ?? 0.0
   	   self.breed_percentage_4_str = String(self.breed_percentage_4)
    }
    func getBreedPercentage4() -> Double {
        return self.breed_percentage_4
    }
    func getBreedPercentage4Type() -> String {
        return "Double"
    };
	func getBreedPercentage4Str() -> String {
        return breed_percentage_4_str
    };
	func getBreedPercentage4StrPG() -> String {
        return breed_percentage_4_str
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

	func setStatusCode(status_code: Double?) {
   	   self.status_code = status_code ?? 0.0
   	   self.status_code_str = String(self.status_code)
    }
    func getStatusCode() -> Double {
        return self.status_code
    }
    func getStatusCodeType() -> String {
        return "Double"
    };
	func getStatusCodeStr() -> String {
        return status_code_str
    };
	func getStatusCodeStrPG() -> String {
        return status_code_str
    };

	func setGeneration(generation: Int?) {
        self.generation = generation ?? 0
        let generation2 = generation ?? 0
        self.generation_str = String(generation2)
        self.generation_str = (self.generation_str == "0") ? "" : self.generation_str
    }
    func getGeneration() -> Int {
        return self.generation
    }
    func getGenerationType() -> String {
        return "Int"
    };
	func getGenerationStr() -> String {
        return generation_str
    };
	func getGenerationStrPG() -> String {
        return generation_str
    };

	func setCertificateFilename(certificate_filename: String?) {
        self.certificate_filename = certificate_filename ?? ""
        self.certificate_filename_str = String(self.certificate_filename)
    }
    func getCertificateFilename() -> String {
        return self.certificate_filename
    }
    func getCertificateFilenameType() -> String {
        return "String"
    };
	func getCertificateFilenameStr() -> String {
        return certificate_filename_str == "unset" ? "" : certificate_filename_str
    };
	func getCertificateFilenameStrPG() -> String {
        return certificate_filename_str == "unset" ? "" : certificate_filename_str
    };

	func setWorkOrder(work_order: String?) {
        self.work_order = work_order ?? ""
        self.work_order_str = String(self.work_order)
    }
    func getWorkOrder() -> String {
        return self.work_order
    }
    func getWorkOrderType() -> String {
        return "String"
    };
	func getWorkOrderStr() -> String {
        return work_order_str == "unset" ? "" : work_order_str
    };
	func getWorkOrderStrPG() -> String {
        return work_order_str == "unset" ? "" : work_order_str
    };

	func setForeignAssociationRegistration(foreign_association_registration: String?) {
        self.foreign_association_registration = foreign_association_registration ?? ""
        self.foreign_association_registration_str = String(self.foreign_association_registration)
    }
    func getForeignAssociationRegistration() -> String {
        return self.foreign_association_registration
    }
    func getForeignAssociationRegistrationType() -> String {
        return "String"
    };
	func getForeignAssociationRegistrationStr() -> String {
        return foreign_association_registration_str == "unset" ? "" : foreign_association_registration_str
    };
	func getForeignAssociationRegistrationStrPG() -> String {
        return foreign_association_registration_str == "unset" ? "" : foreign_association_registration_str
    };

	func setForeignRegistrationAssociation(foreign_registration_association: String?) {
        self.foreign_registration_association = foreign_registration_association ?? ""
        self.foreign_registration_association_str = String(self.foreign_registration_association)
    }
    func getForeignRegistrationAssociation() -> String {
        return self.foreign_registration_association
    }
    func getForeignRegistrationAssociationType() -> String {
        return "String"
    };
	func getForeignRegistrationAssociationStr() -> String {
        return foreign_registration_association_str == "unset" ? "" : foreign_registration_association_str
    };
	func getForeignRegistrationAssociationStrPG() -> String {
        return foreign_registration_association_str == "unset" ? "" : foreign_registration_association_str
    };

	func setStatusCodeDate(status_code_date: NSDate?) {
        self.status_code_date = status_code_date ?? NSDate.distantPast() as NSDate
        self.status_code_date_str = Utils.dateToString(self.status_code_date)
    }
    func getStatusCodeDate() -> NSDate {
        return self.status_code_date
    }
    func getStatusCodeDateType() -> String {
        return "NSDate"
    };
	func getStatusCodeDateStr() -> String {
        return status_code_date_str == "unset" || status_code_date_str == "0000-12-30 00:00:00 +0000" ? "" : status_code_date_str
    };
	func getStatusCodeDateStrPG() -> String {
        return status_code_date_str == "unset" || status_code_date_str == "0000-12-30 00:00:00 +0000" ? "" : status_code_date_str
    };

	func setInternationalId(international_id: String?) {
        self.international_id = international_id ?? ""
        self.international_id_str = String(self.international_id)
    }
    func getInternationalId() -> String {
        return self.international_id
    }
    func getInternationalIdType() -> String {
        return "String"
    };
	func getInternationalIdStr() -> String {
        return international_id_str == "unset" ? "" : international_id_str
    };
	func getInternationalIdStrPG() -> String {
        return international_id_str == "unset" ? "" : international_id_str
    };

	func setEid(eid: String?) {
        self.eid = eid ?? ""
        self.eid_str = String(self.eid)
    }
    func getEid() -> String {
        return self.eid
    }
    func getEidType() -> String {
        return "String"
    };
	func getEidStr() -> String {
        return eid_str == "unset" ? "" : eid_str
    };
	func getEidStrPG() -> String {
        return eid_str == "unset" ? "" : eid_str
    };

	func setMetalEarTag(metal_ear_tag: String?) {
        self.metal_ear_tag = metal_ear_tag ?? ""
        self.metal_ear_tag_str = String(self.metal_ear_tag)
    }
    func getMetalEarTag() -> String {
        return self.metal_ear_tag
    }
    func getMetalEarTagType() -> String {
        return "String"
    };
	func getMetalEarTagStr() -> String {
        return metal_ear_tag_str == "unset" ? "" : metal_ear_tag_str
    };
	func getMetalEarTagStrPG() -> String {
        return metal_ear_tag_str == "unset" ? "" : metal_ear_tag_str
    };

	func setOtherId(other_id: String?) {
        self.other_id = other_id ?? ""
        self.other_id_str = String(self.other_id)
    }
    func getOtherId() -> String {
        return self.other_id
    }
    func getOtherIdType() -> String {
        return "String"
    };
	func getOtherIdStr() -> String {
        return other_id_str == "unset" ? "" : other_id_str
    };
	func getOtherIdStrPG() -> String {
        return other_id_str == "unset" ? "" : other_id_str
    };

	func getFieldType(field: String) -> String {
        switch field {
			case "animal_id":
				return "Int"
			case "animal_registration":
				return "String"
			case "breeder_id":
				return "Int"
			case "animal_record_status":
				return "String"
			case "animal_name":
				return "String"
			case "animal_sex":
				return "String"
			case "animal_sire":
				return "String"
			case "animal_dam":
				return "String"
			case "animal_hold_brand":
				return "String"
			case "animal_hold_brand_location":
				return "String"
			case "animal_private_herd_id":
				return "String"
			case "animal_private_herd_id_location":
				return "String"
			case "animal_color_score":
				return "Int"
			case "animal_scurs_code":
				return "String"
			case "breed_code_1":
				return "String"
			case "breed_percentage_1":
				return "Double"
			case "breed_code_2":
				return "String"
			case "breed_percentage_2":
				return "Double"
			case "breed_code_3":
				return "String"
			case "breed_percentage_3":
				return "Double"
			case "breed_code_4":
				return "String"
			case "breed_percentage_4":
				return "Double"
			case "create_user":
				return "String"
			case "create_stamp":
				return "NSDate"
			case "update_user":
				return "String"
			case "update_stamp":
				return "NSDate"
			case "status_code":
				return "Double"
			case "generation":
				return "Int"
			case "certificate_filename":
				return "String"
			case "work_order":
				return "String"
			case "foreign_association_registration":
				return "String"
			case "foreign_registration_association":
				return "String"
			case "status_code_date":
				return "NSDate"
			case "international_id":
				return "String"
			case "eid":
				return "String"
			case "metal_ear_tag":
				return "String"
			case "other_id":
				return "String"
			default:
				return "String"

		}
	}

	func getFieldString(field: String) -> String {
        switch field { 
			case "animal_id":
			return self.getAnimalIdStr()
			case "animal_registration":
			return self.getAnimalRegistrationStr()
			case "breeder_id":
			return self.getBreederIdStr()
			case "animal_record_status":
			return self.getAnimalRecordStatusStr()
			case "animal_name":
			return self.getAnimalNameStr()
			case "animal_sex":
			return self.getAnimalSexStr()
			case "animal_sire":
			return self.getAnimalSireStr()
			case "animal_dam":
			return self.getAnimalDamStr()
			case "animal_hold_brand":
			return self.getAnimalHoldBrandStr()
			case "animal_hold_brand_location":
			return self.getAnimalHoldBrandLocationStr()
			case "animal_private_herd_id":
			return self.getAnimalPrivateHerdIdStr()
			case "animal_private_herd_id_location":
			return self.getAnimalPrivateHerdIdLocationStr()
			case "animal_color_score":
			return self.getAnimalColorScoreStr()
			case "animal_scurs_code":
			return self.getAnimalScursCodeStr()
			case "breed_code_1":
			return self.getBreedCode1Str()
			case "breed_percentage_1":
			return self.getBreedPercentage1Str()
			case "breed_code_2":
			return self.getBreedCode2Str()
			case "breed_percentage_2":
			return self.getBreedPercentage2Str()
			case "breed_code_3":
			return self.getBreedCode3Str()
			case "breed_percentage_3":
			return self.getBreedPercentage3Str()
			case "breed_code_4":
			return self.getBreedCode4Str()
			case "breed_percentage_4":
			return self.getBreedPercentage4Str()
			case "create_user":
			return self.getCreateUserStr()
			case "create_stamp":
			return self.getCreateStampStr()
			case "update_user":
			return self.getUpdateUserStr()
			case "update_stamp":
			return self.getUpdateStampStr()
			case "status_code":
			return self.getStatusCodeStr()
			case "generation":
			return self.getGenerationStr()
			case "certificate_filename":
			return self.getCertificateFilenameStr()
			case "work_order":
			return self.getWorkOrderStr()
			case "foreign_association_registration":
			return self.getForeignAssociationRegistrationStr()
			case "foreign_registration_association":
			return self.getForeignRegistrationAssociationStr()
			case "status_code_date":
			return self.getStatusCodeDateStr()
			case "international_id":
			return self.getInternationalIdStr()
			case "eid":
			return self.getEidStr()
			case "metal_ear_tag":
			return self.getMetalEarTagStr()
			case "other_id":
			return self.getOtherIdStr()
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
    
    func loadByRegistration(animal_registration: String) -> [String: String] {
        
        
        let query =
            "select * from tbl_animal " +
        "where animal_registration = ? "
        
        var fieldsArr: [AnyObject] = []
        fieldsArr.append(animal_registration)
        
        let fields = [String: String]()
        
        let (resultset, error) = SDOld.executeQuery(query, withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            
            if resultset.count > 0 {
                let row = resultset[0]
                
                self.setAnimalId((row["animal_id"]?.asInt()));
                self.setAnimalRegistration((row["animal_registration"]?.asString()));
                self.setBreederId((row["breeder_id"]?.asInt()));
                self.setAnimalRecordStatus((row["animal_record_status"]?.asString()));
                self.setAnimalName((row["animal_name"]?.asString()));
                self.setAnimalSex((row["animal_sex"]?.asString()));
                self.setAnimalSire((row["animal_sire"]?.asString()));
                self.setAnimalDam((row["animal_dam"]?.asString()));
                self.setAnimalHoldBrand((row["animal_hold_brand"]?.asString()));
                self.setAnimalHoldBrandLocation((row["animal_hold_brand_location"]?.asString()));
                self.setAnimalPrivateHerdId((row["animal_private_herd_id"]?.asString()));
                self.setAnimalPrivateHerdIdLocation((row["animal_private_herd_id_location"]?.asString()));
                self.setAnimalColorScore((row["animal_color_score"]?.asInt()));
                self.setAnimalScursCode((row["animal_scurs_code"]?.asString()));
                self.setBreedCode1((row["breed_code_1"]?.asString()));
                self.setBreedPercentage1((row["breed_percentage_1"]?.asDouble()));
                self.setBreedCode2((row["breed_code_2"]?.asString()));
                self.setBreedPercentage2((row["breed_percentage_2"]?.asDouble()));
                self.setBreedCode3((row["breed_code_3"]?.asString()));
                self.setBreedPercentage3((row["breed_percentage_3"]?.asDouble()));
                self.setBreedCode4((row["breed_code_4"]?.asString()));
                self.setBreedPercentage4((row["breed_percentage_4"]?.asDouble()));
                self.setCreateUser((row["create_user"]?.asString()));
                self.setCreateStamp((row["create_stamp"]?.asDate()));
                self.setUpdateUser((row["update_user"]?.asString()));
                self.setUpdateStamp((row["update_stamp"]?.asDate()));
                self.setStatusCode((row["status_code"]?.asDouble()));
                self.setGeneration((row["generation"]?.asInt()));
                self.setCertificateFilename((row["certificate_filename"]?.asString()));
                self.setWorkOrder((row["work_order"]?.asString()));
                self.setForeignAssociationRegistration((row["foreign_association_registration"]?.asString()));
                self.setForeignRegistrationAssociation((row["foreign_registration_association"]?.asString()));
                self.setStatusCodeDate((row["status_code_date"]?.asDate()));
                self.setInternationalId((row["international_id"]?.asString()));
                self.setEid((row["eid"]?.asString()));
                self.setMetalEarTag((row["metal_ear_tag"]?.asString()));
                self.setOtherId((row["other_id"]?.asString()));
                
                var fields = [String: String]()
                fields["animal_id"] = self.getAnimalIdStr()
                fields["animal_registration"] = self.getAnimalRegistrationStr()
                fields["breeder_id"] = self.getBreederIdStr()
                fields["animal_record_status"] = self.getAnimalRecordStatusStr()
                fields["animal_name"] = self.getAnimalNameStr()
                fields["animal_sex"] = self.getAnimalSexStr()
                fields["animal_sire"] = self.getAnimalSireStr()
                fields["animal_dam"] = self.getAnimalDamStr()
                fields["animal_hold_brand"] = self.getAnimalHoldBrandStr()
                fields["animal_hold_brand_location"] = self.getAnimalHoldBrandLocationStr()
                fields["animal_private_herd_id"] = self.getAnimalPrivateHerdIdStr()
                fields["animal_private_herd_id_location"] = self.getAnimalPrivateHerdIdLocationStr()
                fields["animal_color_score"] = self.getAnimalColorScoreStr()
                fields["animal_scurs_code"] = self.getAnimalScursCodeStr()
                fields["breed_code_1"] = self.getBreedCode1Str()
                fields["breed_percentage_1"] = self.getBreedPercentage1Str()
                fields["breed_code_2"] = self.getBreedCode2Str()
                fields["breed_percentage_2"] = self.getBreedPercentage2Str()
                fields["breed_code_3"] = self.getBreedCode3Str()
                fields["breed_percentage_3"] = self.getBreedPercentage3Str()
                fields["breed_code_4"] = self.getBreedCode4Str()
                fields["breed_percentage_4"] = self.getBreedPercentage4Str()
                fields["create_user"] = self.getCreateUserStr()
                fields["create_stamp"] = self.getCreateStampStr()
                fields["update_user"] = self.getUpdateUserStr()
                fields["update_stamp"] = self.getUpdateStampStr()
                fields["status_code"] = self.getStatusCodeStr()
                fields["generation"] = self.getGenerationStr()
                fields["certificate_filename"] = self.getCertificateFilenameStr()
                fields["work_order"] = self.getWorkOrderStr()
                fields["foreign_association_registration"] = self.getForeignAssociationRegistrationStr()
                fields["foreign_registration_association"] = self.getForeignRegistrationAssociationStr()
                fields["status_code_date"] = self.getStatusCodeDateStr()
                fields["international_id"] = self.getInternationalIdStr()
                fields["eid"] = self.getEidStr()
                fields["metal_ear_tag"] = self.getMetalEarTagStr()
                fields["other_id"] = self.getOtherIdStr()
                
                return fields
            }
        }
        return fields
    }
    
    func loadByRegistration(animal_registration: String, or_animal_private_herd_id: String) -> [String: String] {
        
        
        let query =
        "select * from tbl_animal " +
        "where animal_registration = ? or animal_private_herd_id = ? "
        
        var fieldsArr: [AnyObject] = []
        fieldsArr.append(animal_registration)
        fieldsArr.append(or_animal_private_herd_id)

        let fields = [String: String]()
    
        print("query at 2:", SDOld.printQuery(query, withArgs: fieldsArr))
        let (resultset, error) = SDOld.executeQuery(query, withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            
            if resultset.count > 0 {
                for row in resultset {

                    self.setAnimalId((row["animal_id"]?.asInt()));
                    self.setAnimalRegistration((row["animal_registration"]?.asString()));
                    self.setBreederId((row["breeder_id"]?.asInt()));
                    self.setAnimalRecordStatus((row["animal_record_status"]?.asString()));
                    self.setAnimalName((row["animal_name"]?.asString()));
                    self.setAnimalSex((row["animal_sex"]?.asString()));
                    self.setAnimalSire((row["animal_sire"]?.asString()));
                    self.setAnimalDam((row["animal_dam"]?.asString()));
                    self.setAnimalHoldBrand((row["animal_hold_brand"]?.asString()));
                    self.setAnimalHoldBrandLocation((row["animal_hold_brand_location"]?.asString()));
                    self.setAnimalPrivateHerdId((row["animal_private_herd_id"]?.asString()));
                    self.setAnimalPrivateHerdIdLocation((row["animal_private_herd_id_location"]?.asString()));
                    self.setAnimalColorScore((row["animal_color_score"]?.asInt()));
                    self.setAnimalScursCode((row["animal_scurs_code"]?.asString()));
                    self.setBreedCode1((row["breed_code_1"]?.asString()));
                    self.setBreedPercentage1((row["breed_percentage_1"]?.asDouble()));
                    self.setBreedCode2((row["breed_code_2"]?.asString()));
                    self.setBreedPercentage2((row["breed_percentage_2"]?.asDouble()));
                    self.setBreedCode3((row["breed_code_3"]?.asString()));
                    self.setBreedPercentage3((row["breed_percentage_3"]?.asDouble()));
                    self.setBreedCode4((row["breed_code_4"]?.asString()));
                    self.setBreedPercentage4((row["breed_percentage_4"]?.asDouble()));
                    self.setCreateUser((row["create_user"]?.asString()));
                    self.setCreateStamp((row["create_stamp"]?.asDate()));
                    self.setUpdateUser((row["update_user"]?.asString()));
                    self.setUpdateStamp((row["update_stamp"]?.asDate()));
                    self.setStatusCode((row["status_code"]?.asDouble()));
                    self.setGeneration((row["generation"]?.asInt()));
                    self.setCertificateFilename((row["certificate_filename"]?.asString()));
                    self.setWorkOrder((row["work_order"]?.asString()));
                    self.setForeignAssociationRegistration((row["foreign_association_registration"]?.asString()));
                    self.setForeignRegistrationAssociation((row["foreign_registration_association"]?.asString()));
                    self.setStatusCodeDate((row["status_code_date"]?.asDate()));
                    self.setInternationalId((row["international_id"]?.asString()));
                    self.setEid((row["eid"]?.asString()));
                    self.setMetalEarTag((row["metal_ear_tag"]?.asString()));
                    self.setOtherId((row["other_id"]?.asString()));
                    
                    Utils.printObject(self)

                    var fields = [String: String]()
                    fields["animal_id"] = self.getAnimalIdStr()
                    fields["animal_registration"] = self.getAnimalRegistrationStr()
                    fields["breeder_id"] = self.getBreederIdStr()
                    fields["animal_record_status"] = self.getAnimalRecordStatusStr()
                    fields["animal_name"] = self.getAnimalNameStr()
                    fields["animal_sex"] = self.getAnimalSexStr()
                    fields["animal_sire"] = self.getAnimalSireStr()
                    fields["animal_dam"] = self.getAnimalDamStr()
                    fields["animal_hold_brand"] = self.getAnimalHoldBrandStr()
                    fields["animal_hold_brand_location"] = self.getAnimalHoldBrandLocationStr()
                    fields["animal_private_herd_id"] = self.getAnimalPrivateHerdIdStr()
                    fields["animal_private_herd_id_location"] = self.getAnimalPrivateHerdIdLocationStr()
                    fields["animal_color_score"] = self.getAnimalColorScoreStr()
                    fields["animal_scurs_code"] = self.getAnimalScursCodeStr()
                    fields["breed_code_1"] = self.getBreedCode1Str()
                    fields["breed_percentage_1"] = self.getBreedPercentage1Str()
                    fields["breed_code_2"] = self.getBreedCode2Str()
                    fields["breed_percentage_2"] = self.getBreedPercentage2Str()
                    fields["breed_code_3"] = self.getBreedCode3Str()
                    fields["breed_percentage_3"] = self.getBreedPercentage3Str()
                    fields["breed_code_4"] = self.getBreedCode4Str()
                    fields["breed_percentage_4"] = self.getBreedPercentage4Str()
                    fields["create_user"] = self.getCreateUserStr()
                    fields["create_stamp"] = self.getCreateStampStr()
                    fields["update_user"] = self.getUpdateUserStr()
                    fields["update_stamp"] = self.getUpdateStampStr()
                    fields["status_code"] = self.getStatusCodeStr()
                    fields["generation"] = self.getGenerationStr()
                    fields["certificate_filename"] = self.getCertificateFilenameStr()
                    fields["work_order"] = self.getWorkOrderStr()
                    fields["foreign_association_registration"] = self.getForeignAssociationRegistrationStr()
                    fields["foreign_registration_association"] = self.getForeignRegistrationAssociationStr()
                    fields["status_code_date"] = self.getStatusCodeDateStr()
                    fields["international_id"] = self.getInternationalIdStr()
                    fields["eid"] = self.getEidStr()
                    fields["metal_ear_tag"] = self.getMetalEarTagStr()
                    fields["other_id"] = self.getOtherIdStr()
                }

                return fields
            }
        }
        return fields
    }
    
    func loadByID2(animal_registration_optional: String?) -> [String: String] {
        let qb = QueryBuilder()
        qb.selectFrom("tbl_animal")
            .Where("animal_registration = ?")
        
        let animal_registration = animal_registration_optional ?? ""
        
        var fieldsArr: [AnyObject] = []
        fieldsArr.append(animal_registration)
        
        let fields = [String: String]()
        
        SDOld.printQuery(qb.getQuery(), withArgs: fieldsArr)
        let (resultset, error) = SDOld.executeQuery(qb.getQuery(), withArgs: fieldsArr)
        if (error != nil) {
            SDOld.printDie(error!)
        } else {
            if resultset.count > 0 {
                let row = resultset[0]
                
                self.setAnimalId((row["animal_id"]?.asInt()));
                self.setAnimalRegistration((row["animal_registration"]?.asString()));
                self.setBreederId((row["breeder_id"]?.asInt()));
                self.setAnimalRecordStatus((row["animal_record_status"]?.asString()));
                self.setAnimalName((row["animal_name"]?.asString()));
                self.setAnimalSex((row["animal_sex"]?.asString()));
                self.setAnimalSire((row["animal_sire"]?.asString()));
                self.setAnimalDam((row["animal_dam"]?.asString()));
                self.setAnimalHoldBrand((row["animal_hold_brand"]?.asString()));
                self.setAnimalHoldBrandLocation((row["animal_hold_brand_location"]?.asString()));
                self.setAnimalPrivateHerdId((row["animal_private_herd_id"]?.asString()));
                self.setAnimalPrivateHerdIdLocation((row["animal_private_herd_id_location"]?.asString()));
                self.setAnimalColorScore((row["animal_color_score"]?.asInt()));
                self.setAnimalScursCode((row["animal_scurs_code"]?.asString()));
                self.setBreedCode1((row["breed_code_1"]?.asString()));
                self.setBreedPercentage1((row["breed_percentage_1"]?.asDouble()));
                self.setBreedCode2((row["breed_code_2"]?.asString()));
                self.setBreedPercentage2((row["breed_percentage_2"]?.asDouble()));
                self.setBreedCode3((row["breed_code_3"]?.asString()));
                self.setBreedPercentage3((row["breed_percentage_3"]?.asDouble()));
                self.setBreedCode4((row["breed_code_4"]?.asString()));
                self.setBreedPercentage4((row["breed_percentage_4"]?.asDouble()));
                self.setCreateUser((row["create_user"]?.asString()));
                self.setCreateStamp((row["create_stamp"]?.asDate()));
                self.setUpdateUser((row["update_user"]?.asString()));
                self.setUpdateStamp((row["update_stamp"]?.asDate()));
                self.setStatusCode((row["status_code"]?.asDouble()));
                self.setGeneration((row["generation"]?.asInt()));
                self.setCertificateFilename((row["certificate_filename"]?.asString()));
                self.setWorkOrder((row["work_order"]?.asString()));
                self.setForeignAssociationRegistration((row["foreign_association_registration"]?.asString()));
                self.setForeignRegistrationAssociation((row["foreign_registration_association"]?.asString()));
                self.setStatusCodeDate((row["status_code_date"]?.asDate()));
                self.setInternationalId((row["international_id"]?.asString()));
                self.setEid((row["eid"]?.asString()));
                self.setMetalEarTag((row["metal_ear_tag"]?.asString()));
                self.setOtherId((row["other_id"]?.asString()));
                
                var fields = [String: String]()
                fields["animal_id"] = self.getAnimalIdStr()
                fields["animal_registration"] = self.getAnimalRegistrationStr()
                fields["breeder_id"] = self.getBreederIdStr()
                fields["animal_record_status"] = self.getAnimalRecordStatusStr()
                fields["animal_name"] = self.getAnimalNameStr()
                fields["animal_sex"] = self.getAnimalSexStr()
                fields["animal_sire"] = self.getAnimalSireStr()
                fields["animal_dam"] = self.getAnimalDamStr()
                fields["animal_hold_brand"] = self.getAnimalHoldBrandStr()
                fields["animal_hold_brand_location"] = self.getAnimalHoldBrandLocationStr()
                fields["animal_private_herd_id"] = self.getAnimalPrivateHerdIdStr()
                fields["animal_private_herd_id_location"] = self.getAnimalPrivateHerdIdLocationStr()
                fields["animal_color_score"] = self.getAnimalColorScoreStr()
                fields["animal_scurs_code"] = self.getAnimalScursCodeStr()
                fields["breed_code_1"] = self.getBreedCode1Str()
                fields["breed_percentage_1"] = self.getBreedPercentage1Str()
                fields["breed_code_2"] = self.getBreedCode2Str()
                fields["breed_percentage_2"] = self.getBreedPercentage2Str()
                fields["breed_code_3"] = self.getBreedCode3Str()
                fields["breed_percentage_3"] = self.getBreedPercentage3Str()
                fields["breed_code_4"] = self.getBreedCode4Str()
                fields["breed_percentage_4"] = self.getBreedPercentage4Str()
                fields["create_user"] = self.getCreateUserStr()
                fields["create_stamp"] = self.getCreateStampStr()
                fields["update_user"] = self.getUpdateUserStr()
                fields["update_stamp"] = self.getUpdateStampStr()
                fields["status_code"] = self.getStatusCodeStr()
                fields["generation"] = self.getGenerationStr()
                fields["certificate_filename"] = self.getCertificateFilenameStr()
                fields["work_order"] = self.getWorkOrderStr()
                fields["foreign_association_registration"] = self.getForeignAssociationRegistrationStr()
                fields["foreign_registration_association"] = self.getForeignRegistrationAssociationStr()
                fields["status_code_date"] = self.getStatusCodeDateStr()
                fields["international_id"] = self.getInternationalIdStr()
                fields["eid"] = self.getEidStr()
                fields["metal_ear_tag"] = self.getMetalEarTagStr()
                fields["other_id"] = self.getOtherIdStr()
                
                return fields
            }
        }
        return fields
    }

    func getFields() -> [String: String] {

		var fields = [String: String]()
		fields["animal_id"] = self.getAnimalIdStr()
		fields["animal_registration"] = self.getAnimalRegistrationStr()
		fields["breeder_id"] = self.getBreederIdStr()
		fields["animal_record_status"] = self.getAnimalRecordStatusStr()
		fields["animal_name"] = self.getAnimalNameStr()
		fields["animal_sex"] = self.getAnimalSexStr()
		fields["animal_sire"] = self.getAnimalSireStr()
		fields["animal_dam"] = self.getAnimalDamStr()
		fields["animal_hold_brand"] = self.getAnimalHoldBrandStr()
		fields["animal_hold_brand_location"] = self.getAnimalHoldBrandLocationStr()
		fields["animal_private_herd_id"] = self.getAnimalPrivateHerdIdStr()
		fields["animal_private_herd_id_location"] = self.getAnimalPrivateHerdIdLocationStr()
		fields["animal_color_score"] = self.getAnimalColorScoreStr()
		fields["animal_scurs_code"] = self.getAnimalScursCodeStr()
		fields["breed_code_1"] = self.getBreedCode1Str()
		fields["breed_percentage_1"] = self.getBreedPercentage1Str()
		fields["breed_code_2"] = self.getBreedCode2Str()
		fields["breed_percentage_2"] = self.getBreedPercentage2Str()
		fields["breed_code_3"] = self.getBreedCode3Str()
		fields["breed_percentage_3"] = self.getBreedPercentage3Str()
		fields["breed_code_4"] = self.getBreedCode4Str()
		fields["breed_percentage_4"] = self.getBreedPercentage4Str()
		fields["create_user"] = self.getCreateUserStr()
		fields["create_stamp"] = self.getCreateStampStr()
		fields["update_user"] = self.getUpdateUserStr()
		fields["update_stamp"] = self.getUpdateStampStr()
		fields["status_code"] = self.getStatusCodeStr()
		fields["generation"] = self.getGenerationStr()
		fields["certificate_filename"] = self.getCertificateFilenameStr()
		fields["work_order"] = self.getWorkOrderStr()
		fields["foreign_association_registration"] = self.getForeignAssociationRegistrationStr()
		fields["foreign_registration_association"] = self.getForeignRegistrationAssociationStr()
		fields["status_code_date"] = self.getStatusCodeDateStr()
		fields["international_id"] = self.getInternationalIdStr()
		fields["eid"] = self.getEidStr()
		fields["metal_ear_tag"] = self.getMetalEarTagStr()
		fields["other_id"] = self.getOtherIdStr()
        return fields
    }

    func getFieldsPG() -> [String: String] {

        var fields = [String: String]()


		fields["animal_id"] = self.getAnimalIdStrPG()
		fields["animal_registration"] = self.getAnimalRegistrationStrPG()
		fields["breeder_id"] = self.getBreederIdStrPG()
		fields["animal_record_status"] = self.getAnimalRecordStatusStrPG()
		fields["animal_name"] = self.getAnimalNameStrPG()
		fields["animal_sex"] = self.getAnimalSexStrPG()
		fields["animal_sire"] = self.getAnimalSireStrPG()
		fields["animal_dam"] = self.getAnimalDamStrPG()
		fields["animal_hold_brand"] = self.getAnimalHoldBrandStrPG()
		fields["animal_hold_brand_location"] = self.getAnimalHoldBrandLocationStrPG()
		fields["animal_private_herd_id"] = self.getAnimalPrivateHerdIdStrPG()
		fields["animal_private_herd_id_location"] = self.getAnimalPrivateHerdIdLocationStrPG()
		fields["animal_color_score"] = self.getAnimalColorScoreStrPG()
		fields["animal_scurs_code"] = self.getAnimalScursCodeStrPG()
		fields["breed_code_1"] = self.getBreedCode1StrPG()
		fields["breed_percentage_1"] = self.getBreedPercentage1StrPG()
		fields["breed_code_2"] = self.getBreedCode2StrPG()
		fields["breed_percentage_2"] = self.getBreedPercentage2StrPG()
		fields["breed_code_3"] = self.getBreedCode3StrPG()
		fields["breed_percentage_3"] = self.getBreedPercentage3StrPG()
		fields["breed_code_4"] = self.getBreedCode4StrPG()
		fields["breed_percentage_4"] = self.getBreedPercentage4StrPG()
		fields["create_user"] = self.getCreateUserStrPG()
		fields["create_stamp"] = self.getCreateStampStrPG()
		fields["update_user"] = self.getUpdateUserStrPG()
		fields["update_stamp"] = self.getUpdateStampStrPG()
		fields["status_code"] = self.getStatusCodeStrPG()
		fields["generation"] = self.getGenerationStrPG()
		fields["certificate_filename"] = self.getCertificateFilenameStrPG()
		fields["work_order"] = self.getWorkOrderStrPG()
		fields["foreign_association_registration"] = self.getForeignAssociationRegistrationStrPG()
		fields["foreign_registration_association"] = self.getForeignRegistrationAssociationStrPG()
		fields["status_code_date"] = self.getStatusCodeDateStrPG()
		fields["international_id"] = self.getInternationalIdStrPG()
		fields["eid"] = self.getEidStrPG()
		fields["metal_ear_tag"] = self.getMetalEarTagStrPG()
		fields["other_id"] = self.getOtherIdStrPG()
		return fields    }

    func addNew() {

        var statement = "INSERT INTO tbl_animal ("
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

        var statement = "INSERT INTO tbl_animal ("
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

            var statement = "INSERT INTO tbl_animal ("

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

        var statement = "UPDATE tbl_animal "
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
        statement += "WHERE animal_registration = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query(statement)
    }

    func updatePG(forID: String) {

        // get all field/values as string values
        var fields = self.getFieldsPG()

        var statement = "UPDATE tbl_animal "
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
        statement += "WHERE animal_registration = " + String(forID)

        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    func delete(forID: Int) {
        let query = "DELETE FROM tbl_animal WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query(query)
    }


    func deletePG(forID: String) {

        let statement = "DELETE FROM tbl_animal WHERE animal_registration = " + String(forID)
        let dbn = DatabaseOld()
        dbn.query("INSERT INTO " + SyncableQueries.TABLE_NAME
            + " (" + SyncableQueries.SQL_QUERY + ") "
            + " VALUES "
            + " ('" + statement + "')");
    }

    class func getLastanimalRegistration() -> String {
        let animal_registration: String = ""
        let query = "SELECT animal_registration from tbl_animal ORDER BY _id DESC LIMIT 1 "
        let (resultset, err) = SDOld.executeQuery(query)
        if (err == nil) {
            if resultset.count > 0 {
                let row = resultset[0]
                let animal_registration2 = row["animal_registration"]?.asString() ?? ""

                return animal_registration2

            }
        }
        return animal_registration
    }
}
