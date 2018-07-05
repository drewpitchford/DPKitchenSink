//
//  IntExtensionsTests.swift
//  DPKitchenSinkTests
//
//  Created by Drew Pitchford on 6/28/18.
//

import XCTest
@testable import DPKitchenSink

class IntExtensionsTests: XCTestCase {
    
    // MARK: - Tests
    func testDisplayText() {
        
        var i = 2
        XCTAssertEqual(i.displayText, "2")
        
        i = 10
        XCTAssertEqual(i.displayText, "10")
    }
}
