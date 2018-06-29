//
//  TapticFeedbackingTests.swift
//  DPKitchenSinkTests
//
//  Created by Drew Pitchford on 6/28/18.
//

import XCTest
@testable import DPKitchenSink

class TapticFeedbackableTests: XCTestCase, TapticFeedbackable {
    
    func testAvailabilityOfCalls() {
        
        fireSelectionFeedback()
        fireImpactFeedback(with: .heavy)
        fireNotificationFeedback(with: .success)
    }
}
