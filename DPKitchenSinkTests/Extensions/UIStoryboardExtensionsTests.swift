//
//  UIStoryboardExtensionsTests.swift
//  DPKitchenSinkTests
//
//  Created by Work Drew on 6/29/18.
//

import XCTest
@testable import DPKitchenSink

class UIStoryboardExtensionsTests: XCTestCase {
    
    func testLoadPopoverStoryboard() {
        
        XCTAssertNotNil(UIStoryboard.popoverViewController())
    }
}
