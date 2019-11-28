//
//  UIViewExt.swift
//  goalpost-app
//
//  Created by Nikita Koniukh on 25/11/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import UIKit

extension UIView {
    func bindToKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWillChange(_ notification: NSNotification) {
        
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let startingFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = endingFrame.origin.y - startingFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
    
    
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        let view = UIView()
        if let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            print(keyboardRect.height)
            
            let newRect = CGRect(x: 0, y: view.frame.height - keyboardRect.height - 100, width: keyboardRect.width, height: 100)
            let rectLayer = CAShapeLayer()
            rectLayer.path = CGPath(rect: newRect, transform: nil)
            rectLayer.strokeColor = UIColor.red.cgColor
            rectLayer.lineWidth = 5
            view.layer.addSublayer(rectLayer)

        }
    }
}


