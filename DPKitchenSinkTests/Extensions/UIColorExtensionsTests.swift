//
//  UIColorExtensionsTests.swift
//  DPKitchenSinkTests
//
//  Created by Drew Pitchford on 6/28/18.
//

import XCTest
@testable import DPKitchenSink
import SwifterSwift

class UIColorExtensionsTests: XCTestCase {
    
    // MARK: - Tests
    func testColors() {
        
        let color = UIColor.customColor(withRed: 100, green: 200, blue: 125)
        XCTAssertEqual(color.rgbComponents.red, 100)
        XCTAssertEqual(color.rgbComponents.green, 200)
        XCTAssertEqual(color.rgbComponents.blue, 125)
        XCTAssertEqual(color.alpha, 1)
    }
}
