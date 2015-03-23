//
//  QuestionBodyView.swift
//  ParseStarterProject
//
//  Created by Tony Ruiz on 3/19/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class QuestionBodyView: BodyView {
   
    var answerSelected = String()
    var bw = NSLayoutConstraint()
    var bh = NSLayoutConstraint()
    var bYCenter = NSLayoutConstraint()
    var bXFirstButton = NSLayoutConstraint()
    var bXSecondButton = NSLayoutConstraint()
    // just added
    var todaysQuestionId = String()
    
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var firstAnswerLeftBox: UIView!
    @IBOutlet weak var secondAnswerLeftBox: UIView!
    @IBOutlet weak var submitButton: UIButton!
    @IBAction func didTapSubmitButton(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("didTapSubmitButton", object: nil)
        // More code
    }
    
    @IBAction func didTapFirstAnswerButton(sender: AnyObject) {
        println("Tapped firstAnswer")
        initiateHoverBox("firstAnswer")
        if let t = firstAnswerButton.titleLabel?.text {
            self.answerSelected = t
            
            // just added
            CreateResponseObject().submit(todaysQuestionId, answer: t)
        }
        self.submitButton.hidden = false
    }
    
    @IBAction func didTapSecondAnswerButton(sender: AnyObject) {
        println("Tapped secondAnswer")
        initiateHoverBox("secondAnswer")
        if let t = secondAnswerButton.titleLabel?.text {
            self.answerSelected = t
            
            // just added
            CreateResponseObject().submit(todaysQuestionId, answer: t)
        }
        self.submitButton.hidden = false
    }
    
    var box = UIView()
    
    func initiateHoverBox(answer: String) {
        
        if self.answerSelected == "" {
            self.box.backgroundColor = UIColor(red: (3/255), green: (169/255), blue: (244/255), alpha: 0.0)
            self.box.layer.borderColor = UIColor(red: (33/255), green: (150/255), blue: (243/255), alpha: 1.0).CGColor
            self.box.layer.borderWidth = CGFloat(5.0)
            self.box.layer.cornerRadius = 3.0
            self.box.layer.shadowColor = UIColor.whiteColor().CGColor
            self.box.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.box.layer.shadowOpacity = 0.5
            self.box.layer.shadowRadius = 6
            self.addSubview(box)
        
            self.box.setTranslatesAutoresizingMaskIntoConstraints(false)
        
            // Constraints for box common to both answers
            var boxWidth: CGFloat = firstAnswerButton.bounds.width+6.0
            var boxHeight: CGFloat = firstAnswerButton.bounds.height+6.0
            
            self.bw = NSLayoutConstraint(item: self.box, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: boxWidth)
            self.bh = NSLayoutConstraint(item: self.box, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: boxHeight)
            self.bYCenter = NSLayoutConstraint(item: self.box, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: firstAnswerButton, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0)
        
            // Constraints for box over first answer
            self.bXFirstButton = NSLayoutConstraint(item: self.box, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: firstAnswerButton, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
            
            // Constraints for box over second answer
            self.bXSecondButton = NSLayoutConstraint(item: self.box, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: secondAnswerButton, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)

        }
    
        if self.answerSelected == "" {
            if answer == "firstAnswer" {
                self.addConstraints([bw, bh, bYCenter, bXFirstButton])
                self.layoutIfNeeded()
//                self.boxIsOn = answer
            } else if answer == "secondAnswer" {
                self.addConstraints([bw, bh, bYCenter, bXSecondButton])
                self.layoutIfNeeded()
//                self.boxIsOn = answer
            }
        } else if self.answerSelected != "" {
            if answer == "firstAnswer" {
                UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: {
                    self.removeConstraint(self.bXSecondButton)
                    self.addConstraint(self.bXFirstButton)
                    self.layoutIfNeeded()
                    }, completion: nil)
            } else if answer == "secondAnswer" {
                UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: {
                    self.removeConstraint(self.bXFirstButton)
                    self.addConstraint(self.bXSecondButton)
                    self.layoutIfNeeded()
                    }, completion: nil)
            }

        }
    
    }
    
    override func awakeFromNib() {
        for layer in [self.firstAnswerLeftBox.layer, self.secondAnswerLeftBox.layer] {
            layer.shadowColor = UIColor.blackColor().CGColor
            layer.shadowOffset = CGSize(width: 0, height: 5)
            layer.shadowOpacity = 0.4
            layer.shadowRadius = 6
        }
        let insets = UIEdgeInsetsMake(5.0, 20.0, 5.0, 5.0)
        for button in [self.firstAnswerButton, self.secondAnswerButton] {
            button.titleEdgeInsets = insets
            button.titleLabel?.numberOfLines = 0
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.titleLabel?.minimumScaleFactor = 0.000001
        }
        self.submitButton.layer.shadowColor = UIColor.blackColor().CGColor
        self.submitButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.submitButton.layer.shadowOpacity = 0.3
        self.submitButton.layer.shadowRadius = 8
        self.submitButton.hidden = true
    }
    
    // In here, call a method that, upon didTap of an answer, submits it to Parse, then unloads the loaded subview(s), and loads the result subview inside of the HeaderView and the BodyView
    
}
