//
//  ResultTotalView.swift
//  KnowHumanity
//
//  Created by Tony Ruiz on 3/21/15.
//  Copyright (c) 2015 Tony Ruiz. All rights reserved.
//

import UIKit
import SwiftyJSON

class ResultTotalView: BodyView {
    @IBOutlet weak var highAnswerNum: UILabel!
    @IBOutlet weak var lowAnswerNum: UILabel!
    @IBOutlet weak var highAnswerTitle: UILabel!
    @IBOutlet weak var lowAnswerTitle: UILabel!
    @IBOutlet weak var highAnswerLineView: UIView!
    @IBOutlet weak var lowAnswerLineView: UIView!
    
    // Can the stuff below become a delegate (or extension)?
    
    func addLabels(object: [String: NSObject]) {
        let json = JSON(object)
        highAnswerTitle.text = json["highAnswer"]["title"].description
        lowAnswerTitle.text = json["lowAnswer"]["title"].description
        let highNumFloat = json["highAnswer"]["num"].floatValue
        let highNumString = NSString(format: "%.0f", (highNumFloat * 100))+"%"
        highAnswerNum.text = highNumString
        highAnswerNum.font = highAnswerNum.font.fontWithSize(maxNumFontSize)
        let lowNumFloat = json["lowAnswer"]["num"].floatValue
        let lowNumString = NSString(format: "%.0f", (lowNumFloat * 100))+"%"
        lowAnswerNum.text = lowNumString
        let lnSize: CGFloat = CGFloat(lowNumFloat/highNumFloat)*maxNumFontSize
        lowAnswerNum.font = lowAnswerNum.font.fontWithSize(lnSize)
        for label in [highAnswerTitle, lowAnswerTitle] {
            label.numberOfLines = 0
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.000001
        }

    }
    
}
