//
//  DoubleExtensionsTests.swift
//  DPKitchenSinkTests
//
//  Created by Drew Pitchford on 6/28/18.
//

import XCTest
@testable import DPKitchenSink

class DoubleExtensionsTests: XCTestCase {
    
    func testDisplayText() {
        
        var i = 2.4
        XCTAssertEqual("2.4", i.displayText)
        
        i = 11.99
        XCTAssertEqual("11.99", i.displayText)
    }
}
