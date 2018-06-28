//
//  PopoverWidth.swift
//  DPKit
//
//  Created by Drew Pitchford on 6/27/18.
//

import Foundation

public enum PopoverWidth: CGFloat {
    
    // MARK: Cases
    case narrow = 0.3
    case medium = 0.5
    case wide = 0.8
    
    // MARK: - Computed Vars
    var presentationWidth: CGFloat {
        
        return min(UIScreen.main.bounds.size.width * rawValue, 320)
    }
}
