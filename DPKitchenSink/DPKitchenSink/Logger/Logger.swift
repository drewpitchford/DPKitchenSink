//Copyright © mSIGNIA, Incorporated, 2007.  All rights reserved.
//
//Software is protected by one or more of U.S. Patent No. 9,559,852, 9294448, 8,817,984,
//international patents and others pending. For more information see www.mSIGNIA.com.  User agrees
//that they will not them self, or through any affiliate, agent or other third-party, entity or
//other business structure remove, alter, cover or obfuscate any copyright notices or other
//proprietary rights notices of mSIGNIA or its licensors.  User agrees that they will not them
//self, or through any affiliate, agent or other third party, entity or other business structure
//(a) reproduce, sell, lease, license or sublicense this software or any part thereof, (b)
//decompile, disassemble, re-program, reverse engineer or otherwise attempt to derive or modify
//this software in whole or in part, (c) write or develop any derivative software or any other
//software program based upon this software, (d) provide, copy, transmit, disclose, divulge, or
//make available to, or permit use of this software by any third party or entity or machine without
//software owner's prior written consent, (e) circumvent or disable any security or other
//technological features or measures used by this software.
//
//  Logger.swift
//  ThreeDSStoreDemo
//
//  Created by Drew Pitchford on 6/27/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation
import CocoaLumberjack

public var shouldLogNetworkResponses = false

public func setUpLogging() {
    
    DDLog.add(DDASLLogger.sharedInstance)
    
    if let fileLogger = DDFileLogger() {
        
        fileLogger.rollingFrequency = TimeInterval(60 * 60 * 24)
        fileLogger.logFileManager.maximumNumberOfLogFiles = 1000
        DDLog.add(fileLogger)
    }
}

public func log(_ message: Any = "", file: String = #file, method: String = #function) {
    
    guard let fileName = file.components(separatedBy: "/").last else {
        
        DDLogInfo("\(Date())   \(file)::\(method) - \(message)")
        return
    }
    
    DDLogInfo("\(Date())   \(fileName)::\(method) - \(message)")
}

public func networkLog(_ message: Any = "", file: String = #file, method: String = #function) {
    
    if shouldLogNetworkResponses {
        
        log(message, file: file, method: method)
    }
}
