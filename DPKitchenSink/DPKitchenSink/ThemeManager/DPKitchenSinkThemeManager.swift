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
    public var currentTheme: Themeable
    
    // MARK: - Lifecycle
    init() {
        
        currentTheme = DefaultTheme()
    }
}
