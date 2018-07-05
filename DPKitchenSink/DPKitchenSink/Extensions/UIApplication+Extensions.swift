//
//  UIApplication+Extensions.swift
//  DPKit
//
//  Created by Drew Pitchford on 6/27/18.
//

import Foundation
import UIKit

extension UIApplication {
    
    public class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            
            return topViewController(nav.visibleViewController)
        }
        else if let tab = base as? UITabBarController,
            let selected = tab.selectedViewController {
            
            return topViewController(selected)
        }
        else if let presented = base?.presentedViewController {
            
            return topViewController(presented)
        }
        
        return base
    }
}
