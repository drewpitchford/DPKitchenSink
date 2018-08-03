//
//  UIView+Extensions.swift
//  DPKit
//
//  Created by Drew Pitchford on 6/27/18.
//

import Foundation
import UIKit
import PureLayout

extension UIView {
    
    // MARK: - Blurring
    public func blur(using effectStyle: UIBlurEffectStyle) {
        
        backgroundColor = .clear
        removeBlurs()
        
        let blurEffect = UIBlurEffect(style: effectStyle)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = bounds
        
        addSubview(blurredEffectView)
        sendSubview(toBack: blurredEffectView)
        blurredEffectView.autoPinEdgesToSuperviewEdges()
        
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyEffectView.frame = bounds
        
        blurredEffectView.contentView.addSubview(vibrancyEffectView)
        vibrancyEffectView.autoPinEdgesToSuperviewEdges()
    }
    
    public func removeBlurs() {
        
        for view in subviews {
            
            if view is UIVisualEffectView {
                
                view.removeFromSuperview()
            }
        }
    }
}
