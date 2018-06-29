//
//  UIViewControllerExtensionsTests.swift
//  DPKitchenSinkTests
//
//  Created by Drew Pitchford on 6/28/18.
//

import XCTest
import UIKit
@testable import DPKitchenSink

class MyViewController: UIViewController {
    
    var someDependency: String!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        assertDependenciesHaveBeenInjected([someDependency])
    }
    
    func inject(aDependency dependency: String) {
        
        someDependency = dependency
    }
}

class UIViewControllerExtensionsTests: XCTestCase {
    
    func testSetUpLargeTitle() {
        
        let vc = UIViewController()
        let navController = UINavigationController(rootViewController: vc)
        
        vc.setUpNavBarForLargeTitle()
        XCTAssertTrue(navController.navigationBar.prefersLargeTitles)
    }
    
    func testAssertDependecy() {
        
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        let vc = MyViewController()
        vc.inject(aDependency: "hello there")
        window.addSubview(vc.view)
        vc.loadView()
        vc.viewDidLoad()
        
        
        let vc2 = MyViewController()
        window.addSubview(vc2.view)
        vc2.loadView()
        vc2.viewDidLoad()
        
        MTKAssertAlertIsPresented(by: vc2, style: .alert, title: "VC Injection Error", message: "Missing injection in /Workspace/DPKitchenSink/DPKitchenSinkTests/Extensions/UIViewControllerExtensionsTests.swift::viewDidLoad(). Pressing Ok will kill the app. Please contact the app developer with this info", actions: [ExpectedAlertAction(title: "Ok", style: .default)])
    }
    
    func testGeneralAlerts() {

        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        let vc = UIViewController()
        window.addSubview(vc.view)
        vc.loadView()

        vc.showNotYetImplementedAlert()
        MTKAssertAlertIsPresented(by: vc, style: .alert, title: "Not Yet Implemented", message: "This feature hasn't been implemented yet.", actions: [ExpectedAlertAction(title: "Ok", style: .default)])
    }
    
    func testShowAlertForError() {
        
        let error = NSError(domain: "Unit Test", code: 999, userInfo: [NSLocalizedDescriptionKey: "A localized description"])
        
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        let vc = UIViewController()
        window.addSubview(vc.view)
        vc.loadView()
        
        vc.showAlert(for: error)
        MTKAssertAlertIsPresented(by: vc, style: .alert, title: "Web Error", message: "A localized description", actions: [ExpectedAlertAction(title: "Ok", style: .default)])
        vc.dismiss(animated: true, completion: nil)
        
        let myAction = UIAlertAction(title: "Title", style: .default, handler: nil)
        vc.showAlert(for: error, actions: [myAction])
        MTKAssertAlertIsPresented(by: vc, style: .alert, title: "Web Error", message: "A localized description", actions: [ExpectedAlertAction(title: "Ok", style: .default)])
    }
}
