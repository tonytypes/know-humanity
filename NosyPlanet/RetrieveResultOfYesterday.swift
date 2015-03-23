//
//  RetrieveResultOfYesterday.swift
//  ParseStarterProject
//
//  Created by Tony Ruiz on 3/16/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse
import SwiftyJSON

class RetrieveResultOfYesterday: NSObject {
   
    var json: NSDictionary?
    
    func resultOfYesterdayQuestion(resultOfYesterdayId: String, completionHandler: ((String) -> Void)) {
        
        var query = PFQuery(className:"Question")
        query.whereKey("objectId", equalTo: resultOfYesterdayId)
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            // The find succeeded.
            var resultOfYesterdayQuestion = String()
            println("Successfully retrieved \(objects.count) responses.")
            if objects.count == 0 {
                // function to run if the object wasn't found
                println("Result object was not present")
            } else {
                // function to run if object was found
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        println("Result object was present")
                        resultOfYesterdayQuestion = object["question"] as String
                    }
                }
            }
            completionHandler(resultOfYesterdayQuestion)
        }
        
    }
    
    
    func parsedResultOfYesterdayObject(resultOfYesterdayId: String, completionHandler: ((resultTotal: [String: NSObject], resultGender: [String: NSObject], resultAge: [String: NSObject], resultLikelihood: [String: NSObject], resultSurprising: [String: NSObject]) -> Void)) {
    
        var query = PFQuery(className:"Result")
        query.whereKey("resultFor", equalTo: PFObject(withoutDataWithClassName:"Question", objectId:resultOfYesterdayId))
        query.getFirstObjectInBackgroundWithBlock { (object, error) -> Void in
            // The find succeeded.
            var resultTotal = [String: NSObject]()
            var resultGender = [String: NSObject]()
            var resultAge = [String: NSObject]()
            var resultLikelihood = [String: NSObject]()
            var resultSurprising = [String: NSObject]()
//            println("Successfully retrieved \(object) responses, from the parsedResultOfYesterdayObject func.")
            if object == 0 {
                // function to run if the object wasn't found
                println("Result object was not present")
            } else {
                // function to run if object was found
                var resultObject = object["resultObject"] as? [String: NSObject] // or as? [String: AnyObject]
//                println(resultObject)
                if let r = resultObject {
                    let json = JSON(r)
                    resultTotal = json["total"].object as [String: NSObject]
                    resultGender = json["gender"].object as [String: NSObject]
                    resultAge = json["age"].object as [String: NSObject]
                    resultLikelihood = json["likelihood"].object as [String: NSObject]
                    resultSurprising = json["surprising"].object as [String: NSObject]
                }
            }
            completionHandler(resultTotal: resultTotal, resultGender: resultGender, resultAge: resultAge, resultLikelihood: resultLikelihood, resultSurprising: resultSurprising)
        }
    }
}
/*
CODE THAT WOULD ONLY RETURN NIL FOR PRINTLN(QUERY...)

        var innerQuery = PFQuery(className:"Result")
        innerQuery.includeKey("resultFor")
        innerQuery.includeKey("resultFor.objectId")
        innerQuery.whereKey("resultFor", equalTo: PFObject(withoutDataWithClassName:"Question", objectId:resultOfYesterdayId))
        
        println(innerQuery.findObjects())
        
        var query = PFQuery(className:"Question")
        query.whereKey("objectId", matchesKey: "resultFor.objectId", inQuery: innerQuery)
        println(query.findObjects())

*/
