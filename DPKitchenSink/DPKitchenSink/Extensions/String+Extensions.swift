//
//  String+Extensions.swift
//  DPKit
//
//  Created by Drew Pitchford on 6/27/18.
//

import Foundation

extension String: PopoverDisplayable {
    
    public var displayText: String {
        
        return self
    }
    
    public func isValid(givenMaxLength max: Int) -> Bool {
        
        return self.count <= max
    }
}
