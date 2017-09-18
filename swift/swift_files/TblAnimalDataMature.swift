//
//  TblAnimalDataMature.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAnimalDataMature {
    
    static var TABLE_NAME = "tbl_animal_data_mature";
    static var _ID = "_id";
    static var ANIMAL_REGISTRATION = "animal_registration";
    static var MEASUREMENT_DATE = "measurement_date";
    static var WEIGHT = "weight";
    static var HEIGHT = "height";
    static var BODY_CONDITION_SCORE = "body_condition_score";
    static var CREATE_USER = "create_user";
    static var CREATE_STAMP = "create_stamp";
    static var UPDATE_USER = "update_user";
    static var UPDATE_DATE = "update_date";    // update_stamp
    static var WORK_ORDER = "work_order";
    static var COMMIT_LOCK_ID = "commit_lock_id";
    static var CONTEMPORARY_GROUP = "contemporary_group";
    static var SUB_CONTEMPORARY_GROUP = "sub_contemporary_group";
    static var PREMISE_ID = "premise_id";
    static var PASTURE_ID = "pasture_id";
    static var MANAGEMENT_GROUP = "management_group";
    static var FEED_CODE = "feed_code";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from tbl_animal_data_mature"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getAnimalRegistration() -> String {
        return ANIMAL_REGISTRATION;
    }
    
    class func getMeasurementDate() -> String {
        return MEASUREMENT_DATE;
    }
    
    class func getWEIGHT() -> String {
        return WEIGHT;
    }
    
    class func getHEIGHT() -> String {
        return HEIGHT;
    }
    
    class func getBodyConditionScore() -> String {
        return BODY_CONDITION_SCORE;
    }
    
    class func getCreateUser() -> String {
        return CREATE_USER;
    }
    
    class func getCreateStamp() -> String {
        return CREATE_STAMP;
    }
    
    class func getUpdateUser() -> String {
        return UPDATE_USER;
    }
    
    class func getUpdateDate() -> String {
        return UPDATE_DATE;
    }
    
    class func getWorkOrder() -> String {
        return WORK_ORDER;
    }
    
    class func getCommitLockId() -> String {
        return COMMIT_LOCK_ID;
    }
    
    class func getContemporaryGroup() -> String {
        return CONTEMPORARY_GROUP;
    }
    
    class func getSubContemporaryGroup() -> String {
        return SUB_CONTEMPORARY_GROUP;
    }
    
    class func getPremiseId() -> String {
        return PREMISE_ID;
    }
    
    class func getPastureId() -> String {
        return PASTURE_ID;
    }
    
    class func getManagementGroup() -> String {
        return MANAGEMENT_GROUP;
    }
    
    class func getFeedCode() -> String {
        return FEED_CODE;
    }
}
