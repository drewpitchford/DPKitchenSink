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
//  UIViewController+Extensions.swift
//  ThreeDSStoreDemo
//
//  Created by Drew Pitchford on 6/26/17.
//  Copyright © 2017. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController: TapticFeedbackable {
    
    // MARK: Injection
    public func assertDependenciesHaveBeenInjected(_ dependencies: [Any?], file: String = #file, function: String = #function) {
        
        for dependency in dependencies {
            
            guard let _ = dependency else {
                
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                    
                    fatalError("Missing injection in \(file)::\(function)")
                })
                
                showAlert(withTitle: "VC Injection Error", message: "Missing injection in \(file)::\(function). Pressing Ok will kill the app. Please contact the app developer with this info", actions: [okAction])
                return
            }
        }
    }
    
    // MARK: - Setup
    public func setUpNavBarForLargeTitle(using largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode = .always) {
        
        if #available(iOS 11.0, *) {
            
            navigationItem.largeTitleDisplayMode = largeTitleDisplayMode
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
    
    // MARK: - Show Alerts
    public func showNotYetImplementedAlert() {
        
        showOkAlert(withTitle: "Not Yet Implemented", andMessage: "This feature hasn't been implemented yet.")
    }
    
    public func showAlert(for error: Error, actions: [UIAlertAction]? = nil) {
        
        guard actions == nil else {
            
            showAlert(withTitle: "Web Error", message: error.localizedDescription, actions: actions)
            return
        }
        
        showOkAlert(withTitle: "Web Error", andMessage: error.localizedDescription)
    }
    
    private func showOkAlert(withTitle title: String, andMessage message: String) {
        
        let alert = createAlert(withTitle: title, message: message)
        addOkAction(to: alert)
        
        present(alert, animated: true, completion: nil)
    }
    
    public func showAlert(withTitle title: String = "", message: String, actions: [UIAlertAction]? = nil) {
        
        if let actions = actions {
            
            let alert = createAlert(withTitle: title, message: message)
            
            for action in actions {
                
                alert.addAction(action)
            }
        
            present(alert, animated: true, completion: nil)
        }
        else {
            
            showOkAlert(withTitle: title, andMessage: message)
        }
    }
    
    // MARK: - Private Alert Helpers
    private func createAlert(withTitle title: String, message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        return alert
    }
    
    private func addOkAction(to alert: UIAlertController) {
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
    }
}

// MARK: - PopoverDelegate
extension UIViewController: UIPopoverPresentationControllerDelegate {
    
    // for iOS 8 - 9.2
    open func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        
        return .none
    }
    
    // for iOS 9.3 and up
    open func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        
        return .none
    }
}
