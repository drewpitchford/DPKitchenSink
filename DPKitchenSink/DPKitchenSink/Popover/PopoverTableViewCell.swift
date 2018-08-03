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
//  PopoverTableViewCell.swift
//  3ds-v2-ios-merchant-demo
//
//  Created by Drew Pitchford on 4/5/17.
//
//

import UIKit
import Reusable

class PopoverTableViewCell: UITableViewCell, Reusable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var displayLabel: UILabel!
    
    // MARK: - Setup
    func setup(with displayableItem: PopoverDisplayable) {
        
        setUpUI()
        displayLabel.text = displayableItem.displayText
        accessibilityLabel = displayableItem.displayText
    }
    
    func setUpUI() {
        
        displayLabel.textColor = DPKitchenSinkThemeManager.shared.currentPopoverTheme.textColor
        displayLabel.font = DPKitchenSinkThemeManager.shared.currentPopoverTheme.font
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
}
