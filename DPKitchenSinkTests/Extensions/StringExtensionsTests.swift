//
//  StringExtensionsTests.swift
//  DPKitchenSinkTests
//
//  Created by Drew Pitchford on 6/28/18.
//

import XCTest
@testable import DPKitchenSink

class StringExtensionsTests: XCTestCase {
    
    func testDisplayString() {
         
        let str = "Hello"
        XCTAssertEqual(str.displayText, "Hello")
    }
    
    func testStringIsValidLength() {
        
        let string = "hello world"
        XCTAssertTrue(string.isValid(givenMaxLength: 45))
        XCTAssertFalse(string.isValid(givenMaxLength: 2))
        
        let optionalString: String? = "hello"
        XCTAssertTrue(optionalString?.isValid(givenMaxLength: 5) ?? false)
        XCTAssertFalse(optionalString?.isValid(givenMaxLength: 2) ?? true)
    }
}
