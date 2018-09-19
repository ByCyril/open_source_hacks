//
//  CoolWhip.swift
//
//  Created by Cyril Garcia on 5/21/17.
//  Copyright © 2017 ByCyril. All rights reserved.
//

import UIKit

class CoolWhip {
    
    
    public class func whipViewShowFromTop(myView: UIView, position: CGPoint) {
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            myView.center.y = position.y
            myView.center.x = position.x
            
        }, completion: nil)
        
    }
    
    public class func whipViewOutToTop(myView: UIView) {
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 0.0, options: .curveEaseOut, animations: {
            myView.center.y = -500
            
        }, completion: nil)
    }
    
    public class func whipViewShowFromBottom(myView: UIView, position: CGPoint) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            myView.center.y = position.y
            myView.center.x = position.x
            
        }, completion: nil)
        
    }
    
    public class func whipViewOutToBottom(myView: UIView, superViewSize: UIView) {
      
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: .curveEaseOut, animations: {
            myView.center.y = superViewSize.center.y * 4
            
        }) { (_) in
            myView.removeFromSuperview()
        }
        
    }
}
