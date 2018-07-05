//
//  LoggerTests.swift
//  DPKitchenSinkTests
//
//  Created by Drew Pitchford on 6/28/18.
//

import XCTest
@testable import DPKitchenSink

class LoggerTests: XCTestCase {
    
    // Just test that they are available from the SDK
    func testLoggers() {
        
        shouldLogNetworkResponses = true
        setUpLogging()
        
        log("I can be accessed")
        networkLog("I can be accessed")
    }
}
