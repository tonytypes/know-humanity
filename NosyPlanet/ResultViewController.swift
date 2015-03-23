//
//  ResultViewController.swift
//  KnowHumanity
//
//  Created by Tony Ruiz on 3/22/15.
//  Copyright (c) 2015 Tony Ruiz. All rights reserved.
//

import UIKit

class ResultViewController: QRParentViewController {
   
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var bodyView: BodyView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Latest Result"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: (56/255), green: (142/255), blue: (60/255), alpha: 1.0)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.headerView.loadHeaderView("Result", todaysQuestionId: self.todaysQuestionId, resultOfYesterdayId: self.resultOfYesterdayId)
        self.bodyView.loadBodyView("Result", todaysQuestionId: self.todaysQuestionId, resultOfYesterdayId: self.resultOfYesterdayId)
    }
    
}
