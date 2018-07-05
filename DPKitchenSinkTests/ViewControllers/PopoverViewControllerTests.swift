//
//  UIPopoverViewControllerTests.swift
//  DPKitchenSinkTests
//
//  Created by Drew Pitchford on 6/28/18.
//

import XCTest
@testable import DPKitchenSink

class PopoverViewControllerTests: XCTestCase {
    
    // MARK: - Properties
    var testVC: PopoverViewController!
    var didSelectExpectation: XCTestExpectation!
    
    // MARK: - Setup
    override func setUp() {
        
        super.setUp()
        
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        
        let storyboard = UIStoryboard(name: "Popover", bundle: Bundle(for: PopoverViewController.self))
        guard let initialScene = storyboard.instantiateInitialViewController() as? PopoverViewController else {
            
            log("Could not get initial scene")
            return
        }
        
        testVC = initialScene
        testVC.inject(["1", "2", "3", "4", "5"], preferredWidth: .narrow)
        window.addSubview(testVC.view)
        
        testVC.loadView()
        testVC.viewDidLoad()
        testVC.viewWillAppear(true)
    }
    
    // MARK: - Tests
    func testPopoverWidth() {
        
        var width: PopoverWidth = .narrow
        XCTAssertEqual(width.presentationWidth, UIScreen.main.bounds.size.width * width.rawValue)
        
        width = .medium
        XCTAssertEqual(width.presentationWidth, UIScreen.main.bounds.size.width * width.rawValue)
        
        width = .wide
        XCTAssertEqual(width.presentationWidth, UIScreen.main.bounds.size.width * width.rawValue)
    }
    
    func testContentHeight() {
        
        let _ = testVC.contentHeight
        XCTAssertFalse(testVC.popoverTableView.isScrollEnabled)
        
        testVC.popoverData.append("6")
        let _ = testVC.contentHeight
        XCTAssertTrue(testVC.popoverTableView.isScrollEnabled)
        
        XCTAssertEqual(testVC.preferredContentSize.width, UIScreen.main.bounds.size.width * 0.3)
        
        testVC.popoverData.remove(at: 0)
    }
    
    func testNumberOfRows() {
        
        XCTAssertEqual(testVC.popoverData.count, testVC.tableView(testVC.popoverTableView, numberOfRowsInSection: 0))
    }
    
    func testCellForRow() {
        
        let reloadExpectation = expectation(description: "reload")
        testVC.popoverTableView.reloadData {
            
            guard let cell = self.testVC.tableView(self.testVC.popoverTableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? PopoverTableViewCell else {
                
                XCTFail("Failed to get cell")
                return
            }
            
            XCTAssertEqual(cell.displayLabel.text, self.testVC.popoverData.first?.displayText)
            reloadExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 2.0, handler: nil)
    }
    
    func testDidSelect() {
        
        testVC.delegate = self
        self.didSelectExpectation = expectation(description: "didSelect")
        testVC.popoverTableView.reloadData {
            
            self.testVC.tableView(self.testVC.popoverTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        }
        
        waitForExpectations(timeout: 2.0, handler: nil)
    }
}

// MARK: - PopoverDelegate
extension PopoverViewControllerTests: PopoverViewControllerDelegate {
    
    func displayableItemSelected(_ item: PopoverDisplayable) {
        
        didSelectExpectation.fulfill()
    }
}
