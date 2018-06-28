//
//  PopoverPreparableTests.swift
//  DPKitchenSinkTests
//
//  Created by Work Drew on 6/28/18.
//

import XCTest
@testable import DPKitchenSink

class PopoverPreparableTester: UIViewController, PopoverPreparable {}

class PopoverPreparableTests: XCTestCase {
    
    func testPreparePopoverController() {
        
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        let vc = PopoverPreparableTester()
        window.addSubview(vc.view)
        
        XCTAssertNotNil(vc.preparePopover(UIViewController(), sourceView: UIView(), sourceRect: .zero, navControllerPopoverDelegate: vc))
        
        vc.presentPopover(with: UIViewController(), sourceView: UIView())
        XCTAssertNotNil(vc.presentedViewController)
    }
}
