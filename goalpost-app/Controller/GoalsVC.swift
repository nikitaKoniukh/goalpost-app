//
//  GoalsVC.swift
//  goalpost-app
//
//  Created by Nikita Koniukh on 25/04/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addGoalButtonWasPressed(_ sender: Any) {
        print("button was pressed")
    }
    

}

