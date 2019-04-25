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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonWasPressed(_ sender: Any) {
    }
    @IBAction func shortTermButtonWasPressed(_ sender: Any) {
    }
    @IBAction func longTermButtonWasPressed(_ sender: Any) {
    }
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
