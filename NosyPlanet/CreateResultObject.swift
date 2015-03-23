//
//  CreateResultObject.swift
//  ParseStarterProject
//
//  Created by Tony Ruiz on 3/20/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class CreateResultObject: NSObject {

    /*
    
        // TEST: Create a resultObject with the array of dictionaries needed
    
    // Set vars for question and answers
    let question = "Have you ever stolen (even something small)?"
    let firstAnswer: String = "Yes"
    let secondAnswer: String = "No"
    
    
    // Create the resultObject array and dictionarie(s)
    // var resultObject = [String: NSObject]()
    
    func setup() -> [String: NSObject] {
        
        var resultObject = [String: NSObject]()
        
        let resultTotal = [
            "firstAnswer":[
                "title":firstAnswer,
                "num":0.6,
                "desc":"have done it"
            ],
            "secondAnswer":[
                "title":secondAnswer,
                "num":0.4,
                "desc":"are angels"
            ],
            "desc":"Most people said Yes"
        ]
        resultObject["total"] = resultTotal
        // end the zeroeth array item
        
        let resultLikelihood = [
            "most_likely_desc":"Females 13-17 were most likely to answer Yes",
            "most_likely_num":"89%",
            "least_likely_desc":"Males 55+ were least likely to answer Yes",
            "least_likely_num":"2%"
        ]
        resultObject["likelihood"] = resultLikelihood
        // end the first array item
        
        let resultGender = [
            "males":[
                "firstAnswer":[
                    "title":firstAnswer,
                    "num":0.1
                ],
                "secondAnswer":[
                    "title":secondAnswer,
                    "num":0.9
                ]
            ],
            "females":[
                "firstAnswer":[
                    "title":firstAnswer,
                    "num":0.8
                ],
                "secondAnswer":[
                    "title":secondAnswer,
                    "num":0.2
                ]
            ]
        ]
        resultObject["gender"] = resultGender
        // end the second array item
        
        
        let resultAge = [
            "13-17":[
                "firstAnswer":[
                    "title":firstAnswer,
                    "num":0.75
                ],
                "secondAnswer":[
                    "title":secondAnswer,
                    "num":0.25
                ]
            ],
            "18-24":[
                "firstAnswer":[
                    "title":firstAnswer,
                    "num":0.7
                ],
                "secondAnswer":[
                    "title":secondAnswer,
                    "num":0.3
                ]
            ],
            "25-34":[
                "firstAnswer":[
                    "title":firstAnswer,
                    "num":0.6
                ],
                "secondAnswer":[
                    "title":secondAnswer,
                    "num":0.4
                ]
            ],
            "35-54":[
                "firstAnswer":[
                    "title":firstAnswer,
                    "num":0.3
                ],
                "secondAnswer":[
                    "title":secondAnswer,
                    "num":0.7
                ]
            ],
            "55+":[
                "firstAnswer":[
                    "title":firstAnswer,
                    "num":0.25
                ],
                "secondAnswer":[
                    "title":secondAnswer,
                    "num":0.75
                ]
            ]
        ]
        resultObject["age"] = resultAge
        // end the third array item
        
        let resultSurprising = [
            "desc":"Males and females 35-54 were just as likely to answer Yes"
        ]
        resultObject["surprising"] = resultSurprising
        // end fourth array item
        
        return resultObject
    }
    
    func saveObject(resultObject:[String: NSObject]) {
        // Declare variable for the pointer that will go in resultFor column
        let resultFor = PFObject(withoutDataWithClassName:"Question", objectId:"SfjfegusPV")
        let passedResultObject = resultObject
        
        var result = PFObject(className:"Result")
        result.setObject(passedResultObject, forKey: "resultObject")
        result["resultFor"] = resultFor
        result.saveInBackgroundWithBlock {
            (success: Bool, error: NSError!) -> Void in
            if (success) {
                // The object has been saved.
                println("The object has been saved")
                println(passedResultObject)
            } else {
                // There was a problem, check error.description
                println("Problem. Object wasn't saved.")
            }
        }
    }
    
    */

}
