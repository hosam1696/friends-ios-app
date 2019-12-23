//
//  UIBtnExt.swift
//  goalpost
//
//  Created by Hosam Elnabawy on 12/23/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import UIKit


extension UIView {
    
    
    func bindToKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIWindow.keyboardWillShowNotification, object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillChange(_ notification: Notification) {
        print("Notiifcation User Info \(notification.userInfo!)")
        let duration = notification.userInfo![UIWindow.keyboardAnimationDurationUserInfoKey] as! Double
        
        let curve = notification.userInfo![UIWindow.keyboardAnimationCurveUserInfoKey] as! UInt
        
        let startingFrame = (notification.userInfo![UIWindow.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFrame = (notification.userInfo![UIWindow.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        
        let deltaY = endingFrame.origin.y - startingFrame.origin.y
        
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
        
    }
    
}
