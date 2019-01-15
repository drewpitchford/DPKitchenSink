//
//  Themeable.swift
//  DPKitchenSink
//
//  Created by Drew Pitchford on 6/29/18.
//

import Foundation

public protocol PopoverThemeable {
    
    var backgroundColor: UIColor { get }
    var focusBackgroundColor: UIColor { get }
    var font: UIFont { get }
    var textColor: UIColor { get }
    var focusTextColor: UIColor { get }
    var backgroundVisualEffectView: UIVisualEffectView? { get }
}
