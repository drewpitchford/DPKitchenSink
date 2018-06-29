//
//  UITextField+Extensions.swift
//  DPKit
//
//  Created by Drew Pitchford on 6/27/18.
//

import Foundation
import UIKit
import SwifterSwift

private var kAssociationKeyNextField: UInt8 = 0

extension UITextField {
    
    // MARK: - Validators
    public var containsValidEmail: Bool {
        
        let fullEmailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let domainlessEmailRegex = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z._%+-]{1,}"
        
        let fullEmailPredicate = NSPredicate(format: "SELF MATCHES %@", fullEmailRegex).evaluate(with: text) && text != nil && !isEmpty
        let domainlessEmailPredicate = NSPredicate(format: "SELF MATCHES %@", domainlessEmailRegex).evaluate(with: text) && text != nil && !isEmpty
        
        return fullEmailPredicate || domainlessEmailPredicate
    }
}
