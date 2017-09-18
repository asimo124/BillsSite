//
//  MembeBreedAssocNSR.swift
//  IOSApp3
//
//  Created by Alex Hawley on 8/11/16.
//  Copyright © 2016 Alex Hawley. All rights reserved.
//

import Foundation

class MemberBreedAssocNSR {
    
    static var BERKSHIRE = "berkshire";
    static var HAMPSHIRE = "hampshire";
    static var YORKSHIRE = "yorkshire";
    static var DUROC = "duroc";
    static var LANDRACE = "landrace";
    static var WELSH = "welsh";
    
    class func getBERKSHIRE() -> String {
        return BERKSHIRE;
    }
    
    class func getHAMPSHIRE() -> String {
        return HAMPSHIRE;
    }
    
    class func getYORKSHIRE() -> String {
        return YORKSHIRE;
    }
    
    class func getDUROC() -> String {
        return DUROC;
    }
    
    class func getLANDRACE() -> String {
        return LANDRACE;
    }
    
    class func getWELSH() -> String {
        return WELSH;
    }
}
