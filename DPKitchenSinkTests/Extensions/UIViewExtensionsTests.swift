//
//  UIViewExtensionsTests.swift
//  DPKitchenSinkTests
//
//  Created by Drew Pitchford on 6/28/18.
//

import XCTest
@testable import DPKitchenSink

class UIViewExtensionsTests: XCTestCase {
    
    func testBlurView() {
        
        let exp = expectation(description: "Blur")
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        view.blur(using: .extraLight)
        
        for view in view.subviews {
            
            if view is UIVisualEffectView {
                
                exp.fulfill()
            }
        }
        
        waitForExpectations(timeout: 2.0, handler: nil)
    }
    
    func testRemoveBlur() {
        
        let exp = expectation(description: "Blur")
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        view.blur(using: .extraLight)
        view.blur(using: .dark)
        
        var blurCounter = 0
        for view in view.subviews {
            
            if view is UIVisualEffectView {
                
                exp.fulfill()
                blurCounter += 1
            }
        }
        
        XCTAssertEqual(1, blurCounter)
        waitForExpectations(timeout: 2.0, handler: nil)
    }
}
