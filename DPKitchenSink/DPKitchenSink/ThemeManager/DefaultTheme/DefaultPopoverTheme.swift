//
//  DefaultTheme.swift
//  DPKitchenSink
//
//  Created by Drew Pitchford on 6/29/18.
//

import Foundation

class DefaultPopoverTheme: PopoverThemeable {
    
    // MARK: - Properties
    var backgroundColor: UIColor
    var font: UIFont
    var textColor: UIColor
    
    // MARK: - Lifecycle
    init() {
        
        backgroundColor = .white
        font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        textColor = .black
    }
}
