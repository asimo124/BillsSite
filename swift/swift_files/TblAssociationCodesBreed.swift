//
//  TblAssociationCodesBreed.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/15/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class TblAssociationCodesBreed {
    
    static var TABLE_NAME = "codes_breed";
    static var _ID = "_id";
    static var BREED_ID = "breed_id";
    static var BREED_NAME = "breed_name";
    static var BREED = "breed";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = DatabaseOld()
	     let query = "delete from codes_breed"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getBreedId() -> String {
        return BREED_ID;
    }
    
    class func getBreedName() -> String {
        return BREED_NAME;
    }
    
    class func getBREED() -> String {
        return BREED;
    }
}
