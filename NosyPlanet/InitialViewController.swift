//
//  InitialViewController.swift
//  KnowHumanity
//
//  Created by Tony Ruiz on 3/22/15.
//  Copyright (c) 2015 Tony Ruiz. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    // Below 2 vars will be omitted once they can be determined with Parse.com, maybe in the same query to Result Parse class?
    var resultOfYesterdayId: String = "SfjfegusPV" // This is the question objectId (referenced in the "answeredFor" column) of the result object. It's the result that is scheduled for display today
//    var todaysQuestionId: String = "SfjfegusPV" // To test result view, I've made todaysQuestionId same as resultOfYesterdayId
    var todaysQuestionId: String = "BPd15JqiPt"
    
    var viewToShow: String? // Determined by CheckForResponse method
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        //printFonts()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        //        let resultObject = CreateResultObject().setup()
        //        CreateResultObject().saveObject(resultObject)        
        
        // Run a model that syncronously checks for presence of result
        CheckForResponse().responseIsPresent(self.todaysQuestionId, completionHandler: {(present: Bool) -> Void in
            if present == true {
                self.viewToShow = "Result"
                self.performSegueWithIdentifier("showResultVC", sender: self)
            } else if present == false {
                self.viewToShow = "Question"
                self.performSegueWithIdentifier("showQuestionVC", sender: self)
            }
            
        })
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
