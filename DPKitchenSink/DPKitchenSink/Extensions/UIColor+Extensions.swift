//
//  UIColor+Extensions.swift
//  DPKit
//
//  Created by Drew Pitchford on 6/27/18.
//

import Foundation
import UIKit

extension UIColor {
    
    public class func customColor(withRed red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}
