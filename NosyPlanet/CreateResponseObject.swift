//
//  CreateResponseObject.swift
//  KnowHumanity
//
//  Created by Tony Ruiz on 3/23/15.
//  Copyright (c) 2015 Tony Ruiz. All rights reserved.
//

import UIKit
import Parse

class CreateResponseObject: NSObject {
 
    func submit(todaysQuestionId: String, answer: String) {
        var answeredFor = PFObject(withoutDataWithClassName:"Question", objectId:todaysQuestionId)
            
        var response = PFObject(className:"Response")
        response["answer"] = answer
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
    }
}
