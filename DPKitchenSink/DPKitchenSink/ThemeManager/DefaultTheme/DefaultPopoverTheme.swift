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
    var focusTextColor: UIColor
    var focusBackgroundColor: UIColor
    
    // MARK: - Lifecycle
    init() {
        
        backgroundColor = .white
        font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        textColor = .black
        focusBackgroundColor = UIColor.customColor(withRed: 245, green: 247, blue: 249)
        focusTextColor = .black
    }
}
