//
//  GoalCreatedViewController.swift
//  MyGoalUI
//
//  Created by Nikita Koniukh on 27/11/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//
import UIKit


class GoalCreatedViewController: UIViewController {

    private let intent: NewGoalIntent

    @IBOutlet var goalView: GoalView!


    init(for todoIntent: NewGoalIntent) {
        intent = todoIntent
        super.init(nibName: "GoalCreatedViewController", bundle: Bundle(for: GoalCreatedViewController.self))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        goalView.goalTitile.text = intent.title
        goalView.goalPoints.text = "Points until complete: \(String(describing: intent.points))"

        switch  intent.term {
        case .unknown:
            goalView.goalPoints.text = ""
        case .longTerm:
            goalView.goalPoints.text = "Long Term Goal"
        case .shortTerm:
            goalView.goalPoints.text = "Short Term Goal"
        default:
            goalView.goalPoints.text = ""
        }
    }
}

class GoalView: UIView {
    @IBOutlet weak var goalTitile: UILabel!
    @IBOutlet weak var goalType: UILabel!
    @IBOutlet weak var goalPoints: UILabel!
}
