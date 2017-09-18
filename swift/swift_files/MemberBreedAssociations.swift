//
//  MemberBreedAssociations.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class MemberBreedAssociations {
    
    
    static var TABLE_NAME = "member_breed_associations";
    static var _ID = "_id";
    static var MEMBER_ID = "member_id";
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from member_breed_associations"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
}
