//
//  UIStoryboard+Extensions.swift
//  DPKitchenSink
//
//  Created by Drew Pitchford on 6/29/18.
//

import Foundation

extension UIStoryboard {
    
    public static func popoverViewController() -> PopoverViewController {
        
        let bundle = Bundle(for: PopoverViewController.self)
        let storyboard = UIStoryboard(name: "Popover", bundle: bundle)
        guard let popoverVC = storyboard.instantiateInitialViewController() as? PopoverViewController else {
            
            log("Something went horribly wrong. Contact the maintainer of DPKitchenSink")
            fatalError("Something went horribly wrong. Contact the maintainer of DPKitchenSink")
        }
        
        return popoverVC
    }
}
