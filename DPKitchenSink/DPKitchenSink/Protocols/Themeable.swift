//
//  Themeable.swift
//  DPKitchenSink
//
//  Created by Drew Pitchford on 6/29/18.
//

import Foundation

public protocol Themeable {
    
    var backgroundColor: UIColor { get }
    var font: UIFont { get }
    var textColor: UIColor { get }
}
