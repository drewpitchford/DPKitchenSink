//Copyright © mSIGNIA, Incorporated, 2007.  All rights reserved.
//
//Software is protected by one or more of U.S. Patent No. 9,559,852, 9294448, 8,817,984,
//international patents and others pending. For more information see www.mSIGNIA.com.  User agrees
//that they will not them self, or through any affiliate, agent or other third-party, entity or
//other business structure remove, alter, cover or obfuscate any copyright notices or other
//proprietary rights notices of mSIGNIA or its licensors.  User agrees that they will not them
//self, or through any affiliate, agent or other third party, entity or other business structure
//(a) reproduce, sell, lease, license or sublicense this software or any part thereof, (b)
//decompile, disassemble, re-program, reverse engineer or otherwise attempt to derive or modify
//this software in whole or in part, (c) write or develop any derivative software or any other
//software program based upon this software, (d) provide, copy, transmit, disclose, divulge, or
//make available to, or permit use of this software by any third party or entity or machine without
//software owner's prior written consent, (e) circumvent or disable any security or other
//technological features or measures used by this software.
//
//  PopoverViewController.swift
//  3ds-v2-ios-merchant-demo
//
//  Created by Drew Pitchford on 4/5/17.
//
//

import UIKit

public protocol PopoverViewControllerDelegate: class {
    
    func displayableItemSelected(_ item: PopoverDisplayable)
}

public class PopoverViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var popoverTableView: UITableView!
    
    // MARK: - Properties
    public weak var delegate: PopoverViewControllerDelegate?
    public var cellsAreSelectable = true
    public var cellTextAlignment: NSTextAlignment = .center
    public var allowKeyboardNavigation = true
    var popoverData: [PopoverDisplayable]!
    var contentWidth: CGFloat!
    private var tableNavigator: TableNavigator?
    public override var keyCommands: [UIKeyCommand]? {
        
        set {}
        get {
            
            return tableNavigator?.possibleKeyCommands
        }
    }
    
    // MARK: - Constants
    private let cellHeight: CGFloat = 44
    
    // MARK: - Lifecycle
    override public func viewDidLoad() {
        
        super.viewDidLoad()
        
        log("Showing popover")
        
        assertDependenciesHaveBeenInjected([popoverData])
        navigationController?.isNavigationBarHidden = true
        popoverTableView.estimatedRowHeight = cellHeight
        view.backgroundColor = DPKitchenSinkThemeManager.shared.currentPopoverTheme.backgroundColor
        
        // KVO
        popoverTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        
        // Table Navigator
        if allowKeyboardNavigation {
        
            tableNavigator = TableNavigator(tableView: popoverTableView, delegate: self)
        }
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        
        popoverTableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    public func inject(_ data: [PopoverDisplayable], preferredWidth: PopoverWidth) {
        
        popoverData = data
        contentWidth = preferredWidth.presentationWidth
    }
    
    // MARK: - KVO Handlers
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        preferredContentSize = CGSize(width: contentWidth, height: popoverTableView.contentSize.height)
    }
    
    // MARK: - Overrides
    public override func target(forAction action: Selector, withSender sender: Any?) -> Any? {
        
        guard let target = tableNavigator?.target(forKeyCommandAction: action) else {
            
            return super.target(forAction: action, withSender: sender)
        }
        
        return target
    }
}

// MARK: - UITableViewDelegate methods
extension PopoverViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return popoverData.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: PopoverTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let displayableItem = popoverData[indexPath.row]
        let isFocused = tableNavigator?.indexPathForFocusedRow == indexPath
        cell.setup(with: displayableItem, isSelectable: cellsAreSelectable, textAlignment: cellTextAlignment, isFocused: isFocused)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        cellChosen(at: indexPath)
    }
    
    // MARK: - Helpers
    func cellChosen(at indexPath: IndexPath) {
        
        guard cellsAreSelectable else {
            
            return
        }
        
        fireSelectionFeedback()
        
        popoverTableView.deselectRow(at: indexPath, animated: false)
        let item = popoverData[indexPath.row]
        delegate?.displayableItemSelected(item)
        
        dismiss(animated: true, completion: nil)
    }
}

extension PopoverViewController: TableNavigatorDelegate {
    
    
    public func tableNavigator(_ navigator: TableNavigator, commitFocusedRowAt indexPath: IndexPath) {
        
        cellChosen(at: indexPath)
    }
    
    public func tableNavigator(_ navigator: TableNavigator, didUpdateFocus focusUpdate: TableNavigator.FocusUpdate, completedNavigationWith context: TableNavigator.NavigationCompletionContext) {
        
        popoverTableView.reloadRows(at: focusUpdate.indexPathsForChangedRows, with: .automatic)
    }
}
