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



