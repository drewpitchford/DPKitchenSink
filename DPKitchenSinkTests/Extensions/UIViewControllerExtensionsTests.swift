//
//  UIViewControllerExtensionsTests.swift
//  DPKitchenSinkTests
//
//  Created by Drew Pitchford on 6/28/18.
//

import XCTest
@testable import DPKitchenSink

class UIViewControllerExtensionsTests: XCTestCase {
    
    func testSetUpLargeTitle() {
        
        let vc = UIViewController()
        let navController = UINavigationController(rootViewController: vc)
        
        vc.setUpNavBarForLargeTitle()
        XCTAssertTrue(navController.navigationBar.prefersLargeTitles)
    }
    
    // TODO: Need to fix this test
    func testAlerts() {
        
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        let vc = UIViewController()
        window.addSubview(vc.view)
        vc.loadView()
        
        vc.showNotYetImplementedAlert()
        let nyiExpectation = expectation(description: "Not yet implemented")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            XCTAssertNotNil(vc.presentedViewController)
            vc.dismiss(animated: false, completion: {
                
                nyiExpectation.fulfill()
            })
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
