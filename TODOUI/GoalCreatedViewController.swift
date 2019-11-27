//
//  GoalCreatedViewController.swift
//  TODOUI
//
//  Created by Nikita Koniukh on 26/11/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import UIKit


class GoalCreatedViewController: UIViewController {

    private let intent: TODOIntent

    @IBOutlet var goalView: GoalView!
    

    init(for todoIntent: TODOIntent) {
        intent = todoIntent
        super.init(nibName: "GoalCreatedViewController", bundle: Bundle(for: GoalCreatedViewController.self))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalView.goalTitile.text = intent.title

        guard let points = intent.points else { return }
        goalView.goalPoints.text = "Points until complete: \(String(describing: points))"

        switch  intent.term {
        case .unknown:
            goalView.goalType.text = ""
        case .longTerm:
            goalView.goalType.text = "Long Term Goal"
        case .shortTerm:
            goalView.goalType.text = "Short Term Goal"
        default:
            goalView.goalType.text = ""
        }
    }

}

class GoalView: UIView {
    @IBOutlet weak var goalTitile: UILabel!
    @IBOutlet weak var goalType: UILabel!
    @IBOutlet weak var goalPoints: UILabel!

}
