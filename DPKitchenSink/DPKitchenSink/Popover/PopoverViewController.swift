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
    var popoverData: [PopoverDisplayable]!
    var contentHeight: CGFloat {
        
        let height = min(cellHeight * CGFloat(popoverData.count), cellHeight * 5)
        popoverTableView.isScrollEnabled = cellHeight * CGFloat(popoverData.count) > cellHeight * 5
        return height
    }
    var contentWidth: CGFloat!
    
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
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        preferredContentSize = CGSize(width: contentWidth, height: contentHeight)
    }
    
    public func inject(_ data: [PopoverDisplayable], preferredWidth: PopoverWidth) {
        
        popoverData = data
        contentWidth = preferredWidth.presentationWidth
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
        cell.setup(with: displayableItem)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        fireSelectionFeedback()
        
        tableView.deselectRow(at: indexPath, animated: false)
        let item = popoverData[indexPath.row]
        delegate?.displayableItemSelected(item)
        
        dismiss(animated: true, completion: nil)
    }
}
