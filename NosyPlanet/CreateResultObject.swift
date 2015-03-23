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

    
        // TEST: Create a resultObject with the array of dictionaries needed
    
    // Set vars for question and answers
    let question = "Have you ever stolen (even something small)?"
    let highAnswer: String = "Yes"
    let lowAnswer: String = "No"
    // highAnswer will either be the firstAnswer or secondAnswer
    
    // Create the resultObject array and dictionarie(s)
    // var resultObject = [String: NSObject]()
    
    func setup() -> [String: NSObject] {
        
        var resultObject = [String: NSObject]()
        
        let resultTotal = [
            "highAnswer":[
                "title":highAnswer,
                "num":0.6,
                "desc":"have done it"
            ],
            "lowAnswer":[
                "title":lowAnswer,
                "num":0.4,
                "desc":"are angels"
            ],
            "desc":"Most people said Yes"
        ]
        resultObject["total"] = resultTotal
        // end dicti item
        
        let resultLikelihood = [
            "most_likely_desc":"Females 13-17 were most likely to answer Yes",
            "most_likely_num":"89%",
            "least_likely_desc":"Males 55+ were least likely to answer Yes",
            "least_likely_num":"2%"
        ]
        resultObject["likelihood"] = resultLikelihood
        // end dicti item
        
        let resultGender = [
            "males":[
                "highAnswer":[
                    "title":highAnswer,
                    "num":0.1
                ],
                "lowAnswer":[
                    "title":lowAnswer,
                    "num":0.9
                ]
            ],
            "females":[
                "highAnswer":[
                    "title":highAnswer,
                    "num":0.8
                ],
                "lowAnswer":[
                    "title":lowAnswer,
                    "num":0.2
                ]
            ]
        ]
        resultObject["gender"] = resultGender
        // end dicti item

        var resultAge = [String: NSObject]()
        
        let resultAgeThirteen = [
            "highAnswer":[
                "title":highAnswer,
                "num":0.75
            ],
            "lowAnswer":[
                "title":lowAnswer,
                "num":0.25
            ]
        ]
        resultAge["13-17"] = resultAgeThirteen
        
        let resultAgeEighteen = [
            "highAnswer":[
                "title":highAnswer,
                "num":0.7
            ],
            "lowAnswer":[
                "title":lowAnswer,
                "num":0.3
            ]
        ]
        resultAge["18-24"] = resultAgeThirteen
        
        let resultAgeTwentyFive = [
            "highAnswer":[
                "title":highAnswer,
                "num":0.6
            ],
            "lowAnswer":[
                "title":lowAnswer,
                "num":0.4
            ]
        ]
        resultAge["25-34"] = resultAgeTwentyFive

        let resultAgeThirtyFive = [
            "highAnswer":[
                "title":highAnswer,
                "num":0.3
            ],
            "lowAnswer":[
                "title":lowAnswer,
                "num":0.7
            ]
        ]
        resultAge["35-54"] = resultAgeThirtyFive
        
        let resultAgeFiftyFive = [
            "highAnswer":[
                "title":highAnswer,
                "num":0.25
            ],
            "lowAnswer":[
                "title":lowAnswer,
                "num":0.75
            ]
        ]
        resultAge["55+"] = resultAgeFiftyFive
        
        resultObject["age"] = resultAge
        // end dicti item

        let resultSurprising = [
            "desc":"Males and females 35-54 were just as likely to answer Yes"
        ]
        resultObject["surprising"] = resultSurprising
        // end dicti item
        
        return resultObject
    }
    
    func saveObject(resultObject:[String: NSObject]) {
        // Declare variable for the pointer that will go in resultFor column
        let resultFor = PFObject(withoutDataWithClassName:"Question", objectId:"SfjfegusPV")
        let passedResultObject = resultObject
        var result = PFObject(className:"Result")
        result.setObject(passedResultObject, forKey: "resultObject") // orig. resultObject
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

}
