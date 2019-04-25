//
//  GoalCell.swift
//  goalpost-app
//
//  Created by Nikita Koniukh on 25/04/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    
    //Outlets
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var ogoalProgressLabel: UILabel!
    
    func configureCell(description: String, type: String, goalProgressAmount: Int){
        self.goalDescriptionLabel.text = description
        self.goalTypeLabel.text = type
        self.goalDescriptionLabel.text = String(describing: goalProgressAmount)
    }
    

}
