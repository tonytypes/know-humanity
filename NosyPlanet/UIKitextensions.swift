//
//  UIKitextensions.swift
//  ParseStarterProject
//
//  Created by Tony Ruiz on 3/19/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
    
    func pinToSuperviewEdgesWithInsets(insets: UIEdgeInsets) {
        if let superview = self.superview {
            self.frame = superview.frame
            self.setTranslatesAutoresizingMaskIntoConstraints(false)
            // Will need to be an if statement once I'm loading multiple nibs
            let top = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: superview, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: insets.top)
            let right = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: superview, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: insets.right)
            let left = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: superview, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: insets.left)
            superview.addConstraints([top, left, right])
        }
    }
    
}
