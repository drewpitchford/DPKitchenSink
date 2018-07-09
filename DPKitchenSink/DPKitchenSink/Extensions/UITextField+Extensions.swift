//
//  UITextField+Extensions.swift
//  DPKit
//
//  Created by Drew Pitchford on 6/27/18.
//

import Foundation
import UIKit
import SwifterSwift

extension UITextField {
    
    // MARK: - Validators
    public var containsValidEmail: Bool {
        
        guard let text = text else {
            
            return false
        }
        
        let fullEmailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let fullEmailPredicate = NSPredicate(format: "SELF MATCHES %@", fullEmailRegex).evaluate(with: text) && !text.isEmpty
        
        return fullEmailPredicate
    }
    

}
