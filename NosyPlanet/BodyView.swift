//
//  BodyView.swift
//  ParseStarterProject
//
//  Created by Tony Ruiz on 3/18/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import SwiftyJSON

class BodyView: UIView {

    let maxNumFontSize: CGFloat = 55.0
    
    func loadBodyView(whatToShow: String, todaysQuestionId: String, resultOfYesterdayId: String) {
        if whatToShow == "Question" {
            
            //Retrieve answer options from Parse.com
            RetrieveTodaysQuestion().todaysQuestionAnswers(todaysQuestionId, completionHandler: {(firstAnswerTitle: String, secondAnswerTitle: String) -> Void in
                if let q = QuestionBodyView.loadFromNibNamed("QuestionBodyView", bundle: nil) as? QuestionBodyView {
                    q.firstAnswerButton.setTitle(firstAnswerTitle, forState: UIControlState.Normal)
                    q.secondAnswerButton.setTitle(secondAnswerTitle, forState: UIControlState.Normal)
                    self.addSubview(q)
                    q.pinToSuperviewEdgesWithInsets(UIEdgeInsetsZero)
                }
            })
        
            
        } else if whatToShow == "Result" {
            
            RetrieveResultOfYesterday().parsedResultOfYesterdayObject(resultOfYesterdayId, completionHandler: {(resultTotal: [String: NSObject], resultGender: [String: NSObject], resultAge: [String: NSObject], resultLikelihood: [String: NSObject], resultSurprising: [String: NSObject]) -> Void in
                // println("ResultTotal: \(resultTotal)")
                
                if resultTotal != [:] {
                    // let json = JSON(resultTotal)
//                    var firstAnswer = json["13-17"].object as [String: NSObject]
//                    println(thirteen)
                    
                    if let t = ResultTotalView.loadFromNibNamed("ResultTotalView", bundle: nil) as? ResultTotalView {
                        t.setTranslatesAutoresizingMaskIntoConstraints(false) // Appears that I don't need this, and AutoLayout still works
//                        t.frame = self.frame
                        self.addSubview(t)
                        
                        
                        // Set constraints for ResultTotalView nib
                        let left = NSLayoutConstraint(item: t, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0)
                        let top = NSLayoutConstraint(item: t, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
                        let right = NSLayoutConstraint(item: t, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0)
                        let width = NSLayoutConstraint(item: t, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0)
                        self.addConstraints([left, top, right, width])
                        
                        t.addLabels(resultTotal)

                        
                        
                    }
 
                }
//                let json = JSON(resultTotal)
//                var thirteen = json["13-17"].object as [String: NSObject]
//                println(thirteen)
                // resultTotal = oneresultTotal
                
            })
            
//            NSBundle.mainBundle().loadNibNamed("ResultHeaderView", owner: self, options: nil)
//            
//            self.addSubview(self.view)
//            self.view.frame = self.frame
            
            // Run a Model that displays yesterday's result, modifying code below

            
        }
        
        
    }

    


}
