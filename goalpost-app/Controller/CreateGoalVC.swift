//
//  CreateGoalVC.swift
//  goalpost-app
//
//  Created by Nikita Koniukh on 25/04/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.bindToKeyboard()
        shortTermButton.setSelectedColor()
        longTermButton.deSelectedColor()
        
    }
    
    @IBAction func nextButtonWasPressed(_ sender: Any) {
    }
    @IBAction func shortTermButtonWasPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermButton.setSelectedColor()
        longTermButton.deSelectedColor()
    }
    @IBAction func longTermButtonWasPressed(_ sender: Any) {
        goalType = .longTerm
        shortTermButton.deSelectedColor()
        longTermButton.setSelectedColor()
    }
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
}
