//
//  UIApplicationExtensionsTests.swift
//  DPKitchenSinkTests
//
//  Created by Drew Pitchford on 6/28/18.
//

import XCTest
@testable import DPKitchenSink

class UIApplicationExtensionsTests: XCTestCase {
    
    func testTopViewControllerInsideNavController() {
        
        let vc = UIViewController()
        let navController = UINavigationController(rootViewController: vc)
        XCTAssertEqual(vc, UIApplication.topViewController(navController))
    }
    
    func testTopViewControllerInsideTabBarController() {
        
        let vc = UIViewController()
        let tabBar = UITabBarController()
        tabBar.setViewControllers([vc], animated: false)
        XCTAssertEqual(vc, UIApplication.topViewController(tabBar))
    }
    
    // TODO: Figure out how to test this
    func testTopViewControllerPresentedModally() {
        
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        let vc1 = UIViewController()
        window.addSubview(vc1.view)
        vc1.loadView()
        vc1.viewDidLoad()
        
        let vc2 = UIViewController()
        vc1.present(vc2, animated: true, completion: nil)
        XCTAssertEqual(vc2, UIApplication.topViewController(vc2))
    }
}
