//
//  UITextFieldExtensionsTests.swift
//  DPKitchenSinkTests
//
//  Created by Drew Pitchford on 6/28/18.
//

import XCTest
@testable import DPKitchenSink

class UITextFieldExtensionsTests: XCTestCase {
    
    func testContainsValidEmail() {
        
        let tf = UITextField()
        tf.text = "sadfhsladkf"
        XCTAssertFalse(tf.containsValidEmail)
        
        tf.text = "some.email@email.com"
        XCTAssertTrue(tf.containsValidEmail)
        
        tf.text = "some@email.com"
        XCTAssertTrue(tf.containsValidEmail)
    }
}
