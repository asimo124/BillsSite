//
//  Multisire.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class Multisire {
    
    static var TABLE_NAME = "multisire";
    static var _ID = "_id";
    static var MULTISIRE_ID = "multisire_id";
    static var MEMBER_ID = "member_id";
    static var MOVE_IN = "move_in";
    static var MOVE_OUT = "move_out";
    
    class func getMultisireId() -> String {
        return MULTISIRE_ID;
    }
    
    class func getTableName() -> String {
        return TABLE_NAME;
    }
    class func truncate() {
	     let dbn = Database()
	     let query = "delete from multisire"
	     dbn.query(query)
    }
    
    class func getId() -> String {
        return _ID;
    }
    
    class func getMemberId() -> String {
        return MEMBER_ID;
    }
    
    class func getMoveIn() -> String {
        return MOVE_IN;
    }
    
    class func getMoveOut() -> String {
        return MOVE_OUT;
    }
}
