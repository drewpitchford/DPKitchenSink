//
//  ThemeManager.swift
//  DPKitchenSink
//
//  Created by Drew Pitchford on 6/29/18.
//

import Foundation

public class DPKitchenSinkThemeManager {
    
    // MARK: - Singleton
    public static let shared = DPKitchenSinkThemeManager()
    
    // MARK: - Properties
    public var currentPopoverTheme: PopoverThemeable
    
    // MARK: - Lifecycle
    init() {
        
        currentPopoverTheme = DefaultPopoverTheme()
    }
}
