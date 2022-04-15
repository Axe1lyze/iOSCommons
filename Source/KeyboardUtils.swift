//
//  KeyboardUtils.swift
//  iOSUtils
//
//  Created by Masaharu Tsukamoto on 2022/04/15.
//

import Foundation
import UIKit

class KeyboardControl:NSObject {
    
    static let keyboardNotifications:[NSNotification.Name] = [
        .UIKeyboardWillShow,
        .UIKeyboardWillHide
    ]
    
    let view:UIView
    let bottomMarginConstraint:NSLayoutConstraint
    
    init(view:UIView, bottomMarginConstraint:NSLayoutConstraint) {
        self.view = view
        self.bottomMarginConstraint = bottomMarginConstraint
        super.init()
        KeyboardControl.keyboardNotifications.forEach {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillNotification), name:$0, object: nil)
        }
    }
    
    @objc func keyboardWillNotification(_ notification: Notification) {
        let keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? CGRect.zero
        bottomMarginConstraint.constant = notification.name == NSNotification.Name.UIKeyboardWillShow ?
            keyboardFrame.height - view.safeAreaInsets.bottom: 0
        
    }
}
