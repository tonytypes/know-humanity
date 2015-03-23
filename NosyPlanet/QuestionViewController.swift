//
//  QuestionViewController.swift
//  QandA
//
//  Created by trvslhlt on 3/11/15.
//  Copyright (c) 2015 travis holt. All rights reserved.
//

import UIKit
import Parse

class QuestionViewController: QRParentViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var bodyView: BodyView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Latest Question"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: (25/255), green: (118/255), blue: (210/255), alpha: 1.0)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "methodOFReceivedNotication:", name:"didTapSubmitButton", object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.headerView.loadHeaderView("Question", todaysQuestionId: self.todaysQuestionId, resultOfYesterdayId: self.resultOfYesterdayId)
        self.bodyView.loadBodyView("Question", todaysQuestionId: self.todaysQuestionId, resultOfYesterdayId: self.resultOfYesterdayId)
    }
    
    func methodOFReceivedNotication(notification: NSNotification){
//        self.viewToShow = "Result"
        self.performSegueWithIdentifier("showResultVCLater", sender: self)
    }
    
}


/*-------------------------------
This is all of my test code for Parse.com queries.
    
    

//    var result: PFObject?
//    var syncTest: String?
    
    func displayObject(result: PFObject) {
        println("In function:\n\(result)")
    }
    
    override func viewDidLoad() {
        
        //// What will need to happen
        // Check if logged in.
            // If NO: Show login
            // If YES:
                // Check if user has answered yesterday's question:
                    // If NO: Show today's question
                    // If YES:
                        // Check if yesterday's result is available:
                            // If NO: Display some kind of placeholder (for short window between answer submissions closing, and when the result is posted after calculations
                            // If YES: Display yesterday's result
        // Somewhere, need to deal with network connection issues
        
        
        super.viewDidLoad()
        // saveObject(setup())
        getResult("SfjfegusPV") // questionId // This will also displayResult
//        println(self.result)
//        println(self.syncTest)

        //// CRAP! This will run okay, but I can't make this work with returns. CRAP.
        
        // var result = getResult("SfjfegusPV") as [String: NSObject]
        // println("Result: \(result)")
//        for key in result.keys {
//            println("Key: \(key)")
//        }
    }


    /*
    //// This is the synchronous version
    func getResult(questionId: String) {
        
        
        func showResult(resultObject: PFObject) /* -> [PFObject]*/ {
            println("Results for yesterday's question were retrieved.")
            // return resultObject["resultObject"] as (PFObject)
            println(resultObject["answer"])
            // return resultObject
        }
        
        var resultQuery = PFQuery(className:"Response")
        resultQuery.whereKey("answeredFor", equalTo: PFObject(withoutDataWithClassName:"Question", objectId:questionId))
        var objects = resultQuery.findObjects(NSErrorPointer())
        
            
        
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects.count) responses.")
                if objects.count == 0 {
                    // function to run if this user DID NOT answer this question
                    // show today's question
                    println("Didn't find any objects")
                } else {
                    // function to run if this user DID answer this question
                    // show results of yesterday's question
                    
                    // Do something with the found objects.
                    if let objects = objects as? [PFObject] {
                        for object in objects {
                            //                            println(object.objectId)
                            //                            println(object)
                            // showResult(object)
                            self.result = object
                            self.syncTest = "Here is the result of the sync test"
                        }
                    }
                }
                
            } else {
                // Log details of the failure
                println("Error: \(error) \(error.userInfo!)")
            }
        }
    }
    */
    

    //// This is asynchronous
    
    // Retrieve the Result
    func getResult(questionId: String) {
        
        var resultObject: PFObject?
        
//        let showResult = { () -> () in
//            println("Results for yesterday's question were retrieved.")
//            // return resultObject["resultObject"] as (PFObject)
//            println(object["answer"])
//            resultObject = object
//        }
        
        var resultQuery = PFQuery(className:"Response")
        resultQuery.whereKey("answeredFor", equalTo: PFObject(withoutDataWithClassName:"Question", objectId:questionId))
        resultQuery.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects.count) responses.")
                if objects.count == 0 {
                    // function to run if this user DID NOT answer this question
                    // show today's question
                    println("Didn't find any objects")
                } else {
                    // function to run if this user DID answer this question
                    // show results of yesterday's question
                    
                    // Do something with the found objects.
                    if let objects = objects as? [PFObject] {
                        for object in objects {
//                            println(object.objectId)
//                            println(object)
                            resultObject = object
                            // self.result = object
                            // self.syncTest = "Here is the result of the sync test"
                        }
                    }
                }
            
                dispatch_async(dispatch_get_main_queue(), {
                    if let r = resultObject {
                        self.displayObject(r)
                    }
                })
                
            } else {
                // Log details of the failure
                println("Error: \(error) \(error.userInfo!)")
            }
        }
//        if let r = resultObject {
//            return r
//        }
//        return nil
    }
    
    
    
    
    
    

    
    
    
    
        /*
        // Check for existence of Response for one Question by currentUser. (Mark it with a bool variable.)
        var questionId = "SfjfegusPV" // ID of today's question
        var user = PFUser.currentUser()
        var didAnswerQuestion: Bool?
        
        // Func to run if this user DID NOT answer today's question
        func showQuestion() {
            println("User has not yet answered today's question")
        }
        
        // Func to run if this user DID answer today's question
        func showResult(object:PFObject) {
            println("User has already answered today's question")
            println(object.objectId)
        }
        
        var responseQuery = PFQuery(className:"Response")
        responseQuery.whereKey("answeredFor", equalTo: PFObject(withoutDataWithClassName:"Question", objectId:questionId))
        responseQuery.whereKey("answeredBy", equalTo:user)
        responseQuery.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects.count) responses.")
                if objects.count == 0 {
                    didAnswerQuestion = false
                    // function to run if this user DID NOT answer this question
                    // show today's question
                    showQuestion()
                } else {
                    didAnswerQuestion = true
                    // function to run if this user DID answer this question
                    // show results of yesterday's question
                    
                    // Do something with the found objects.
                    if let objects = objects as? [PFObject] {
                        for object in objects {
//                            println(object.objectId)
//                            println(object)
                            showResult(object)
                        }
                    }
                }

            } else {
                // Log details of the failure
                println("Error: \(error) \(error.userInfo!)")
            }
        }
        */
    
    
    
        
        // Retrieve one Question (using QuestionId)
        /*
        // This is the question I want users to answer
        var questionId = "BPd15JqiPt" // ID of today's question
        
        var questionQuery = PFQuery(className:"Question")
        questionQuery.getObjectInBackgroundWithId(questionId) {
            (question: PFObject!, error: NSError!) -> Void in
            if error == nil && question != nil {
                println(question)
            } else {
                println(error)
            }
        }
        */
        
    
    
    
        // Create one Response
        /*
        var answeredFor = PFObject(withoutDataWithClassName:"Question", objectId:"SfjfegusPV")
        
        var response = PFObject(className:"Response")
        response["answer"] = "Yes"
        response["answeredFor"] = answeredFor
        response["answeredBy"] = PFUser.currentUser()
        // saveInBackground() would work too. Rudd showed us.
        response.saveInBackgroundWithBlock {
            (success: Bool, error: NSError!) -> Void in
            if (success) {
                // The object has been saved.
                println("The object has been saved")
            } else {
                // There was a problem, check error.description
                println("Problem. Object wasn't saved.")
            }
        }
        */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
*/
