//
//  HeaderView.swift
//  QandA
//
//  Created by trvslhlt on 3/11/15.
//  Copyright (c) 2015 travis holt. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var label: UILabel!

    
    func loadHeaderView(whatToShow: String, todaysQuestionId: String, resultOfYesterdayId: String) {
        
        if whatToShow == "Question" {
            NSBundle.mainBundle().loadNibNamed("QuestionHeaderView", owner: self, options: nil)
            self.view.backgroundColor = UIColor(red: (33/255), green: (150/255), blue: (243/255), alpha: 1.0)
            self.view.setTranslatesAutoresizingMaskIntoConstraints(false)
            self.addSubview(self.view)
            
            // Run a model that displays today's question
            RetrieveTodaysQuestion().todaysQuestionQuestion(todaysQuestionId, completionHandler: {(todaysQuestionQuestion: String) -> Void in
                self.label.text = todaysQuestionQuestion
                
                
                
            })
        
        } else if whatToShow == "Result" {
            NSBundle.mainBundle().loadNibNamed("ResultHeaderView", owner: self, options: nil)
            self.view.backgroundColor = UIColor(red: (76/255), green: (175/255), blue: (80/255), alpha: 1.0)
            self.view.setTranslatesAutoresizingMaskIntoConstraints(false)
            self.addSubview(self.view)
            
            // Run a Model that displays yesterday's result, modifying code below
            RetrieveResultOfYesterday().resultOfYesterdayQuestion(resultOfYesterdayId, completionHandler: {(resultOfYesterdayQuestion: String) -> Void in
                self.label.text = resultOfYesterdayQuestion
            })
            
        }
        
        // Set constraints for QuestionHeaderView or ResultHeaderView nib
        let left = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
        let right = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0)
         let bottom = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
        self.addConstraints([left, top, right, bottom])
        
        // Make label font size adjust to String length
        self.label.numberOfLines = 0
        self.label.adjustsFontSizeToFitWidth = true
        self.label.minimumScaleFactor = 0.000001
    }
    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
    
        // loadHeaderView()
        
        //    self.setTranslatesAutoresizingMaskIntoConstraints(false)
        //
        //    let top = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        //    let bottom = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        //    let left = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        //    let right = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        //
        //    self.addConstraints([top, bottom, left, right])
//    }

}

